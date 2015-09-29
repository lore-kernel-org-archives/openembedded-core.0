Return-Path: <ian.ray@ge.com>
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id E544576E04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 06:59:23 +0000 (UTC)
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t8T6uqEJ003283 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 02:59:23 -0400
Received: from cinmlip13.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.4.1] (may be forged))
	by m0048205.ppops.net-00176a03. with ESMTP id 1x5pm6c69t-29
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 02:59:23 -0400
Received: from unknown (HELO ALPMBHT02.e2k.ad.ge.com) ([3.159.19.195])
	by cinmlip13.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	29 Sep 2015 02:59:13 -0400
Received: from BUDURLND10.e2k.ad.ge.com (3.159.54.66) by
	ALPMBHT02.e2k.ad.ge.com (3.159.19.195) with Microsoft SMTP Server (TLS)
	id 14.3.224.2; Tue, 29 Sep 2015 02:59:12 -0400
Received: from BUDURBPA11.e2k.ad.ge.com ([169.254.5.78]) by
	BUDURLND10.e2k.ad.ge.com ([169.254.8.234]) with mapi id 14.03.0224.002;
	Tue, 29 Sep 2015 08:59:11 +0200
From: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
To: Tudor Florea <tudor.florea@enea.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [yocto][PATCH 1/1] ptest: user-specified run-ptest
	script location
Thread-Index: AQHQ9D12gDdNURG4z0uEytnw+fttNJ5R3wsAgAAscpD//+29gIAAIdOggAAWfICAANYcAA==
Date: Tue, 29 Sep 2015 06:59:10 +0000
Message-ID: <30E719D66AEA914CBB7DAB303B1C722D1729D1@BUDURBPA11.e2k.ad.ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
	<CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
	<30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
	<56098AA9.2070505@enea.com>
