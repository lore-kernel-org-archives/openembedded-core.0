Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.2306.1612489204047047237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 17:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VffUvPVIZzOwO7kVP3d11KvU6M0GP5RhpL5t6Iji3+VUr6tXvwMGGLzV+ohbW8KMjY2m0eqER3
 1STwejn7rf9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181509028"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="181509028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 17:40:03 -0800
IronPort-SDR: QsFT3sCzxi4/QI8avBg1SPgtnfyptARHYKWcjmmNdKG0AtZ9jPcCa0EFJNe8yX6qpQC+2foqqU
 aV3r/JuMgjVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="357441194"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2021 17:40:03 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 09:40:01 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Fri, 5 Feb 2021 09:40:01 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/2] Fix issue with npm shrinkwrap fetcher
Thread-Topic: [OE-core] [PATCH 0/2] Fix issue with npm shrinkwrap fetcher
Thread-Index: AQHW6kTABniVVGdk702VCiZCH3sss6omp6oAgAAU+QCAHw39gIACml2A
Date: Fri, 5 Feb 2021 01:40:01 +0000
Message-ID: <8563467700f9308c1de3c1b588a50dff68b7234b.camel@intel.com>
References: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
	 <CAAdc0hwtbSPoTmBoG60e-5UL+BBTEkmoQi8r+BdzOu5Eek_Pmw@mail.gmail.com>
	 <YABmBpmfl8WIK/Jf@kb-xps> <390151a7-070e-4d1f-2ffe-4051e04e1ab1@pr.hu>
In-Reply-To: <390151a7-070e-4d1f-2ffe-4051e04e1ab1@pr.hu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F02963ACD4986C45B25585252622ACDE@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIxLTAyLTAzIGF0IDEwOjU1ICswMTAwLCBab2x0YW4gQm9zem9ybWVueWkgdmlh
DQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiAyMDIxLiAwMS4gMTQuIDE2OjQwIGtl
bHRlesOpc3NlbCwgS2FtZWwgQm91aGFyYSDDrXJ0YToNCj4gPiBPbiBUaHUsIEphbiAxNCwgMjAy
MSBhdCAwMzoyNTo1MFBNICswMTAwLCBKZWFuLU1hcmllIExlbWV0YXllcg0KPiA+IHdyb3RlOg0K
PiA+ID4gSGkgS2FtZWwsDQo+ID4gPiANCj4gPiANCj4gPiBIaSBKZWFuLU1hcmllLA0KPiA+IA0K
PiA+ID4gVGhhbmtzIGZvciB5b3VyIHdvcmsuIEkgc2hvdWxkIGhhdmUgZml4ZWQgdGhpcyBhIGxv
bmcgdGltZSBhZ28NCj4gPiA+IGJ1dCBJDQo+ID4gPiBkaWRuJ3QgaGF2ZSB0aGUgdGltZSA6KA0K
PiA+ID4gDQo+ID4gDQo+ID4gV2VsbCBpdHMgbmV2ZXIgdG9vIGxhdGUgIQ0KPiA+IA0KPiA+ID4g
VGhlcmUgaXMgYWN0dWFsbHkgYW4gb3BlbiBidWcgZm9yIHRoaXMgaXNzdWU6DQo+ID4gPiBodHRw
czovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTEzOTAxDQo+ID4g
PiBJIHRoaW5rIHlvdSBjYW4gYWRkIHRoZSByZWZlcmVuY2UgdG8geW91ciBjb21taXQgbWVzc2Fn
ZXMuIEFuZA0KPiA+ID4gY2xvc2UNCj4gPiA+IGl0IGlmIG1lcmdlZC4NCj4gDQo+IFBsZWFzZSBi
YWNrcG9ydCB0aGlzIHNlcmllcyB0byBHYXRlc2dhcnRoIGFzIHNvb24NCj4gYXMgcG9zc2libGUg
YmVjYXVzZSBpdCdzIGEgcHJvYmxlbSB0aGVyZSwgdG9vLg0KPiBUaGUgc2VyaWVzIGFwcGxpZXMg
Y2xlYW5seS4NCg0KSSB3aWxsIHBpY2sgdGhlc2UgZm9yIHRoZSBuZXh0IHB1bGwgcmVxdWVzdC4N
Cg0KVGhhbmtzLA0KDQpBbnVqDQo=
