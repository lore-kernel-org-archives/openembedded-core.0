Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.7345.1592784449463980444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2020 17:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RbJrijJMKKxL5dIs/hL9x0//9r/aOBuxbt9fmMQ4GfIij8SdJb/KVQLojiH2fxSEO9EFGJbTqA
 QA6IP/v/pjag==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="208827838"
X-IronPort-AV: E=Sophos;i="5.75,264,1589266800"; 
   d="scan'208";a="208827838"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2020 17:07:27 -0700
IronPort-SDR: mLCc1sNSQPiuNVlaZFMD9TuA+RpKbsIh+p4ispFNVSoEDRcadp8Kadhzuc0uhABon2Lp3D01Vx
 agFADU/4Jn/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,264,1589266800"; 
   d="scan'208";a="274851221"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2020 17:07:26 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.140]) by
 KMSMSX154.gar.corp.intel.com ([169.254.12.207]) with mapi id 14.03.0439.000;
 Mon, 22 Jun 2020 08:07:25 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "arthur.she@linaro.org"
	<arthur.she@linaro.org>
Subject: Re: [OE-core][PATCH v3] igt-gpu-tools: add new package
Thread-Topic: [OE-core][PATCH v3] igt-gpu-tools: add new package
Thread-Index: AQHWRmTM10lnzIDOCk20SvVqHVxULajf+wyAgANEQ4A=
Date: Mon, 22 Jun 2020 00:07:24 +0000
Message-ID: <29c3a83a8625e9f8fff5c758adc3e5d46589e8b4.camel@intel.com>
References: <20200619180922.57663-1-arthur.she@linaro.org>
	 <386362e4937341d265b2e10d87dc472eb2e4f7fa.camel@linuxfoundation.org>
In-Reply-To: <386362e4937341d265b2e10d87dc472eb2e4f7fa.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.175.240]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <550ED71329770745980D7D3CAA57B27F@intel.com>
Content-Transfer-Encoding: base64

SGkgQXJ0aHVyLA0KDQpPbiBGcmksIDIwMjAtMDYtMTkgYXQgMjM6MTQgKzAxMDAsIFJpY2hhcmQg
UHVyZGllIHdyb3RlOg0KPiBPbiBGcmksIDIwMjAtMDYtMTkgYXQgMTE6MDkgLTA3MDAsIEFydGh1
ciBTaGUgd3JvdGU6DQo+ID4gaWd0LWdwdS10b29scyBpcyBhIGNvbGxlY3Rpb24gb2YgdG9vbHMg
Zm9yIGRldmVsb3BtZW50IGFuZCB0ZXN0aW5nDQo+ID4gb2YNCj4gPiB0aGUgRFJNDQo+ID4gZHJp
dmVycy4gKGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scykN
Cj4gPiBUaGlzIHJlY2lwZSBpcyBvcmlnaW5hbGx5IGNvcGllZCBmcm9tIG1ldGEtaW50ZWwgYW5k
IGFkZGVkIHRoZQ0KPiA+IGZvbGxvd2luZw0KPiA+IG1vZGlmaWNhdGlvbnMNCj4gPiAxLiBFbmFi
bGUgQVJNIGFyY2hpdGVjdHVyZQ0KPiA+IDIuIEVuYWJsZSBpZ3QtcnVubmVyIGFuZCBDaGFtZWxp
dW0NCj4gPiAzLiBCdWlsZCBnaXQgSEVBRCBjb2RlIGluc3RlYWQgb2YgYSBzcGVjaWZpYyB2ZXJz
aW9uDQo+ID4gVGhlIG9yaWdpbmFsIHJlY2lwZSBpbiB0aGUgbWV0YS1pbnRlbCB3aWxsIGJlIHJl
bW92ZWQgYW5kIHJlcGxhY2VkDQo+ID4gYnkNCj4gPiB0aGlzIG9uZSB0byBhdm9pZCBoYXZpbmcg
YSBkdXBsaWNhdGUgcmVjaXBlLg0KPiA+IEl0IGlzIGFwcGxpY2FibGUgdG8gYmUgc3VibWl0dGVk
IHRvIG9lLWNvcmUsIGJlY2F1c2UgaXQgcHJvdmlkZXMNCj4gPiBhIGNvcmUgdmFsaWRhdGlvbiBm
dW5jdGlvbmFsaXR5IHRoYXQgaXMgbmVlZGVkIGJ5IGFsbCBwcm92aWRpbmcgRFJNDQo+ID4gZHJp
dmVycyBhbmQgbm90IGp1c3QgdG8gYSBzaW5nbGUgYXJjaC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBcnRodXIgU2hlIDxhcnRodXIuc2hlQGxpbmFyby5vcmc+DQo+IA0KPiBMb29rcyBsaWtl
IGl0IGhhcyBhIG51bWJlciBvZiBkZXBlbmRlbmNpZXMgbm90IGluIE9FLUNvcmU/DQo+IA0KPiBX
QVJOSU5HOiBOb3RoaW5nIFBST1ZJREVTICd4bWxycGMtYycgKGJ1dCAvaG9tZS9wb2t5YnVpbGQv
eW9jdG8tDQo+IHdvcmtlci9hLWZ1bGwvYnVpbGQvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1n
cHUtdG9vbHMvaWd0LWdwdS0NCj4gdG9vbHNfZ2l0LmJiIERFUEVORFMgb24gb3Igb3RoZXJ3aXNl
IHJlcXVpcmVzIGl0KQ0KPiBXQVJOSU5HOiBOb3RoaW5nIFBST1ZJREVTICdnc2wnIChidXQgL2hv
bWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hLQ0KPiBmdWxsL2J1aWxkL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiDQo+IERFUEVORFMgb24g
b3Igb3RoZXJ3aXNlIHJlcXVpcmVzIGl0KQ0KPiANCg0KeG1scnBjLWMgYW5kIGdzbCBhcmUgb3B0
aW9uYWwgZGVwZW5kZW5jaWVzIGFuZCBsb29rcyBsaWtlIGFyZSBvbmx5DQpuZWVkZWQgZm9yIGNo
YW1lbGl1bS4gQ291bGQgeW91IHBsZWFzZSB0dXJuIHRoZSBvcHRpb24NCmNoYW1lbGl1bT1lbmFi
bGVkIGludG8gYSBQQUNLQUdFQ09ORklHIGFuZCB0dXJuIHRoYXQgb2ZmIGJ5IGRlZmF1bHQ/DQoN
ClRoYW5rcywNCg0KQW51ag0K
