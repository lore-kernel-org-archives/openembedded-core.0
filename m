Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06B9B71ADE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489592333; x=1521128333;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=XxRtsFuQrtivuwFvp6qG3/45/wHMXT5k1aSF7dJlTz0=;
	b=TuvyagRqYf/SpnjMU0L3gGhk/jfxEX2SVxunLUTlyDul9d9bOEyErjtn
	JYfb8u9uT9//urWPTwQy4l3Bg9JZVg==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 08:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,169,1486454400"; d="scan'208";a="76483783"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2017 08:38:52 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 15 Mar 2017 08:38:52 -0700
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.63]) by
	fmsmsx117.amr.corp.intel.com ([169.254.3.201]) with mapi id
	14.03.0248.002; Wed, 15 Mar 2017 08:38:52 -0700
From: "Ibarra Lopez, Humberto" <humberto.ibarra.lopez@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/3] rpm: add support for remote package
	feeds via PACKAGE_FEED_URIS variable
Thread-Index: AQHSnX1KJhnvMrv49061xob9uZSeEKGWNlIA///SDxA=
Date: Wed, 15 Mar 2017 15:38:51 +0000
Message-ID: <F187383F84EB304A88D055C3049588791BCF0AF1@FMSMSX106.amr.corp.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
	<9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
In-Reply-To: <9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Wed, 15 Mar 2017 15:38:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIG1pc3NlZCB0aGUgcHJldmlvdXMgbWFpbC4NCg0KSSBhbSBub3Qgc3VyZSBob3cgdG8g
aW1wcm92ZSB0aGUgaGFyZGNvZGluZyB0aGVyZSwgSSBkb24ndCBsaWtlIGl0IGVpdGhlciwgYnV0
IGNvdWxkbid0IGZpbmQgYW4gYWx0ZXJuYXRpdmUuIFRoZSB0aGluZyBpcyB0aGF0IHdlIG5lZWQg
dGhlIGlwIG9mIHRoZSBob3N0IGFzIHNlZW4gZnJvbSB0aGUgdGFyZ2V0IHRvIHJ1biB0ZXN0aW1h
Z2UsIGJ1dCB3ZSBkb27igJl0IGhhdmUgdGhlIGV4YWN0IHZhbHVlIGZvciB0aGF0IG9uZSB1bnRp
bCBxZW11IGlzIHVwLiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IHdlIG5lZWQgdG8gZ2l2ZSB0aGlz
IGlwIHRvIHRoZSBjb25mIGluIHRoZSBQQUNLQUdFX0ZFRURfVVJJUyBiZWZvcmUgYnVpbGRpbmcg
c28gd2UgY2FuIGdldCBhbiBpbWFnZSB3aXRoIHRoaXMgdmFyIHRvIGxhdGVyIHVzZSBpbiB0ZXN0
aW1hZ2UuDQoNCklmIHNvbWVvbmUgaGFzIGEgYmV0dGVyIGlkZWEgdG8gZ2V0IHJpZCBvZiB0aGlz
IGhhcmRjb2RpbmcsIGl0IHdvdWxkIGJlIGdyZWF0IHRvIGtub3cuDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiBbbWFpbHRvOmFsZXhhbmRlci5r
YW5hdmluQGxpbnV4LmludGVsLmNvbV0gDQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE1LCAyMDE3
IDU6MTkgQU0NClRvOiBCdXJ0b24sIFJvc3MgPHJvc3MuYnVydG9uQGludGVsLmNvbT4NCkNjOiBP
RS1jb3JlIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjsgSWJhcnJh
IExvcGV6LCBIdW1iZXJ0byA8aHVtYmVydG8uaWJhcnJhLmxvcGV6QGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvM10gcnBtOiBhZGQgc3VwcG9ydCBmb3IgcmVtb3Rl
IHBhY2thZ2UgZmVlZHMgdmlhIFBBQ0tBR0VfRkVFRF9VUklTIHZhcmlhYmxlDQoNCk9uIDAzLzE1
LzIwMTcgMDE6MTMgUE0sIEJ1cnRvbiwgUm9zcyB3cm90ZToNCj4NCj4gICAgICsgICAgICAgIGNs
cy5yZXBvX3NlcnZlci5wb3J0ID0gODA4MA0KPg0KPg0KPiBXaGF0IGlmIHBhcmFsbGVsIHNlbGZ0
ZXN0cyBhcmUgcnVubmluZyBhdCBvbmNlPyAgQ2FuIHRoaXMgc2VydmljZSBiZSANCj4gc3RhcnRl
ZCBiZWZvcmUgdGhlIGltYWdlIGlzIGNyZWF0ZWQsIHNvIHRoZSByaWdodCBwb3J0IGNhbiBiZSB3
cml0dGVuIA0KPiBpbnRvIHRoZSBpbWFnZT8NCg0KSSBkb24ndCBrbm93LiBJIG9ubHkgZm9sbG93
ZWQgd2hhdCBIdW1iZXJ0byB3cm90ZSBpbiB0aGUgb3JpZ2luYWwgcGF0Y2g7IHdlIG5lZWQgdG8g
YXNrIGhpbS4gSSdtIGFsc28gbm90IGVudGlyZWx5IGNlcnRhaW4gdGhhdCBoYXJkY29kaW5nIHRo
ZSBpcCBhZGRyZXNzIHdpbGwgYWx3YXlzIHdvcmssIGFuZCBkaWQgbm90IGdldCBhbiBhbnN3ZXIg
dG8gdGhhdC4NCg0KQW5vdGhlciwgbW9yZSBoYWNraXNoIG9wdGlvbiBpcyB0byBtb25rZXkgcGF0
Y2ggdGhlIGVwaGVtZXJhbCBwb3J0IGJlZm9yZSBydW5uaW5nIGRuZiBpbnRvIHRoZSByZXBvIGNv
bmZpZyBvbiB0aGUgaW1hZ2UuDQoNCkFsZXgNCg0K

