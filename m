Return-Path: <william.c.randle@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 510DE65CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:36:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2016 14:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="770185290"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga003.jf.intel.com with ESMTP; 23 Mar 2016 14:36:20 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 23 Mar 2016 14:36:20 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX111.amr.corp.intel.com ([169.254.12.9]) with mapi id
	14.03.0248.002; Wed, 23 Mar 2016 14:36:19 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, "pb@pbcl.net" <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH] insane.bbclass: tighten lib_re and exec_re
	patterns to avoid false positive
Thread-Index: AQHRhRxTM8ODTxW/+UeMoyRHDMMi3Z9nxdEAgAAA5wCAAAEhAIAANhaAgAAFRAA=
Date: Wed, 23 Mar 2016 21:36:19 +0000
Message-ID: <1458768980.2442.13.camel@intel.com>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
	<1458755798.3476.186.camel@pbcl.net>
	<CAJTo0LbicCM6LJbxEK8m-QES49-WjPJsDUgduV0-dOg1FSEdZw@mail.gmail.com>
	<1458756234.3476.189.camel@pbcl.net>
	<CAJTo0LZL6WKPv+UFNRP9hMO8Ui0F6mLvkKrcM0eBdFJ5bF-pSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZL6WKPv+UFNRP9hMO8Ui0F6mLvkKrcM0eBdFJ5bF-pSQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.0.118]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 21:36:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DEE5174C9DDE24CB79F4A6F76C7279B@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTAzLTIzIGF0IDIxOjE3ICswMDAwLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+
IA0KPiBPbiAyMyBNYXJjaCAyMDE2IGF0IDE4OjAzLCBQaGlsIEJsdW5kZWxsIDxwYkBwYmNsLm5l
dD4gd3JvdGU6DQo+ID4gT3IgYWx0ZXJuYXRpdmVseSwgYWRkIGFuIGV4dHJhIGNoZWNrIHNvIHRo
YXQgd2hlbiBpdCB0aGlua3MgaXQncyBmb3VuZCBhDQo+ID4gbWlzcGxhY2VkIGxpYnJhcnksIGl0
IGNoZWNrcyB0aGUgRUxGIGhlYWRlciB0byBtYWtlIHN1cmUgdGhhdCBpdCByZWFsbHkgaXMNCj4g
PiBvbmUgYW5kIHN1cHByZXNzZXMgdGhlIGRpYWdub3N0aWMgaWYgbm90LsKgIElmIHlvdSBvbmx5
IGRvIHRoaXMgaW4gY2FzZXMNCj4gPiB3aGVyZSBpdCB3YXMgYWJvdXQgdG8gcHJpbnQgYSB3YXJu
aW5nIGFueXdheSB0aGVuIHRoZSBpbXBhY3Qgb24gcGVyZm9ybWFuY2UNCj4gPiBzaG91bGRuJ3Qg
YmUgdG9vIGJhZC4NCj4gPiANCj4gWWVhaCwgYmVzdCBvZiBib3RoIHdvcmxkcy7CoCBBIGZsZXhp
YmxlIHJlZ2V4IHRvIGNhdGNoIHBvdGVudGlhbCBvZmZlbmRlcnMsIGFuZA0KPiB0aGVuIHVzZSBv
ZS5xYS5FTEZGaWxlIHRvIHZlcmlmeSBpdCdzIGFjdHVhbGx5IGEgbGlicmFyeS7CoCBDYW4geW91
IHVwZGF0ZSB0aGUNCj4gcGF0Y2ggQmlsbD8NCj4gDQpZZXMsIEknbGwgdXBkYXRlIHRoZSBwYXRj
aCBhbmQgcmVwb3N0IGluIGEgYml0Lg0KDQrCoCDCoCAtQmlsbA==

