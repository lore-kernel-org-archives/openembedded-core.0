Return-Path: <darren.hart@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 335E96D2EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 18:47:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2013 10:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,746,1378882800"; d="scan'208";a="412574051"
Received: from fmsmsx105.amr.corp.intel.com ([10.19.9.36])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2013 10:47:08 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	FMSMSX105.amr.corp.intel.com (10.19.9.36) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 21 Nov 2013 10:47:07 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.233]) by
	FMSMSX109.amr.corp.intel.com ([169.254.5.37]) with mapi id
	14.03.0123.003; Thu, 21 Nov 2013 10:47:07 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: distro/machine:kernel feature mapping and version checking
Thread-Index: AQHO5uoULxIi7dROZki1xkJDRScoPQ==
Date: Thu, 21 Nov 2013 18:47:07 +0000
Message-ID: <1385059626.3614.10.camel@dvhart-mobl4.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.58]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: distro/machine:kernel feature mapping and version checking
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
X-List-Received-Date: Thu, 21 Nov 2013 18:47:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2174EB5E8BA094BA90CA4D5848717D9@intel.com>
Content-Transfer-Encoding: base64

QWxsLA0KDQpSZWdhcmRpbmcgdGhlIGZvbGxvd2luZyAyIGJ1Z3M6DQoNCmh0dHBzOi8vYnVnemls
bGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NTU3NA0KQWRkIGtlcm5lbCB2ZXJz
aW9uIC8gY29uZmlndXJhdGlvbiBjaGVjayBtZWNoYW5pc20NCg0KYW5kIA0KDQpodHRwczovL2J1
Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTIyNjcNCkludGVncmF0ZSBE
SVNUUk9fRkVBVFVSRVMgd2l0aCBLRVJORUxfRkVBVFVSRVMNCg0KVGhlcmUgaXMgYSBuZWVkIHRv
IHJlZHVjZSBlcnJvcnMgd2hlcmUgYSBESVNUUk8gY29uZmlnIG1pZ2h0IGJyZWFrIGR1ZQ0KdG8g
bGFjayBvZiBrZXJuZWwgc3VwcG9ydCwgdGhpbmdzIHN1Y2ggYXMgc3lzdGVtZC4gVGhlcmUgaXMg
YWxzbw0KaW50ZXJlc3QgaW4gZW5hYmxpbmcgY2VydGFpbiBrZXJuZWwgZmVhdHVyZXMgYmFzZWQg
b24NCkRJU1RSTy9NQUNISU5FX0ZFQVRVUkVTLCBzdWNoIGFzIHdpZmkuDQoNCk5laXRoZXIgb2Yg
dGhlc2Ugc2hvdWxkIGRlcGVuZCBvbiB0aGUgS2VybmVsIFZlcnNpb24gYXMgZXZlbiB3aXRoIHRo
ZQ0KcmlnaHQgdmVyc2lvbiwgaWYgdGhlIENPTkZJR18qIGZlYXR1cmUgaXMgbWlzc2luZywgdGhl
IGltYWdlIHdpbGwgbm90DQp3b3JrIGNvcnJlY3RseS4gVGhlcmUgaXMgYWxzbyB0aGUgcmlzayBv
ZiBmYWxzZSBuZWdhdGl2ZXMgd2hlbiBhIGZlYXR1cmUNCmhhcyBiZWVuIGJhY2twb3J0ZWQgdG8g
YSBrZXJuZWwgdmVyc2lvbiB0aGF0IGRpZG4ndCBoYXZlIHRoZSBmZWF0dXJlDQpwcmV2aW91c2x5
Lg0KDQpUaGUgcmVjb21tZW5kZWQgYXBwcm9hY2ggd291bGQgYmUgdG8gY2hlY2sgZm9yIHRoZSBy
ZXF1aXJlZCBDT05GSUdfKg0Kb3B0aW9ucyBhZnRlciB0aGUgbGludXgteW9jdG8gY29uZmlndXJh
dGlvbiBzdGFnZS4NCg0KVGhlcmUgaXMgYWxzbyB0aGUgdG9waWMgb2YgRElTVFJPX0ZFQVRVUkVT
IH49ICJ3aWZpIiBpbXBhY3RpbmcgaG93IHRoZQ0Ka2VybmVsIHdpbGwgYmUgYnVpbHQuIFRoZSBN
QUNISU5FIHNob3VsZCBoYXZlIHNvbWUgc2F5IGluIGhvdyB0aGlzIGlzDQpkb25lIC0gaWYgdGhl
IG1hY2hpbmUgY2FuIG5ldmVyIGhhdmUgd2lmaSwgYnVpbGRpbmcgd2lmaSBpbnRvIHRoZSBrZXJu
ZWwNCmRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBzZW5zZS4gU29tZXRoaW5nIGxpa2UgdGhlIGZvbGxv
d2luZyBtaWdodCBtYWtlDQpzZW5zZToNCg0KZm9yIEZFQVRVUkUgaW4gRElTVFJPX0ZFQVRVUkVT
Og0KICAgIGlmIE1BQ0hJTkVfRkVBVFVSRVMgY29udGFpbnMgRkVBVFVSRVM6DQogICAgICAgIEtF
Uk5FTF9GRUFUVVJFUyArPSBGRUFUVVJFX292ZXJyaWRlDQoNCldoZXJlIEZFQVRVUkVfb3ZlcnJp
ZGUgaXMgZGVmaW5lZCBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQpGRUFUVVJFID0gRkVBVFVSRV9k
ZWZhdWx0DQppZiBleGlzdHMgRkVBVFVSRV9kaXN0cm86DQogICAgRkVBVFVSRSA9IEZFQVRVUkVf
ZGlzdHJvDQppZiBleGlzdHMgRkVBVFVSRV9tYWNoaW5lOg0KICAgIEZFQVRVUkUgPSBGRUFUVVJF
X21hY2hpbmUNCg0KVGhpcyBpcyBlZmZlY3RpdmVseSBhIGZyYWdtZW50IG5hbWUgd2hpY2ggbmVl
ZHMgdG8gYmUgcHJvdmlkZWQgYnkgdGhlDQpsaW51eC15b2N0byBrZXJuZWwgbWV0YSBkYXRhIGFz
IGl0IHdpbGwgYmUga2VybmVsIHZlcnNpb24gZGVwZW5kZW50Lg0KDQpUaGUgbGlua2FnZSBJJ20g
bm90IHN1cmUgYWJvdXQgaXMgaG93IHRvIGtub3cgd2hhdCB0byB0ZXN0IGZvciBpbiB0aGUNCmtl
cm5lbC5iYmNsYXNzIHdpdGhvdXQgaW50aW1hdGUga25vd2xlZGdlIG9mIHRoZSBrZXJuZWwgdmVy
c2lvbiBDT05GSUcNCm9wdGlvbnMgaW4gcmVjaXBlIHNwYWNlLg0KDQotLSANCkRhcnJlbiBIYXJ0
DQpJbnRlbCBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcg0KWW9jdG8gUHJvamVjdCAtIExp
bnV4IEtlcm5lbA0KDQo=

