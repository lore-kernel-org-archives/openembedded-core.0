Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C928260089
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:51:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Apr 2015 04:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="477656096"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2015 04:51:03 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.2]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.140]) with mapi id
	14.03.0224.002; Tue, 7 Apr 2015 12:51:03 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the
	default BT stack
Thread-Index: AQHQcR1n76/Zfw7rAUWS/GVXmj4WXZ1BZ9Mg///0sICAABJnsA==
Date: Tue, 7 Apr 2015 11:51:02 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F496D80@irsmsx105.ger.corp.intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496CEA@irsmsx105.ger.corp.intel.com>
	<1428406875.12283.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
In-Reply-To: <1428406875.12283.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 11:51:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIG9ubHkgd2F5IHRoaXMgY291bGQgYmUgZml4ZWQgaXMgdG8gcmVtb3ZlIHRoZSBhZm9yZW1l
bnRpb25lZCBndWlkZWxpbmVzLi4NCkxpa2UgSSBzYWlkLCB0aGVyZSBhcmUgcGxlbnR5IG9mIGV4
YW1wbGVzIGluIHRoZSBjb2RlLg0KVGhvc2UgcGFja2FnZWNvbmZpZ3Mgd2hlcmUgZWxhYm9yYXRl
ZCBiYXNlZCBvbjoNCjEuIGlmIGEgcGFja2FnZSBoYXMgc3VwcG9ydCBmb3IgYm90aCBCbHVlWiB2
ZXJzaW9uczsNCjIuIElmIG5vdCwgdXN1YWxseSBvbmx5IEJsdWVaIDQgaXMgc3VwcG9ydGVkOw0K
DQpDYXJlIHRvIGVsYWJvcmF0ZSBob3cgSSBjYW4gZml4IHRoZW0gb3RoZXJ3aXNlPyBJIGFtIG9w
ZW4gdG8gc3VnZ2VzdGlvbnMuDQpUaGFua3MsDQpDcmlzdGlhbg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogVGFudSBLYXNraW5lbiBbbWFpbHRvOnRhbnUua2Fza2luZW5AbGlu
dXguaW50ZWwuY29tXSANClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDcsIDIwMTUgMjo0MSBQTQ0KVG86
IElvcmdhLCBDcmlzdGlhbg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDUvNV0gYmx1ZXRvb3RoLmJiY2xh
c3M6IHNldCBibHVlejUgYXMgdGhlIGRlZmF1bHQgQlQgc3RhY2sNCg0KT24gVHVlLCAyMDE1LTA0
LTA3IGF0IDExOjIzICswMDAwLCBJb3JnYSwgQ3Jpc3RpYW4gd3JvdGU6DQo+IFRoZSBhZm9yZW1l
bnRpb25lZCBwYWNrYWdlY29uZmlncyBhcmUganVzdCBleGFtcGxlcy9ndWlkZWxpbmVzLCB3ZSAN
Cj4gYWRkZWQgY29kZSBmb3IgZGl2ZXJzZSByZWNpcGVzIG9uIGEgY2FzZSBieSBjYXNlIHNjZW5h
cmlvLg0KDQpNeSBwb2ludCB3YXMgdGhhdCB0aGUgZXhhbXBsZXMvZ3VpZGVsaW5lcyBhcmUgbWlz
bGVhZGluZywgYW5kIHNob3VsZCBiZSBmaXhlZC4NCg0KLS0NClRhbnUNCg0K

