Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 486887837D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:07:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 00:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,405,1496127600"; d="scan'208";a="111204755"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga004.jf.intel.com with ESMTP; 24 Jul 2017 00:07:35 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.27]) by
	PGSMSX101.gar.corp.intel.com ([10.221.44.78]) with mapi id
	14.03.0319.002; Mon, 24 Jul 2017 15:07:34 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [poky][master][PATCH v2 0/1] initramfs-framework:
	include install-efi module in recipe for installation
Thread-Index: AQHS/p8259YHVNbLPkSqg+55Tz1w7KJeUWOAgAQ07PA=
Date: Mon, 24 Jul 2017 07:07:33 +0000
Message-ID: <CBAEED2EB06BF94889E80B47A33FE329EE0F15@PGSMSX105.gar.corp.intel.com>
References: <cover.1500229225.git.wei.tee.ng@intel.com>
	<1500673401.22282.109.camel@linuxfoundation.org>
In-Reply-To: <1500673401.22282.109.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [poky][master][PATCH v2 0/1] initramfs-framework: include install-efi module in recipe for installation
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
X-List-Received-Date: Mon, 24 Jul 2017 07:07:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KRm9yIHRoZSBhbGxhcmNoIHByb2JsZW0gdGhhdCB5b3UgbWVudGlvbmVk
LCBJIGFkZGVkIElOSElCSVRfREVGQVVMVF9ERVBTID0gIjEiIGJlY2F1c2UgdGhlIHBhY2thZ2Vz
IG1heWJlIGFuIGFsbGFyY2ggZHVlIHRvIGl0IGJlaW5nIGENCnNpbXBsZSBzY3JpcHQsIHJlYWxp
dHkgaXMgdGhhdCBpdCBpcyBIb3N0IHNwZWNpZmljIGJhc2VkIG9uIHRoZSBDT01QQVRJQkxFX0hP
U1QsIHdoaWNoIG5lZWRzIHRvIHRha2UgcHJlY2VkZW5jZS4NCg0KRm9yIHRoaXMgY2FzZSwgSSBy
dW4gdGhlIGZvdXIgdGVzdHMgd2hpY2ggaXMgcHJldmlvdXNseSBmYWlsZWQgaW4gdGhlIG9lLXNl
bGZ0ZXN0IHJlcG9ydCBhbmQgbm93IGl0IGlzIFBBU1MuDQotIG9lLXNlbGZ0ZXN0IC1yIHNzdGF0
ZXRlc3RzLlNTdGF0ZVRlc3RzLnRlc3Rfc3N0YXRlX2FsbGFyY2hfc2FtZXNpZ3MgW1BBU1NdDQot
IG9lLXNlbGZ0ZXN0IC1yIHNzdGF0ZXRlc3RzLlNTdGF0ZVRlc3RzLnRlc3Rfc3N0YXRlX2FsbGFy
Y2hfc2FtZXNpZ3NfbXVsdGlsaWIgW1BBU1NdDQotIG9lLXNlbGZ0ZXN0IC1yIHdpYy5XaWMudGVz
dF9mc190eXBlcyBbUEFTU10NCi0gb2Utc2VsZnRlc3QgLXIgd2ljLldpYy50ZXN0X21rZnNfZXh0
cmFvcHRzIFtQQVNTXQ0KDQpJIHJlLXNlbnQgYSBuZXcgc2V0IG9mIHBhdGNoZXMgd2hpY2ggY29u
c29saWRhdGUgaW50byB0aHJlZSBjb21taXRzIHRvIHRoZSBtYWlsaW5nIGxpc3QuICBZb3UgY2Fu
IGZpbmQgaXQgaW4gdGhpcyBsaW5rOiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBl
cm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxNy1KdWx5LzE0MDAyMS5odG1sIA0KVGhlIG5ldyBw
YXRjaGVzIGNvbnNpc3RzIG9mIHRoZSAzIGNvbW1pdHMgd2hpY2ggYXJlOg0KaW5pdHJhbWZzLWZy
YW1ld29yazogbW9kdWxlIHRvIHN1cHBvcnQgYm9vdCBsaXZlIGltYWdlDQppbml0cmFtZnMtZnJh
bWV3b3JrOiBpbmNsdWRlIGluc3RhbGwtZWZpIG1vZHVsZSBpbiByZWNpcGUgZm9yIGluc3RhbGxh
dGlvbg0KY29yZS1pbWFnZS1taW5pbWFsLWluaXRyYW1mczogdXNlIGluaXRyYW1mcy1mcmFtZXdv
cmsgYnkgZGVmYXVsdCBbbmV3bHkgYWRkZWRdDQoNClJlZ2FyZHMsDQpXZWkgVGVlDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogU2F0dXJkYXksIEp1bHkgMjIs
IDIwMTcgNTo0MyBBTQ0KVG86IE5nLCBXZWkgVGVlIDx3ZWkudGVlLm5nQGludGVsLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBXb2xkLCBTYXVsIDxz
YXVsLndvbGRAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbcG9reV1bbWFzdGVy
XVtQQVRDSCB2MiAwLzFdIGluaXRyYW1mcy1mcmFtZXdvcms6IGluY2x1ZGUgaW5zdGFsbC1lZmkg
bW9kdWxlIGluIHJlY2lwZSBmb3IgaW5zdGFsbGF0aW9uDQoNCkhpLA0KDQpPbiBTdW4sIDIwMTct
MDctMTYgYXQgMTI6MjkgLTA3MDAsIHdlaS50ZWUubmdAaW50ZWwuY29tIHdyb3RlOg0KPiBGcm9t
OiAiTmcsIFdlaSBUZWUiIDx3ZWkudGVlLm5nQGludGVsLmNvbT4NCj4gDQo+IFRoaXMgcGF0Y2gg
aXMgdG8gZW5hYmxlIHRoZSBpbnN0YWxsYXRpb24gbWVjaGFuaXNtIGluIGluaXRyYW1mcy0gDQo+
IGZyYW1ld29yay4NCj4gSXQgdXNlZCB0aGUgZXhpc3RpbmcgaW5pdC1pbnN0YWxsLWVmaS5zaCBz
Y3JpcHQgaW4gdGhlIGluaXRyZHNjcmlwdCANCj4gYW5kIGluc3RhbGwgYSBuZXcgbW9kdWxlIG5h
bWVkIGluaXRyYW1mcy1tb2R1bGUtaW5zdGFsbC1lZmkgaW4gdGhlIA0KPiByZWNpcGUuDQo+IA0K
PiBJIHB1dCBhbGwgdGhlIGNoYW5nZXMgYXMgYSBzaW5nbGUgY29tbWl0LiBUaGlzIHZlcnNpb24g
MiBoYWQgcmVuYW1lZCANCj4gdGhlIGV4aXN0aW5nIGluaXQtaW5zdGFsbC1lZmkuc2ggdG8gaW5z
dGFsbC1lZmkuc2ggYW5kIHBhY2thZ2UgbmFtZSANCj4gY2hhbmdlZCB0byBpbnN0YWxsLWVmaS4N
Cj4gDQo+IFRoaXMgcGF0Y2ggc2hhbGwgZW5jb3VudGVyIGEgcGF0Y2h0ZXN0IGZhaWx1cmUgYXMg
aXQgaXMgZGVwZW5kcyBvbiBhIA0KPiBwYXRjaCB3aGljaCBoYXZlIGJlZW4gc2VudCB0byB0aGUg
bWFpbGluZyBsaXN0IGFuZCB3YWl0aW5nIGZvciANCj4gYWNjZXB0YW5jZS4gVGhlIGRlcGVuZGVu
Y3kgcGF0Y2ggY2FuIGJlIGZvdW5kIGluIGhlcmU6DQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL3BpcGVybWFpbC9vcGVuZW1iZWRkZWQtY29yZS8yMDE3LUp1bHkvMQ0KPiAzOTU3MC5o
dG1sDQo+IA0KPiBUaGlzIGNoYW5nZXMgaGFzIGJlZW4gdmVyaWZpZWQgd2l0aCBidWlsZCB0ZXN0
LCBib290IHVwIHRlc3QgYW5kIA0KPiBpbnN0YWxsYXRpb24gdGVzdCBvbiBNaW5ub3dib2FyZCBN
YXggcGxhdGZvcm0uDQo+IA0KPiBQbGVhc2UgcmV2aWV3IGFuZCBwcm92aWRlIGZlZWRiYWNrIGlm
IHlvdSBoYXZlIGFueS4NCj4gVGhlIHBhdGNoZXMgYXJlIHRhcmdldGVkIGZvciBtZXJnaW5nIGlu
dG8gcG9reSBtYXN0ZXIgYnJhbmNoLg0KDQpJIHRoaW5rIHRoZSBSREVQRU5EUyBpbiB0aGlzIHBh
dGNoIGNhdXNlIHByb2JsZW1zIHdoZW4gYWRkZWQgdG8gYW4gYWxsYXJjaCByZWNpcGUuIFlvdSBj
YW4gc2VlIHRoaXMgaXNzdWUgYnkgcnVubmluZzoNCg0Kb2Utc2VsZnRlc3QgLXIgc3N0YXRldGVz
dHMuU1N0YXRlVGVzdHMudGVzdF9zc3RhdGVfYWxsYXJjaF9zYW1lc2lncw0KDQooaXQgZmFpbGVk
IG9uIHRoZSBhdXRvYnVpbGRlcjoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vYnVpbGRl
cnMvbmlnaHRseS1vZS1zZWxmdGVzdC9idWlsZHMvMzk5L3N0DQplcHMvUnVubmluZyUyMG9lLXNl
bGZ0ZXN0L2xvZ3Mvc3RkaW8pDQoNCldlIG5lZWQgdG8gcmVzb2x2ZSB0aGlzIGJlZm9yZSB0aGUg
dHdvIGluaXRyYW1mcy1mcmFtZXdvcmsgcGF0Y2hlcyBjYW4gYmUgbWVyZ2VkLg0KDQpDaGVlcnMs
DQoNClJpY2hhcmQNCg0KDQo=

