Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.8768.1612536292811354449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zSGyamCt/SeR+r+nwFkm3cz7DlHhnwMgnXlj9JEQwzuFvJBNhG90SlTl0GsvpsaoEV0Sng0+lx
 hwTYN1lXO71Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168556157"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="168556157"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 06:44:43 -0800
IronPort-SDR: ZnV1ONn8dJoBtBaI75SX1+fVPYkzz5RSL8wwwoZrmTIOsZN5i0XWsS16J/5LJWljiEcxNKUOAz
 7VdZ7xlB9tbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="373420548"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2021 06:44:42 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 22:44:41 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Fri, 5 Feb 2021 22:44:41 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [gatesgarth][PATCH] license_image.bbclass: Don't attempt to symlink to the same file
Thread-Topic: [OE-core] [gatesgarth][PATCH] license_image.bbclass: Don't
 attempt to symlink to the same file
Thread-Index: AQHW+8qlDFUUWvR2r0umxmzXKmC0hapJHS2A
Date: Fri, 5 Feb 2021 14:44:41 +0000
Message-ID: <89f603997b197c3fe883fbb8e74c710111dd569b.camel@intel.com>
References: <20210205142427.18942-1-mike.looijmans@topic.nl>
In-Reply-To: <20210205142427.18942-1-mike.looijmans@topic.nl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D4880CF3450C439FEDDC3DC3CE98B8@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTAyLTA1IGF0IDE1OjI0ICswMTAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToN
Cj4gU29tZXRpbWVzICh0aGF0IGlzLCBpbiBhbGwgbXkgYnVpbGRzKSB0aGUgbGljX21hbmlmZXN0
X2RpciBhbmQNCj4gbGljX21hbmlmZXN0X3N5bWxpbmtfZGlyIGVuZCB1cCBwb2ludGluZyB0byB0
aGUgc2FtZSBmaWxlLCByZXN1bHRpbmcNCj4gaW4gYW4gZXJyb3IgbGlrZSB0aGlzOg0KPiDCoCBF
eGNlcHRpb246IEZpbGVFeGlzdHNFcnJvcjogW0Vycm5vIDE3XSBGaWxlIGV4aXN0czogJy8uLi4v
dG1wLQ0KPiBnbGliYy9kZXBsb3kvbGljZW5zZXMvbXktaW1hZ2UtdGRrejE1JyAtPiAnLy4uLi90
bXAtDQo+IGdsaWJjL2RlcGxveS9saWNlbnNlcy9teS1pbWFnZS10ZGt6MTUnDQo+IA0KPiBGaXJz
dCBjaGVjayB0byBzZWUgaWYgdGhpcyBpcyB0aGUgY2FzZSBiZWZvcmUgYXR0ZW1wdGluZyB0byBj
cmVhdGUNCj4gdGhlIGxpbmsuDQoNCklzIHRoaXMgbm90IHJlcXVpcmVkIGluIG1hc3RlciBicmFu
Y2g/IEkgY2FuJ3Qgc2VlIHRoaXMgY2hhbmdlIHRoZXJlLg0KDQpUaGFua3MsDQoNCkFudWoNCg0K
