Return-Path: <william.c.randle@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 873BC77040
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 15:20:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Jun 2016 08:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,401,1459839600"; d="scan'208";a="993091841"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2016 08:20:33 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 1 Jun 2016 08:20:32 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.59]) by
	ORSMSX115.amr.corp.intel.com ([169.254.4.114]) with mapi id
	14.03.0248.002; Wed, 1 Jun 2016 08:20:32 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 01/22] oe-buildenv-internal: Update to python3
Thread-Index: AQHRvAJs9SAJl2AdskqVpUd9qUbXcZ/VL5iA
Date: Wed, 1 Jun 2016 15:20:32 +0000
Message-ID: <1464794431.2777.21.camel@intel.com>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.199.146]
MIME-Version: 1.0
Subject: Re: [PATCH 01/22] oe-buildenv-internal: Update to python3
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
X-List-Received-Date: Wed, 01 Jun 2016 15:20:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <60652B9EF4E1DB48BC51979442C9187A@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA2LTAxIGF0IDEzOjM1ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gQ2hlY2sgdGhhdCAncHl0aG9uJyBpcyBhIHB5dGhvbiB2MiBzaW5jZSB0aGF0IGlzIHdoYXQg
d2UgYXNzdW1lIGV2ZXJ5d2hlcmUNCj4gYW5kIHVwc3RyZWFtIHB5dGhvbiBkZXZzIHJlY29tbWVu
ZC4gV2UgY2FuIG5lZWQgYm90aCBweXRob24yIGFuZCBweXRob24zDQo+IGF2YWlsYWJsZSBzaW5j
ZSB3ZSBkb24ndCBjb250cm9sIHRoZSBzb2Z0d2FyZSB3ZSBtaWdodCBkb3dubG9hZCBhbmQgcnVu
Lg0KPiANCj4gQWxzbyBjaGVjayB0aGF0IHB5dGhvbiAzIGlzID49IDMuNC4wLCBvdXIgbWluaW11
bSB2ZXJzaW9uIGZvciBiaXRiYWtlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IC0tLQ0KPiDCoHNjcmlw
dHMvb2UtYnVpbGRlbnYtaW50ZXJuYWwgfCAzOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNyBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL29lLWJ1aWxkZW52LWludGVybmFs
IGIvc2NyaXB0cy9vZS1idWlsZGVudi1pbnRlcm5hbA0KPiBpbmRleCA4MWVlNzg0Li41NmQzNDE5
IDEwMDc1NQ0KPiAtLS0gYS9zY3JpcHRzL29lLWJ1aWxkZW52LWludGVybmFsDQo+ICsrKyBiL3Nj
cmlwdHMvb2UtYnVpbGRlbnYtaW50ZXJuYWwNCj4gQEAgLTI5LDI3ICsyOSwzMSBAQCBpZiBbIC16
ICIkT0VfU0tJUF9TREtfQ0hFQ0siIF0gJiYgWyAtbg0KPiAiJE9FQ09SRV9TREtfVkVSU0lPTiIg
XTsgdGhlbg0KPiDCoMKgwqDCoMKgcmV0dXJuIDENCj4gwqBmaQ0KPiDCoA0KPiAtIyBNYWtlIHN1
cmUgd2UncmUgbm90IHVzaW5nIHB5dGhvbiB2My54LiBUaGlzIGNoZWNrIGNhbid0IGdvIGludG8N
Cj4gLSMgc2FuaXR5LmJiY2xhc3MgYmVjYXVzZSBiaXRiYWtlJ3Mgc291cmNlIGNvZGUgZG9lc24n
dCBldmVuIHBhc3MNCj4gLSMgcGFyc2luZyBzdGFnZSB3aGVuIHVzZWQgd2l0aCBweXRob24gdjMs
IHNvIHdlIGNhdGNoIGl0IGhlcmUgc28gd2UNCj4gLSMgY2FuIG9mZmVyIGEgbWVhbmluZ2Z1bCBl
cnJvciBtZXNzYWdlLg0KPiAtcHlfdjNfY2hlY2s9JCgvdXNyL2Jpbi9lbnYgcHl0aG9uIC0tdmVy
c2lvbiAyPiYxIHwgZ3JlcCAiUHl0aG9uIDMiKQ0KPiAtaWYgWyAtbiAiJHB5X3YzX2NoZWNrIiBd
OyB0aGVuDQo+IC3CoMKgwqDCoGVjaG8gPiYyICJCaXRiYWtlIGlzIG5vdCBjb21wYXRpYmxlIHdp
dGggcHl0aG9uIHYzIg0KPiAtwqDCoMKgwqBlY2hvID4mMiAiUGxlYXNlIHNldCB1cCBweXRob24g
djIgYXMgeW91ciBkZWZhdWx0IHB5dGhvbiBpbnRlcnByZXRlciINCj4gKyMgTWFrZSBzdXJlIHdl
J3JlIG5vdCB1c2luZyBweXRob24gdjMueCBhcyAncHl0aG9uJywgd2UgZG9uJ3Qgc3VwcG9ydCBp
dC4NCj4gK3B5X3YyX2NoZWNrPSQoL3Vzci9iaW4vZW52IHB5dGhvbiAtLXZlcnNpb24gMj4mMSB8
IGdyZXAgIlB5dGhvbiAzIikNCj4gK2lmIFsgLW4gIiRweV92Ml9jaGVjayIgXTsgdGhlbg0KPiAr
wqDCoMKgwqBlY2hvID4mMiAiT3BlbkVtYmVkZGVkIHJlcXVpcmVzICdweXRob24nIHRvIGJlIHB5
dGhvbiB2MiAoPj0gMi43LjMpLCBub3QNCj4gcHl0aG9uIHYzLiINCj4gK8KgwqDCoMKgZWNobyA+
JjIgIlBsZWFzZSBzZXQgdXAgcHl0aG9uIHYyIGFzIHlvdXIgZGVmYXVsdCAncHl0aG9uJyBpbnRl
cnByZXRlci4iDQo+IMKgwqDCoMKgwqByZXR1cm4gMQ0KPiDCoGZpDQo+IC11bnNldCBweV92M19j
aGVjaw0KPiAtDQo+IC0jIFNpbWlsYXJseSwgd2Ugbm93IGhhdmUgY29kZSB0aGF0IGRvZXNuJ3Qg
cGFyc2UgY29ycmVjdGx5IHdpdGggb2xkZXINCj4gLSMgdmVyc2lvbnMgb2YgUHl0aG9uLCBhbmQg
cmF0aGVyIHRoYW4gZml4aW5nIHRoYXQgYW5kIGJlaW5nIGV0ZXJuYWxseQ0KPiAtIyB2aWdpbGFu
dCBmb3IgYW55IG90aGVyIG5ldyBmZWF0dXJlIHVzZSwganVzdCBjaGVjayB0aGUgdmVyc2lvbiBo
ZXJlLg0KPiAtcHlfdjI2X2NoZWNrPSQocHl0aG9uIC1jICdpbXBvcnQgc3lzOyBwcmludCBzeXMu
dmVyc2lvbl9pbmZvID49ICgyLDcsMyknKQ0KPiAtaWYgWyAiJHB5X3YyNl9jaGVjayIgIT0gIlRy
dWUiIF07IHRoZW4NCj4gLcKgwqDCoMKgZWNobyA+JjIgIkJpdEJha2UgcmVxdWlyZXMgUHl0aG9u
IDIuNy4zIG9yIGxhdGVyIg0KPiArdW5zZXQgcHlfdjJfY2hlY2sNCj4gKw0KPiArcHlfdjI3X2No
ZWNrPSQocHl0aG9uIC1jICdpbXBvcnQgc3lzOyBwcmludCBzeXMudmVyc2lvbl9pbmZvID49ICgy
LDcsMyknKQ0KPiAraWYgWyAiJHB5X3YyN19jaGVjayIgIT0gIlRydWUiIF07IHRoZW4NCj4gK8Kg
wqDCoMKgZWNobyA+JjIgIk9wZW5FbWJlZGRlZCByZXF1aXJlcyAncHl0aG9uJyB0byBiZSBweXRo
b24gdjIgKD49IDIuNy4zKSwgbm90DQo+IHB5dGhvbiB2My4iDQo+ICvCoMKgwqDCoGVjaG8gPiYy
ICJQbGVhc2UgdXBncmFkZSB5b3VyIHB5dGhvbiB2Mi4iDQo+ICtmaQ0KPiArdW5zZXQgcHlfdjI3
X2NoZWNrDQo+ICsNCj4gKyMgV2UgcG90ZW50aWFsbHkgaGF2ZSBjb2RlIHRoYXQgZG9lc24ndCBw
YXJzZSBjb3JyZWN0bHkgd2l0aCBvbGRlciB2ZXJzaW9uc8KgDQo+ICsjIG9mIFB5dGhvbiwgYW5k
IHJhdGhlciB0aGFuIGZpeGluZyB0aGF0IGFuZCBiZWluZyBldGVybmFsbHkgdmlnaWxhbnQgZm9y
wqANCj4gKyMgYW55IG90aGVyIG5ldyBmZWF0dXJlIHVzZSwganVzdCBjaGVjayB0aGUgdmVyc2lv
biBoZXJlLg0KPiArcHlfdjM0X2NoZWNrPSQocHl0aG9uMyAtYyAnaW1wb3J0IHN5czsgcHJpbnQo
c3lzLnZlcnNpb25faW5mbyA+PSAoMyw0LDApKScpDQo+ICtpZiBbICIkcHlfdjM0X2NoZWNrIiAh
PSAiVHJ1ZSIgXTsgdGhlbg0KPiArwqDCoMKgwqBlY2hvID4mMiAiQml0QmFrZSByZXF1aXJlcyBQ
eXRob24gMy40LjAgb3IgbGF0ZXIgYXMgJ3B5dGhvbjMnIg0KPiDCoMKgwqDCoMKgcmV0dXJuIDEN
Cj4gwqBmaQ0KPiAtdW5zZXQgcHlfdjI2X2NoZWNrDQo+ICt1bnNldCBweV92MzRfY2hlY2sNCj4g
wqANCj4gwqBpZiBbIC16ICIkQkRJUiIgXTsgdGhlbg0KPiDCoMKgwqDCoMKgaWYgWyAteiAiJDEi
IF07IHRoZW4NCj4gLS3CoA0KPiAyLjUuMA0KDQpJdCBzZWVtcyB0byBtZSB0aGUgY29tbWVudCBh
Ym91dCBvbGRlciBQeXRob24gdmVyc2lvbnMgc2hvdWxkIHJlbWFpbiBiZWZvcmUgdGhlDQoyLjcu
MyBjaGVjayBzbyB0aGF0IGl0IGFwcGxpZXMgdG8gYm90aCB0aGUgMi43LjMgYW5kIDMuNC4wIGNo
ZWNrcy4NCg0KwqAgwqAgLUJpbGwNCg==

