Return-Path: <vedang.patel@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 184986FEE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 00:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490747354; x=1522283354;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=smyUMXiqgAzgfoSMXfNqQA7ypv+oJ89oACDz9BQzFxE=;
	b=Z55h2OY3o/AstpHRo+iKA3LvFTeQF1YXycP/MjtNu1hAv/uhdPKk59ay
	6UWu70EMo3KdthIynUnxFLJTZndECA==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 17:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,239,1486454400"; d="scan'208";a="80400457"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga005.jf.intel.com with ESMTP; 28 Mar 2017 17:29:12 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.44]) by
	ORSMSX107.amr.corp.intel.com ([169.254.1.73]) with mapi id
	14.03.0319.002; Tue, 28 Mar 2017 17:29:12 -0700
From: "Patel, Vedang" <vedang.patel@intel.com>
To: "armccurdy@gmail.com" <armccurdy@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libxslt: Add PACKAGECONFIG support for python
Thread-Index: AQHSpDG7a3h4ohrUF0idWsChykVR16GjrAmAgAfH5IA=
Date: Wed, 29 Mar 2017 00:29:11 +0000
Message-ID: <1490747351.12818.47.camel@intel.com>
References: <1490306205.12818.5.camel@intel.com>
	<1490313649-32458-1-git-send-email-vedang.patel@intel.com>
	<CAJ86T=WeV6_5WRj7FSqVUFoJH_+SE6j-5qfD+HQ6UTEBT9guNg@mail.gmail.com>
In-Reply-To: <CAJ86T=WeV6_5WRj7FSqVUFoJH_+SE6j-5qfD+HQ6UTEBT9guNg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.159.64]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support for python
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
X-List-Received-Date: Wed, 29 Mar 2017 00:29:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED9770E9B2DF4B49B7EE2D92228ABBE1@intel.com>
Content-Transfer-Encoding: base64

