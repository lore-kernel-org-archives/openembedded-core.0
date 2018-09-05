Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA96F793EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 227171834E;
	Wed,  5 Sep 2018 21:22:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tka2CCH3APzw; Wed,  5 Sep 2018 21:22:52 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id AA7F51847D;
	Wed,  5 Sep 2018 21:22:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 963A61E083;
	Wed,  5 Sep 2018 21:22:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89E071E07A;
	Wed,  5 Sep 2018 21:22:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  5 Sep 2018 21:22:51 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 7D62829C1;
	Wed,  5 Sep 2018 21:22:51 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 5 Sep 2018 21:22:51 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 5 Sep 2018 21:22:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2 V2] oe/utils.py: Add vartrue()
Thread-Index: AQHURObgspiXYLZLJEGvQ0W1FbCv16ThSc/Q///rFwCAANt9AA==
Date: Wed, 5 Sep 2018 19:22:51 +0000
Message-ID: <c89381efe4204135951c64b9642b53b1@XBOX02.axis.com>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
	<7eac4cc6501f4799bb542739f6f7e57d@XBOX02.axis.com>
	<f0fcb85e-d3b6-3bd4-8e46-5aa5f03ba5ee@windriver.com>
In-Reply-To: <f0fcb85e-d3b6-3bd4-8e46-5aa5f03ba5ee@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 19:22:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhp
LnlhbmdAd2luZHJpdmVyLmNvbT4NCj4gU2VudDogZGVuIDUgc2VwdGVtYmVyIDIwMTggMTA6MTIN
Cj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsg
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yIFYyXSBvZS91dGlscy5weTogQWRkIHZhcnRydWUoKQ0K
PiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBPbiAwOS8wNS8yMDE4IDAzOjMzIFBNLCBQZXRlciBLamVs
bGVyc3RlZHQgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8
b3BlbmVtYmVkZGVkLQ0KPiA+PiBjb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
T24gQmVoYWxmIE9mIFJvYmVydCBZYW5nDQo+ID4+IFNlbnQ6IGRlbiA1IHNlcHRlbWJlciAyMDE4
IDA5OjE2DQo+ID4+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yIFYyXSBvZS91dGlscy5weTogQWRk
IHZhcnRydWUoKQ0KPiA+Pg0KPiA+PiBJdCBjYW4gYmUgdXNlZCB0byBzaW1wbGlmeSBjb2RlIGxp
a2U6DQo+ID4+ICIke0BbJ2lmZmFsc2UnLCAnaWZ0cnVlJ11bdmFyXX0iDQo+ID4+DQo+ID4+IFNp
Z25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+
PiAtLS0NCj4gPj4gICBtZXRhL2NvbmYvYml0YmFrZS5jb25mIHwgMiArLQ0KPiA+PiAgIG1ldGEv
bGliL29lL3V0aWxzLnB5ICAgfCA3ICsrKysrKysNCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0
YS9jb25mL2JpdGJha2UuY29uZiBiL21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gPj4gaW5kZXgg
ZmFlZjc3MS4uZGJhZGViMyAxMDA2NDQNCj4gPj4gLS0tIGEvbWV0YS9jb25mL2JpdGJha2UuY29u
Zg0KPiA+PiArKysgYi9tZXRhL2NvbmYvYml0YmFrZS5jb25mDQo+ID4+IEBAIC02MTAsNyArNjEw
LDcgQEAgREVCVUdfRkxBR1MgPz0gIi1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy0NCj4gdHlw
ZXMNCj4gPj4gJHtERUJVR19QUkVGSVhfTUFQfSINCj4gPj4gICAjIERpc2FibGVkIHVudGlsIHRo
ZSBvcHRpb24gd29ya3MgcHJvcGVybHkgLWZlbGltaW5hdGUtZHdhcmYyLWR1cHMNCj4gPj4gICBG
VUxMX09QVElNSVpBVElPTiA9ICItTzIgLXBpcGUgJHtERUJVR19GTEFHU30iDQo+ID4+ICAgREVC
VUdfT1BUSU1JWkFUSU9OID0gIi1PIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyICR7REVCVUdfRkxB
R1N9IC0NCj4gcGlwZSINCj4gPj4gLVNFTEVDVEVEX09QVElNSVpBVElPTiA9ICIke0BkLmdldFZh
cihbJ0ZVTExfT1BUSU1JWkFUSU9OJywNCj4gPj4gJ0RFQlVHX09QVElNSVpBVElPTiddW2QuZ2V0
VmFyKCdERUJVR19CVUlMRCcpID09ICcxJ10pfSINCj4gPj4gK1NFTEVDVEVEX09QVElNSVpBVElP
TiA9DQo+ICIke0BkLmdldFZhcihvZS51dGlscy52YXJ0cnVlKCdERUJVR19CVUlMRCcsDQo+ID4+
ICdERUJVR19PUFRJTUlaQVRJT04nLCAnRlVMTF9PUFRJTUlaQVRJT04nLCBkKSl9Ig0KPiA+PiAg
IFNFTEVDVEVEX09QVElNSVpBVElPTlt2YXJkZXBzXSArPSAiRlVMTF9PUFRJTUlaQVRJT04NCj4g
Pj4gREVCVUdfT1BUSU1JWkFUSU9OIg0KPiA+PiAgIEJVSUxEX09QVElNSVpBVElPTiA9ICItTzIg
LXBpcGUiDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZS91dGlscy5weSBiL21l
dGEvbGliL29lL3V0aWxzLnB5DQo+ID4+IGluZGV4IGYyMmE2YWIuLjkxNGE2ZjIgMTAwNjQ0DQo+
ID4+IC0tLSBhL21ldGEvbGliL29lL3V0aWxzLnB5DQo+ID4+ICsrKyBiL21ldGEvbGliL29lL3V0
aWxzLnB5DQo+ID4+IEBAIC00NjQsMyArNDY0LDEwIEBAIGNsYXNzIEltYWdlUUFGYWlsZWQoYmIu
YnVpbGQuRnVuY0ZhaWxlZCk6DQo+ID4+ICAgICAgICAgICAgICAgbXNnID0gbXNnICsgJyAoJXMp
JyAlIHNlbGYuZGVzY3JpcHRpb24NCj4gPj4NCj4gPj4gICAgICAgICAgIHJldHVybiBtc2cNCj4g
Pj4gKw0KPiA+PiArZGVmIHZhcnRydWUodmFyLCBpZnRydWUsIGlmZmFsc2UsIGQpOg0KPiA+PiAr
ICAgIGltcG9ydCBvZS50eXBlcw0KPiA+PiArICAgIGlmIG9lLnR5cGVzLmJvb2xlYW4oZC5nZXRW
YXIodmFyKSk6DQo+ID4+ICsgICAgICAgIHJldHVybiBpZnRydWUNCj4gPj4gKyAgICBlbHNlOg0K
PiA+PiArICAgICAgICByZXR1cm4gaWZmYWxzZQ0KPiA+DQo+ID4gUHV0IGl0IHRvZ2V0aGVyIHdp
dGggaWZlbHNlKCkgYW5kIGNvbmRpdGlvbmFsKCkgaW5zdGVhZCwgd2hlcmUgaXQNCj4gPiBiZXR0
ZXIgYmVsb25ncy4NCj4gPg0KPiA+IFlvdSBjYW4gYWxzbyBpbXBsZW1lbnQgaXQgYXM6DQo+ID4N
Cj4gPiBkZWYgdmFydHJ1ZSh2YXIsIGlmdHJ1ZSwgaWZmYWxzZSwgZCk6DQo+ID4gICAgICBpbXBv
cnQgb2UudHlwZXMNCj4gPiAgICAgIHJldHVybiBvZS51dGlscy5pZmVsc2Uob2UudHlwZXMuYm9v
bGVhbihkLmdldFZhcih2YXIpLCBpZnRydWUsIGlmZmFsc2UpOg0KPiANCj4gVGhlbiB3ZSBuZWVk
IGltcG9ydCBvZS51dGlscywgYW5kIEkgZG9uJ3QgdGhpbmsgdGhhdCBpdCdzIGVhc2llciB0bw0K
PiByZWFkIHRoYW46DQoNCldlbGwsIHNpbmNlIHRoaXMgZmlsZSBhY3R1YWxseSBpcyBvZS51dGls
cywgSSB3b3VsZCBhc3N1bWUgdGhhdCBpcyBub3QgDQpuZWVkZWQgKG90aGVyIGZ1bmN0aW9ucyBp
biB0aGlzIGZpbGUgY2FsbCBvZS51dGlscyBmdW5jdGlvbnMganVzdCBmaW5lKS4NCg0KPiArDQo+
ICtkZWYgdmFydHJ1ZSh2YXIsIGlmdHJ1ZSwgaWZmYWxzZSwgZCk6DQo+ICsgICAgaW1wb3J0IG9l
LnR5cGVzDQo+ICsgICAgaWYgb2UudHlwZXMuYm9vbGVhbihkLmdldFZhcih2YXIpKToNCj4gKyAg
ICAgICAgcmV0dXJuIGlmdHJ1ZQ0KPiArICAgIGVsc2U6DQo+ICsgICAgICAgIHJldHVybiBpZmZh
bHNlDQo+IA0KPiAvLyBSb2JlcnQNCj4gDQo+ID4NCj4gPj4gLS0NCj4gPj4gMi43LjQNCj4gPg0K
PiA+IC8vUGV0ZXINCg0KLy9QZXRlcg0KDQo=

