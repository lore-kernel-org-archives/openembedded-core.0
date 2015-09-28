Return-Path: <ian.ray@ge.com>
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id B6A3076FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 15:42:10 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t8SFg4Yr023907 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:42:09 -0400
Received: from alpmlip13.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.5.1] (may be forged))
	by m0048300.ppops.net-00176a03. with ESMTP id 1x5m1nkrtj-3
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:42:09 -0400
Received: from unknown (HELO ALPMBHT04.e2k.ad.ge.com) ([3.159.19.197])
	by alpmlip13.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	28 Sep 2015 11:41:56 -0400
Received: from BUDURLND09.e2k.ad.ge.com (3.159.54.65) by
	ALPMBHT04.e2k.ad.ge.com (3.159.19.197) with Microsoft SMTP Server (TLS)
	id 14.3.224.2; Mon, 28 Sep 2015 11:41:56 -0400
Received: from BUDURBPA11.e2k.ad.ge.com ([169.254.5.78]) by
	BUDURLND09.e2k.ad.ge.com ([169.254.7.50]) with mapi id 14.03.0224.002;
	Mon, 28 Sep 2015 17:41:54 +0200
From: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [yocto][PATCH 1/1] ptest: user-specified run-ptest
	script location
Thread-Index: AQHQ9D12gDdNURG4z0uEytnw+fttNJ5R3wsAgAAscpD//+29gIAAIdOg
Date: Mon, 28 Sep 2015 15:41:53 +0000
Message-ID: <30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
	<CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
In-Reply-To: <CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.54.224]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-28_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1509280214
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Sep 2015 15:42:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcw0KDQo+IE9uIDI4IFNlcHRlbWJlciAyMDE1LCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4+
IE9uIDI4IFNlcHRlbWJlciAyMDE1IGF0IDE1OjQ2LCBSYXksIElhbiAoR0UgSGVhbHRoY2FyZSkg
PGlhbi5yYXlAZ2UuY29tPiB3cm90ZToNCj4+VGhlIG1haW4gYmVuZWZpdCBpcyBmb3IgcGFja2Fn
ZXMgdGhhdCBhcmUgcnVuLXB0ZXN0IC9hd2FyZS8sIGluIHdoaWNoIGNhc2UNCj4+IHRoZSByZWNp
cGUgY2FuIGJlIHNpbXBsaWZpZWQuDQoNCj4gU3VyZWx5IGlmIGFuIHVwc3RyZWFtIGlzIHVuZGVy
IHlvdXIgY29udHJvbCBhbmQgaXMgcHRlc3QtYXdhcmUsIGl0IGNhbiBhbHNvIGluc3RhbGwgcnVu
LXB0ZXN0IGludG8gdGhlIHJpZ2h0IHBsYWNlIHRvbz8NCg0KVGhlIHJ1bi1wdGVzdCBzY3JpcHQg
aXMgY3VycmVudGx5IHJlcXVpcmVkIHRvIGJlIGluIFdPUktESVIuICBDYW4gYSBwYWNrYWdlDQpr
bm93IFdPUktESVIgd2l0aG91dCBvdGhlciBjaGFuZ2VzIHRvIHRoZSByZWNpcGU/ICAoV09SS0RJ
UiBkaWQgbm90DQpzZWVtIHRvIGJlIHByZXNlbnQgaW4gYSBxdWljayBjaGVjayBvZiBhIHJ1bi5k
b19jb21waWxlIGxvZyBJIGhhZCBoYW5keS4pDQoNCg==

