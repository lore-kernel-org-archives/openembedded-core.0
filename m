Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 44994601AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 10:46:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2014 02:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,630,1384329600"; d="scan'208";a="436257190"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2014 02:46:08 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 9 Jan 2014 10:46:07 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.66]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.169]) with mapi id
	14.03.0123.003; Thu, 9 Jan 2014 10:46:07 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH V2] Modify buildstats to be merged inside
	buildhistory
Thread-Index: AQHPCvh2YRR2GBOAqUCmGkQ1n5Lnupp7Gl2AgAENmzA=
Date: Thu, 9 Jan 2014 10:46:07 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1C545E@IRSMSX103.ger.corp.intel.com>
References: <1389028342-23264-1-git-send-email-corneliux.stoicescu@intel.com>
	<1389202585.19102.1.camel@ted>
In-Reply-To: <1389202585.19102.1.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Thu, 09 Jan 2014 10:46:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9idWlsZGhpc3RvcnkuYmJjbGFzcw0KPiA+ICsrKyBiL21l
dGEvY2xhc3Nlcy9idWlsZGhpc3RvcnkuYmJjbGFzcw0KPiA+IEBAIC0xNiw5ICsxNiwxMiBAQCBC
VUlMREhJU1RPUllfSU1BR0VfRklMRVMgPz0gIi9ldGMvcGFzc3dkDQo+IC9ldGMvZ3JvdXAiDQo+
ID4gIEJVSUxESElTVE9SWV9DT01NSVQgPz0gIjAiDQo+ID4gIEJVSUxESElTVE9SWV9DT01NSVRf
QVVUSE9SID89ICJidWlsZGhpc3RvcnkNCj4gPGJ1aWxkaGlzdG9yeUAke0RJU1RST30+Ig0KPiA+
ICBCVUlMREhJU1RPUllfUFVTSF9SRVBPID89ICIiDQo+ID4gK0JVSUxEU1RBVFNfQkFTRSA9ICIk
e0JVSUxESElTVE9SWV9ESVJ9L2J1aWxkc3RhdHMiDQo+ID4NCj4gPiAgU1NUQVRFUE9TVElOU1RG
VU5DUyArPSAiYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSINCj4gPg0KPiA+ICtpbmhlcml0
IGJ1aWxkc3RhdHMNCj4gPiArDQo+IA0KPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhpcyBpbmhl
cml0IGxpbmUuIFRoZSB1c2VyIGNhbiBzdGlsbCBkZWNpZGUgd2hldGhlciB0bw0KPiBpbmNsdWRl
IGl0IG9yIG5vdCwgaWYgaXQgaXMgaW5jbHVkZWQsIGl0IGNhbiBiZSB1bmRlciBidWlsZGhpc3Rv
cnkgY29udHJvbC4gU28gaXQNCj4gc2hvdWxkIGJlIHNhZmUgc2ltcGx5IHRvIHJlbW92ZSBpdC4N
Cj4gDQoNClJlbW92aW5nIHRoaXMgaW5oZXJpdCBhbmQgdXNpbmcgdGhlIG1hbnVhbCBzdWdnZXN0
ZWQgc3RlcHMgdG8gYWN0aXZhdGUgYnVpbGRoaXN0b3J5IGluIGxvY2FsLmNvbmY6DQoiDQpJTkhF
UklUICs9ICJidWlsZGhpc3RvcnkiDQpCVUlMREhJU1RPUllfQ09NTUlUID0gIjEiDQoiDQoNCldp
bGwgcmVzdWx0IGluIGJ1aWxkaGlzdG9yeSBiZWluZyBpbmhlcml0ZWQgYmVmb3JlIGJ1aWxkc3Rh
dHM6DQoiDQpjb3JuZWxATk9ERTE6fi9TU0QvcG9reS9idWlsZCQgYml0YmFrZSAtZSB8IGdyZXAg
J0lOSEVSSVQ9Jw0KSU5IRVJJVD0iIGJ1aWxkaGlzdG9yeSBwb2t5LXNhbml0eSBwYWNrYWdlX3Jw
bSBidWlsZHN0YXRzIGltYWdlLW1rbGlicyBpbWFnZS1wcmVsaW5rIGRlYmlhbiBkZXZzaGVsbCBz
c3RhdGUgbGljZW5zZSBzYW5pdHkiDQoiDQoNClRoaXMgd2lsbCBjYXVzZSBwYXJ0IG9mIHRoZSBi
dWlsZF9zdGF0cyBmaWxlKHdoaWNoIGlzIHdyaXR0ZW4gYXQgdGhlIGVuZCBvZiB0aGUgYnVpbGQp
IHRvIGJlIGxlZnQgb3V0IG9mIHRoZSBjb21taXRzIHdoZW4gZ2l0IGlzIHVzZWQgZm9yIGJ1aWxk
aGlzdG9yeToNCiINCmNvcm5lbEBOT0RFMTp+L1NTRC9wb2t5L2J1aWxkL2J1aWxkaGlzdG9yeSQg
Z2l0IHN0YXR1cw0KIyBPbiBicmFuY2ggbWFzdGVyDQojIENoYW5nZXMgbm90IHN0YWdlZCBmb3Ig
Y29tbWl0Og0KIyAgICh1c2UgImdpdCBhZGQgPGZpbGU+Li4uIiB0byB1cGRhdGUgd2hhdCB3aWxs
IGJlIGNvbW1pdHRlZCkNCiMgICAodXNlICJnaXQgY2hlY2tvdXQgLS0gPGZpbGU+Li4uIiB0byBk
aXNjYXJkIGNoYW5nZXMgaW4gd29ya2luZyBkaXJlY3RvcnkpDQojDQojICAgICAgIG1vZGlmaWVk
OiAgIGJ1aWxkc3RhdHMvY29yZS1pbWFnZS1taW5pbWFsLXFlbXV4ODYtNjQvMjAxNDAxMDkxMTIz
L2J1aWxkX3N0YXRzDQojDQpubyBjaGFuZ2VzIGFkZGVkIHRvIGNvbW1pdCAodXNlICJnaXQgYWRk
IiBhbmQvb3IgImdpdCBjb21taXQgLWEiKQ0KIg0KDQpBbiBlYXN5IHdheSB0byBhdm9pZCB0aGlz
IGlzIHRvIGFjdGl2YXRlIGJ1aWxkaGlzdG9yeSBieSBhZGRpbmcgaXQgYWZ0ZXIgYnVpbGRzdGF0
cyBpbiBVU0VSX0NMQVNTRVMgaW4gbG9jYWwuY29uZjoNCiINClVTRVJfQ0xBU1NFUyA/PSAiYnVp
bGRzdGF0cyBpbWFnZS1ta2xpYnMgaW1hZ2UtcHJlbGluayBidWlsZGhpc3RvcnkiDQoiDQpPcg0K
Ig0KVVNFUl9DTEFTU0VTICs9ICJidWlsZGhpc3RvcnkiDQoiDQoNClNvIGluIG9yZGVyIHRvIG1h
a2UgdGhpcyB3b3JrLCB3ZSBlaXRoZXIgY2hhbmdlIHRoZSBzdWdnZXN0ZWQgd2F5IHRvIGVuYWJs
ZSBidWlsZGhpc3Rvcnkgb3IgZmluZCBhIHdvcmthcm91bmQgaW4gY29kZS4NCg0KUmVnYXJkcywN
CkNvcm5lbGl1DQoNCg==

