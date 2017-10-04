Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 673C977EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 16:07:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2017 09:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,477,1500966000"; d="scan'208";a="135139571"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga004.jf.intel.com with ESMTP; 04 Oct 2017 09:07:27 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 4 Oct 2017 09:07:27 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.30]) by
	ORSMSX158.amr.corp.intel.com ([169.254.10.25]) with mapi id
	14.03.0319.002; Wed, 4 Oct 2017 09:07:26 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Marek Vasut <marex@denx.de>
Thread-Topic: [OE-core] [PATCH v2] siteinfo: nios2-linux - remove wrong
	mutex info
Thread-Index: AQHTPJI3w0UwK6XDJ0uEzXwhUiC0oKLTZbkAgAAGgACAAAICgIAAbJig
Date: Wed, 4 Oct 2017 16:07:25 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611A2318C@ORSMSX112.amr.corp.intel.com>
References: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=UdzPA4WyTELZjiLmfAtK4asKRN-SBd6tsinmi76FiV_A@mail.gmail.com>
	<427c98e1-fbe4-592b-6554-a3a93d747c61@denx.de>
	<CAMKF1sqiBU6oicH4vCvJQDDR+5BRP=RXttheU9ysCdd4QRYwfQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqiBU6oicH4vCvJQDDR+5BRP=RXttheU9ysCdd4QRYwfQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "Gan, Yau Wai" <yau.wai.gan@intel.com>,
	Juro Bystricky <jurobystricky@hotmail.com>, OE
	Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Wed, 04 Oct 2017 16:07:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IE9uIDEwLzA0LzIwMTcgMDQ6MDEgQU0sIEFuZHJlIE1jQ3VyZHkgd3JvdGU6DQo+ID4+IE9u
IFR1ZSwgT2N0IDMsIDIwMTcgYXQgMjo1NCBQTSwgSnVybyBCeXN0cmlja3kNCj4gPGp1cm8uYnlz
dHJpY2t5QGludGVsLmNvbT4gd3JvdGU6DQo+ID4+PiBXaXRoIHRoZSBjb21taXQgZjRlOGU5MjQy
YzVkZjA5NWI1MjY4OGIwODNkZjNjOWQzNmU3MTQ0Yg0KPiA+Pg0KPiA+PiBUaGF0IHJldmlzaW9u
IGRvZXNuJ3QgZXhpc3QgaW4gb2UtY29yZS4uLg0KPiA+DQo+IA0KPiBpdCBleGlzdHMgaW4gcG9r
eSwgc29tZXRpbWVzIHVzZXJzIGNvbmZ1c2UgT3BlbmVtYmVkZGVkIHJlcG9zaXRvcmllcyB3aXRo
DQo+IHlvY3RvIHJlcG9zaXRvcmllcywgaXRzIHVuZm9ydHVuYXRlIGJ1dCBub3QgdW5jb21tb24N
Cj4gDQoNClRoZSBjb21taXQgSSByZWZlcmVuY2VkIGlzIGhlcmU6DQpodHRwOi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcvY2dpdC5jZ2kvcG9reS9jb21taXQvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGI/
aWQ9ZjRlOGU5MjQyYzVkZjA5NWI1MjY4OGIwODNkZjNjOWQzNmU3MTQ0Yg0KDQpKdXN0IHRvIGNs
YXJpZnk6IHRoYXQgY29tbWl0IGRpZCBub3QgYnJlYWsgdGhlIGJ1aWxkLCBpdCBleHBvc2VkIHRo
ZSBlcnJvciB0aGF0IGJyb2tlIHRoZSBidWlsZCBmb3IgbmlvczIuDQoNCg0K

