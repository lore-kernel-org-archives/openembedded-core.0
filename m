Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DF27B77BD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 16:27:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 26 Apr 2017 09:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,255,1488873600"; d="scan'208";a="81096578"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga004.jf.intel.com with ESMTP; 26 Apr 2017 09:27:41 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX108.amr.corp.intel.com ([169.254.2.95]) with mapi id
	14.03.0319.002; Wed, 26 Apr 2017 09:27:41 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/4] Reproducible binaries
Thread-Index: AQHSve/H0RnFKsoUjUy3r4mWvWsL7aHXLvuAgACoUwA=
Date: Wed, 26 Apr 2017 16:27:40 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61194DCB0@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CAHUNapRY94uC0W2Z0Y3GCfMSer5HjOW9AWoe_vc3m3MarxG+0A@mail.gmail.com>
In-Reply-To: <CAHUNapRY94uC0W2Z0Y3GCfMSer5HjOW9AWoe_vc3m3MarxG+0A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 16:27:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29uc2Vuc3VzIGlzIGFsd2F5cyBhIGdvb2QgdGhpbmcuDQpUaGUgdXNlciBjYW4gb3ZlcnJpZGUg
dGhlIGRlZmF1bHQgYnkgZXhwbGljaXRseSBzcGVjaWZ5aW5nIChmb3IgZXhhbXBsZSBpbiBsb2Nh
bC5jb25mKQ0KQlVJTERfUkVQUk9EVUNJQkxFX0JJTkFSSUVTPSIxIg0Kb3INCkJVSUxEX1JFUFJP
RFVDSUJMRV9CSU5BUklFUz0iMCINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBUcmV2b3IgV29lcm5lciBbbWFpbHRvOnR3b2VybmVyQGdtYWlsLmNvbV0NCj4gU2VudDog
VHVlc2RheSwgQXByaWwgMjUsIDIwMTcgNDoyMiBQTQ0KPiBUbzogQnlzdHJpY2t5LCBKdXJvIDxq
dXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBh
Ym91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+OyBqdXJvYnlzdHJpY2t5QGhvdG1haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDAvNF0gUmVwcm9kdWNpYmxlIGJpbmFyaWVzDQo+IA0KPiBPbiBUdWUs
IEFwciAyNSwgMjAxNyBhdCAyOjE0IFBNLCBKdXJvIEJ5c3RyaWNreQ0KPiA8anVyby5ieXN0cmlj
a3lAaW50ZWwuY29tPiB3cm90ZToNCj4gPiBUaGUgdmFyaWFibGUgZGVmYXVsdHMgdG8gIjAiIChk
byBub3QNCj4gPiBidWlsZCByZXByb2R1Y2libGUgYmluYXJpZXMpIGluIG9yZGVyIHRvIG1pbmlt
aXplIGFueSBwb3RlbnRpYWwNCj4gPiByZWdyZXNzaW9ucy4gKE9uY2UgdGhlIHJlcHJvZHVjaWJs
ZSBiaW5hcmllcyBjb2RlIGlzIG1hdHVyZSBlbm91Z2gsDQo+ID4gaXQgY2FuIGJlIHNldCB0byAi
MSIuKQ0KPiANCj4gTXkgZ3Vlc3MgaXMgdGhhdCBwZW9wbGUgd291bGQgcHJlZmVyIHNlY3VyaXR5
IG92ZXIgcmVwcm9kdWNpYmlsaXR5Lg0KPiBNYXliZSB3ZSBuZWVkIG1vcmUgY29uc2Vuc3VzIGZv
ciB0aGUgZGVmYXVsdCB2YWx1ZSBnb2luZyBmb3J3YXJkPw0K

