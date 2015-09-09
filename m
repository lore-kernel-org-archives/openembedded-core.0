Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB1574197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 21:27:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 09 Sep 2015 14:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,499,1437462000"; d="scan'208";a="786146123"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2015 14:27:15 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 9 Sep 2015 14:27:14 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.154]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.116]) with mapi id
	14.03.0224.002; Wed, 9 Sep 2015 14:27:14 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
Thread-Index: AQHQ6p49wcfefQ0JH0iJ0ulPegvHAp40YdiAgABSuCA=
Date: Wed, 9 Sep 2015 21:27:14 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6101E771D@ORSMSX109.amr.corp.intel.com>
References: <1441761543-10979-1-git-send-email-juro.bystricky@intel.com>
	<1441790471.31676.13.camel@pbcl.net>
In-Reply-To: <1441790471.31676.13.camel@pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
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
X-List-Received-Date: Wed, 09 Sep 2015 21:27:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB3b3VsZCBub3QgY2FsbCBpdCBhIHJlYWwgYnVnLiBUaGUgY29kZSBqdXN0IHRyaWVzIHRvIGlu
aXRpYWxpemUgQVJDSCAgKHdoaWNoIG1heSBub3QgYmUgdXNlZA0KZm9yIGJhcmVtZXRhbCBzaXR1
YXRpb25zKS4gVGhlIG5hbWUgIm1hcF9rZXJuZWxfYXJjaCIgaXMgYSBiaXQgbWlzbGVhZGluZw0K
aW4gdGhpcyAoYmFyZW1ldGFsKSBjb250ZXh0Lg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogUGhpbCBCbHVuZGVsbCBbbWFpbHRvOnBiQHBiY2wubmV0XQ0KPiBTZW50
OiBXZWRuZXNkYXksIFNlcHRlbWJlciA5LCAyMDE1IDI6MjEgQU0NCj4gVG86IEJ5c3RyaWNreSwg
SnVybw0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgUHVy
ZGllLCBSaWNoYXJkDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBrZXJuZWwtYXJj
aC5iYmNsYXNzOiBBbGxvdyAnYmFyZW1ldGFsJyBDUFVzDQo+IA0KPiBPbiBUdWUsIDIwMTUtMDkt
MDggYXQgMTg6MTkgLTA3MDAsIEp1cm8gQnlzdHJpY2t5IHdyb3RlOg0KPiA+IEF2b2lkICJFUlJP
UjogY2Fubm90IG1hcCA8Y3B1PiB0byBhIGxpbnV4IGtlcm5lbCBhcmNoaXRlY3R1cmUiDQo+ID4g
Tm90IGJlaW5nIGFibGUgdG8gbWFwIGEgQ1BVIHRvIGEga2VybmVsIGFyY2hpdGVjdHVyZSBzaG91
bGQgbm90IGJlDQo+ID4gdHJlYXRlZCBhcyBhbiBlcnJvciB3aGVuIGJ1aWxkaW5nIGJhcmVtZXRh
bCB0b29sY2hhaW5zIGZvciBDUFUgPGNwdT4NCj4gPiB3aGljaCBkb2VzIG5vdCBoYXZlIGEga2Vy
bmVsIHNvdXJjZSB0cmVlLg0KPiANCj4gV2h5IGlzIG1hcF9rZXJuZWxfYXJjaCgpIGV2ZW4gYmVp
bmcgaW52b2tlZCBmb3IgYSBiYXJlbWV0YWwNCj4gY29uZmlndXJhdGlvbj8gIFRoYXQgc291bmRz
IGxpa2UgaXQgaXMgdGhlIHJlYWwgYnVnIGhlcmUuDQo+IA0KPiBwLg0KPiANCg0K

