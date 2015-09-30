Return-Path: <ian.ray@ge.com>
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBF0758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:35:13 +0000 (UTC)
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t8UAXjqk017345 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:35:13 -0400
Received: from cinmlip10.e2k.ad.ge.com ([12.71.149.1])
	by m0048205.ppops.net-00176a03. with ESMTP id 1x5pm6dkm2-21
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:35:13 -0400
Received: from unknown (HELO CINMBHT03.e2k.ad.ge.com) ([3.159.212.196])
	by cinmlip10.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	30 Sep 2015 06:35:04 -0400
Received: from BUDURLND08.e2k.ad.ge.com (3.159.54.58) by
	CINMBHT03.e2k.ad.ge.com (3.159.212.196) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 30 Sep 2015 06:35:03 -0400
Received: from BUDURBPA11.e2k.ad.ge.com ([169.254.5.78]) by
	BUDURLND08.e2k.ad.ge.com ([169.254.10.238]) with mapi id 14.03.0224.002;
	Wed, 30 Sep 2015 12:35:02 +0200
From: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
To: Tudor Florea <tudor.florea@enea.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [yocto][PATCH 1/1] ptest: user-specified run-ptest
	script location
Thread-Index: AQHQ9D12gDdNURG4z0uEytnw+fttNJ5R3wsAgAAscpD//+29gIAAIdOggAAWfICAANYcAIAAz2OAgADzmHA=
Date: Wed, 30 Sep 2015 10:35:01 +0000
Message-ID: <30E719D66AEA914CBB7DAB303B1C722D172E6F@BUDURBPA11.e2k.ad.ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
	<CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
	<30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
	<56098AA9.2070505@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1729D1@BUDURBPA11.e2k.ad.ge.com>
	<560AEC3D.1010701@enea.com>
In-Reply-To: <560AEC3D.1010701@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.54.224]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1509300157
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
X-List-Received-Date: Wed, 30 Sep 2015 10:35:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxkIG1vZGlmeSBkb19pbnN0YWxsX3B0ZXN0X2Jhc2UgdG8g
cnVuDQo+IGRvX2luc3RhbGxfcHRlc3QgYW5kIGluc3RhbGwgdGhlIE1ha2VmaWxlIGlycmVzcGVj
dGl2ZSBvZiB0aGUgcHJlc2VuY2UNCj4gb2YgcnVuLXB0ZXN0IGZpbGUgaW4gJHtXT1JLRElSfQ0K
PiBTb21ldGhpbmcgbGlrZToNCj4gZG9faW5zdGFsbF9wdGVzdF9iYXNlKCkgew0KPiAgICAgIGlm
IFsgLWYgJHtXT1JLRElSfS9ydW4tcHRlc3QgXTsgdGhlbg0KPiAgICAgICAgICBpbnN0YWxsIC1E
ICR7V09SS0RJUn0vcnVuLXB0ZXN0ICR7RH0ke1BURVNUX1BBVEh9L3J1bi1wdGVzdA0KPiAgICAg
IGZpDQo+ICAgICAgaWYgZ3JlcCAtcSBpbnN0YWxsLXB0ZXN0OiBNYWtlZmlsZTsgdGhlbg0KPiAg
ICAgICAgICBvZV9ydW5tYWtlIERFU1RESVI9JHtEfSR7UFRFU1RfUEFUSH0gaW5zdGFsbC1wdGVz
dA0KPiAgICAgIGZpDQo+ICAgICAgZG9faW5zdGFsbF9wdGVzdA0KPiB9DQo+IA0KPiBEb2VzIHRo
aXMgZml0cyB3aXRoIHlvdXIgbmVlZHM/DQoNClRoYXQncyBhIGdvb2QgaWRlYSEgIFllcywgdGhh
dCB3b3VsZCBmaXQgdmVyeSB3ZWxsIGluZGVlZC4NCg0KSSBzdWJtaXR0ZWQgYSBuZXcgcGF0Y2gg
cHJvcG9zYWwgaW4gdGhyZWFkICJbUEFUQ0ggdjIgMC8xXSBwdGVzdDoNCnJ1bi1wdGVzdCBub3Qg
cmVxdWlyZWQgdG8gcnVuIGRvX2luc3RhbGxfcHRlc3QiLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIg
Y29tbWVudHMsDQoNCklhbg0KDQo=

