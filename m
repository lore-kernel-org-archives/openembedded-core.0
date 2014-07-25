Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 45B047029E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 18:28:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jul 2014 11:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,732,1400050800"; d="scan'208";a="461463205"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2014 11:28:06 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.251]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.245]) with mapi id
	14.03.0123.003; Fri, 25 Jul 2014 11:28:06 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [Patch v4 4/6] image-ucode.bbclass: a new bbclass for
	initramfs images
Thread-Index: AQHPouY7Mv7DW1Uhw0uVCRI25wBCkpurY8GAgAXAe4A=
Date: Fri, 25 Jul 2014 18:28:05 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CE72CCB@ORSMSX103.amr.corp.intel.com>
References: <cover.1405728594.git.nitin.a.kamble@intel.com>
	<8153ac4d137126ac86039128af8ad464af2d21e3.1405728594.git.nitin.a.kamble@intel.com>
	<CAJTo0LbN=VXEp2t+mBm9a8A4XHz6P+N4zAbV63a=6t6ojka7zw@mail.gmail.com>
In-Reply-To: <CAJTo0LbN=VXEp2t+mBm9a8A4XHz6P+N4zAbV63a=6t6ojka7zw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Hart,
	Darren" <darren.hart@intel.com>
Subject: Re: [Patch v4 4/6] image-ucode.bbclass: a new bbclass for initramfs images
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
X-List-Received-Date: Fri, 25 Jul 2014 18:28:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBNb25kYXksIEp1bHkgMjEsIDIw
MTQgMTI6MzAgUE0NCj4gVG86IEthbWJsZSwgTml0aW4gQQ0KPiBDYzogWmFudXNzaSwgVG9tOyBI
YXJ0LCBEYXJyZW47IFB1cmRpZSwgUmljaGFyZDsgbWV0YS1pbnRlbEB5b2N0b3Byb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUGF0Y2ggdjQgNC82XSBpbWFnZS11Y29kZS5iYmNsYXNzOiBhIG5l
dyBiYmNsYXNzIGZvciBpbml0cmFtZnMNCj4gaW1hZ2VzDQo+IA0KPiBPbiAxOSBKdWx5IDIwMTQg
MDE6MTgsICA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPiB3cm90ZToNCj4gPiArSU1BR0VfVFlQ
RVMgKz0gImNwaW8uZ3oudWNvZGUiDQo+ID4gK0NPTVBSRVNTSU9OVFlQRVMgKz0gImd6LnVjb2Rl
Ig0KPiA+ICtDT01QUkVTU19DTURfZ3oudWNvZGUgPSAiJHtDT01QUkVTU19DTURfZ3p9OyBjYXQN
Cj4gJHtFQVJMWV9VQ09ERV9DUElPfSAke0lNQUdFX05BTUV9LnJvb3Rmcy4ke3R5cGV9Lmd6ID4N
Cj4gJHtJTUFHRV9OQU1FfS5yb290ZnMuJHt0eXBlfS5nei51Y29kZSINCj4gPiArQ09NUFJFU1Nf
REVQRU5EU19nei51Y29kZSA9ICIke0NPTVBSRVNTX0RFUEVORFNfZ3p9IGludGVsLQ0KPiBtaWNy
b2NvZGUiDQo+IA0KPiBTb21ldGhpbmcgYWJvdXQgdGhpcyBoYXMgYWx3YXlzIGJ1Z2dlZCBtZSBh
bmQgSSBqdXN0IHJlYWxpc2VkIHdoYXQgaXQgaXMuICBBcyBJDQo+IHVuZGVyc3RhbmQgaXQgdGhl
IGtlcm5lbCBhbGxvd3MgYW4gYXJiaXRyYXJ5IG51bWJlciBvZiBjcGlvIGFyY2hpdmVzIHRvIGJl
DQo+IGFwcGVuZGVkIHRvIHRoZSBrZXJuZWwsIGJ1dCBvdXIgaW1hZ2UgY3JlYXRpb24gY29kZSBl
eHBlY3RzIG9uZS4gIFRoaXMgY2xhc3MNCj4gaXMgYmFzaWNhbGx5IHdvcmtpbmcgYXJvdW5kIHRo
YXQgbGltaXRhdGlvbiBieSBiZWluZyBhIHNwZWNpYWxpc2VkIGltYWdlIHR5cGUNCj4gdGhhdCBh
cHBlbmRzIGFub3RoZXIgaGFyZC1jb2RlZCBmaWxlLg0KPiANCj4gSWYgdGhlIGltYWdlIGNyZWF0
aW9uIGNvZGUgd2FzIGNoYW5nZWQgdG8gZXhwZWN0IGEgbGlzdCwgdGhlbiB3ZSB3b3VsZG4ndA0K
PiBuZWVkIHRoaXMgY2xhc3MgYXQgYWxsIGJ1dCBjb3VsZCBzaW1wbHkgZG8gSU5JVFJEICs9ICQo
RUFSTFlfVUNPREVfQ1BJTykuDQoNCkFzIHRoaXMgY2hhbmdlIHdpbGwgYmUgaW4gb2Vjb3JlIGxh
eWVyLCBhZGRpbmcgb2Vjb3JlIG1haWxpbmcgbGlzdCB0byB0aGlzIHRocmVhZC4NCg0KVGhlIElO
SVRSRCB2YXJpYWJsZSBpcyB1c2VkIGF0IGRpZmZlcmVudCBwbGFjZXMgbGlrZSBncnViLWVmaS5i
YmNsYXNzLCBzeXNsaW51eC5iYmNsYXNzLCBib290aW1nLmJiY2xhc3MsIGd1bW15Ym9vdC5iYmNs
YXNzLCBib290LWRpcmVjdGRpc2suYmJjbGFzcywgaW1hZ2UtbGl2ZS5iYmNsYXNzIC4gU28gZXh0
ZW5kaW5nIElOSVRSRCB2YXIgaXMgZ29pbmcgdG8gYmUgYml0IGludmFzaXZlLiBMZXQgbWUgc2Vl
IGlmIHRoaXMgY2FuIGJlIGhhbmRsZWQgaW4gbGVzcyBpbnZhc2l2ZSB3YXkuDQoNCk5pdGluDQog
DQo+IA0KPiBSb3NzDQo=

