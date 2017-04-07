Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09FCB72F59
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491556243; x=1523092243;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=aVK8mwR5+s7Q9L7884tl7tE8CIU6IEfb7jX37ZSy6aY=;
	b=ZxyD1SA1Nf2FxgCe06OTFBl9uu1Qb9gXUyqG2IrT+5ajJ6aB2omfZymI
	X/5c/TieRhuqTHOJPs+juipl2PU6iA==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 02:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="84623325"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by orsmga005.jf.intel.com with ESMTP; 07 Apr 2017 02:10:41 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.238]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.5]) with mapi id
	14.03.0319.002; Fri, 7 Apr 2017 17:10:39 +0800
From: "Choong, Yin Thong" <yin.thong.choong@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 4/8] logrotate: replace fedorahosted.org
	SRC_URI with github.com source
Thread-Index: AQHSrrFkIo2TwkSBfEigdBZ5YvrjKaG4/+QAgACfnXA=
Date: Fri, 7 Apr 2017 09:10:39 +0000
Message-ID: <CF0C948DE8E2634BB64BF489FF9EF7E7CB2F5A@PGSMSX105.gar.corp.intel.com>
References: <1491467730-8418-1-git-send-email-yin.thong.choong@intel.com>
	<1491467730-8418-5-git-send-email-yin.thong.choong@intel.com>
	<1491550600.17200.82.camel@linuxfoundation.org>
In-Reply-To: <1491550600.17200.82.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Phoong, Stanley Cheong Kwan" <stanley.cheong.kwan.phoong@intel.com>, "Khor,
	Chin Kooi" <chin.kooi.khor@intel.com>, "Gan,
	Yau Wai" <yau.wai.gan@intel.com>, "Ang,
	Chin Huat" <chin.huat.ang@intel.com>, "Tan, 
	Shen Joon" <shen.joon.tan@intel.com>, "Ng,
	Wei Tee" <wei.tee.ng@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
