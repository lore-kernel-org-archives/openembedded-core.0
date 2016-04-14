Return-Path: <william.c.randle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 99F5D6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 00:14:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 13 Apr 2016 17:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,482,1455004800"; d="scan'208";a="944679632"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2016 17:14:31 -0700
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 13 Apr 2016 17:14:30 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX162.amr.corp.intel.com ([169.254.3.111]) with mapi id
	14.03.0248.002; Wed, 13 Apr 2016 17:14:30 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "danismostlikely@gmail.com"
	<danismostlikely@gmail.com>
Thread-Topic: [OE-core] [PATCH] package.bbclass: improve permission handling
Thread-Index: AQHRldJvW5fAXzoPuEeuUutKSgCoXp+JDu0A
Date: Thu, 14 Apr 2016 00:14:29 +0000
Message-ID: <1460592870.21923.18.camel@intel.com>
References: <1460569219.21923.2.camel@intel.com>
	<1460585876-26239-1-git-send-email-danismostlikely@gmail.com>
In-Reply-To: <1460585876-26239-1-git-send-email-danismostlikely@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.4.174]
MIME-Version: 1.0
Subject: Re: [PATCH] package.bbclass: improve permission handling
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
X-List-Received-Date: Thu, 14 Apr 2016 00:14:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB088442CE3E5443999A580B82CD0F32@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA0LTEzIGF0IDE2OjE3IC0wNjAwLCBEYW4gTWNHcmVnb3Igd3JvdGU6DQoN
CkZyb206IERhbiBNY0dyZWdvciA8ZGFuLm1jZ3JlZ29yQHVzYXNrLmNhPG1haWx0bzpkYW4ubWNn
cmVnb3JAdXNhc2suY2E+Pg0KDQpDaGFuZ2UgZnNfbGlua190YWJsZSB0byBiZSBrZXllZCBieSBw
YXRoLCBqdXN0IGxpa2UgZnNfcGVybXNfdGFibGUuDQpXaGVuIGEgbmV3IGVudHJ5IGlzIGNvbWlu
ZyBpbiBmb3IgZWl0aGVyIHRhYmxlLCByZW1vdmUgYW55IHByZXZpb3VzDQplbnRyeSBmb3IgdGhh
dCBwYXRoLiBUaGlzIHdheSBsYXRlciBwZXJtaXNzaW9uIGZpbGUgZW50cmllcyBvdmVycmlkZQ0K
ZWFybGllciBvbmVzLg0KDQpbWU9DVE8gIzk0MzBdDQoNClNpZ25lZC1vZmYtYnk6IERhbiBNY0dy
ZWdvciA8ZGFuLm1jZ3JlZ29yQHVzYXNrLmNhPG1haWx0bzpkYW4ubWNncmVnb3JAdXNhc2suY2E+
Pg0KLS0tDQogbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcyB8IDExICsrKysrKysrLS0tDQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL21ldGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvcGFja2Fn
ZS5iYmNsYXNzDQppbmRleCA4OTRiNzI5Li43NmI5Zjg2IDEwMDY0NA0KLS0tIGEvbWV0YS9jbGFz
c2VzL3BhY2thZ2UuYmJjbGFzcw0KKysrIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0K
QEAgLTc3NSw5ICs3NzUsMTMgQEAgcHl0aG9uIGZpeHVwX3Blcm1zICgpIHsNCiAgICAgICAgICAg
ICAgICAgZW50cnkgPSBmc19wZXJtc19lbnRyeShkLmV4cGFuZChsaW5lKSkNCiAgICAgICAgICAg
ICAgICAgaWYgZW50cnkgYW5kIGVudHJ5LnBhdGg6DQogICAgICAgICAgICAgICAgICAgICBpZiBl
bnRyeS5saW5rOg0KLSAgICAgICAgICAgICAgICAgICAgICAgIGZzX2xpbmtfdGFibGVbZW50cnku
bGlua10gPSBlbnRyeQ0KKyAgICAgICAgICAgICAgICAgICAgICAgIGZzX2xpbmtfdGFibGVbZW50
cnkucGF0aF0gPSBlbnRyeQ0KKyAgICAgICAgICAgICAgICAgICAgICAgIGlmIGVudHJ5LnBhdGgg
aW4gZnNfcGVybXNfdGFibGU6DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZzX3Blcm1z
X3RhYmxlLnBvcChlbnRyeS5wYXRoKQ0KICAgICAgICAgICAgICAgICAgICAgZWxzZToNCiAgICAg
ICAgICAgICAgICAgICAgICAgICBmc19wZXJtc190YWJsZVtlbnRyeS5wYXRoXSA9IGVudHJ5DQor
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgZW50cnkucGF0aCBpbiBmc19saW5rX3RhYmxlOg0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICBmc19saW5rX3RhYmxlLnBvcChlbnRyeS5wYXRo
KQ0KICAgICAgICAgICAgIGYuY2xvc2UoKQ0KDQogICAgICMgRGVidWcgLS0gbGlzdCBvdXQgaW4t
bWVtb3J5IHRhYmxlDQpAQCAtNzg5LDggKzc5Myw5IEBAIHB5dGhvbiBmaXh1cF9wZXJtcyAoKSB7
DQogICAgICMgV2UgcHJvY2VzcyBsaW5rcyBmaXJzdCwgc28gd2UgY2FuIGdvIGJhY2sgYW5kIGZp
eHVwIGRpcmVjdG9yeSBvd25lcnNoaXANCiAgICAgIyBmb3IgYW55IG5ld2x5IGNyZWF0ZWQgZGly
ZWN0b3JpZXMNCiAgICAgIyBQcm9jZXNzIGluIHNvcnRlZCBvcmRlciBzbyAvcnVuIGdldHMgY3Jl
YXRlZCBiZWZvcmUgL3J1bi9sb2NrLCBldGMuDQotICAgIGZvciBsaW5rIGluIHNvcnRlZChmc19s
aW5rX3RhYmxlKToNCi0gICAgICAgIGRpciA9IGZzX2xpbmtfdGFibGVbbGlua10ucGF0aA0KKyAg
ICBmb3IgZW50cnkgaW4gc29ydGVkKGZzX2xpbmtfdGFibGUudmFsdWVzKCksIGtleT1sYW1iZGEg
eDogeC5saW5rKToNCisgICAgICAgIGxpbmsgPSBlbnRyeS5saW5rDQorICAgICAgICBkaXIgPSBl
bnRyeS5wYXRoDQogICAgICAgICBvcmlnaW4gPSBkdmFyICsgZGlyDQogICAgICAgICBpZiBub3Qg
KGNwYXRoLmV4aXN0cyhvcmlnaW4pIGFuZCBjcGF0aC5pc2RpcihvcmlnaW4pIGFuZCBub3QgY3Bh
dGguaXNsaW5rKG9yaWdpbikpOg0KICAgICAgICAgICAgIGNvbnRpbnVlDQotLQ0KMi44LjENCg0K
DQoNClRoYW5rcywgRGFuISBUaGF0IGxvb2tzIGdvb2QgdG8gbWUuIE9uZSB0aG91Z2h0LCB0aG91
Z2guIFNpbmNlIHlvdSdyZSBsb29raW5nIGZvciBwcmV2aW91cyBlbnRyaWVzIGluIHRoZSBhbHRl
cm5hdGUgdGFibGVzIChwZXJtcyBpbiBsaW5rIHRhYmxlIGFuZCBsaW5rcyBpbiBwZXJtIHRhYmxl
KSwgc2hvdWxkIHdlIGFsc28gY29uc2lkZXIgc2VhcmNoaW5nIHRoZSBzYW1lIHRhYmxlIChsaW5r
IGluIGxpbmtzIGFuZCBwZXJtIGluIHBlcm1zKSBpbiBjYXNlIHNvbWVvbmUgdXNlZCBhIHByaXZh
dGUvbG9jYWwgcGVybXMgZmlsZSB0byBvdmVycmlkZSBhIGRlZmF1bHQgKGUuZy4sIGNoYW5nZSBh
IHN5bWxpbmsgL3Zhci9mb28gLT4gL3J1bi9mb28gdG8gL3Zhci9mb28gLT4gL3Zhci9iYXopLiBJ
biB0aGlzIGNhc2UsIGl0IHdvdWxkIGtlZXAgdGhlIGxhc3Qgb25lIGZvdW5kLCBraW5kIG9mIGxp
a2UgeW91J3JlIGRvaW5nIGhlcmUuIEp1c3QgYSB0aG91Z2h0Lg0KDQogICAgLUJpbGwNCg0K