SGkgQW5kcmUsIFJvc3MsDQoNCk9uIFRodSwgMjAxNy0wMy0yMyBhdCAxODozOSAtMDcwMCwgQW5k
cmUgTWNDdXJkeSB3cm90ZToNCj4gwqBPbiBUaHUsIE1hciAyMywgMjAxNyBhdCA1OjAwIFBNLCBW
ZWRhbmcgUGF0ZWwgPHZlZGFuZy5wYXRlbEBpbnRlbC5jbw0KPiBtPiB3cm90ZToNCj4gPiANCj4g
PiBBZGQgc3VwcG9ydCB0byBlbmFibGUgcHl0aG9uIGJpbmRpbmdzIGZvciBsaWJ4c2x0IHVzaW5n
DQo+ID4gUEFDS0FHRUNPTkZJRy4NCj4gPiBUaGlzIHdpbGwgaW5jbHVkZSAtLXdpdGgtcHl0aG9u
IGFyZ3VtZW50IHdoaWxlIGNvbXBpbGluZyB0aGUNCj4gPiBwYWNrYWdlLg0KPiA+IFRoZSBzdXBw
b3J0IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVmVk
YW5nIFBhdGVsIDx2ZWRhbmcucGF0ZWxAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4yOS5iYiB8IDYgKysrKy0tDQo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4x
LjI5LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjI5
LmJiDQo+ID4gaW5kZXggYmU3NDdlNjA4ZDlkLi43MDdmMmY5N2I3ZmMgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4yOS5iYg0KPiA+ICsr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEuMjkuYmINCj4gPiBA
QCAtMjIsNyArMjIsNyBAQCBTID0gIiR7V09SS0RJUn0vbGlieHNsdC0ke1BWfSINCj4gPiANCj4g
PiDCoEJJTkNPTkZJRyA9ICIke2JpbmRpcn0veHNsdC1jb25maWciDQo+ID4gDQo+ID4gLWluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiaW5jb25maWctZGlzYWJsZWQgbGliX3BhY2thZ2UNCj4g
PiAraW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGJpbmNvbmZpZy1kaXNhYmxlZCBsaWJfcGFj
a2FnZQ0KPiA+IGRpc3R1dGlscy1jb21tb24tYmFzZQ0KPiA+IA0KPiA+IMKgIyBXZSBkb24ndCBE
RVBFTkQgb24gYmludXRpbHMgZm9yIGFuc2lkZWNsLmggc28gZW5zdXJlIHdlIGRvbid0DQo+ID4g
dXNlIHRoZSBoZWFkZXINCj4gPiDCoGRvX2NvbmZpZ3VyZV9wcmVwZW5kICgpIHsNCj4gPiBAQCAt
MzMsNyArMzMsOSBAQCBkb19jb25maWd1cmVfcHJlcGVuZCAoKSB7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoHRvdWNoICR7U30vZG9jL3hzbHRwcm9jLjENCj4gPiDCoH0NCj4gPiANCj4gPiAtRVhUUkFf
T0VDT05GID0gIi0td2l0aG91dC1weXRob24gLS13aXRob3V0LWRlYnVnIC0td2l0aG91dC1tZW0t
DQo+ID4gZGVidWcgLS13aXRob3V0LWNyeXB0byINCj4gPiArRVhUUkFfT0VDT05GID0gIi0td2l0
aG91dC1kZWJ1ZyAtLXdpdGhvdXQtbWVtLWRlYnVnIC0td2l0aG91dC0NCj4gPiBjcnlwdG8iDQo+
ID4gK1BBQ0tBR0VDT05GSUdbcHl0aG9uXSA9ICItLXdpdGgtcHl0aG9uPSR7UFlUSE9OX0JBU0Vf
VkVSU0lPTn0sIC0tDQo+ID4gd2l0aG91dC1weXRob24iDQo+IFRoZSBtb3JlIGNvbnZlbnRpb25h
bCB3YXkgdG8gb3JkZXIgdGhlc2UgbGluZXMgd291bGQgYmU6DQo+IA0KPiDCoCBQQUNLQUdFQ09O
RklHID89ICIiDQo+IMKgIFBBQ0tBR0VDT05GSUdbcHl0aG9uXSA9ICItLXdpdGgtcHl0aG9uPSR7
UFlUSE9OX0JBU0VfVkVSU0lPTn0sDQo+IC0td2l0aG91dC1weXRob24iDQo+IA0KPiDCoCBFWFRS
QV9PRUNPTkYgPSAiLS13aXRob3V0LWRlYnVnIC0td2l0aG91dC1tZW0tZGVidWcgLS13aXRob3V0
LQ0KPiBjcnlwdG8iDQo+IA0KPiBUaGUgcHl0aG9uIFBBQ0tBR0VDT05GSUcgb3B0aW9uIHByb2Jh
Ymx5IG5lZWRzIHRvIGluY2x1ZGUgYQ0KPiBkZXBlbmRlbmN5DQo+IG9uIHB5dGhvbi4NCj4gDQpJ
IHdpbGwgbWFrZSB0aGUgcHJvcG9zZWQgY2hhbmdlcyBpbiB0aGUgYXJyYW5nZW1lbnQgb2YgdGhl
IHN0YXRlbWVudHMuDQoNClJlZ2FyZGluZyB0aGUgcHl0aG9uIGRlcGVuZGVuY3ksIHRoZSBmZWVk
YmFjayBmcm9tIEFuZHJlIGlzIHRoZQ0Kb3Bwb3NpdGUgb2Ygd2hhdCBSb3NzIGdhdmUgbWUgaW4g
b25lIG9mIHRoZSBwcmV2aW91cyBlbWFpbHMgd2hlcmUgaGUNCnRvbGQgbm90IHRvIGluY2x1ZGUg
dGhlIHB5dGhvbiBkZXBlbmRlbmN5IGluIFBBQ0tBR0VDT05GSUcuIEhlIGFza2VkIHRvDQptYWtl
IHN1cmUgdGhhdCB0aGUgcHl0aG9uIG1vZHVsZSBpcyBwYWNrYWdlZCBzZXBlcmF0ZWx5LiAoSnVz
dCBGWUk6DQrCoEhlcmUsIGxpYnhzbHQgaGFzIGEgaGFyZCBkZXBlbmRlbmN5IG9uIHB5dGhvbi0y
LjcuKQ0KDQpBbHNvLCB0aGUgLS13aXRoLXB5dGhvbiBhcmd1bWVudCB3aWxsIG9ubHkgYWRkaW5n
IHB5dGhvbiBiaW5kaW5ncyB0bw0KbGlieHNsdC4gSXMgaXQgYSBnb29kIGlkZWEgwqB0byBtb3Zl
IHRoYXQgdG8gYSBzdWJwYWNrYWdlPyBJZiBzbywgY2FuDQp5b3UgcG9pbnQgbWUgdG8gYSBnb29k
IGV4YW1wbGUgZm9yIHRoYXQNCg0KVGhhbmtzLA0KVmVkYW5nIFBhdGVsDQpTb2Z0d2FyZSBFbmdp
bmVlcg0KSW50ZWwgQ29ycG9yYXRpb24NCj4gPiANCj4gPiDCoCMgb2xkZXIgdmVyc2lvbnMgb2Yg
dGhpcyByZWNpcGUgaGFkICR7UE59LXV0aWxzDQo+ID4gwqBSUFJPVklERVNfJHtQTn0tYmluICs9
ICIke1BOfS11dGlscyINCj4gPiDCoFJDT05GTElDVFNfJHtQTn0tYmluICs9ICIke1BOfS11dGls
cyINCj4gPiAtLQ0KPiA+IDIuNy4zDQo+ID4gDQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1h
aWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5l
bWJlZGRlZC1jb3Jl

