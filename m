Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 226EC7E6E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 03:19:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,394,1557158400"; d="scan'208";a="68127636"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2019 11:19:10 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1113B4CDE93A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 11:19:10 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Thu, 20 Jun 2019 11:19:21 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][warrior][PATCH v3] openssl: Fix a build bug on
	aarch64BE.
Thread-Index: AQHVJasOUP82WUk4y02QSOE3Q2hrOaaj4mXw
Date: Thu, 20 Jun 2019 03:19:16 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF1308EE@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1559790295-34076-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1559790295-34076-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 1113B4CDE93A.ACF5A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [warrior][PATCH v3] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Thu, 20 Jun 2019 03:19:11 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExlaSwgTWFvaHVpDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDA2LCAyMDE5
IDExOjA1IEFNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiBMZWksIE1hb2h1aQ0KPiBTdWJqZWN0OiBb
T0UtY29yZV1bd2Fycmlvcl1bUEFUQ0ggdjNdIG9wZW5zc2w6IEZpeCBhIGJ1
aWxkIGJ1ZyBvbiBhYXJjaDY0QkUuDQo+IA0KPiBGaXggYnVnIGFzIGZvbGxv
d2luZyBvbiBhYXJjaDY0QkU6DQo+IA0KPiBFcnJvcjogb3BlcmFuZCAxIG11
c3QgYmUgYW4gaW50ZWdlciByZWdpc3RlciAtLSBgcmV2IHYzMS4xNmIsdjMx
LjE2YicNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1h
b2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4wMS1GaXgtYnVp
bGQtZXJyb3ItZm9yLWFhcmNoNjQtYmlnLWVuZGlhbi5wYXRjaCB8IDQzICsr
KysrKysrKysrKysrKysrKysrKysNCj4gIC4uLi9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFiLmJiIHwgIDEgKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29w
ZW5zc2wvMDAwMS1GaXgtYnVpbGQtDQo+IGVycm9yLWZvci1hYXJjaDY0LWJp
Zy1lbmRpYW4ucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLUZpeC1idWls
ZC1lcnJvci0NCj4gZm9yLWFhcmNoNjQtYmlnLWVuZGlhbi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEt
DQo+IEZpeC1idWlsZC1lcnJvci1mb3ItYWFyY2g2NC1iaWctZW5kaWFuLnBh
dGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAu
LjlhOTBhNjgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLUZpeC1idWls
ZC1lcnJvci1mb3ItDQo+IGFhcmNoNjQtYmlnLWVuZGlhbi5wYXRjaA0KPiBA
QCAtMCwwICsxLDQzIEBADQo+ICtGcm9tIDFmOGMwZjJmZWVhNWNkY2FlMGJj
ZDlkZmM3ODE5OGQ5ZTJjNGNmMDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
DQo+ICtGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5j
b20+DQo+ICtEYXRlOiBUaHUsIDEzIEp1biAyMDE5IDEyOjE3OjMwICswOTAw
DQo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCBlcnJvciBmb3IgYWFy
Y2g2NCBiaWcgZW5kaWFuLg0KPiArDQo+ICtNb2RpZmllZCByZXYgdG8gcmV2
NjQsIGJlY2F1c2UgcmV2IG9ubHkgdGFrZXMgaW50ZWdlciByZWdpc3RlcnMu
DQo+ICtodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNn
aT9pZD05MDgyNw0KPiArT3RoZXJ3aXNlLCB0aGUgZm9sbG93aW5nIGVycm9y
IHdpbGwgb2NjdXIuDQo+ICsNCj4gK0Vycm9yOiBvcGVyYW5kIDEgbXVzdCBi
ZSBhbiBpbnRlZ2VyIHJlZ2lzdGVyIC0tIGByZXYgdjMxLjE2Yix2MzEuMTZi
Jw0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6
Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9wdWxsLzkxNTFdDQo+ICsN
Cj4gK1NpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBjbi5m
dWppdHN1LmNvbT4NCj4gKy0tLQ0KPiArIGNyeXB0by9zaGEvYXNtL2tlY2Nh
azE2MDAtYXJtdjgucGwgfCA0ICsrLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZm
IC0tZ2l0IGEvY3J5cHRvL3NoYS9hc20va2VjY2FrMTYwMC1hcm12OC5wbCBi
L2NyeXB0by9zaGEvYXNtL2tlY2NhazE2MDAtDQo+IGFybXY4LnBsDQo+ICtp
bmRleCBkYzcyZjE4Li42NjIwNjkwIDEwMDc1NQ0KPiArLS0tIGEvY3J5cHRv
L3NoYS9hc20va2VjY2FrMTYwMC1hcm12OC5wbA0KPiArKysrIGIvY3J5cHRv
L3NoYS9hc20va2VjY2FrMTYwMC1hcm12OC5wbA0KPiArQEAgLTczMSw3ICs3
MzEsNyBAQCAkY29kZS49PDxfX187DQo+ICsgCWJsbwkuTHByb2Nlc3NfYmxv
Y2tfY2UNCj4gKyAJbGRyCWQzMSxbJGlucF0sIzgJCS8vICppbnArKw0KPiAr
ICNpZmRlZglfX0FBUkNINjRFQl9fDQo+ICstCXJldgl2MzEuMTZiLHYzMS4x
NmINCj4gKysJcmV2NjQJdjMxLjE2Yix2MzEuMTZiDQo+ICsgI2VuZGlmDQo+
ICsgCWVvcgkkQVskai81XVskaiU1XSwkQVskai81XVskaiU1XSx2MzEuMTZi
DQo+ICsgCWJlcQkuTHByb2Nlc3NfYmxvY2tfY2UNCj4gK0BAIC03NDAsNyAr
NzQwLDcgQEAgX19fDQo+ICsgJGNvZGUuPTw8X19fOw0KPiArIAlsZHIJZDMx
LFskaW5wXSwjOAkJLy8gKmlucCsrDQo+ICsgI2lmZGVmCV9fQUFSQ0g2NEVC
X18NCj4gKy0JcmV2CXYzMS4xNmIsdjMxLjE2Yg0KPiArKwlyZXY2NAl2MzEu
MTZiLHYzMS4xNmINCj4gKyAjZW5kaWYNCj4gKyAJZW9yCSRBWzRdWzRdLCRB
WzRdWzRdLHYzMS4xNmINCj4gKw0KPiArLS0NCj4gKzIuNy40DQo+ICsNCj4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
bC9vcGVuc3NsXzEuMS4xYi5iYg0KPiBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzEuMS4xYi5iYg0KPiBpbmRleCBkMzQw
NGQyLi40NjAzMGMzIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjEuMWIuYmINCj4gKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4x
LjFiLmJiDQo+IEBAIC0xNyw2ICsxNyw3IEBAIFNSQ19VUkkgPSAiaHR0cDov
L3d3dy5vcGVuc3NsLm9yZy9zb3VyY2Uvb3BlbnNzbC0ke1BWfS50YXIuZ3oN
Cj4gXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1idWlsZGluZm8tc3Ry
aXAtc3lzcm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLQ0KPiBjby5w
YXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly9hZmFsZy5wYXRjaCBcDQo+
ICAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAxOS0xNTQzLnBhdGNoIFwNCj4g
KyAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLWVycm9yLWZvci1h
YXJjaDY0LWJpZy1lbmRpYW4ucGF0Y2ggXA0KPiAgICAgICAgICAgICAiDQo+
IA0KPiAgU1JDX1VSSV9hcHBlbmRfY2xhc3MtbmF0aXZlc2RrID0gIiBcDQo+
IC0tDQo+IDIuNy40DQoNCgoK

