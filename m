Return-Path: <vedang.patel@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5159C77A98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 22:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490220980; x=1521756980;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=ajYWKPIJ4KAA2Vmz5//73WjoOsu04Bw5+5lZ67ukhzY=;
	b=NogmZQlNw/O+ApOGMNMHOjITU9WZsBv9FVsGbsilEakLiW+Or5Oy5S29
	wuSFEvEbMHUdQJlYH5OMQlJEXdX1OA==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 15:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,206,1486454400"; d="scan'208";a="1125961071"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2017 15:16:18 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 22 Mar 2017 15:16:17 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.227]) by
	ORSMSX159.amr.corp.intel.com ([169.254.11.140]) with mapi id
	14.03.0319.002; Wed, 22 Mar 2017 15:16:17 -0700
From: "Patel, Vedang" <vedang.patel@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libxslt: Add PACKAGECONFIG support
Thread-Index: AQHSodp9JloWuTDi4kKOdqEqso0XOKGfbi+AgAJWBYCAAADGgIAAIIIA
Date: Wed, 22 Mar 2017 22:16:16 +0000
Message-ID: <1490220976.15509.34.camel@intel.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
	<CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
	<1490213829.15509.26.camel@intel.com>
	<CAJTo0LZd1JgF+Zz_-yS5p-HeA1jxrmbxg-G9oP1maVO3rfzfVA@mail.gmail.com>
In-Reply-To: <CAJTo0LZd1JgF+Zz_-yS5p-HeA1jxrmbxg-G9oP1maVO3rfzfVA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.159.64]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Wed, 22 Mar 2017 22:16:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3473DC6F9D13848A0A471086EB2ED72@intel.com>
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KT24gV2VkLCAyMDE3LTAzLTIyIGF0IDIwOjE5ICswMDAwLCBCdXJ0b24sIFJv
c3Mgd3JvdGU6DQo+IA0KPiBPbiAyMiBNYXJjaCAyMDE3IGF0IDIwOjE3LCBQYXRlbCwgVmVkYW5n
IDx2ZWRhbmcucGF0ZWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBDYW4geW91IGVsYWJvcmUg
b24geW91ciBjb25jZXJuPyBJIGFtIG5vdCBleGFjdGx5IGZvbGxvd2luZyBpdC4NCj4gPiANCj4g
PiB0aGUgY29uZmlncyB3b24ndCBiZSBlbmFibGVkIHVubGVzcyB0aGUgY29ycmVzcG9uZGluZyBm
ZWF0dXJlcyBhcmUNCj4gPiBleHBsaWNpdGx5IGVuYWJsZWQgaW4gdGhlIGltYWdlLiBJIGFtIHVz
aW5nIGxpYnhzbHQtIHByZWZpeCB0byBtYWtlDQo+ID4gc3VyZSBzb21lb25lIGRvZXMgbm90IGlu
YWR2ZXJ0ZW50bHkgZW5hYmxlcyB0aGUgZmVhdHVyZXMgYnkgdXNpbmcNCj4gPiB0aGUgZ2VuZXJp
YyBmbGFncyAocHl0aG9uLCBkZWJ1ZywgLi4uICkuwqANCj4gPiANCj4gTm8sIHlvdSdyZSBjaGFu
Z2luZyB0aGUgZGVmYXVsdCB0byBlbmFibGUgYWxsIHRoZSB0aGluZ3MgdGhhdCB3ZXJlDQo+IHBy
ZXZpb3VzbHkgZGlzYWJsZWQuDQo+IA0KPiBBbHNvIHlvdSBkb24ndCBuZWVkIHRvIHByZWZpeCB0
aGUgbmFtZXMgYXMgdGhleSdyZSByZWNpcGUtc3BlY2lmaWMNCj4gYWxyZWFkeS4NCj4gDQo+IEkg
c3VnZ2VzdCB0aGF0IHlvdSByZS1yZWFkIHRoZSBQQUNLQUdFQ09ORklHIHNlY3Rpb24gaW4gdGhl
IG1hbnVhbA0KPiBhbmQgcmVzdWJtaXQgdGhlIHBhdGNoLg0KDQpJIGdvdCBteSBtaXN0YWtlLiBT
ZXR0aW5nIFBBQ0tBR0VDT05GSUcgZW5hYmxlZCBhbGwgdGhlIGZlYXR1cmVzIGJ5DQpkZWZhdWx0
LiBBbHNvLCBzaG91bGQgSSBiZSBpbmNsdWRpbmcgcHl0aG9uIGFzIHJ1bnRpbWUgZGVwZW5kZW5j
eSB3aGVuDQotLXdpdGgtcHl0aG9uIGlzIHVzZWQ/DQoNClRoYW5rcywNClZlZGFuZyBQYXRlbA0K
U29mdHdhcmUgRW5naW5lZXINCkludGVsIENvcnBvcmF0aW9uDQo+IA0KPiBSb3Nz

