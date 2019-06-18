Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E36D7E82B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 07:57:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="67886442"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2019 15:57:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B20274CDD98E;
	Tue, 18 Jun 2019 15:57:56 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0439.000; Tue, 18 Jun 2019 15:57:56 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: ChenQi <Qi.Chen@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2] openssl: Fix a build bug on aarch64BE.
Thread-Index: AQHVJMouu+EuMU7QUU25MtJmL2Pa5qahDLwg
Date: Tue, 18 Jun 2019 07:58:01 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF12F717@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1559771208-32780-1-git-send-email-leimaohui@cn.fujitsu.com>
	<ae10a4bc-7415-d9af-280b-9e64703ba7fa@windriver.com>
In-Reply-To: <ae10a4bc-7415-d9af-280b-9e64703ba7fa@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: B20274CDD98E.AC128
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Tue, 18 Jun 2019 07:57:57 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkNCg0KSSdtIHNvcnJ5IEkgbWlzdW5kZXJzdG9vZC4gSSBoYXZlIHN1Ym1p
dHRlZCB2MyB2ZXJzaW9uLiBQbGVhc2UgaGF2ZSBhIHJldmlldy4NCg0KDQpC
ZXN0IHJlZ2FyZHMNCkxlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IENoZW5RaSBbbWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVy
LmNvbV0NCj4gU2VudDogTW9uZGF5LCBKdW5lIDE3LCAyMDE5IDE6MTcgUE0N
Cj4gVG86IExlaSwgTWFvaHVpL5eLIJbOjGQ7IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggdjJdIG9wZW5zc2w6IEZpeCBhIGJ1aWxkIGJ1ZyBvbiBh
YXJjaDY0QkUuDQo+IA0KPiBPbiAwNi8wNi8yMDE5IDA1OjQ2IEFNLCBMZWkg
TWFvaHVpIHdyb3RlOg0KPiA+IEZpeCBidWcgYXMgZm9sbG93aW5nIG9uIGFh
cmNoNjRCRToNCj4gPg0KPiA+IEVycm9yOiBvcGVyYW5kIDEgbXVzdCBiZSBh
biBpbnRlZ2VyIHJlZ2lzdGVyIC0tIGByZXYgdjMxLjE2Yix2MzEuMTZiJw0K
PiA+DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9w
dWxsLzkxNTENCj4gPg0KPiA+IFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVk
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9o
dWlAY24uZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gICAuLi4wMS1GaXgt
YnVpbGQtZXJyb3ItZm9yLWFhcmNoNjQtYmlnLWVuZGlhbi5wYXRjaCB8IDQx
DQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIC4uLi9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFjLmJiIHwgIDEg
Kw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1GaXgtDQo+IGJ1aWxkLWVycm9y
LWZvci1hYXJjaDY0LWJpZy1lbmRpYW4ucGF0Y2gNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbC8wMDAxLUZpeC1idWlsZC1lcnJvci0NCj4gZm9yLWFhcmNoNjQtYmln
LWVuZGlhbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsLzAwMDEtDQo+IEZpeC1idWlsZC1lcnJvci1mb3ItYWFy
Y2g2NC1iaWctZW5kaWFuLnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwLi42NWNhMDJjDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsLzAwMDEtRml4LWJ1aWxkLWVycm9yLWZvci0NCj4gYWFy
Y2g2NC1iaWctZW5kaWFuLnBhdGNoDQo+ID4gQEAgLTAsMCArMSw0MSBAQA0K
PiA+ICtGcm9tIDFmOGMwZjJmZWVhNWNkY2FlMGJjZDlkZmM3ODE5OGQ5ZTJj
NGNmMDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+ID4gK0Zyb206IExl
aSBNYW9odWkgPGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gPiArRGF0
ZTogVGh1LCAxMyBKdW4gMjAxOSAxMjoxNzozMCArMDkwMA0KPiA+ICtTdWJq
ZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCBlcnJvciBmb3IgYWFyY2g2NCBiaWcg
ZW5kaWFuLg0KPiA+ICsNCj4gPiArTW9kaWZpZWQgcmV2IHRvIHJldjY0LCBi
ZWNhdXNlIHJldiBvbmx5IHRha2VzIGludGVnZXIgcmVnaXN0ZXJzLg0KPiA+
ICtodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9p
ZD05MDgyNw0KPiA+ICtPdGhlcndpc2UsIHRoZSBmb2xsb3dpbmcgZXJyb3Ig
d2lsbCBvY2N1ci4NCj4gPiArDQo+ID4gK0Vycm9yOiBvcGVyYW5kIDEgbXVz
dCBiZSBhbiBpbnRlZ2VyIHJlZ2lzdGVyIC0tIGByZXYgdjMxLjE2Yix2MzEu
MTZiJw0KPiA+ICsNCj4gDQo+IFB1dCBVcHN0cmVhbS1TdGF0dXMgaGVyZS4N
Cj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gQ2hlbiBRaQ0KPiANCj4gPiArU2ln
bmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3Uu
Y29tPg0KPiA+ICstLS0NCj4gPiArIGNyeXB0by9zaGEvYXNtL2tlY2NhazE2
MDAtYXJtdjgucGwgfCA0ICsrLS0NCj4gPiArIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gKw0KPiA+ICtk
aWZmIC0tZ2l0IGEvY3J5cHRvL3NoYS9hc20va2VjY2FrMTYwMC1hcm12OC5w
bCBiL2NyeXB0by9zaGEvYXNtL2tlY2NhazE2MDAtDQo+IGFybXY4LnBsDQo+
ID4gK2luZGV4IGRjNzJmMTguLjY2MjA2OTAgMTAwNzU1DQo+ID4gKy0tLSBh
L2NyeXB0by9zaGEvYXNtL2tlY2NhazE2MDAtYXJtdjgucGwNCj4gPiArKysr
IGIvY3J5cHRvL3NoYS9hc20va2VjY2FrMTYwMC1hcm12OC5wbA0KPiA+ICtA
QCAtNzMxLDcgKzczMSw3IEBAICRjb2RlLj08PF9fXzsNCj4gPiArIAlibG8J
Lkxwcm9jZXNzX2Jsb2NrX2NlDQo+ID4gKyAJbGRyCWQzMSxbJGlucF0sIzgJ
CS8vICppbnArKw0KPiA+ICsgI2lmZGVmCV9fQUFSQ0g2NEVCX18NCj4gPiAr
LQlyZXYJdjMxLjE2Yix2MzEuMTZiDQo+ID4gKysJcmV2NjQJdjMxLjE2Yix2
MzEuMTZiDQo+ID4gKyAjZW5kaWYNCj4gPiArIAllb3IJJEFbJGovNV1bJGol
NV0sJEFbJGovNV1bJGolNV0sdjMxLjE2Yg0KPiA+ICsgCWJlcQkuTHByb2Nl
c3NfYmxvY2tfY2UNCj4gPiArQEAgLTc0MCw3ICs3NDAsNyBAQCBfX18NCj4g
PiArICRjb2RlLj08PF9fXzsNCj4gPiArIAlsZHIJZDMxLFskaW5wXSwjOAkJ
Ly8gKmlucCsrDQo+ID4gKyAjaWZkZWYJX19BQVJDSDY0RUJfXw0KPiA+ICst
CXJldgl2MzEuMTZiLHYzMS4xNmINCj4gPiArKwlyZXY2NAl2MzEuMTZiLHYz
MS4xNmINCj4gPiArICNlbmRpZg0KPiA+ICsgCWVvcgkkQVs0XVs0XSwkQVs0
XVs0XSx2MzEuMTZiDQo+ID4gKw0KPiA+ICstLQ0KPiA+ICsyLjcuNA0KPiA+
ICsNCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFjLmJiDQo+IGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFjLmJiDQo+ID4g
aW5kZXggNjY5YjFhMS4uZWM4NWNjZCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjEuMWMu
YmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2wvb3BlbnNzbF8xLjEuMWMuYmINCj4gPiBAQCAtMTYsNiArMTYsNyBAQCBT
UkNfVVJJID0gImh0dHA6Ly93d3cub3BlbnNzbC5vcmcvc291cmNlL29wZW5z
c2wtDQo+ICR7UFZ9LnRhci5neiBcDQo+ID4gICAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLXNraXAtdGVzdF9zeW1ib2xfcHJlc2VuY2UucGF0Y2ggXA0KPiA+
ICAgICAgICAgICAgICBmaWxlOi8vMDAwMS1idWlsZGluZm8tc3RyaXAtc3lz
cm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLQ0KPiBjby5wYXRjaCBc
DQo+ID4gICAgICAgICAgICAgIGZpbGU6Ly9hZmFsZy5wYXRjaCBcDQo+ID4g
KyAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLWVycm9yLWZvci1h
YXJjaDY0LWJpZy1lbmRpYW4ucGF0Y2ggXA0KPiA+ICAgICAgICAgICAgICAi
DQo+ID4NCj4gPiAgIFNSQ19VUklfYXBwZW5kX2NsYXNzLW5hdGl2ZXNkayA9
ICIgXA0KPiANCj4gDQo+IA0KDQoKCg==

