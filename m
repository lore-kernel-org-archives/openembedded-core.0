Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id E9C247526A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:54:07 +0000 (UTC)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
	by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 418wbh3L9Tz1XLFYj;
	Tue, 19 Jun 2018 06:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1529384048;
	bh=0/uKPD6zO90LeoOjUbFk1zweH/Se7LWOQW33ahYMDdA=; l=10;
	h=From:From:Reply-To:Sender;
	b=dRuLv2gl3bJjcg+HpqG7g04/AnIIzCa3r5bJ1KXTBHN8omU3ZVEvvseuWcnfxauEE
	hvmyQzLWkwC6YOHjlAyWsiabK6GY9QTQQWKv36/Bkjr5byz3D4duN3fYMvY50B32qQ
	w/E+ipNNU1z+xoG+Z2L7hqHrCdlcdJ7zFeJudXzk=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 418wbh2yMCz1KF;
	Tue, 19 Jun 2018 06:54:08 +0200 (CEST)
X-AuditID: 0a3aad12-ef5ff70000016568-74-5b288c6d583e
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id
	B7.52.25960.D6C882B5; Tue, 19 Jun 2018 06:54:05 +0200 (CEST)
Received: from FE-MBX2038.de.bosch.com (fe-mbx2038.de.bosch.com [10.3.231.48])
	by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 418wbh1MwRzBpBW;
	Tue, 19 Jun 2018 06:54:08 +0200 (CEST)
Received: from SGPMBX2018.APAC.bosch.com (10.187.83.36) by
	FE-MBX2038.de.bosch.com (10.3.231.48) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Tue, 19 Jun 2018 06:54:07 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2018.APAC.bosch.com (10.187.83.36) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Tue, 19 Jun 2018 12:54:05 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.008; Tue, 19 Jun 2018 12:54:05 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug
	sources in externalsrc -dbg packages
