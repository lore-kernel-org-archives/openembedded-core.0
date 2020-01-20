Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8107D2E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 04:49:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2020 20:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,340,1574150400"; d="scan'208";a="374223196"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by orsmga004.jf.intel.com with ESMTP; 19 Jan 2020 20:49:16 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.14]) with mapi id
	14.03.0439.000; Mon, 20 Jan 2020 12:49:15 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "crg7475@mailbox.org"
	<crg7475@mailbox.org>
Thread-Topic: [OE-core] [PATCH 04/12] gstreamer1.0-plugins-good: Transition
	to meson based builds
Thread-Index: AQHVz0z3vdzeFSL2VkesitnrKCgRFg==
Date: Mon, 20 Jan 2020 04:49:14 +0000
Message-ID: <e860f308a14e924c1fa718f31de68165f1b81a11.camel@intel.com>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<20200112135954.23868-4-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-4-crg7475@mailbox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.21.115]
MIME-Version: 1.0
Subject: Re: [PATCH 04/12] gstreamer1.0-plugins-good: Transition to meson based builds
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
X-List-Received-Date: Mon, 20 Jan 2020 04:49:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FDE052C4BFFCC4D9485818FA7174108@intel.com>
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIwLTAxLTEyIGF0IDE0OjU5ICswMTAwLCBDYXJsb3MgUmFmYWVsIEdpYW5pIHdy
b3RlOg0KPiAgIyBxdDUgc3VwcG9ydCBpcyBkaXNhYmxlZCwgYmVjYXVzZSBpdCBpcyBub3QgcHJl
c2VudCBpbiBPRSBjb3JlLCBhbmQNCj4gcmVxdWlyZXMgbW9yZSB3b3JrIHRoYW4NCj4gICMganVz
dCBhZGRpbmcgYSBwYWNrYWdlY29uZmlnIChpdCByZXF1aXJlcyBhY2Nlc3MgdG8gbW9jLCB1aWMs
IHJjYywNCj4gYW5kIHFtYWtlIHBhdGhzKS4NCj4gQEAgLTU4LDE5ICs1NiwxOCBAQCBQQUNLQUdF
Q09ORklHW3psaWJdICAgICAgID0gIi0tZW5hYmxlLXpsaWIsDQo+IC0tZGlzYWJsZS16bGliLHps
aWIiDQo+ICAjIGluIGEgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZCBiYmFwcGVuZCkuDQo+ICAN
Cj4gIEVYVFJBX09FQ09ORiArPSAiIFwNCg0KVGhpcyBzaG91bGQgaGF2ZSBiZWVuIEVYVFJBX09F
TUVTT04uDQoNCj4gLSAgICAtLWVuYWJsZS1vc3MgXA0KPiAtICAgIC0tZGlzYWJsZS1hYWxpYiBc
DQo+IC0gICAgLS1kaXNhYmxlLWFhbGlidGVzdCBcDQo+IC0gICAgLS1kaXNhYmxlLWRpcmVjdHNv
dW5kIFwNCj4gLSAgICAtLWRpc2FibGUtbGliY2FjYSBcDQo+IC0gICAgLS1kaXNhYmxlLWxpYmR2
IFwNCj4gLSAgICAtLWRpc2FibGUtb3NzNCBcDQo+IC0gICAgLS1kaXNhYmxlLW9zeF9hdWRpbyBc
DQo+IC0gICAgLS1kaXNhYmxlLW9zeF92aWRlbyBcDQo+IC0gICAgLS1kaXNhYmxlLXF0IFwNCj4g
LSAgICAtLWRpc2FibGUtc2hvdXQyIFwNCj4gLSAgICAtLWRpc2FibGUtdHdvbGFtZSBcDQo+IC0g
ICAgLS1kaXNhYmxlLXdhdmVmb3JtIFwNCj4gKyAgICAtRGFhbGliPWRpc2FibGVkIFwNCj4gKyAg
ICAtRGRpcmVjdHNvdW5kPWRpc2FibGVkIFwNCj4gKyAgICAtRGR2PWRpc2FibGVkIFwNCj4gKyAg
ICAtRGxpYmNhY2E9ZGlzYWJsZWQgXA0KPiArICAgIC1Eb3NzPWVuYWJsZWQgXA0KPiArICAgIC1E
b3NzND1kaXNhYmxlZCBcDQo+ICsgICAgLURvc3hhdWRpbz1kaXNhYmxlZCBcDQo+ICsgICAgLURv
c3h2aWRlbz1kaXNhYmxlZCBcDQo+ICsgICAgLURxdD1kaXNhYmxlZCBcDQoNCmFuZCB0aGlzIHNo
b3VsZCBiZSBxdDU/DQoNClRoYW5rcywNCg0KQW51ag0K

