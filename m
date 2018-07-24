Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 59B3075114
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:37:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42574401"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2018 10:37:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AE14D4B66A23;
	Tue, 24 Jul 2018 10:37:30 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0399.000; Tue, 24 Jul 2018 10:37:27 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v3] sshd: add sshd.service
Thread-Index: AQHUIm6BKpPfg0jFbUq0GJZKHRvJ66SdqLSg
Date: Tue, 24 Jul 2018 02:37:32 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF738709DE20@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1532336544-107337-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZTO7OxZokj2pymX7PaLqBRq5KiyyBij3Ncq8j59YrE7w@mail.gmail.com>
In-Reply-To: <CAJTo0LZTO7OxZokj2pymX7PaLqBRq5KiyyBij3Ncq8j59YrE7w@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: AE14D4B66A23.AB31D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] sshd: add sshd.service
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
X-List-Received-Date: Tue, 24 Jul 2018 02:37:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zczoNCiAgICAgICAgSSB3YW50IHRvIGFkZCB0aGlzIGZvciBpbiBV
YnVudHUgYW5kIEZlZG9yYSwgc3NoZC5zb2NrZXQgYW5kIHNzaGQuc2Vydmlj
ZSBjYW4gYm90aCBjb2V4aXN0Lg0KICAgICAgICBTbywgbWF5YmUgd2UgcHJv
dmlkZSBib3RoIG9mIHRoZW0sIGFuZCB1c2VyIGNhbiBjaG9vc2UgdGhlIHdh
eSB0aGV5IHdhbnQuICAgICAgICANCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClpoZW5nIFJ1b3Fpbg0K
TmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRk
LihGTlNUKQ0KQUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2
ZW51ZSwNCiAgICAgICBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpNQUlMIDog
emhlbmdycS5mbnN0QGNuLmZ1amlzdHUuY29tDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3Nz
LmJ1cnRvbkBpbnRlbC5jb21dIA0KU2VudDogTW9uZGF5LCBKdWx5IDIzLCAy
MDE4IDY6MTggUE0NClRvOiBaaGVuZywgUnVvcWluL+mDkSDoi6XpkqYgPHpo
ZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCkNjOiBPRS1jb3JlIDxvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjNdIHNzaGQ6IGFkZCBzc2hkLnNl
cnZpY2UNCg0KU3RpbGwgbm8gZXhwbGFuYXRpb24gd2h5IHlvdSdkIHdhbnQg
dG8gZG8gdGhpcyBhbmQgbm90IHVzZSBzb2NrZXQgYWN0aXZhdGlvbi4NCg0K
Um9zcw0KDQpPbiAyMyBKdWx5IDIwMTggYXQgMTA6MDIsIFpoZW5nIFJ1b3Fp
biA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gQWRk
IHNzaGQuc2VydmljZSBmb3IgdXNlciB0byBzdGFydCB0aGUgc3NoZCBkYWVt
b24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdy
cS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZSB8
IDE2ICsrKysrKysrKysrKysrKysNCj4gIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzcuN3AxLmJiICAgICB8ICA2ICsrKysr
Kw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgDQo+IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5z
c2gvc3NoZC5zZXJ2aWNlIA0KPiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZQ0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi4yZDI3MTdkDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gvc3NoZC5zZXJ2aWNlDQo+IEBAIC0wLDAgKzEsMTYg
QEANCj4gK1tVbml0XQ0KPiArRGVzY3JpcHRpb249T3BlblNTSCBzZXJ2ZXIg
ZGFlbW9uDQo+ICtXYW50cz1zc2hkZ2Vua2V5cy5zZXJ2aWNlDQo+ICtBZnRl
cj1zc2hkZ2Vua2V5cy5zZXJ2aWNlDQo+ICsNCj4gK1tTZXJ2aWNlXQ0KPiAr
RW52aXJvbm1lbnQ9IlNTSERfT1BUUz0iDQo+ICtFbnZpcm9ubWVudEZpbGU9
LS9ldGMvZGVmYXVsdC9zc2gNCj4gK0V4ZWNTdGFydD0tQFNCSU5ESVJAL3Nz
aGQgLWkgJFNTSERfT1BUUyBFeGVjUmVsb2FkPUBCQVNFX0JJTkRJUkAva2ls
bCANCj4gKy1IVVAgJE1BSU5QSUQgS2lsbE1vZGU9cHJvY2VzcyBSZXN0YXJ0
PW9uLWZhaWx1cmUgUmVzdGFydFNlYz00MnMNCj4gKw0KPiArW0luc3RhbGxd
DQo+ICtXYW50ZWRCeT1tdWx0aS11c2VyLnRhcmdldA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hf
Ny43cDEuYmIgDQo+IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2hfNy43cDEuYmINCj4gaW5kZXggYjNkYTVmNi4uYjRmNGM2
ZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2hfNy43cDEuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfNy43cDEuYmINCj4gQEAg
LTE3LDYgKzE3LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vZnRwLm9wZW5ic2Qu
b3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUvb3BlbnNzaC0ke1BW
fS50YXINCj4gICAgICAgICAgICAgZmlsZTovL3NzaF9jb25maWcgXA0KPiAg
ICAgICAgICAgICBmaWxlOi8vaW5pdCBcDQo+ICAgICAgICAgICAgICR7QGJi
LnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgDQo+
ICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXA0KPiArICAgICAgICAgICAk
e0BiYi51dGlscy5jb250YWlucygnU1NIRF9EQUVNT04nLCAnc2VydmljZScs
IA0KPiArICcke1NTSERfREFFTU9OX1NSQ19VUkl9JywgJycsIGQpfSBcDQo+
ICAgICAgICAgICAgIGZpbGU6Ly9zc2hkLnNvY2tldCBcDQo+ICAgICAgICAg
ICAgIGZpbGU6Ly9zc2hkQC5zZXJ2aWNlIFwNCj4gICAgICAgICAgICAgZmls
ZTovL3NzaGRnZW5rZXlzLnNlcnZpY2UgXCBAQCAtMzAsNiArMzEsOCBAQCBT
UkNfVVJJID0gDQo+ICJodHRwOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVu
QlNEL09wZW5TU0gvcG9ydGFibGUvb3BlbnNzaC0ke1BWfS50YXINCj4NCj4g
IFBBTV9TUkNfVVJJID0gImZpbGU6Ly9zc2hkIg0KPg0KPiArU1NIRF9EQUVN
T05fU1JDX1VSSSA9ICJmaWxlOi8vc3NoZC5zZXJ2aWNlIg0KPiArDQo+ICBT
UkNfVVJJW21kNXN1bV0gPSAiNjhiYTg4M2FmZjY5NTgyOTc0MzJlNTg3N2U5
YTBmZTIiDQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDczYmU3ZTY4NGU5
OWVmY2QwMjRiZTE1YTMwYmZmY2JlNDFiMDEyYjJmN2IzYzkwODRhZWQ2MjE3
NzVlNmI4ZiINCj4NCj4gQEAgLTExMSw2ICsxMTQsOSBAQCBkb19pbnN0YWxs
X2FwcGVuZCAoKSB7DQo+ICAgICAgICAgZWNobyAiSG9zdEtleSAvdmFyL3J1
bi9zc2gvc3NoX2hvc3RfZWQyNTUxOV9rZXkiID4+IA0KPiAke0R9JHtzeXNj
b25mZGlyfS9zc2gvc3NoZF9jb25maWdfcmVhZG9ubHkNCj4NCj4gICAgICAg
ICBpbnN0YWxsIC1kICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtDQo+
ICsgICAgICAgaWYgWyAiJHtAYmIudXRpbHMuZmlsdGVyKCdTU0hEX0RBRU1P
TicsICdzZXJ2aWNlJywgZCl9IiBdOyB0aGVuDQo+ICsgICAgICAgICAgICAg
ICBpbnN0YWxsIC1jIC1tIDA2NDQgJHtXT1JLRElSfS9zc2hkLnNlcnZpY2Ug
JHtEfSR7c3lzdGVtZF91bml0ZGlyfS9zeXN0ZW0NCj4gKyAgICAgICAgZmkN
Cj4gICAgICAgICBpbnN0YWxsIC1jIC1tIDA2NDQgJHtXT1JLRElSfS9zc2hk
LnNvY2tldCAke0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbQ0KPiAgICAg
ICAgIGluc3RhbGwgLWMgLW0gMDY0NCAke1dPUktESVJ9L3NzaGRALnNlcnZp
Y2UgJHtEfSR7c3lzdGVtZF91bml0ZGlyfS9zeXN0ZW0NCj4gICAgICAgICBp
bnN0YWxsIC1jIC1tIDA2NDQgJHtXT1JLRElSfS9zc2hkZ2Vua2V5cy5zZXJ2
aWNlIA0KPiAke0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbQ0KPiAtLQ0K
PiAyLjcuNA0KPg0KPg0KPg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQt
Y29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQoNCg0K
Cgo=

