Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7AAE787CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 07:13:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBC7DLif015230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Dec 2017 23:13:21 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.47]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 11 Dec 2017 23:13:20 -0800
From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gmp: depends on flex-native to fix parallel
	building issue
Thread-Index: AQHTcgkHuOync75SXUuUF7sziNr0L6M/R05A
Date: Tue, 12 Dec 2017 07:13:20 +0000
Message-ID: <C2A454FDE6C23F41BD5011E2458C46C9CEF081F1@ALA-MBD.corp.ad.wrs.com>
References: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
	<1512946109.19417.136.camel@linuxfoundation.org>
In-Reply-To: <1512946109.19417.136.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.79]
MIME-Version: 1.0
Subject: Re: [PATCH] gmp: depends on flex-native to fix parallel building issue
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
X-List-Received-Date: Tue, 12 Dec 2017 07:13:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpDb21tZW50cyBiZWxvdy4gdGhhbmtzDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmddIA0KU2VudDogMjAxN+W5tDEy5pyIMTHml6UgNjo0OA0KVG86IEJhaSwgSGFpcWluZzsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdIGdtcDogZGVwZW5kcyBvbiBmbGV4LW5hdGl2ZSB0byBmaXggcGFyYWxs
ZWwgYnVpbGRpbmcgaXNzdWUNCg0KT24gV2VkLCAyMDE3LTExLTI5IGF0IDE0OjU0ICswODAwLCBI
YWlxaW5nIEJhaSB3cm90ZToNCj4gZml4IGJlbG93IHBhcmFsbGVsIGJ1aWxkaW5nIGlzc3VlOg0K
PiBjb25maWd1cmU6MjczNjU6IHJlc3VsdDogZmxleA0KPiBjb25maWd1cmU6Mjc0MDM6IGZsZXgg
Y29uZnRlc3QubA0KPiAuLi4vc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4vZmxleC5yZWFs
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IGNvbmZpZ3VyZToyNzQwNzogJD8gPSAxMjcN
Cj4gY29uZmlndXJlOjI3NDA5OiBjaGVja2luZyBsZXggb3V0cHV0IGZpbGUgcm9vdA0KPiBjb25m
aWd1cmU6Mjc0MjA6IGVycm9yOiBjYW5ub3QgZmluZCBvdXRwdXQgZnJvbSBmbGV4OyBnaXZpbmcg
dXANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhaXFpbmcgQmFpIDxIYWlxaW5nLkJhaUB3aW5kcml2
ZXIuY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbXAvZ21wLmluYyB8IDIg
KysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ21wL2dtcC5pbmMgYi9tZXRhL3JlY2lwZXMtIA0KPiBz
dXBwb3J0L2dtcC9nbXAuaW5jIGluZGV4IGFiYWM4Y2YuLjFiMzVlYWEgMTAwNjQ0DQo+IC0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dtcC9nbXAuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dtcC9nbXAuaW5jDQo+IEBAIC0xMCwzICsxMCw1IEBAIFBBQ0tBR0VDT05GSUdbcmVh
ZGxpbmVdID0gIi0td2l0aC1yZWFkbGluZT15ZXMsIA0KPiAtLXdpdGgtcmVhZGxpbmU9bm8scmVh
ZGxpbmUiDQo+IMKgDQo+IMKgQVJNX0lOU1RSVUNUSU9OX1NFVF9hcm12NCA9ICJhcm0iDQo+IMKg
QVJNX0lOU1RSVUNUSU9OX1NFVF9hcm12NSA9ICJhcm0iDQo+ICsNCj4gK0RFUEVORFMgPSAiZmxl
eC1uYXRpdmUiDQoNCldpdGggcmVjaXBlIHNwZWNpZmljIHN5c3Jvb3RzIHRoaXMgc2hvdWxkIG5v
dyBiZSBkZXRlcm1pbmlzdGljLiBUaGUgbG9nIGFib3ZlIHN1Z2dlc3RzIHlvdSB3ZXJlIG5vdCB1
c2luZyByZWNpcGUgc3BlY2lmaWMgc3lzcm9vdHM/IFRoaXMgd291bGQgdGhlcmVmb3JlIG9ubHkg
YmUgYXBwbGljYWJsZSB0byBtb3J0eSBhbmQgZWFybGllcj8NCltUaGlzIGlzc3VlIGlzIGZvdW5k
ZWQgb24geDg2LTY0IGJ1aWxkaW5nLCAgYnV0IGl0IGRvZXMgbm90IG1lYW4gaXQgaXMgb25seSBy
ZWxhdGVkIHdpdGggeDg2LiAgQWN0dWFsbHkgdGhpcyBpcyBjYXVzZWQgYnkgdGhlIGRlZmVjdCBv
ZiB0aGUgdHJhZGl0aW9uYWwgcHJvYmUgbWVjaGFuaXNtIG9mICdjb25maWd1cmUnLCAgdGhlIHBh
Y2thZ2UgY29uZmlndXJlDQpzY3JpcHQgdHJ5IHRvIHByb2JlIHdoZXRoZXIgaGFzIHBhY2thZ2Ug
J2ZsZXgnICwgdGhlbiBzb21lIG9wdGlvbmFsIGFjdGlvbnMgd2lsbCBiZSBkb25lIGJ5IGl0LiAg
SW4gdGhpcyBpc3N1ZSwgIHdoZW4gdGhpcyBwcm9iZSBoYXBwZW5zLCAgIC91c3IvYmluL2ZsZXgg
ZXhpc3RzIGJ1dCAnL3Vzci9iaW4vZmxleC5yZWFsJyBoYXMgbm90IGNyZWF0ZWQgZm9yIHRoZQ0K
cGFyYWxsZWwgYnVpbGRpbmcsICB0aGVuIGNvbmZpZ3VyZSByZXBvcnRzIHRoZSBlcnJvciBhbmQg
ZXhpdHMgZnJvbSBidWlsZGluZy4gICBTaW5jZSB0aGVyZSBhcmUgbm8gYXRvbWljIGd1YXJhbnRl
ZSBmb3IgdGhlIHBhY2thZ2Ugb3V0cHV0IGR1cmluZyBwYXJhbGxlbCBidWlsZGluZywgc28gaGVy
ZSBhZGQgdGhpcyBkZXBlbmRzXQ0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

