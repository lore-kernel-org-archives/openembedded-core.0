Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id 8453678997
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 04:29:10 +0000 (UTC)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
	by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 41MMF318snz1XLDR2;
	Fri,  6 Jul 2018 06:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1530851351;
	bh=0/uKPD6zO90LeoOjUbFk1zweH/Se7LWOQW33ahYMDdA=; l=10;
	h=From:From:Reply-To:Sender;
	b=Si1TgcMvh46VqbSmFoE7DS9sPxSdpEay7cw4stPIb0WkwkAAZcuDj+a7c9hAYdEm+
	iXHRhsfaLKiZ6c29iD9LkUSWmsyMi09TQwS6fCt+Uv1UBm8khbr8Q6DhPhMCFf9fGH
	rXlyBPV47gIAy6vlhHxiqtPZr4zS6J87bTcGE2K4=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 41MMF30kMgz1Mc;
	Fri,  6 Jul 2018 06:29:11 +0200 (CEST)
X-AuditID: 0a3aad15-1a5ff70000001291-98-5b3ef01608eb
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id
	7E.C8.04753.610FE3B5; Fri,  6 Jul 2018 06:29:11 +0200 (CEST)
Received: from FE-MBX2008.de.bosch.com (fe-mbx2008.de.bosch.com [10.3.231.14])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 41MMF25RGrz6D4lbD; 
	Fri,  6 Jul 2018 06:29:10 +0200 (CEST)
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	FE-MBX2008.de.bosch.com (10.3.231.14) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Fri, 6 Jul 2018 06:29:10 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2020.APAC.bosch.com (10.187.83.43) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Fri, 6 Jul 2018 12:29:08 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.008; Fri, 6 Jul 2018 12:29:08 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug
	sources in externalsrc -dbg packages
