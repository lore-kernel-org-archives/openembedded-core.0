Return-Path: <darren.hart@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 65B546BCAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 16:11:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2013 08:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,745,1378882800"; d="scan'208";a="437416738"
Received: from fmsmsx104.amr.corp.intel.com ([10.19.9.35])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2013 08:11:50 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
	FMSMSX104.amr.corp.intel.com (10.19.9.35) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 21 Nov 2013 08:11:50 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.233]) by
	FMSMSX155.amr.corp.intel.com ([169.254.5.40]) with mapi id
	14.03.0123.003; Thu, 21 Nov 2013 08:11:50 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] ia32-base: Remove cpio and ext3 defaults
Thread-Index: AQHO5s39Uk6hlmaEeka1cuQHGreTHpowYUIA
Date: Thu, 21 Nov 2013 16:11:49 +0000
Message-ID: <1385050308.20337.16.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1385047536.16887.137.camel@ted>
In-Reply-To: <1385047536.16887.137.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.58]
MIME-Version: 1.0
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ia32-base: Remove cpio and ext3 defaults
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
X-List-Received-Date: Thu, 21 Nov 2013 16:11:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C96C19E7406BE4F88F64E1AD3CC33CE@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDEzLTExLTIxIGF0IDE1OjI1ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gcmVhbCBJQSBoYXJkd2FyZSwgbmVpdGhlciB0aGUgZXh0MyBvciBjcGlvIGltYWdlcyBh
cmUgcGFydGljdWxhcmx5IHVzZWZ1bA0KPiBvciB1c2VkLiBjcGlvIGlzIGxlZ2FjeSBmcm9tIGlu
aXRyYW1mcyBhbmQgdGhhdCBzcGVjaWZpYyBpbWFnZSBub3cgb3ZlcnJpZGVzDQo+IEZTVFlQRVMg
YWNjb3JkaW5nbHkuIFRoZSBzaXplIGRpZmZlcmVuY2UgaW4gZmlsZXN5c3RlbXMgbWFrZXMgZXh0
MyBhcyBhIGZpbGUNCj4gZm9ybWF0IGxlc3MgdXNlZnVsLCBtYWlubHkgYmVpbmcgdXNlZnVsIGlu
IHRoZSBxZW11IGNhc2UuDQo+IA0KPiBXaGVuIG5lZWRlZCB1c2VycyBjYW4gc3RpbGwgb3ZlcnJp
ZGUgdGhlIGRlZmF1bHQgRlNUWVBFUyBzbyBoYXZpbmcNCj4gc2FuZXIgZGVmYXVsdHMgbWFrZXMg
c2Vuc2UuIFRoaXMgaW1wcm92ZXMgYnVpbGQgdGltZXMgYW5kIHVzZXMgbGVzcw0KPiBuZXR3b3Jr
IGJhbmR3aWR0aCBmb3IgYnVpbGRzIGFuZCByZWxlYXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KDQpJ
J20gZmluZSB3aXRoIHRoaXMsIGFsdGhvdWdoIGl0IHJhaXNlcyB0aGUgcXVlc3Rpb24gaWYgd2Ug
b3VnaHQgdG8gYmUNCmRvaW5nIGFueXRoaW5nIG1vcmUgdGhhbiB0YXIgcm9vdGZzIGluIGluY2x1
ZGUgZmlsZXMgbGlrZSB0aGlzLiB0aGVyZQ0KYXJlIGlhMzIgbWFjaGluZXMgd2hlcmUgYSBsaXZl
IGltYWdlIGlzIG5vdCB1c2VmdWwgKGFsdGhvdWdoIHJhcmUpLiBNb3N0DQp4ODYgQlNQcyB3b3Vs
ZCBhZGQgbGl2ZSAtIGJ1dCB0aGVuIGFnYWluLCBtb3N0IHg4NiBCU1BzIHdpbGwgYmUgc3RhcnRp
bmcNCnRvIGNvbnNvbGlkYXRlIG9uIHRoZSBnZW5lcmljeDg2IEJTUHMgYW55d2F5Li4uLg0KDQpC
dXQsIHRoaXMgaXMgYSBjbGVhciBpbXByb3ZlbWVudCBhcyBpcy4NCg0KQWNrZWQtYnk6IERhcnJl
biBIYXJ0IDxkdmhhcnRAbGludXguaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9pYTMyLWJhc2UuaW5jIGIvbWV0YS9jb25mL21hY2hp
bmUvaW5jbHVkZS9pYTMyLWJhc2UuaW5jDQo+IGluZGV4IDhhMjBiY2EuLmUxNWY5MjcgMTAwNjQ0
DQo+IC0tLSBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvaWEzMi1iYXNlLmluYw0KPiArKysg
Yi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2lhMzItYmFzZS5pbmMNCj4gQEAgLTEwLDcgKzEw
LDcgQEAgTUFDSElORV9GRUFUVVJFUyArPSAic2NyZWVuIGtleWJvYXJkIHBjaSB1c2Job3N0IGV4
dDIgZXh0MyB4ODYgXA0KPiAgDQo+ICBNQUNISU5FX0VYVFJBX1JSRUNPTU1FTkRTICs9ICJrZXJu
ZWwtbW9kdWxlcyINCj4gIA0KPiAtSU1BR0VfRlNUWVBFUyArPSAiZXh0MyBjcGlvLmd6IGxpdmUi
DQo+ICtJTUFHRV9GU1RZUEVTICs9ICJsaXZlIg0KPiAgDQo+ICBLRVJORUxfSU1BR0VUWVBFID89
ICJiekltYWdlIg0KPiAgDQo+IA0KPiANCg0KLS0gDQpEYXJyZW4gSGFydA0KSW50ZWwgT3BlbiBT
b3VyY2UgVGVjaG5vbG9neSBDZW50ZXINCllvY3RvIFByb2plY3QgLSBMaW51eCBLZXJuZWwNCg0K

