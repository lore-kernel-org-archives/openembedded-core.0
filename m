Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01746774AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 22:34:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u86MYsIA005849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Sep 2016 15:34:54 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Tue, 6 Sep 2016 15:34:54 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] libwebp: do not assume armv7a
	has neon intrinsics
Thread-Index: AQHSCHzfSlAT6Dz53kWeG3xc23gdYqBtZWMA//+mnRA=
Date: Tue, 6 Sep 2016 22:34:53 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84B6225A20@ALA-MBB.corp.ad.wrs.com>
References: <1473193556-11790-1-git-send-email-jslater@windriver.com>
	<CAJ86T=Uiq42eV-zOH8un-1Q4vUmrJmxKX-UHmSGZkNZ5DQ1VAQ@mail.gmail.com>
In-Reply-To: <CAJ86T=Uiq42eV-zOH8un-1Q4vUmrJmxKX-UHmSGZkNZ5DQ1VAQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libwebp: do not assume armv7a has neon intrinsics
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
X-List-Received-Date: Tue, 06 Sep 2016 22:34:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmUgTWNDdXJkeSBb
bWFpbHRvOmFybWNjdXJkeUBnbWFpbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAw
NiwgMjAxNiAxOjUyIFBNDQo+IFRvOiBTbGF0ZXIsIEpvc2VwaA0KPiBDYzogT0UgQ29yZSBtYWls
aW5nIGxpc3QNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbb2UtY29yZV1bUEFUQ0ggMS8xXSBs
aWJ3ZWJwOiBkbyBub3QgYXNzdW1lIGFybXY3YSBoYXMgbmVvbg0KPiBpbnRyaW5zaWNzDQo+IA0K
PiBPbiBUdWUsIFNlcCA2LCAyMDE2IGF0IDE6MjUgUE0sIEpvZSBTbGF0ZXIgPGpzbGF0ZXJAd2lu
ZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gY29uZmlndXJlIGluY29ycmVjdGx5IHRoaW5rcyAtbWZw
dT1uZW9uIGlzIGluIENDIGZvciBhcm12N2EsDQo+ID4gc28gZGVmZWF0IGF1dG9tYXRpYyBuZW9u
IGRldGVjdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpzbGF0ZXJA
d2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvd2Vi
cC9saWJ3ZWJwXzAuNS4xLmJiIHwgICAgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L3dlYnAvbGlid2VicF8wLjUuMS5iYiBiL21ldGEvcmVjaXBlcy0NCj4gbXVsdGltZWRpYS93ZWJw
L2xpYndlYnBfMC41LjEuYmINCj4gPiBpbmRleCAyMjJiZDU2Li4yZDg2YjRhIDEwMDY0NA0KPiA+
IC0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3dlYnAvbGlid2VicF8wLjUuMS5iYg0KPiA+
ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3dlYnAvbGlid2VicF8wLjUuMS5iYg0KPiA+
IEBAIC0yNiw2ICsyNiw5IEBAIEVYVFJBX09FQ09ORiA9ICIgXA0KPiA+ICAgICAgLS1lbmFibGUt
bGlid2VicGRlbXV4IFwNCj4gPiAgICAgIC0tZW5hYmxlLXRocmVhZGluZyBcDQo+ID4gICINCj4g
PiArIyBjb25maWd1cmUgaW5jb3JyZWN0bHkgYmVsaWV2ZXMgdGhhdCBhcm12N2EgaGFzIC1tZnB1
PW5lb24NCj4gPiArIw0KPiA+ICtFWFRSQV9PRUNPTkZfYXBwZW5kX2FybXY3YSA9ICIgLS1kaXNh
YmxlLW5lb24iDQo+IA0KPiBVbmxlc3MgeW91IHdhbnQgdG8gZGlzYWJsZSBuZW9uIGZvciBhbGwg
YXJtdjdhIGJ1aWxkcywgcGVyaGFwcw0KPiBzb21ldGhpbmcgbGlrZSB0aGlzIHdvdWxkIGJlIGJl
dHRlcjoNCj4gDQo+ICAgRVhUUkFfT0VDT05GICs9ICIke0BiYi51dGlscy5jb250YWlucygiVFVO
RV9GRUFUVVJFUyIsICJuZW9uIiwgIiIsDQo+ICItLWRpc2FibGUtbmVvbiIgLGQpfSINCg0KVGhh
dCdzIGEgZ29vZCBpZGVhLCBidXQgSSdkIG9ubHkgZG8gdGhlIGNoZWNrIGZvciBhcm0uICBBbHNv
LCBpZiB3ZSBkbyBoYXZlDQpuZW9uLCBzaG91bGRuJ3QgdGhlIGNvcmUgYmUgYXJtdjdhLW5lb24s
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/ICBDYW4ndCB3ZQ0KcmVseSBvbiB0aGUgb3ZlcnJpZGVz
Pw0KDQpKb2UNCg0KDQo+IA0KPiA+ICBpbmhlcml0IGF1dG90b29scyBsaWJfcGFja2FnZQ0KPiA+
DQo+ID4gLS0NCj4gPiAxLjcuOS41DQo+ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFp
bGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVt
YmVkZGVkLWNvcmUNCg==

