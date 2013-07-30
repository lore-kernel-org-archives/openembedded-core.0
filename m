Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE7166B410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:59:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2013 01:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="354152905"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2013 01:58:51 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 30 Jul 2013 09:56:26 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.10]) with mapi id
	14.03.0123.003; Tue, 30 Jul 2013 09:56:26 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/4] oeqa/runtime/xorg: use the right ps
	command for xorg test
Thread-Index: AQHOjPvWdDQ7DTRvn0i45eECIzAnMpl82tWA
Date: Tue, 30 Jul 2013 08:56:25 +0000
Message-ID: <1375174633.17676.1.camel@firebird.rb.intel.com>
References: <cover.1375171561.git.stefanx.stanacar@intel.com>
	<edec10deb2863c79750af25b31d39f7d0904c8a8.1375171561.git.stefanx.stanacar@intel.com>
In-Reply-To: <edec10deb2863c79750af25b31d39f7d0904c8a8.1375171561.git.stefanx.stanacar@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] oeqa/runtime/xorg: use the right ps command for xorg test
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
X-List-Received-Date: Tue, 30 Jul 2013 08:59:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C45C3679EB45164D866C27AEB901E297@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFR1ZSwgMjAxMy0wNy0zMCBhdCAxMTozNSArMDMwMCwgU3RlZmFuIFN0YW5hY2FyIHdy
b3RlOg0KPiBVc2Ugb3VyIGRldGVybWluZWQgcHMgY29tbWFuZCwgb3RoZXJ3aXNlIHRlc3QgZmFp
bHMgZm9yIGltYWdlcyB3aXRoIHByb2Nwcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBT
dGFuYWNhciA8c3RlZmFueC5zdGFuYWNhckBpbnRlbC5jb20+DQoNCj4gICAgICAgICAgc2VsZi5z
dHJlYW1wYXRoID0gJy90bXAvcWVtdWNvbm5lY3Rpb24uJXMnICUgb3MuZ2V0cGlkKCkNCj4gLSAg
ICAgICAgc2VsZi5xZW11cGFyYW1zID0gJ2Jvb3RwYXJhbXM9ImNvbnNvbGU9dHR5MSBjb25zb2xl
PXR0eVMwLDExNTIwMG44IiBxZW11cGFyYW1zPSItc2VyaWFsIHVuaXg6JXMsc2VydmVyLG5vd2Fp
dCInICUgc2VsZi5zdHJlYW1wYXRoDQo+ICsgICAgICAgIHNlbGYucWVtdXBhcmFtcyA9ICdub2dy
YXBoaWMgYm9vdHBhcmFtcz0iY29uc29sZT10dHkxIGNvbnNvbGU9dHR5UzAsMTE1MjAwbjgiIHFl
bXVwYXJhbXM9Ii1zZXJpYWwgdW5peDolcyxzZXJ2ZXIsbm93YWl0IicgJSBzZWxmLnN0cmVhbXBh
dGgNCg0KVGhpcyB3YXMgdW5pbnRlbnRpb25hbCwgSSdsbCByZXNlbmQuDQoNClJlZ2FyZHMsDQpT
dGVmYW4NCg0KDQoNCj4gICAgICAgICAgc2VsZi5xZW11cGlkID0gTm9uZQ0KPiAgICAgICAgICBz
ZWxmLmlwID0gTm9uZQ0KPiAgDQoNCg==

