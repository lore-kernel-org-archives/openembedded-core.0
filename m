Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A927C6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:23:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 07 Apr 2015 04:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="477647472"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2015 04:23:06 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.2]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.129]) with mapi id
	14.03.0224.002; Tue, 7 Apr 2015 12:23:05 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the
	default BT stack
Thread-Index: AQHQcR1n76/Zfw7rAUWS/GVXmj4WXZ1BZ9Mg
Date: Tue, 7 Apr 2015 11:23:05 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F496CEA@irsmsx105.ger.corp.intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
In-Reply-To: <1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 11:23:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGFmb3JlbWVudGlvbmVkIHBhY2thZ2Vjb25maWdzIGFyZSBqdXN0IGV4YW1wbGVzL2d1aWRl
bGluZXMsIHdlIGFkZGVkIGNvZGUgZm9yIGRpdmVyc2UgcmVjaXBlcyBvbiBhIGNhc2UgYnkgY2Fz
ZSBzY2VuYXJpby4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRhbnUgS2Fz
a2luZW4gW21haWx0bzp0YW51Lmthc2tpbmVuQGxpbnV4LmludGVsLmNvbV0gDQpTZW50OiBUdWVz
ZGF5LCBBcHJpbCA3LCAyMDE1IDE6MjcgUE0NClRvOiBJb3JnYSwgQ3Jpc3RpYW4NCkNjOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCA1LzVdIGJsdWV0b290aC5iYmNsYXNzOiBzZXQgYmx1ZXo1IGFzIHRoZSBkZWZh
dWx0IEJUIHN0YWNrDQoNCk9uIEZyaSwgMjAxNS0wNC0wMyBhdCAxNzoxMyArMDMwMCwgQ3Jpc3Rp
YW4gSW9yZ2Egd3JvdGU6DQo+ICAjIFVzZSB0aGlzIHdpdGg6DQo+ICAjICBpbmhlcml0IGJsdWV0
b290aA0KPiAgIyAgUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNU
Uk9fRkVBVFVSRVMnLCANCj4gJ2JsdWV0b290aCcsICcke0JMVUVafScsICcnLCBkKX0gICMgIFBB
Q0tBR0VDT05GSUdbYmx1ZXo0XSA9ICItLWVuYWJsZS1ibHVlejQsLS1kaXNhYmxlLWJsdWV6NCxi
bHVlejQiDQo+ICsjIGlmIHRoZSBvYnNvbGV0ZSwgYnV0IHN0aWxsIHN1cHBvcnRlZCBibHVlejQg
QlQgc3RhY2sgaXMgdXNlZCAjIG9yICMgIA0KPiAraW5oZXJpdCBibHVldG9vdGggIyAgUEFDS0FH
RUNPTkZJRyA/Pz0gDQo+ICsiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycs
ICdibHVldG9vdGgnLCAnJHtCTFVFWn0nLCAnJywgDQo+ICtkKX0gIyAgUEFDS0FHRUNPTkZJR1ti
bHVlejVdID0gIi0tZW5hYmxlLWJsdWV6NSwtLWRpc2FibGUtYmx1ZXo1LGJsdWV6NSINCj4gKyMg
aWYgdGhlIGRlZmF1bHQgYmx1ZXo1IEJUIHN0YWNrIGlzIHVzZWQNCg0KSSBkb24ndCB0aGluayB0
aGlzIGRvY3VtZW50YXRpb24gaXMgY29ycmVjdC4gSXQgbWFrZXMgaXQgc291bmQgbGlrZSBhIHJl
Y2lwZSBzaG91bGQgb25seSBoYXZlDQoNCiAgICBQQUNLQUdFQ09ORklHW2JsdWV6NF0gPSAiLS1l
bmFibGUtYmx1ZXo0LC0tZGlzYWJsZS1ibHVlejQsYmx1ZXo0Ig0KDQpvcg0KDQogICAgUEFDS0FH
RUNPTkZJR1tibHVlejVdID0gIi0tZW5hYmxlLWJsdWV6NSwtLWRpc2FibGUtYmx1ZXo1LGJsdWV6
NSINCg0KLCB3aGlsZSBpbiByZWFsaXR5IHRoZSByZWNpcGUgc2hvdWxkIGhhdmUgYm90aCBsaW5l
cy4NCg0KU28sIEkgdGhpbmsgdGhlIGRvY3VtZW50YXRpb24gc2hvdWxkIGJlIHdyaXR0ZW4gbGlr
ZSB0aGlzOg0KDQojIFVzZSB0aGlzIHdpdGg6DQojICBpbmhlcml0IGJsdWV0b290aA0KIyAgUEFD
S0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAn
Ymx1ZXRvb3RoJywgJyR7QkxVRVp9JywgJycsIGQpfSAjICBQQUNLQUdFQ09ORklHW2JsdWV6NF0g
PSAiLS1lbmFibGUtYmx1ZXo0LC0tZGlzYWJsZS1ibHVlejQsYmx1ZXo0Ig0KIyAgUEFDS0FHRUNP
TkZJR1tibHVlejVdID0gIi0tZW5hYmxlLWJsdWV6NSwtLWRpc2FibGUtYmx1ZXo1LGJsdWV6NSIN
Cg0KLS0NClRhbnUNCg0K