Thread-Index: AQHT7aL1NBdDeQv1gUOwAbts2z5YlqQ4scOAgC1EdYCAAUFHUA==
Date: Tue, 19 Jun 2018 04:54:05 +0000
Message-ID: <c26a71ac52144bf1afc9a0c7f42f923a@in.bosch.com>
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqTp4y-a=cxdhy-DCax+V2h=S+QRY419qYiMgeBNuGtwg@mail.gmail.com>
In-Reply-To: <CAMKF1sqTp4y-a=cxdhy-DCax+V2h=S+QRY419qYiMgeBNuGtwg@mail.gmail.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.208]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tf1CTdRzH+W7PtmeTBx6eB7aPc9g50axLHEYeIkflHxz1V3DXH0mWA57Y
	TrbRnoFCHecVzTmm+bPLJ6CiLRBmGqe0wDNvRxZD9A4xEiWbgKfLiuRQmYE94xluf/Tf+/t5
	f16f9/f7ee7BxdRpXI0bzTbGatZXaqUKTJF7PH2tybWmRGf/ZVXO9dm/ZDlXOFWOfYRDL4kL
	v+fGZIUt/UWFF79tR6+JtyjyyplKYw1jXZe/TWHgTh6TVP2ctbN3Zp90F3LrnEiOA5kNtwdD
	yIkUOEV+KoKwo1kiHM4geHztVtSZQvBRx1zUmUZwci4gi/AU2YfgR29eREvJAug8/IEoolPJ
	YvDv4xZ6xOQ2+LuhcaFOkyb42HdMJvSYwTd8ExP0Zpg8EJRENEaugr6OswuaIDdB12dhTAge
	RHDbN4kihpwsgsETDxaGIjIdWq8exIQwFYxOfC4SHkeC+8wlsaDT4M74vETQK+DP7k6+H+f7
	n4ETPesEdAUcbgzKhNwU6D86ge1HwMVN5WIEF0dwccQXCOtAaaxRV2PK3pC9PtNayrB1uqzM
	MoupCwlfkPKhRk+pH5E40iYSmt1rSiiJvoatNfnRC7hIm0Yo3+JLSaWW8lqDnjW8ba2uZFit
	mkAJCQkU/aTMVpeajCxrtJj9CHCxNpU4/x7PEeX62jrGahEwP1qGY1oV4Sp/fwtFVuhtzHaG
	qWKsi+4mHNcC0dzIgylWpoLZ+Y6x0rZoa9OFTGW8Ex8rwuV+9DyeyGcHHZFstkpvYo0VUXyp
	gFOL1RgaQK/gd+0ulxifuPyJS0xhZouZUauIASc/hYz0G6rNT+6h1hCZrRklVFqcEZsVQlcR
	v0maoCOvSOR/l9gNgPDRTW9QKdFiDFrv4RmyPRmaLowgaPHNIAjd2CsGR+sMBtfu90ngG/uQ
	BB7+fk8KQz2cDCaCozIYfjQug4fnPpSDc3aPHKYPNcnhn5FHS6D9j8eJ0DoWJqD9uCcJwkeP
	JEP3sJsE39xsCrj2dNLw6/xPNHBfTtHw2y27Eu7u7lYCdzmghBbvdYCDTsdS8E4dUcPpB50a
	+PfUdxrwNjUuD/HrFfHrPVX3dGS9Nr3tf9YbrcZep96F9GX5W++H3U8tKysa+KHruR3J0+Tr
	0vzM+uaCS5qa1V0NxRdHv3a8u5EeWjl+6Ob5A56erXhbm8R9LzhW/2Ygoyp1e+/epALXao+v
	3nujobB/gO5Ayq9erOMytG1scH5Dce6FlWg5tlH16h1P/8u63N6RzUvmApbJc/vPXgmt3ZGX
	ocVYgz7rWbGV1f8HdwMsg8gEAAA=
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Tue, 19 Jun 2018 04:54:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gS2hlbSwNCg0KPj4gcGVyaGFwcyBzZXR0aW5nIERFQlVHX1BSRUZJWF9NQVAgcmVsYXRp
dmUgdG8gUyBpbnN0ZWFkIG9mIFdPUktESVIgaXMNCj4+IGdvaW5nIHRvIHRha2UgY2FyZSBvZiB0
aGlzDQoNCkRvIHlvdSBtZWFuIHRvIGNoYW5nZSBpdCBhdCBiaXRiYWtlLmNvbmYgPw0KDQpNaXQg
ZnJldW5kbGljaGVuIEdyw7zDn2VuIC8gQmVzdCByZWdhcmRzDQoNClJhamVuZHJhbiBWaWduZXNo
DQpSQkVJL0VDRjMzICANCg0KVGVsLiArOTEgNDIyIDY3LTY1MTAzIA0KDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNv
bV0gDQpTZW50OiBNb25kYXksIEp1bmUgMTgsIDIwMTggMTE6MTMgUE0NClRvOiBQYXVsIEVnZ2xl
dG9uIDxwYXVsLmVnZ2xldG9uQGxpbnV4LmludGVsLmNvbT4NCkNjOiBWaWduZXNoIFJhamVuZHJh
biAoUkJFSS9FQ0YzKSA8VmlnbmVzaC5SYWplbmRyYW5AaW4uYm9zY2guY29tPjsgUGF0Y2hlcyBh
bmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFttZXRhLW9l
XVtQQVRDSF0gcGFja2FnZS5iYmNsYXNzOiBwcm92aWRlIGRlYnVnIHNvdXJjZXMgaW4gZXh0ZXJu
YWxzcmMgLWRiZyBwYWNrYWdlcw0KDQpPbiBTdW4sIE1heSAyMCwgMjAxOCBhdCAzOjI2IFBNIFBh
dWwgRWdnbGV0b24NCjxwYXVsLmVnZ2xldG9uQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+DQo+
IEhpIFZpZ25lc2gsDQo+DQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBhIHF1ZXN0aW9uIGJlbG93
Lg0KPg0KPiBPbiBUaHVyc2RheSwgMTcgTWF5IDIwMTggNTo1MDowMCBQTSBOWlNUIFZpZ25lc2gg
UmFqZW5kcmFuIHdyb3RlOg0KPiA+IFRoZSByZWNpcGVzIHdoaWNoIGFyZSB1c2luZyBleHRlcm5h
bHNyYyBtZXRob2QgZG9lc24ndCBjb250YWluIHRoZQ0KPiA+IGRlYnVnIHNvdXJjZXMgaW4gdGhl
aXIgLWRiZyBwYWNrYWdlcy4NCj4gPg0KPiA+IEFkZCBhIGhhbmRsaW5nIGluIGNvcHlkZWJ1Z3Nv
dXJjZXMgZnVuY3Rpb24gdG8gY29weSB0aGUgZGVidWdzb3VyY2VzIGZvcg0KPiA+IGV4dGVybmFs
c3JjIC1kYmcgcGFja2FnZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaWduZXNoIFJhamVu
ZHJhbiA8dmlnbmVzaC5yYWplbmRyYW5AaW4uYm9zY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRh
L2NsYXNzZXMvZXh0ZXJuYWxzcmMuYmJjbGFzcyB8ICAzICsrKw0KPiA+ICBtZXRhL2NsYXNzZXMv
cGFja2FnZS5iYmNsYXNzICAgICB8IDEyICsrKysrKysrKystLQ0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvbWV0YS9jbGFzc2VzL2V4dGVybmFsc3JjLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvZXh0ZXJu
YWxzcmMuYmJjbGFzcw0KPiA+IGluZGV4IGM5ZjVjZjcuLjEzNTY3MGQgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9jbGFzc2VzL2V4dGVybmFsc3JjLmJiY2xhc3MNCj4gPiArKysgYi9tZXRhL2NsYXNz
ZXMvZXh0ZXJuYWxzcmMuYmJjbGFzcw0KPiA+IEBAIC0xMjksNiArMTI5LDkgQEAgcHl0aG9uICgp
IHsNCj4gPiAgICAgICAgICAgICAgZC5zZXRWYXIoJ0NPTkZJR1VSRVNUQU1QRklMRScsIGNvbmZp
Z3N0YW1wKQ0KPiA+ICAgICAgICAgICAgICBkLnNldFZhcignU1RBTVAnLCAnJHtTVEFNUFNfRElS
fS93b3JrLXNoYXJlZC8ke1BOfS8ke0VYVEVORFBFfSR7UFZ9LSR7UFJ9JykNCj4gPiAgICAgICAg
ICAgICAgZC5zZXRWYXIoJ1NUQU1QQ0xFQU4nLCAnJHtTVEFNUFNfRElSfS93b3JrLXNoYXJlZC8k
e1BOfS8qLSonKQ0KPiA+ICsNCj4gPiArICAgICAjIHNldCBERUJVR19QUkVGSVhfTUFQIHRvIGV4
dGVybmFsIHNvdXJjZSBwYXRoDQo+ID4gKyAgICAgZC5hcHBlbmRWYXIoIkRFQlVHX1BSRUZJWF9N
QVAiLCAiLWZkZWJ1Zy1wcmVmaXgtbWFwPSR7RVhURVJOQUxTUkN9PS91c3Ivc3JjL2RlYnVnLyR7
UE59LyR7RVhURU5EUEV9JHtQVn0tJHtQUn0iKQ0KPiA+ICB9DQo+ID4NCj4gPiAgcHl0aG9uIGV4
dGVybmFsc3JjX2NvbmZpZ3VyZV9wcmVmdW5jKCkgew0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMvcGFja2FnZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0KPiA+
IGluZGV4IGVkZWZmYTkuLmYwNzFhMmUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL3Bh
Y2thZ2UuYmJjbGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MNCj4g
PiBAQCAtNDIwLDYgKzQyMCw3IEBAIGRlZiBjb3B5ZGVidWdzb3VyY2VzKGRlYnVnc3JjZGlyLCBk
KToNCj4gPiAgICAgICAgICB3b3JrZGlyID0gZC5nZXRWYXIoIldPUktESVIiKQ0KPiA+ICAgICAg
ICAgIHdvcmtwYXJlbnRkaXIgPSBvcy5wYXRoLmRpcm5hbWUob3MucGF0aC5kaXJuYW1lKHdvcmtk
aXIpKQ0KPiA+ICAgICAgICAgIHdvcmtiYXNlZGlyID0gb3MucGF0aC5iYXNlbmFtZShvcy5wYXRo
LmRpcm5hbWUod29ya2RpcikpICsgIi8iICsgb3MucGF0aC5iYXNlbmFtZSh3b3JrZGlyKQ0KPiA+
ICsgICAgICAgIGV4dGVybmFsc3JjID0gZC5nZXRWYXIoJ0VYVEVSTkFMU1JDJywgVHJ1ZSkNCj4g
Pg0KPiA+ICAgICAgICAgICMgSWYgYnVpbGQgcGF0aCBleGlzdHMgaW4gc291cmNlZmlsZSwgaXQg
bWVhbnMgdG9vbGNoYWluIGRpZCBub3QgdXNlDQo+ID4gICAgICAgICAgIyAtZmRlYnVnLXByZWZp
eC1tYXAgdG8gY29tcGlsZQ0KPiA+IEBAIC00NDQsOSArNDQ1LDE2IEBAIGRlZiBjb3B5ZGVidWdz
b3VyY2VzKGRlYnVnc3JjZGlyLCBkKToNCj4gPiAgICAgICAgICBwcm9jZXNzZGVidWdzcmMgKz0g
ImZncmVwIC16dyAnJXMnIHwgIg0KPiA+ICAgICAgICAgICMgUmVtb3ZlIHByZWZpeCBpbiB0aGUg
c291cmNlIHBhdGhzDQo+ID4gICAgICAgICAgcHJvY2Vzc2RlYnVnc3JjICs9ICJzZWQgJ3MjJXMj
I2cnIHwgIg0KPiA+IC0gICAgICAgIHByb2Nlc3NkZWJ1Z3NyYyArPSAiKGNkICclcycgOyBjcGlv
IC1wZDBtbEwgLS1uby1wcmVzZXJ2ZS1vd25lciAnJXMlcycgMj4vZGV2L251bGwpIg0KPiA+ICsg
ICAgICAgICMgaGFuZGxlIGV4dGVybmFsIHNvdXJjZXMgdG8gcHJvdmlkZSBzb3VyY2VzIGluIC1k
YmcgcGFja2FnZXMNCj4gPiArICAgICAgICBpZiBleHRlcm5hbHNyYzoNCj4gPiArICAgICAgICAg
ICAgbG9jYWxzcmNfcHJlZml4ID0gIi91c3Ivc3JjL2RlYnVnLyINCj4gPiArICAgICAgICAgICAg
cHJvY2Vzc2RlYnVnc3JjICs9ICJzZWQgJ3MjJXMvIyNnJyB8ICINCj4gPiArICAgICAgICAgICAg
cHJvY2Vzc2RlYnVnc3JjICs9ICIoY2QgJyVzJyA7IGNwaW8gLXBkMG1sTCAtLW5vLXByZXNlcnZl
LW93bmVyICclcyVzLyVzJyAyPi9kZXYvbnVsbCkiDQo+ID4gKyAgICAgICAgICAgIGNtZCA9IHBy
b2Nlc3NkZWJ1Z3NyYyAlIChzb3VyY2VmaWxlLCB3b3JrYmFzZWRpciwgbG9jYWxzcmNfcHJlZml4
LCB3b3JrYmFzZWRpciwgZXh0ZXJuYWxzcmMsIGR2YXIsIGRlYnVnc3JjZGlyLCB3b3JrYmFzZWRp
cikNCj4gPiArICAgICAgICBlbHNlOg0KPiA+ICsgICAgICAgICAgICBwcm9jZXNzZGVidWdzcmMg
Kz0gIihjZCAnJXMnIDsgY3BpbyAtcGQwbWxMIC0tbm8tcHJlc2VydmUtb3duZXIgJyVzJXMnIDI+
L2Rldi9udWxsKSINCj4gPiArICAgICAgICAgICAgY21kID0gcHJvY2Vzc2RlYnVnc3JjICUgKHNv
dXJjZWZpbGUsIHdvcmtiYXNlZGlyLCBsb2NhbHNyY19wcmVmaXgsIHdvcmtwYXJlbnRkaXIsIGR2
YXIsIGRlYnVnc3JjZGlyKQ0KPiA+DQo+ID4gLSAgICAgICAgY21kID0gcHJvY2Vzc2RlYnVnc3Jj
ICUgKHNvdXJjZWZpbGUsIHdvcmtiYXNlZGlyLCBsb2NhbHNyY19wcmVmaXgsIHdvcmtwYXJlbnRk
aXIsIGR2YXIsIGRlYnVnc3JjZGlyKQ0KPiA+ICAgICAgICAgIChyZXR2YWwsIG91dHB1dCkgPSBv
ZS51dGlscy5nZXRzdGF0dXNvdXRwdXQoY21kKQ0KPiA+ICAgICAgICAgICMgQ2FuICJmYWlsIiBp
ZiBpbnRlcm5hbCBoZWFkZXJzL3RyYW5zaWVudCBzb3VyY2VzIGFyZSBhdHRlbXB0ZWQNCj4gPiAg
ICAgICAgICAjaWYgcmV0dmFsOg0KPiA+DQo+DQo+IElzIHRoZXJlIGEgd2F5IHdlIGNhbiBmaXgg
dGhpcyB3aXRob3V0IGFkZGluZyBhIHJlZmVyZW5jZSB0byBleHRlcm5hbHNyYyBpbg0KPiBwYWNr
YWdlLmJiY2xhc3M/DQo+DQoNCnBlcmhhcHMgc2V0dGluZyBERUJVR19QUkVGSVhfTUFQIHJlbGF0
aXZlIHRvIFMgaW5zdGVhZCBvZiBXT1JLRElSIGlzDQpnb2luZyB0byB0YWtlIGNhcmUgb2YgdGhp
cw0KDQo+IENoZWVycywNCj4gUGF1bA0KPg0KPiAtLQ0KPg0KPiBQYXVsIEVnZ2xldG9uDQo+IElu
dGVsIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudHJlDQo+DQo+DQo+IC0tDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1j
b3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bmVtYmVkZGVkLWNvcmUNCg==