In-Reply-To: <56098AA9.2070505@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.54.224]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1509290094
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
X-List-Received-Date: Tue, 29 Sep 2015 06:59:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjggU2VwdGVtYmVyIDIwMTUsIFR1ZG9yIEZsb3JlYSB3cm90ZToNCj4gPiBPbiAyOCBTZXB0
ZW1iZXIgMjAxNSwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+ID4gPiBTdXJlbHkgaWYgYW4gdXBzdHJl
YW0gaXMgdW5kZXIgeW91ciBjb250cm9sIGFuZCBpcyBwdGVzdC1hd2FyZSwgaXQgY2FuIGFsc28N
Cj4gPiA+IGluc3RhbGwgcnVuLXB0ZXN0IGludG8gdGhlIHJpZ2h0IHBsYWNlIHRvbz8NCj4gPiBU
aGUgcnVuLXB0ZXN0IHNjcmlwdCBpcyBjdXJyZW50bHkgcmVxdWlyZWQgdG8gYmUgaW4gV09SS0RJ
Ui4NCj4gQWN0dWFsbHkgcnVuLXB0ZXN0IGlzIGN1cnJlbnRseSByZXF1aXJlZCB0byBiZSBwcmVz
ZW50IGluDQo+IC91c3IvbGliLzxwYWNrYWdlPi9wdGVzdC4gSWYgYSBwYWNrYWdlIGlzICJwdGVz
dC1hd2FyZSIsIHRoYXQgIHBhY2thZ2UNCj4gc2hvdWxkIGNvbnRhaW4gYSAgaW5zdGFsbC1wdGVz
dCBtYWtlIHRhcmdldCB3aGljaCB3aWxsIHRha2UgY2FyZSBvZg0KPiBpbnN0YWxsaW5nIHRoZSBy
dW4tcHRlc3QgZmlsZS4NCg0KSW4gc3VtbWFyeSwgdGhlIG9wdGlvbnMgc2VlbSB0byBiZSBhcyBm
b2xsb3dzOg0KDQojIG9wdGlvbiAxIC0tIHBhY2thZ2UgaW5jbHVkZXMgcnVuLXB0ZXN0LCByZWNp
cGUgcG9pbnRzIHRvIGl0DQpQVEVTVF9SVU5fU0NSSVBUX1BBVEggPSAicGF0aC90by9ydW4tcHRl
c3QiDQoNCiMgb3B0aW9uIDIgLS0gcmVjaXBlIGNvcGllcyBydW4tcHRlc3QgdG8gV09SS0RJUg0K
IyBUaGlzIGxldmVyYWdlcyBtZXRhL2NsYXNzZXMvcHRlc3QuYmJjbGFzcyBkb19pbnN0YWxsX3B0
ZXN0X2Jhc2UuDQpkb19jb21waWxlX3B0ZXN0ICgpIHsNCiAgICAgICAgb2VfcnVubWFrZSBidWls
ZHRlc3QtVEVTVFMNCiAgICAgICAgY3AgJHtTfS9wYXRoL3RvL3J1bi1wdGVzdCAke1dPUktESVJ9
DQp9DQoNCiMgb3B0aW9uIDMgLS0gcGFja2FnZSBpbnN0YWxscyBydW4tcHRlc3QNCiMgVGhlIHJl
Y2lwZSByZXF1aXJlcyBjdXN0b20gZG9faW5zdGFsbF9wdGVzdCBiZWNhdXNlIHRoZXJlIGlzIG5v
DQojIHJ1bi1wdGVzdCBpbiBXT1JLRElSIHNvIG1ldGEvY2xhc3Nlcy9wdGVzdC5iYmNsYXNzIGRv
ZXMgbm90IGNhbGwNCiMgZG9faW5zdGFsbF9wdGVzdF9iYXNlLg0KZG9faW5zdGFsbCAoKSB7DQog
ICAgICAgIG9lX3J1bm1ha2UgREVTVERJUj0ke0R9IGluc3RhbGwNCg0KICAgICAgICAjIENvcGll
ZCBmcm9tIGRvX2luc3RhbGxfcHRlc3RfYmFzZS4NCiAgICAgICAgaW5zdGFsbCAtRCAke1N9L3B0
ZXN0L3J1bi1wdGVzdCAke0R9JHtQVEVTVF9QQVRIfS9ydW4tcHRlc3QNCiAgICAgICAgb2VfcnVu
bWFrZSBERVNURElSPSR7RH0ke1BURVNUX1BBVEh9IGluc3RhbGwtcHRlc3QNCiAgICAgICAgY2hv
d24gLVIgcm9vdDpyb290ICR7RH0ke1BURVNUX1BBVEh9DQoNCiAgICAgICAgIyBIYWNrIGFsZXJ0
ISAgaGFkIHRvIGNvbW1lbnQgb3V0IGRvX2luc3RhbGxfcHRlc3RfYmFzZVtjbGVhbmRpcnNdIGlu
DQogICAgICAgICMgbWV0YS9jbGFzc2VzL3B0ZXN0LmJiY2xhc3MgdG8gdGVzdCB0aGlzIG9wdGlv
bi4NCn0NCg0KTXkgaW5leHBlcmllbmNlIHNob3dzIGhlcmUgd2l0aCBvcHRpb24gIzMgd2hpY2gg
YXR0ZW1wdGVkIHRvIGFkZHJlc3MgdGhlIGNvbW1lbnRzDQpieSBSb3NzIGFuZCBUdWRvciwgYnV0
IHdoaWNoIGRvZXMgbm90IGFjdHVhbGx5IHdvcmsgKHRlc3RlZCBvbiBGaWRvIGJyYW5jaCkuDQoN
Ck1heWJlIHRoZXJlIGlzIGFuIG9wdGlvbiAjNCwgd2hlcmUgdGhlIHJlY2lwZSBkb2VzICpub3Qq
IGluaGVyaXQgcHRlc3QsIGJ1dCB0aGF0IHdvdWxkDQpwbGFjZSBhIHNpZ25pZmljYW50IGJ1cmRl
biBvbiB0aGUgcmVjaXBlIGF1dGhvciAoZGV0ZWN0aW5nIFBURVNUX0VOQUJMRUQsIGFkZGluZw0K
dGFza3MsIGV0YykuICBObyBkb3VidCB0aGVyZSBpcyBhbiBlYXNpZXIgd2F5LiAgU29ycnkgZm9y
IGJlaW5nIHN1Y2ggYSBub29iIQ0KDQpJYW4NCg0K