Thread-Index: AQHT7aL1NBdDeQv1gUOwAbts2z5YlqQ4scOAgC1EdYCAAUFHUIAasLmQ
Date: Fri, 6 Jul 2018 04:29:08 +0000
Message-ID: <521b95cb51424da79205d466f7376a2d@in.bosch.com>
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqTp4y-a=cxdhy-DCax+V2h=S+QRY419qYiMgeBNuGtwg@mail.gmail.com> 
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.209]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22TfUwTdxjH+fWu7bXr4fVK24cOslA1070gTBhsGPYS40iWZWNbtiALs4yT
	NuvbegVE/nHToFKV1y56ElCUBFcdYWbYsUm2ug11BjIH8urUlQxkhnYuTl6k7toD2z/2z+X7
	fJ/7PN/f77kcgdGdhI4wWZ2Mw2ow6yVyXP7imeRntcHcwrTRJpQ9MT8rzR7itNnVwxx6Gcv7
	hrsuzWu5lJ/X39WB3sK2yjeVMGZTOePYkLtNbvT3tmP2K1k7QtMnpLtQ0/M1iCCAyoBznldr
	kJygqcMi8IfqkVD0IhjyD0qEIoCg6+EpqVDcRfCz/5BYKC4gWGxb4hkZIaG2gKfpM1FYJ1Bv
	g+8QJw1rjNoGgT2uiK+iLFDrPSUV3rGCd/APXNBb4ODsVGQOTq2BX/eew8KapHJg9OxPmBDW
	j+Di+YuRQYhKhrbRBlwI0MLYZGvEB4qCk98NYIJWw21/SCzoFOjqc2HhS2PUeujs2SCgKdDk
	uiUVspRw6cgkXoe0XMxULkpwMQQXQxxD+BdIvZ1JK7ekZ2WkpzqKGXZnWnrqRzbLV0j4amov
	6jzL+BBFIL2CPDqbW0iLDeVspcWHMgmRXk06O3grvthWUmk0sMYPHWVmhtXrSBQXF0erHtls
	WbHFxLImm9WHgMD0CeT5fJ4jSwyVOxmHTcB86HEC12vJ4+89XUhTpQYn8zHD2BnHSjeHIPRA
	5gV4UOlgSpkd201m50pbnyxkamI7sbEiQuZDGwkFn909E85m7QYLaypdxhMFnF5xo+hl9CYx
	tvtAA0Y8CLj554Tr8waMxq02K6PTkp3hlVBhylhmfXQaXRJ5rWhTIa2OaUQnzqBRxO9TRcrC
	d1HwP0r0HEB6Vc0FtHLZjELPtfMM1aOE5ivDCFq89xDM3DiIwb62eziM//ujGL6sviqG5uCQ
	BOZu3pXA1R5OCpO3xqQwuOiXwtz3u2VQM79fBv80Nsvg7+HFx6Djr4cKaLu+QELHmfZ4WDji
	XgXdgycp8C7NK+HAfo8KRkJ9KuCOB1Xw+5/VGrizt1sDD27/oAHut8saaDk9AdBQsy8RTgfd
	Ovj6vidphl+yiF9yPRVZstPg/J8lL7vR2+l2oUZ35nSRpO6DVpRUv1R7oT+z4rVA4uKnG9et
	pivNKQV9xvGsV0QzI96jFeXeqqopU6jLvSb+W89Cav7cJ+1VravGi+wn5O+6Exrvv3/zmTv1
	CwnTrsONT74xxQ3krH1hnSmUPzBescfzzo3Xf9k8MrD+JU/GXG3vE/aqaxkFirXarcE6Pc4a
	DelPYQ7W8B/0J8NPwgQAAA==
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
X-List-Received-Date: Fri, 06 Jul 2018 04:29:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gS2hlbSwNCg0KQ2FuIHlvdSBjbGFyaWZ5IHlvdXIgaWRlYSBhbmQgbXkgcXVlc3Rpb24/
DQoNCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4gLyBCZXN0IHJlZ2FyZHMNCg0KUmFqZW5kcmFu
IFZpZ25lc2gNClJCRUkvRUNGMzMgIA0KDQpUZWwuICs5MSA0MjIgNjctNjUxMDMgDQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFZpZ25lc2ggUmFqZW5kcmFuIChSQkVJL0VD
RjMpIA0KU2VudDogVHVlc2RheSwgSnVuZSAxOSwgMjAxOCAxMDoyNCBBTQ0KVG86ICdLaGVtIFJh
aicgPHJhai5raGVtQGdtYWlsLmNvbT47IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbGlu
dXguaW50ZWwuY29tPg0KQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1j
b3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3Vi
amVjdDogUkU6IFtPRS1jb3JlXSBbbWV0YS1vZV1bUEFUQ0hdIHBhY2thZ2UuYmJjbGFzczogcHJv
dmlkZSBkZWJ1ZyBzb3VyY2VzIGluIGV4dGVybmFsc3JjIC1kYmcgcGFja2FnZXMNCg0KSGVsbG8g
S2hlbSwNCg0KPj4gcGVyaGFwcyBzZXR0aW5nIERFQlVHX1BSRUZJWF9NQVAgcmVsYXRpdmUgdG8g
UyBpbnN0ZWFkIG9mIFdPUktESVIgaXMNCj4+IGdvaW5nIHRvIHRha2UgY2FyZSBvZiB0aGlzDQoN
CkRvIHlvdSBtZWFuIHRvIGNoYW5nZSBpdCBhdCBiaXRiYWtlLmNvbmYgPw0KDQpNaXQgZnJldW5k
bGljaGVuIEdyw7zDn2VuIC8gQmVzdCByZWdhcmRzDQoNClJhamVuZHJhbiBWaWduZXNoDQpSQkVJ
L0VDRjMzICANCg0KVGVsLiArOTEgNDIyIDY3LTY1MTAzIA0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0gDQpT
ZW50OiBNb25kYXksIEp1bmUgMTgsIDIwMTggMTE6MTMgUE0NClRvOiBQYXVsIEVnZ2xldG9uIDxw
YXVsLmVnZ2xldG9uQGxpbnV4LmludGVsLmNvbT4NCkNjOiBWaWduZXNoIFJhamVuZHJhbiAoUkJF
SS9FQ0YzKSA8VmlnbmVzaC5SYWplbmRyYW5AaW4uYm9zY2guY29tPjsgUGF0Y2hlcyBhbmQgZGlz
Y3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFttZXRhLW9lXVtQQVRD
SF0gcGFja2FnZS5iYmNsYXNzOiBwcm92aWRlIGRlYnVnIHNvdXJjZXMgaW4gZXh0ZXJuYWxzcmMg
LWRiZyBwYWNrYWdlcw0KDQpPbiBTdW4sIE1heSAyMCwgMjAxOCBhdCAzOjI2IFBNIFBhdWwgRWdn
bGV0b24NCjxwYXVsLmVnZ2xldG9uQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+DQo+IEhpIFZp
Z25lc2gsDQo+DQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBhIHF1ZXN0aW9uIGJlbG93Lg0KPg0K
PiBPbiBUaHVyc2RheSwgMTcgTWF5IDIwMTggNTo1MDowMCBQTSBOWlNUIFZpZ25lc2ggUmFqZW5k
cmFuIHdyb3RlOg0KPiA+IFRoZSByZWNpcGVzIHdoaWNoIGFyZSB1c2luZyBleHRlcm5hbHNyYyBt
ZXRob2QgZG9lc24ndCBjb250YWluIHRoZQ0KPiA+IGRlYnVnIHNvdXJjZXMgaW4gdGhlaXIgLWRi
ZyBwYWNrYWdlcy4NCj4gPg0KPiA+IEFkZCBhIGhhbmRsaW5nIGluIGNvcHlkZWJ1Z3NvdXJjZXMg
ZnVuY3Rpb24gdG8gY29weSB0aGUgZGVidWdzb3VyY2VzIGZvcg0KPiA+IGV4dGVybmFsc3JjIC1k
YmcgcGFja2FnZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaWduZXNoIFJhamVuZHJhbiA8
dmlnbmVzaC5yYWplbmRyYW5AaW4uYm9zY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL2NsYXNz
ZXMvZXh0ZXJuYWxzcmMuYmJjbGFzcyB8ICAzICsrKw0KPiA+ICBtZXRhL2NsYXNzZXMvcGFja2Fn
ZS5iYmNsYXNzICAgICB8IDEyICsrKysrKysrKystLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS9jbGFzc2VzL2V4dGVybmFsc3JjLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvZXh0ZXJuYWxzcmMu
YmJjbGFzcw0KPiA+IGluZGV4IGM5ZjVjZjcuLjEzNTY3MGQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0
YS9jbGFzc2VzL2V4dGVybmFsc3JjLmJiY2xhc3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMvZXh0
ZXJuYWxzcmMuYmJjbGFzcw0KPiA+IEBAIC0xMjksNiArMTI5LDkgQEAgcHl0aG9uICgpIHsNCj4g
PiAgICAgICAgICAgICAgZC5zZXRWYXIoJ0NPTkZJR1VSRVNUQU1QRklMRScsIGNvbmZpZ3N0YW1w
KQ0KPiA+ICAgICAgICAgICAgICBkLnNldFZhcignU1RBTVAnLCAnJHtTVEFNUFNfRElSfS93b3Jr
LXNoYXJlZC8ke1BOfS8ke0VYVEVORFBFfSR7UFZ9LSR7UFJ9JykNCj4gPiAgICAgICAgICAgICAg
ZC5zZXRWYXIoJ1NUQU1QQ0xFQU4nLCAnJHtTVEFNUFNfRElSfS93b3JrLXNoYXJlZC8ke1BOfS8q
LSonKQ0KPiA+ICsNCj4gPiArICAgICAjIHNldCBERUJVR19QUkVGSVhfTUFQIHRvIGV4dGVybmFs
IHNvdXJjZSBwYXRoDQo+ID4gKyAgICAgZC5hcHBlbmRWYXIoIkRFQlVHX1BSRUZJWF9NQVAiLCAi
LWZkZWJ1Zy1wcmVmaXgtbWFwPSR7RVhURVJOQUxTUkN9PS91c3Ivc3JjL2RlYnVnLyR7UE59LyR7
RVhURU5EUEV9JHtQVn0tJHtQUn0iKQ0KPiA+ICB9DQo+ID4NCj4gPiAgcHl0aG9uIGV4dGVybmFs
c3JjX2NvbmZpZ3VyZV9wcmVmdW5jKCkgew0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMv
cGFja2FnZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0KPiA+IGluZGV4
IGVkZWZmYTkuLmYwNzFhMmUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL3BhY2thZ2Uu
YmJjbGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MNCj4gPiBAQCAt
NDIwLDYgKzQyMCw3IEBAIGRlZiBjb3B5ZGVidWdzb3VyY2VzKGRlYnVnc3JjZGlyLCBkKToNCj4g
PiAgICAgICAgICB3b3JrZGlyID0gZC5nZXRWYXIoIldPUktESVIiKQ0KPiA+ICAgICAgICAgIHdv
cmtwYXJlbnRkaXIgPSBvcy5wYXRoLmRpcm5hbWUob3MucGF0aC5kaXJuYW1lKHdvcmtkaXIpKQ0K
PiA+ICAgICAgICAgIHdvcmtiYXNlZGlyID0gb3MucGF0aC5iYXNlbmFtZShvcy5wYXRoLmRpcm5h
bWUod29ya2RpcikpICsgIi8iICsgb3MucGF0aC5iYXNlbmFtZSh3b3JrZGlyKQ0KPiA+ICsgICAg
ICAgIGV4dGVybmFsc3JjID0gZC5nZXRWYXIoJ0VYVEVSTkFMU1JDJywgVHJ1ZSkNCj4gPg0KPiA+
ICAgICAgICAgICMgSWYgYnVpbGQgcGF0aCBleGlzdHMgaW4gc291cmNlZmlsZSwgaXQgbWVhbnMg
dG9vbGNoYWluIGRpZCBub3QgdXNlDQo+ID4gICAgICAgICAgIyAtZmRlYnVnLXByZWZpeC1tYXAg
dG8gY29tcGlsZQ0KPiA+IEBAIC00NDQsOSArNDQ1LDE2IEBAIGRlZiBjb3B5ZGVidWdzb3VyY2Vz
KGRlYnVnc3JjZGlyLCBkKToNCj4gPiAgICAgICAgICBwcm9jZXNzZGVidWdzcmMgKz0gImZncmVw
IC16dyAnJXMnIHwgIg0KPiA+ICAgICAgICAgICMgUmVtb3ZlIHByZWZpeCBpbiB0aGUgc291cmNl
IHBhdGhzDQo+ID4gICAgICAgICAgcHJvY2Vzc2RlYnVnc3JjICs9ICJzZWQgJ3MjJXMjI2cnIHwg
Ig0KPiA+IC0gICAgICAgIHByb2Nlc3NkZWJ1Z3NyYyArPSAiKGNkICclcycgOyBjcGlvIC1wZDBt
bEwgLS1uby1wcmVzZXJ2ZS1vd25lciAnJXMlcycgMj4vZGV2L251bGwpIg0KPiA+ICsgICAgICAg
ICMgaGFuZGxlIGV4dGVybmFsIHNvdXJjZXMgdG8gcHJvdmlkZSBzb3VyY2VzIGluIC1kYmcgcGFj
a2FnZXMNCj4gPiArICAgICAgICBpZiBleHRlcm5hbHNyYzoNCj4gPiArICAgICAgICAgICAgbG9j
YWxzcmNfcHJlZml4ID0gIi91c3Ivc3JjL2RlYnVnLyINCj4gPiArICAgICAgICAgICAgcHJvY2Vz
c2RlYnVnc3JjICs9ICJzZWQgJ3MjJXMvIyNnJyB8ICINCj4gPiArICAgICAgICAgICAgcHJvY2Vz
c2RlYnVnc3JjICs9ICIoY2QgJyVzJyA7IGNwaW8gLXBkMG1sTCAtLW5vLXByZXNlcnZlLW93bmVy
ICclcyVzLyVzJyAyPi9kZXYvbnVsbCkiDQo+ID4gKyAgICAgICAgICAgIGNtZCA9IHByb2Nlc3Nk
ZWJ1Z3NyYyAlIChzb3VyY2VmaWxlLCB3b3JrYmFzZWRpciwgbG9jYWxzcmNfcHJlZml4LCB3b3Jr
YmFzZWRpciwgZXh0ZXJuYWxzcmMsIGR2YXIsIGRlYnVnc3JjZGlyLCB3b3JrYmFzZWRpcikNCj4g
PiArICAgICAgICBlbHNlOg0KPiA+ICsgICAgICAgICAgICBwcm9jZXNzZGVidWdzcmMgKz0gIihj
ZCAnJXMnIDsgY3BpbyAtcGQwbWxMIC0tbm8tcHJlc2VydmUtb3duZXIgJyVzJXMnIDI+L2Rldi9u
dWxsKSINCj4gPiArICAgICAgICAgICAgY21kID0gcHJvY2Vzc2RlYnVnc3JjICUgKHNvdXJjZWZp
bGUsIHdvcmtiYXNlZGlyLCBsb2NhbHNyY19wcmVmaXgsIHdvcmtwYXJlbnRkaXIsIGR2YXIsIGRl
YnVnc3JjZGlyKQ0KPiA+DQo+ID4gLSAgICAgICAgY21kID0gcHJvY2Vzc2RlYnVnc3JjICUgKHNv
dXJjZWZpbGUsIHdvcmtiYXNlZGlyLCBsb2NhbHNyY19wcmVmaXgsIHdvcmtwYXJlbnRkaXIsIGR2
YXIsIGRlYnVnc3JjZGlyKQ0KPiA+ICAgICAgICAgIChyZXR2YWwsIG91dHB1dCkgPSBvZS51dGls
cy5nZXRzdGF0dXNvdXRwdXQoY21kKQ0KPiA+ICAgICAgICAgICMgQ2FuICJmYWlsIiBpZiBpbnRl
cm5hbCBoZWFkZXJzL3RyYW5zaWVudCBzb3VyY2VzIGFyZSBhdHRlbXB0ZWQNCj4gPiAgICAgICAg
ICAjaWYgcmV0dmFsOg0KPiA+DQo+DQo+IElzIHRoZXJlIGEgd2F5IHdlIGNhbiBmaXggdGhpcyB3
aXRob3V0IGFkZGluZyBhIHJlZmVyZW5jZSB0byBleHRlcm5hbHNyYyBpbg0KPiBwYWNrYWdlLmJi
Y2xhc3M/DQo+DQoNCnBlcmhhcHMgc2V0dGluZyBERUJVR19QUkVGSVhfTUFQIHJlbGF0aXZlIHRv
IFMgaW5zdGVhZCBvZiBXT1JLRElSIGlzDQpnb2luZyB0byB0YWtlIGNhcmUgb2YgdGhpcw0KDQo+
IENoZWVycywNCj4gUGF1bA0KPg0KPiAtLQ0KPg0KPiBQYXVsIEVnZ2xldG9uDQo+IEludGVsIE9w
ZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudHJlDQo+DQo+DQo+IC0tDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1h
aWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVk
ZGVkLWNvcmUNCg==

