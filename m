Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.4138.1590104991673481119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 16:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hvodkQUx9oe5ZJv4aPVupXnJBmL3IBX67Fsl15I//bVtNoLTDQWEsXqxopNQcbkA/JHeMyraHP
 DijO3/y5jVcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 16:49:51 -0700
IronPort-SDR: 0/gLwM5MYw6BKaTZ14EKrTOcFbQiwfbY1RiqrCJxtXJwX40GZ3rF3GW5yBaPUgj9v5MDtePMNf
 ciEBOH6JLYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; 
   d="scan'208";a="300493370"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
  by fmsmga002.fm.intel.com with ESMTP; 21 May 2020 16:49:50 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 PGSMSX105.gar.corp.intel.com ([169.254.4.241]) with mapi id 14.03.0439.000;
 Fri, 22 May 2020 07:49:39 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
Thread-Topic: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
Thread-Index: AQHWL4shX+cMedWa00is6OQn1penj6iyR7gAgABoDoA=
Date: Thu, 21 May 2020 23:49:38 +0000
Message-ID: <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
	 <20200521161543.3273063-8-raj.khem@gmail.com>
	 <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
In-Reply-To: <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.135.70]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5526AEDDA9D66A47A09EF93113B209E5@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE5OjM3ICswMjAwLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+
IE9uIFRodSwgTWF5IDIxLCAyMDIwIGF0IDY6MTYgUE0gS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4gTm93IHRoYXQgdGhleSB1c2VzIC1tY3B1LCBpdHMgYmV0dGVyIHRv
IGhhdmUgdHVuZSBzcGVjaWZpYyBidWlsZA0KPiA+IGRpcmVjdG9yaWVzLCBzaW5jZSBhYXJjaDY0
IHdvbnQgYmUgYXBwcm9wcmlhdGUgYW55IGxvbmdlcg0KPiANCj4gSSBhZ3JlZSB3aXRoIFN0ZXZl
IHRoYXQgdGhpcyBpcyBhIGJpdCBpbnZhc2l2ZSBmb3Igc3RhYmxlIGJyYW5jaCwgYnV0DQo+IG9u
IHRoZSBvdGhlciBoYW5kIGl0J3MgbG9uZyBvdmVyZHVlIGFuZCBpZiB3ZSBkb24ndCBpbXByb3Zl
IGl0IGluIExUUw0KPiBicmFuY2ggdGhlbiBtYW55IHBlb3BsZSB3aWxsIG5lZWQgdG8gY2Fycnkg
bG9jYWwgd29yayBhcm91bmRzIGZvcg0KPiBtdWx0aS1tYWNoaW5lIGJ1aWxkcy4gKzEgZnJvbSBt
ZS4NCj4gDQoNCkJ1dCB0aGlzIGlzIGFnYWluc3QgdGhlIExUUy9TdGFibGUgYnJhbmNoIHBvbGlj
eS4gV2hhdCBpcyB0aGUgcG9pbnQgb2YNCmhhdmluZyBhIHBvbGljeSBpZiB3ZSBhcmUgZ29pbmcg
dG8ga2VlcCBtYWtpbmcgZXhjZXB0aW9ucz8gVGhlcmUnZCBiZQ0Kb3RoZXIgY2hhbmdlcyBhcyB3
ZWxsIGZvciB3aGljaCBwZW9wbGUgbWlnaHQgYmUgY2Fycnlpbmcgd29yay1hcm91bmRzLg0KV291
bGQgd2UgYmUgd2lsbGluZyB0byBtYWtlIGV4Y2VwdGlvbnMgZm9yIGFsbD8NCg0KVGhhbmtzLA0K
DQpBbnVqDQo=