Subject: Re: [PATCH v3 4/8] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Fri, 07 Apr 2017 09:10:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgd2lyZWQuIEkgYml0YmFrZSBzdWNjZXNzZnVsIG9uIG15IG1hY2hpbmUuIGJpdGJha2UgbG9n
cm90YXRlIC1jY2xlYW5hbGwgYW5kIGJpdGJha2UgbG9ncm90YXRlLg0KSW4gdGhpcyBjYXNlLCBJ
IHNob3VsZCBzdWJtaXQgbXkgZW50aXJlIHBhdGNoIG9yIG9ubHkgcmVzdWJtaXQgdGhpcyBwYXRj
aCBbUEFUQ0ggdjMgNC84XSB3aXRoIGNvdmVyIGxldHRlcj8NCg0KVGhhbmtzIGFuZCBSZWdhcmRz
DQpDaG9vbmcgWWluVGhvbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJp
Y2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10g
DQpTZW50OiBGcmlkYXksIEFwcmlsIDcsIDIwMTcgMzozNyBQTQ0KVG86IENob29uZywgWWluIFRo
b25nIDx5aW4udGhvbmcuY2hvb25nQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYzIDQvOF0g
bG9ncm90YXRlOiByZXBsYWNlIGZlZG9yYWhvc3RlZC5vcmcgU1JDX1VSSSB3aXRoIGdpdGh1Yi5j
b20gc291cmNlDQoNCk9uIFRodSwgMjAxNy0wNC0wNiBhdCAwMTozNSAtMDcwMCwgeWluLnRob25n
LmNob29uZ0BpbnRlbC5jb20gd3JvdGU6DQo+IEZyb206IENob29uZyBZaW5UaG9uZyA8eWluLnRo
b25nLmNob29uZ0BpbnRlbC5jb20+DQo+IA0KPiBmZWRvcmFob3N0ZWQub3JnIHdhcyByZXRpcmVk
IG9uIE1hcmNoIDFzdCwgMjAxNy4gVGhpcyBpcyB0byB1cGRhdGUgdGhlIA0KPiBTUkNfVVJJIHRv
IHBvaW50IHRvIGdpdGh1Yi5jb20uDQo+IA0KPiBbWU9DVE8gIzExMjI2XQ0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQ2hvb25nIFlpblRob25nIDx5aW4udGhvbmcuY2hvb25nQGludGVsLmNvbT4NCg0K
VGhpcyBmYWlsZWQgYXV0b2J1aWxkZXIgdGVzdGluZyBpbiBtdWx0aWxpYiBidWlsZHM6DQoNCmh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vYnVpbGRlcnMvbmlnaHRseS13b3JsZC1sc2IvYnVp
bGRzLzIxNC9zdGVwcy9CdWlsZEltYWdlcy9sb2dzL3N0ZGlvDQpodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvLmlvL2J1aWxkZXJzL25pZ2h0bHktd29ybGQvYnVpbGRzLzIxNC9zdGVwcy9CdWlsZElt
YWdlcy9sb2dzL3N0ZGlvDQoNClByb2JhYmx5IHlvdSBuZWVkICR7QlBOfSwgbm90ICR7UE59Lg0K
DQo+IMKgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy45LjEuYmIg
fCAxOQ0KPiArKysrKysrKysrKysrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy45LjEuYmINCj4gYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbG9ncm90YXRlL2xvZ3JvdGF0ZV8zLjkuMS5iYg0KPiBpbmRleCA5YzJkZmUwLi41
Y2JkOWZmIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbG9ncm90YXRlL2xv
Z3JvdGF0ZV8zLjkuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbG9ncm90YXRl
L2xvZ3JvdGF0ZV8zLjkuMS5iYg0KPiBAQCAtMSw2ICsxLDYgQEANCj4gwqBTVU1NQVJZID0gIlJv
dGF0ZXMsIGNvbXByZXNzZXMsIHJlbW92ZXMgYW5kIG1haWxzIHN5c3RlbSBsb2cgZmlsZXMiDQo+
IMKgU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIg0KPiAtSE9NRVBBR0UgPSAiaHR0cHM6Ly9mZWRv
cmFob3N0ZWQub3JnL2xvZ3JvdGF0ZS8iDQo+ICtIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5j
b20vbG9ncm90YXRlL2xvZ3JvdGF0ZS9pc3N1ZXMiDQo+IMKgTElDRU5TRSA9ICJHUEx2MiINCj4g
wqANCj4gwqAjIFRPRE86IGxvZ3JvdGF0ZSAzLjguOCBhZGRzIGF1dG90b29scy9hdXRvbWFrZSBz
dXBwb3J0LCB1cGRhdGUgDQo+IHJlY2lwZSB0byB1c2UgaXQuDQo+IEBAIC0xMCwxNCArMTAsMjUg
QEAgREVQRU5EUz0iY29yZXV0aWxzIHBvcHQiDQo+IMKgDQo+IMKgTElDX0ZJTEVTX0NIS1NVTSA9
DQo+ICJmaWxlOi8vQ09QWUlORzttZDU9MTg4MTA2NjlmMTNiODczNDg0NTllNjExZDMxYWI3NjAi
DQo+IMKgDQo+IC1TUkNfVVJJID0gImh0dHBzOi8vZmVkb3JhaG9zdGVkLm9yZy9yZWxlYXNlcy9s
L28vbG9ncm90YXRlL2xvZ3JvdGF0ZQ0KPiAtJHtQVn0udGFyLmd6IFwNCj4gKyMgV2hlbiB1cGRh
dGluZyBsb2dyb3RhdGUgdG8gbGF0ZXN0IHVwc3RyZWFtLCBTUkNfVVJJIHNob3VsZCBwb2ludA0K
PiB0bw0KPiArIyBhIHByb3BlciByZWxlYXNlIHRhcmJhbGwgZnJvbSBodHRwczovL2dpdGh1Yi5j
b20vbG9ncm90YXRlL2xvZ3JvdGENCj4gdGUvcmVsZWFzZXMNCj4gKyMgYW5kIHdlIGhhdmUgdG8g
dGFrZSB0aGUgc25hcHNob3QgZm9yIG5vdyBiZWNhdXNlIHRoZXJlIGlzIG5vIHN1Y2ggIyANCj4g
K3RhcmJhbGwgYXZhaWxhYmxlIGZvciAzLjkuMS4NCj4gKw0KPiArUyA9ICIke1dPUktESVJ9LyR7
UE59LXIzLTktMSINCj4gKw0KPiArVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS8ke1BOfS8ke1BOfS9yZWxlYXNlcyINCj4gKw0KPiArU1JDX1VSSSA9ICJodHRwczovL2dp
dGh1Yi5jb20vJHtQTn0vJHtQTn0vYXJjaGl2ZS9yMy05LTEudGFyLmd6IFwNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZmlsZTovL2FjdC1hcy1tdi13aGVuLXJvdGF0ZS5wYXRjaCBcDQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZpbGU6Ly91cGRhdGUtdGhlLW1hbnVhbC5wYXRjaCBcDQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZpbGU6Ly9kaXNhYmxlLWNoZWNrLWRpZmZlcmVudC1m
aWxlc3lzdGVtcy5wYXRjaCBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIg0KPiDCoA0K
PiAtU1JDX1VSSVttZDVzdW1dID0gIjQ0OTJiMTQ1YjZkNTQyZTRhMmY0MWU3N2ZhMTk5YWIwIg0K
PiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjAyMjc2OWUzMjg4YzgwOTgxNTU5YTg0MjE3MDNj
ODhlODQzOGI0NDcyMzVlMzZkZDNjOGU5N2NkOTRjNTI1NDUiDQo+ICsjIENoZWNrc3VtIGNoYW5n
ZWQgZHVlIHRvIHRhcmJhbGwgc291cmNlIGZvbGRlciBjaGFuZ2VzIGluIHVwc3RyZWFtDQo+ICsJ
CQkNCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICI4NTcyYjdjMmNmOWFkZTA5YThhOGUxMDA5ODUwMGZi
MyINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI1YmY4ZTQ3OGM0MjhlNzc0NGZlZmE0NjUx
MThmODI5NmU3ZTc3MWM5ODFmYjZkZmZiNzUyNzg1NmEwZWEzNjE3Ig0KPiDCoA0KPiDCoFBBQ0tB
R0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2FjbCAN
Cj4gc2VsaW51eCcsIGQpfSINCj4gwqANCj4gLS0NCj4gMi43LjQNCj4gDQo=

