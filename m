Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1E77CBE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:55:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2019 18:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="183657992"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2019 18:55:31 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.232]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.133]) with mapi id
	14.03.0439.000; Fri, 30 Aug 2019 09:55:30 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 3/4] qemu: switch to '-vga std' emulated
	hardware from vmware/cirrus for x86/mips
Thread-Index: AQHVXtX/r7Dcyo0SPke8YRdMxrbc4g==
Date: Fri, 30 Aug 2019 01:55:29 +0000
Message-ID: <48b10fe5d26221da2cb169a0ec968dc7bff082c7.camel@intel.com>
References: <20190828152440.70861-1-alex.kanavin@gmail.com>
	<20190828152440.70861-3-alex.kanavin@gmail.com>
In-Reply-To: <20190828152440.70861-3-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.199.133]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Fri, 30 Aug 2019 01:55:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E683E36DE761A4685F6EF1F3361A009@intel.com>
Content-Transfer-Encoding: base64

SGkgQWxleCwNCg0KT24gV2VkLCAyMDE5LTA4LTI4IGF0IDE3OjI0ICswMjAwLCBBbGV4YW5kZXIg
S2FuYXZpbiB3cm90ZToNCi4uLiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9tYWNoaW5lL3Fl
bXVhcm02NC5jb25mDQo+IGIvbWV0YS9jb25mL21hY2hpbmUvcWVtdWFybTY0LmNvbmYNCj4gaW5k
ZXggZWMyYTg4N2JkZGYuLjA1ZjBlZTVlNjZmIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NvbmYvbWFj
aGluZS9xZW11YXJtNjQuY29uZg0KPiArKysgYi9tZXRhL2NvbmYvbWFjaGluZS9xZW11YXJtNjQu
Y29uZg0KPiBAQCAtMTcsNyArMTcsNyBAQCBRQl9DUFVfS1ZNID0gIi1jcHUgaG9zdCINCj4gICMg
U3RhbmRhcmQgU2VyaWFsIGNvbnNvbGUNCj4gIFFCX0tFUk5FTF9DTURMSU5FX0FQUEVORCA9ICJj
b25zb2xlPXR0eUFNQTAiDQo+ICAjIEZvciBncmFwaGljcyB0byB3b3JrIHdlIG5lZWQgdG8gZGVm
aW5lIHRoZSBWR0EgZGV2aWNlIGFzIHdlbGwgYXMNCj4gdGhlIG5lY2Vzc2FyeSBVU0IgZGV2aWNl
cw0KPiAtUUJfT1BUX0FQUEVORCA9ICItc2hvdy1jdXJzb3IgLWRldmljZSBWR0EsZWRpZD1vbiIN
Cj4gK1FCX09QVF9BUFBFTkQgPSAiLXNob3ctY3Vyc29yIg0KDQpXYXMgdGhpcyBpbnRlbnRpb25h
bD8gVGhpcyBpcyByZXZlcnRpbmcgYW4gZWFybGllciBmaXg6DQoNCmh0dHBzOi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5L2NvbW1pdC9tZXRhL2NvbmYvbWFjaGluZS9x
ZW11YXJtNjQuY29uZj9oPW1hc3Rlci1uZXh0JmlkPWIxODFiZjkyZTJiYzUxYTgwODQ3OGMxMmZl
NjIxNzdkOTY2ZjJhODUNCg0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQu
Y2dpL3Bva3kvY29tbWl0L21ldGEvY29uZi9tYWNoaW5lL3FlbXVhcm02NC5jb25mP2g9bWFzdGVy
LW5leHQmaWQ9ZmYzNWI2YzU3YTM4MGNhNGRjMTU4YzUxMDRhNjEzN2Y4ZmFlYTVjZA0KDQpJJ20g
bm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgcmVhc29uIGJ1dCBtYXN0ZXItbmV4dCBidWlsZCBpcyBh
bHNvDQpzaG93aW5nIHByb2JsZW1zIHdoZW4gcnVubmluZyBYIHdpdGggcWVtdWFybToNCg0KaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8zOC9i
dWlsZHMvOTc4L3N0ZXBzLzgvbG9ncy9zdGVwMWMNCg0KLi4uDQoNCj4gZGlmZiAtLWdpdCBhL21l
dGEvbGliL29lcWEvcnVudGltZS9jYXNlcy9wYXJzZWxvZ3MucHkNCj4gYi9tZXRhL2xpYi9vZXFh
L3J1bnRpbWUvY2FzZXMvcGFyc2Vsb2dzLnB5DQo+IGluZGV4IDE5YzljNTJhMGE5Li4wMDAyNzMw
ZDQ2ZiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3BhcnNlbG9n
cy5weQ0KPiArKysgYi9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvcGFyc2Vsb2dzLnB5DQo+
IEBAIC01NSw3ICs1NSwxMSBAQCBjb21tb25fZXJyb3JzID0gWw0KPiAgICAgICJGYWlsZWQgdG8g
cmVhZCAvdmFyL2xpYi9uZnMvc3RhdGQvc3RhdGU6IFN1Y2Nlc3MiLA0KPiAgICAgICJlcnJvciBy
ZXRyeSB0aW1lLW91dCA9IiwNCj4gICAgICAibG9naW5kOiBjYW5ub3Qgc2V0dXAgc3lzdGVtZC1s
b2dpbmQgaGVscGVyICgtNjEpLCB1c2luZyBsZWdhY3kNCj4gZmFsbGJhY2siLA0KPiAtICAgICJF
cnJvciBjaGFuZ2luZyBuZXQgaW50ZXJmYWNlIG5hbWUgJ2V0aDAnIHRvICINCj4gKyAgICAiRXJy
b3IgY2hhbmdpbmcgbmV0IGludGVyZmFjZSBuYW1lICdldGgwJyB0byAiLA0KPiArICAgICJtb2Rl
c2V0KDApOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSB0aGUgRFJJMiBleHRlbnNpb24iLA0KPiArICAg
ICJ1dmVzYWZiOiBjYW5ub3QgcmVzZXJ2ZSB2aWRlbyBtZW1vcnkgYXQiLA0KPiArICAgICJ1dmVz
YWZiOiBwcm9iZSBvZiB1dmVzYWZiLjAgZmFpbGVkIHdpdGggZXJyb3IiLA0KPiArICAgICJnbGFt
b3IgaW5pdGlhbGl6YXRpb24gZmFpbGVkIg0KPiAgICAgIF0NCj4gIA0KDQpwYXJzZWxvZ3MgdGVz
dCBpcyB1c2VkIG5vdCBvbmx5IGZvciBxZW11IGJ1dCBmb3Igb3RoZXIgTUFDSElORVMgYXMgd2Vs
bA0KaW5jbHVkaW5nIGdlbmVyaWN4ODYgb24gYWN0dWFsIGhhcmR3YXJlIHdoZXJlIGdsYW1vciBp
bml0aWFsaXphdGlvbg0KZXJyb3IgbWlnaHQgbmVlZCBsb29raW5nIGludG8uIFBlcmhhcHMgdGhp
cyBzaG91bGQgYmUgYWRkZWQgdG8gcWVtdQ0Kc3BlY2lmaWMgcGFydHMgb2YgdGhpcyB0ZXN0IG9u
bHk/DQoNClRoYW5rcywNCg0KQW51ag0K

