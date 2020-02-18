Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DC04C6139B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 15:43:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 07:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="348714068"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2020 07:43:52 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.223]) with mapi id
	14.03.0439.000; Tue, 18 Feb 2020 23:43:51 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "chet.ramey@case.edu" <chet.ramey@case.edu>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "De.Huo@windriver.com"
	<De.Huo@windriver.com>,
	"preid@electromag.com.au" <preid@electromag.com.au>, 
	"akuster808@gmail.com" <akuster808@gmail.com>
Thread-Topic: [OE-core] bash: Fix CVE-2019-18276
Thread-Index: AQHV5nEFhVQSrHc3hE6AQYp+F2a3xqggkW6A
Date: Tue, 18 Feb 2020 15:43:50 +0000
Message-ID: <41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
In-Reply-To: <9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.67.53]
MIME-Version: 1.0
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Tue, 18 Feb 2020 15:43:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5A7C9EEF920AD4B907031737B479700@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTAyLTE4IGF0IDE1OjM1ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVHVlLCAyMDIwLTAyLTE4IGF0IDEwOjI4IC0wNTAwLCBDaGV0IFJhbWV5IHdyb3RlOg0K
PiA+IE9uIDIvMTcvMjAgOTo0NiBQTSwgSHVvLCBEZSB3cm90ZToNCj4gPiA+ICBJIGFwcGxpZWQg
dGhlIHBhdGNoIHRvIGZpeCBDVkUgZGVmZWN0IENWRS0yMDE5LTE4Mjc2Lg0KPiA+IA0KPiA+IFRo
YXQncyBub3QgZXhhY3RseSBhbiBhbnN3ZXIgdG8gdGhlIHF1ZXN0aW9uIG9mIHdobyBwcm9kdWNl
ZCB0aGUNCj4gPiBwYXRjaC4NCj4gPiBJZiB0aGF0IHBhdGNoIGlzIHRoZSBvbmUgY2F1c2luZyBm
YWlsdXJlcyB3aGVuIGl0J3MgYXBwbGllZCwNCj4gPiBkb2Vzbid0IGl0DQo+ID4gbWFrZSBzZW5z
ZSB0byBnbyBiYWNrIHRvIHRoZSBwZXJzb24gd2hvIHByb2R1Y2VkIGl0IGFuZCBhc2sgdGhlbSB0
bw0KPiA+IHVwZGF0ZSBpdCBpZiBuZWNlc3Nhcnk/DQo+IA0KPiBJdHMgbGlrZWx5IGEgZ2VuZXJh
bCBDVkUgcGF0Y2ggd2hlcmUgYm90aCBjb25maWd1cmUgYW5kIGNvbmZpZ3VyZS5hYw0KPiBhcmUg
cGF0Y2hlZC4gRm9yIE9FLCB3ZSBjYW4gZHJvcCB0aGUgY29uZmlndXJlIHBhcnQgc2luY2Ugd2UN
Cj4gcmVhdXRvY29uZg0KPiB0aGUgY29kZS4gSXRzIHRoZXJlZm9yZSB0aGUgT0UgcG9ydCBvZiB0
aGUgcGF0Y2ggd2hpY2ggaXMgbGlrZWx5IGF0DQo+IGZhdWx0Lg0KPiANCj4gU29tZW9uZSBqdXN0
IG5lZWRzIHRvIHJlbW92ZSB0aGF0IHNlY3Rpb24gb2YgdGhlIHBhdGNoLg0KDQpUaGVyZSBhcmUg
b3RoZXIgaXNzdWVzIHdpdGggdGhpcyBwYXRjaCB3aGljaCBzaG91bGQgYWxzbyBiZSBmaXhlZCBJ
DQp0aGluay4gSXQgaGFzIGJlZW4gbWFya2VkIGFzIGEgQmFja3BvcnQgd2hpbGUgaXQgaXMgbm90
IG9uZS4gVGhlIHBhdGNoDQppbmNsdWRlcyBjaGFuZ2VzIHRoYXQgYXJlIGlycmVsZXZhbnQgdG8g
dGhlIENWRS4gQW5kLCBpdCBzaG91bGQgaGF2ZQ0KZ29uZSB0byBtYXN0ZXIgZmlyc3QuDQoNClRo
YW5rcywNCg0KQW51ag0K

