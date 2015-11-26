Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A02746011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 18:34:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 26 Nov 2015 10:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="607645422"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2015 10:34:26 -0800
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 26 Nov 2015 10:34:24 -0800
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.39]) by
	fmsmsx117.amr.corp.intel.com ([169.254.3.91]) with mapi id
	14.03.0248.002; Thu, 26 Nov 2015 10:34:24 -0800
From: "Joya Cruz, Alejandro" <alejandro.joya.cruz@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] Replace busybox for variable.
Thread-Index: AQHRKHkSL3HBOfsh40e3MMwS/ycG2A==
Date: Thu, 26 Nov 2015 18:34:24 +0000
Message-ID: <1448562857.29924.16.camel@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.128.81]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Replace busybox for variable.
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
X-List-Received-Date: Thu, 26 Nov 2015 18:34:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6B7522B08C1AA4D810B3008A92A0689@intel.com>
Content-Transfer-Encoding: base64

QW55IGZlZWRiYWNrIGFib3V0IHRoaXM/DQoNCk9uIG1hciwgMjAxNS0xMS0xNyBhdCAxNjoxMyAt
MDYwMCwgQWxlamFuZHJvIEpveWEgd3JvdGU6DQo+IFRoZXNlIHJlY2lwZXMgaGF2ZSBhIGhhcmRj
b2RlZCBkZXBlbmRlbmN5IHRvIGJ1c3lib3gsDQo+IGluIG9yZGVyIHRvIGJlIGFibGUgdG8gaGF2
ZSBhIGZsZXhpYmxlIHNlbGVjdGlvbiwNCj4gaW5zdGVhZCBvZiB0aGUgaGFyZGNvZGVkIGRlcGVu
ZGVuY3ksIG5vdyBpdCBpcyBwb2ludCB0byAgdmlydHVhbCByZWZlcmVuY2UNCj4gYmFzZS11dGls
cy4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmY5OGMzOTQxOGM2
MGI3YzBiMjViMzA5ODNkMmU1MjU3MTU4YTZhNDoNCj4gDQo+ICAgZ2NjOiBEcm9wIDQuOCAoMjAx
NS0xMS0xNiAxNDo1OTowNyArMDAwMCkNCj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCBy
ZXBvc2l0b3J5IGF0Og0KPiANCj4gICBnaXQ6Ly9naXRodWIuY29tL0Fqb3lhY3Ivb3BlbmVtYmVk
ZGVkLWNvcmUgYmFzZS11dGlscw0KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9Bam95YWNyL29wZW5l
bWJlZGRlZC1jb3JlL3RyZWUvYmFzZS11dGlscw0KPiANCj4gQWxlamFuZHJvIEpveWEgKDQpOg0K
PiAgIGJhc2UtdXRpbHM6ZmxleGlibGUgZGVwZW5kZW5jeSBmb3IgY29tbWFuZCB1dGlsaXRpZXMN
Cj4gICBjb3JlLWltYWdlLW1pbmltYWwtaW5pdHJhbWZzOiByZXBsYWNlIGJhc2UtdXRpbHMNCj4g
ICBpbml0cmFtZnMtZnJhbWV3b3JrXzEuMDpyZXBsYWNlIGJ1c3lib3ggZm9yIHZhcmlhYmxlLg0K
PiAgIHBhY2thZ2Vncm91cC1jb3JlLWJvb3Q6cmVwbGFjZSBidXN5Ym94IHRvIHZhcmlhYmxlDQo+
IA0KPiAgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL2RlZmF1bHQtcHJvdmlkZXJzLmluYyAgICAg
ICAgICAgICB8IDMgKysrDQo+ICBtZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29yZS1pbWFnZS1t
aW5pbWFsLWluaXRyYW1mcy5iYiAgIHwgMiArLQ0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJk
c2NyaXB0cy9pbml0cmFtZnMtZnJhbWV3b3JrXzEuMC5iYiB8IDIgKy0NCj4gIG1ldGEvcmVjaXBl
cy1jb3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWNvcmUtYm9vdC5iYiAgfCA0ICsrLS0N
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gLS0gDQo+IDIuMS4wDQo+IA0KDQo=

