Return-Path: <vedang.patel@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D3E8672F74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490306210; x=1521842210;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=XC7WZGNwoyH4HZTdL6urct2Ia2GplbrEC5xwi6fveAw=;
	b=Pyp6tmi9mii4KV1crGz+ktWkJTPSagpVB3t6E1lCpkl9oPyKkdKaxNPQ
	HtDTT59USUuey8qhGvQGFu+u2R6aMg==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2017 14:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,211,1486454400"; d="scan'208";a="64295545"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2017 14:56:48 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 23 Mar 2017 14:56:46 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.44]) by
	ORSMSX116.amr.corp.intel.com ([10.22.240.14]) with mapi id
	14.03.0319.002; Thu, 23 Mar 2017 14:56:46 -0700
From: "Patel, Vedang" <vedang.patel@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "randy.e.witt@linux.intel.com"
	<randy.e.witt@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] libxslt: Add PACKAGECONFIG support for
	python
Thread-Index: AQHSo3GwDNER4RqNLECmjeNJDpV9dqGjTTEAgAAh/YA=
Date: Thu, 23 Mar 2017 21:56:45 +0000
Message-ID: <1490306205.12818.5.camel@intel.com>
References: <1490225634.15509.40.camel@intel.com>
	<1490231158-6151-1-git-send-email-vedang.patel@intel.com>
	<ee7db60c-985e-49a5-8e64-0632e40d2db2@linux.intel.com>
In-Reply-To: <ee7db60c-985e-49a5-8e64-0632e40d2db2@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.159.64]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libxslt: Add PACKAGECONFIG support for python
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
X-List-Received-Date: Thu, 23 Mar 2017 21:56:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6F1BC96B48DB14B8704404FD7BC2AF5@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE3LTAzLTIzIGF0IDEyOjU1IC0wNzAwLCBSYW5keSBXaXR0IHdyb3RlOg0KPiBI
aSBQYXRlbCwNCj4gDQo+IE9uIDAzLzIyLzIwMTcgMDY6MDUgUE0sIFZlZGFuZyBQYXRlbCB3cm90
ZToNCj4gPiANCj4gPiBBZGQgc3VwcG9ydCB0byBlbmFibGUgcHl0aG9uIGJpbmRpbmdzIGZvciBs
aWJ4c2x0IHVzaW5nDQo+ID4gUEFDS0FHRUNPTkZJRy4NCj4gPiBUaGlzIHdpbGwgaW5jbHVkZSAt
LXdpdGgtcHl0aG9uIGFyZ3VtZW50IHdoaWxlIGNvbXBpbGluZyB0aGUNCj4gPiBwYWNrYWdlLg0K
PiA+IFRoZSBzdXBwb3J0IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogVmVkYW5nIFBhdGVsIDx2ZWRhbmcucGF0ZWxAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+IMKgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4yOS5iYiB8IDYg
KysrKy0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0
L2xpYnhzbHRfMS4xLjI5LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xp
YnhzbHRfMS4xLjI5LmJiDQo+ID4gaW5kZXggYmU3NDdlNjA4ZDlkLi4xZTAwMzA2MjA3YzUgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4y
OS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEu
MjkuYmINCj4gPiBAQCAtMjIsNyArMjIsNyBAQCBTID0gIiR7V09SS0RJUn0vbGlieHNsdC0ke1BW
fSINCj4gPiANCj4gPiDCoEJJTkNPTkZJRyA9ICIke2JpbmRpcn0veHNsdC1jb25maWciDQo+ID4g
DQo+ID4gLWluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiaW5jb25maWctZGlzYWJsZWQgbGli
X3BhY2thZ2UNCj4gPiAraW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGJpbmNvbmZpZy1kaXNh
YmxlZCBsaWJfcGFja2FnZQ0KPiA+IGRpc3R1dGlscy1jb21tb24tYmFzZQ0KPiA+IA0KPiA+IMKg
IyBXZSBkb24ndCBERVBFTkQgb24gYmludXRpbHMgZm9yIGFuc2lkZWNsLmggc28gZW5zdXJlIHdl
IGRvbid0DQo+ID4gdXNlIHRoZSBoZWFkZXINCj4gPiDCoGRvX2NvbmZpZ3VyZV9wcmVwZW5kICgp
IHsNCj4gPiBAQCAtMzMsNyArMzMsOSBAQCBkb19jb25maWd1cmVfcHJlcGVuZCAoKSB7DQo+ID4g
wqAJdG91Y2ggJHtTfS9kb2MveHNsdHByb2MuMQ0KPiA+IMKgfQ0KPiA+IA0KPiA+IC1FWFRSQV9P
RUNPTkYgPSAiLS13aXRob3V0LXB5dGhvbiAtLXdpdGhvdXQtZGVidWcgLS13aXRob3V0LW1lbS0N
Cj4gPiBkZWJ1ZyAtLXdpdGhvdXQtY3J5cHRvIg0KPiA+ICtFWFRSQV9PRUNPTkYgPSAiLS13aXRo
b3V0LWRlYnVnIC0td2l0aG91dC1tZW0tZGVidWcgLS13aXRob3V0LQ0KPiA+IGNyeXB0byINCj4g
PiArUEFDS0FHRUNPTkZJR1tsaWJ4c2x0LXB5dGhvbl0gPSAiLS13aXRoLQ0KPiA+IHB5dGhvbj0k
e1BZVEhPTl9CQVNFX1ZFUlNJT059LCAtLXdpdGhvdXQtcHl0aG9uIg0KPiA+ICsNCj4gWW91IGtl
cHQgImxpYnhzbHQtcHl0aG9uIiwgYW5kIEkgdGhpbmsgeW91IG1lYW50IHRvIGNoYW5nZSBpdCB0
bw0KPiAicHl0aG9uIi4NCj4gDQpZZWFoIEkgdG90YWxseSBtaXNzZWQgdGhhdC4uLiBXaWxsIGZp
eCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQotVmVkYW5nDQo+ID4gDQo+ID4gwqAjIG9sZGVy
IHZlcnNpb25zIG9mIHRoaXMgcmVjaXBlIGhhZCAke1BOfS11dGlscw0KPiA+IMKgUlBST1ZJREVT
XyR7UE59LWJpbiArPSAiJHtQTn0tdXRpbHMiDQo+ID4gwqBSQ09ORkxJQ1RTXyR7UE59LWJpbiAr
PSAiJHtQTn0tdXRpbHMiDQo+ID4g

