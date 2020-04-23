Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.3079.1587634424508122837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 02:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=ZQP51UNv;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: NDhNAkr+AGC+gAGyQTjZJMkYKYuFp3N5x4rfxX2CFBTx7ojgaGM2bAWEF/Clfy8JAXHOcRC2Il
 04ayn2+AV4mw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 02:33:44 -0700
IronPort-SDR: 25WZ5FNom6/bFxP/YxHKv9aJN5SVChz5WrQncvFE8BR7WyEZhG3ogphogtJWSAqMb70ysKCoeV
 lCIzgDFx8EZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; 
   d="scan'208";a="274175618"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by orsmga002.jf.intel.com with ESMTP; 23 Apr 2020 02:33:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Apr 2020 02:33:32 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 23 Apr 2020 02:33:31 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 23 Apr 2020 02:33:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 23 Apr 2020 02:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KROfhxPe+x8H279finwVsQgcw9B8Vi2pmsmhU05bEsEpeRRWaiCAp7/5EDknHOmd2P32g6WlcRc7BWkYDHoRYYgRgAKiNlvisUd+ASF/FKD15/DYDZjOjBaadyc0X2wOjRdISrFzv2Kx6oIsIuiW4elL1Y8IRzHr8cEMcS1rcaok+B9xcxjRtu/QnDbMSpTfLSx5ld9R6Vp6EB1oSKQQ2Z3f7lfwUnSVrmg8zamCyKuVkQmRtpTKyP3poTm4AM8/Qj97hrJ9ZvRL59S2gWbr7d2DIvk5EP8dM5YZz6BOlMp2ytza1I9PAJko68N2fScjNt56x0+306a8tl9YjvqYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU+mM70mTLpn/+bthHU6PUgstwwqCJ5gRCm10aWosKM=;
 b=las/9aEm+FAZtG+AnJxZmKyf3LuXI8ggPbpobb+V15UqKYVmGbZWcTsx2rbWX1Ik1/BwL0481g9QjgB604m1c4Jgl/utasT2O38UDv3dpWAkDq2ct5tv+iPaCHxLqVWpdJpz1+d8wAW2fuBKzCFOWZ8+pvwMzh/BAkZsupE7GN2k2yM2ypOJ7nmmkVKDMS59B7hGUNUvA7AS7svTw8574EqHunFHpdNMe6RJ2EEMNPhMuffz8fdVbcY6fcft9diMKxNH5CXpwWHPHLXfIScQ7eBcV3PB2nnGD8nbYGDeAEmI6nsS2GJEPQt4052HhguV88tKqnuG/cAwsWJ2mdRqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU+mM70mTLpn/+bthHU6PUgstwwqCJ5gRCm10aWosKM=;
 b=ZQP51UNvSGQN8dlsPm/VwdcMVT5Mr+hLd2WqZHSqXRmhUPdyPqHuZi3Ei+3XVM8AxPyHghZZjesdHQ7doTX/OTMw4t84d/+rS9Qn69DcJtPiC+fl/UR78xCldLuRTszDuqfF/aj8+110LNWK9+oA797jtcpEEVNGROywZi6APO4=
Received: from BL0PR11MB3251.namprd11.prod.outlook.com (2603:10b6:208:64::23)
 by BL0PR11MB2962.namprd11.prod.outlook.com (2603:10b6:208:78::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Thu, 23 Apr
 2020 09:33:30 +0000
Received: from BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c]) by BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c%6]) with mapi id 15.20.2921.033; Thu, 23 Apr 2020
 09:33:29 +0000
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Thread-Topic: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for
 IMAGE_GEN_DEBUGFS
Thread-Index: AQHWGUytfiUu1qpIlkeNbvSmc/98PKiGcI0w
Date: Thu, 23 Apr 2020 09:33:29 +0000
Message-ID: <BL0PR11MB32518D373ED7B546CBE13E1AC8D30@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
 <38bd6d9fd2144ed8f5bd90da57c6dbd686d3c684.camel@linuxfoundation.org>
In-Reply-To: <38bd6d9fd2144ed8f5bd90da57c6dbd686d3c684.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ee.peng.yeoh@intel.com; 
x-originating-ip: [192.198.147.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b0557b3-de86-4c3a-6f61-08d7e769621c
x-ms-traffictypediagnostic: BL0PR11MB2962:
x-microsoft-antispam-prvs: <BL0PR11MB296249F025F8CD3AACFE56FAC8D30@BL0PR11MB2962.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3251.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(81156014)(316002)(8936002)(2906002)(966005)(86362001)(186003)(478600001)(55016002)(8676002)(7696005)(53546011)(9686003)(52536014)(71200400001)(33656002)(66556008)(64756008)(26005)(66476007)(66446008)(66946007)(110136005)(76116006)(5660300002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K6lzx0JbjxOM2FI41Y+PIKpjfTIWKx1SE9zO0DoYsKbt3IIeWoQg6O5kA4sCbVCegJwxguWB7rRJkKz5VrsAfajtzH7SkS2rkoo1smULudKetqsazJ+mUxyxMnUOdxDPYsbLbU1IRUnRvfncuCOHicQG4bG846AaipP4X0nmvYVDZf1Fd14OupJ1pAPQTp6SPc3HMZyk6SgBkIQY76UYY1gdQBEOTlbP5cdp15Cw/1y8GXa8wICJPOOzb24gapkWQMOsGzb9fs+DdzdnK12lvbjhlbfaQRPQl5UH+rC52IqvUWmW4PgGoj0S/sNAJxmtQijVDpw5flvYVQ2N2y/Qsq8sLILmD1r+YgchOJ2QUdwinDwtrIf4bPYa35gxJLgNi0lHSX5yEUeBUxby7sWMFM9+QlJAWbV8mCyLWgQDLqkMCtMebBQq+Q3GHoJ/5NlW/P32/K3P/2OS+6ivMKU5FFPGZVddQM5aIxiaftF+wxADIzW7HSRevHWFY0rEf7iWPm9axMxvQ7n/+l04SycLQA==
x-ms-exchange-antispam-messagedata: DEzA2pdbeEtRtuAZFBDjsUY+0bzxIaW7U94F3gLP46bGxsN4ewnIodFNfKjiV9SBtVBI9MxT/hcJvGLetjA5X3M1U5oviu/vzaxVInMSyErGRxOn4N3Js4krU1W0syXxrOyfbNwYXw7ieXWfWW77OA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0557b3-de86-4c3a-6f61-08d7e769621c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 09:33:29.6899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iiyAhoDCuy/5o2qmCygUN/16oWHiZYrmdE3HBZGxJIYjtWB3rQenGwbh5Z7bj3EA8G1cagNERIj9R/Qi2DH7TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2962
Return-Path: ee.peng.yeoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhpcyB3YXMgc3VycHJpc2luZywgaXQgbG9vayBsaWtlIGRlYnVnIGZp
bGVzeXN0ZW0gd2FzIG5vdCBiZWluZyBnZW5lcmF0ZWQgZ2l2ZW4gdGhlIGNvbmZpZ3VyYXRpb24g
KElNQUdFX0dFTl9ERUJVR0ZTID0gIjEiKS4gVGhpcyB3YXMgZXhhY3RseSB0aGUgdHlwZSBvZiBl
cnJvciB0aGF0IHRoaXMgYXV0b21hdGVkIHRlc3Qgd2FzIGRlc2lnbmVkIHRvIGNhdGNoLiANCg0K
SSBzaGFsbCBkZWJ1ZyB0aGlzIG9uIG1hc3RlciBhbmQgcG90ZW50aWFsbHkgbWFzdGVyLW5leHQu
IA0KDQpUaGFua3MsDQpZZW9oIEVlIFBlbmcgDQoNCjIwMjAtMDQtMjMgMDM6NTc6MzMsNDkxIC0g
b2Utc2VsZnRlc3QgLSBJTkZPIC0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KMjAyMC0wNC0yMyAwMzo1NzozMyw0
OTEgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBGQUlMOiBpbWFnZWZlYXR1cmVzLkltYWdlRmVhdHVy
ZXMudGVzdF9pbWFnZV9nZW5fZGVidWdmcyAoc3VidW5pdC5SZW1vdGVkVGVzdENhc2UpDQoyMDIw
LTA0LTIzIDAzOjU3OjMzLDQ5MSAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
CjIwMjAtMDQtMjMgMDM6NTc6MzMsNDkxIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gdGVzdHRvb2xz
LnRlc3RyZXN1bHQucmVhbC5fU3RyaW5nRXhjZXB0aW9uOiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50
IGNhbGwgbGFzdCk6DQogIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvb2Utc2Vs
ZnRlc3QtZmVkb3JhL2J1aWxkL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvaW1hZ2VmZWF0
dXJlcy5weSIsIGxpbmUgMjg4LCBpbiB0ZXN0X2ltYWdlX2dlbl9kZWJ1Z2ZzDQogICAgc2VsZi5h
c3NlcnROb3RFcXVhbChsZW4oZGVidWdfZmlsZXMpLCAwLCAnZGVidWcgZmlsZXN5c3RlbSBub3Qg
Z2VuZXJhdGVkJykNCiAgRmlsZSAiL3Vzci9saWI2NC9weXRob24zLjcvdW5pdHRlc3QvY2FzZS5w
eSIsIGxpbmUgODYxLCBpbiBhc3NlcnROb3RFcXVhbA0KICAgIHJhaXNlIHNlbGYuZmFpbHVyZUV4
Y2VwdGlvbihtc2cpDQpBc3NlcnRpb25FcnJvcjogMCA9PSAwIDogZGVidWcgZmlsZXN5c3RlbSBu
b3QgZ2VuZXJhdGVkDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBUaHVy
c2RheSwgQXByaWwgMjMsIDIwMjAgNDo1MyBQTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcu
eWVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpDYzogSHVtYmVydG8gSWJhcnJhIDxodW1iZXJ0by5pYmFycmEubG9wZXpAaW50ZWwuY29tPg0K
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHNlbGZ0ZXN0L2ltYWdlZmVhdHVyZXM6IEVu
YWJsZSBzYW5pdHkgdGVzdCBmb3IgSU1BR0VfR0VOX0RFQlVHRlMNCg0KT24gV2VkLCAyMDIwLTA0
LTAxIGF0IDEzOjM3ICswODAwLCBZZW9oIEVlIFBlbmcgd3JvdGU6DQo+IEFkZCBuZXcgdGVzdGNh
c2UgdG8gY2hlY2sgSU1BR0VfR0VOX0RFQlVHRlMuIFRlc3QgbWFrZXMgc3VyZSB0aGF0IA0KPiBk
ZWJ1ZyBmaWxlc3lzdGVtIGlzIGNyZWF0ZWQgYWNjb3JkaW5nbHkuIFRlc3QgYWxzbyBjaGVjayBm
b3IgZGVidWcgDQo+IHN5bWJvbHMgZm9yIHNvbWUgcGFja2FnZXMgYXMgc3VnZ2VzdGVkIGJ5IFJv
c3MgQnVydG9uLg0KPiANCj4gW1lPQ1RPICMxMDkwNl0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1
bWJlcnRvIEliYXJyYSA8aHVtYmVydG8uaWJhcnJhLmxvcGV6QGludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogWWVvaCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPg0KPiAtLS0NCj4g
IG1ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvaW1hZ2VmZWF0dXJlcy5weSB8IDMzIA0KPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9p
bWFnZWZlYXR1cmVzLnB5IA0KPiBiL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvaW1hZ2Vm
ZWF0dXJlcy5weQ0KPiBpbmRleCA1YzUxOWFjLi45YWQ1YzE3IDEwMDY0NA0KPiAtLS0gYS9tZXRh
L2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2ltYWdlZmVhdHVyZXMucHkNCj4gKysrIGIvbWV0YS9s
aWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9pbWFnZWZlYXR1cmVzLnB5DQo+IEBAIC0yNjIsMyArMjYy
LDM2IEBAIFBOQkxBQ0tMSVNUW2J1c3lib3hdID0gIkRvbid0IGJ1aWxkIHRoaXMiDQo+ICAgICAg
ICAgIHNlbGYud3JpdGVfY29uZmlnKGNvbmZpZykNCj4gIA0KPiAgICAgICAgICBiaXRiYWtlKCIt
LWdyYXBodml6IGNvcmUtaW1hZ2Utc2F0byIpDQo+ICsNCj4gKyAgICBkZWYgdGVzdF9pbWFnZV9n
ZW5fZGVidWdmcyhzZWxmKToNCj4gKyAgICAgICAgIiIiDQo+ICsgICAgICAgIFN1bW1hcnk6ICAg
ICBDaGVjayBkZWJ1Z2ZzIGdlbmVyYXRpb24NCj4gKyAgICAgICAgRXhwZWN0ZWQ6ICAgIDEuIGNv
cmUtaW1hZ2UtbWluaW1hbCBjYW4gYmUgYnVpbGQgd2l0aCBJTUFHRV9HRU5fREVCVUdGUyB2YXJp
YWJsZSBzZXQNCj4gKyAgICAgICAgICAgICAgICAgICAgIDIuIGRlYnVnIGZpbGVzeXN0ZW0gaXMg
Y3JlYXRlZCB3aGVuIHZhcmlhYmxlIHNldA0KPiArICAgICAgICAgICAgICAgICAgICAgMy4gZGVi
dWcgc3ltYm9scyBhdmFpbGFibGUNCj4gKyAgICAgICAgUHJvZHVjdDogICAgIG9lLWNvcmUNCj4g
KyAgICAgICAgQXV0aG9yOiAgICAgIEh1bWJlcnRvIEliYXJyYSA8aHVtYmVydG8uaWJhcnJhLmxv
cGV6QGludGVsLmNvbT4NCj4gKyAgICAgICAgICAgICAgICAgICAgIFllb2ggRWUgUGVuZyA8ZWUu
cGVuZy55ZW9oQGludGVsLmNvbT4NCj4gKyAgICAgICAgIiIiDQo+ICsgICAgICAgIGltcG9ydCBn
bG9iDQo+ICsgICAgICAgIGltYWdlX25hbWUgPSAnY29yZS1pbWFnZS1taW5pbWFsJw0KPiArICAg
ICAgICBkZXBsb3lfZGlyX2ltYWdlID0gZ2V0X2JiX3ZhcignREVQTE9ZX0RJUl9JTUFHRScpDQo+
ICsNCj4gKyAgICAgICAgZmVhdHVyZXMgPSAnSU1BR0VfR0VOX0RFQlVHRlMgPSAiMSJcbicNCj4g
KyAgICAgICAgZmVhdHVyZXMgKz0gJ0lNQUdFX0ZTVFlQRVNfREVCVUdGUyA9ICJ0YXIuYnoyIlxu
Jw0KPiArICAgICAgICBmZWF0dXJlcyArPSAnTUFDSElORSA9ICJnZW5lcmljeDg2LTY0IlxuJw0K
PiArICAgICAgICBzZWxmLndyaXRlX2NvbmZpZyhmZWF0dXJlcykNCj4gKw0KPiArICAgICAgICBi
aXRiYWtlKGltYWdlX25hbWUpDQo+ICsgICAgICAgIGRiZ190YXJfZmlsZSA9IG9zLnBhdGguam9p
bihkZXBsb3lfZGlyX2ltYWdlLCAiKi1kYmcucm9vdGZzLnRhci5iejIiKQ0KPiArICAgICAgICBk
ZWJ1Z19maWxlcyA9IGdsb2IuZ2xvYihkYmdfdGFyX2ZpbGUpDQo+ICsgICAgICAgIHNlbGYuYXNz
ZXJ0Tm90RXF1YWwobGVuKGRlYnVnX2ZpbGVzKSwgMCwgJ2RlYnVnIGZpbGVzeXN0ZW0gbm90IGdl
bmVyYXRlZCcpDQo+ICsgICAgICAgIHJlc3VsdCA9IHJ1bkNtZCgnY2QgJXM7IHRhciB4dmYgJXMn
ICUgKGRlcGxveV9kaXJfaW1hZ2UsIGRiZ190YXJfZmlsZSkpDQo+ICsgICAgICAgIHNlbGYuYXNz
ZXJ0RXF1YWwocmVzdWx0LnN0YXR1cywgMCwgbXNnPSdGYWlsZWQgdG8gZXh0cmFjdCAlczogJXMn
ICUgKGRiZ190YXJfZmlsZSwgcmVzdWx0Lm91dHB1dCkpDQo+ICsgICAgICAgIHJlc3VsdCA9IHJ1
bkNtZCgnZmluZCAlcyAtbmFtZSAlcycgJSAoZGVwbG95X2Rpcl9pbWFnZSwgInVkZXZhZG0iKSkN
Cj4gKyAgICAgICAgc2VsZi5hc3NlcnRUcnVlKCJ1ZGV2YWRtIiBpbiByZXN1bHQub3V0cHV0LCBt
c2c9J0ZhaWxlZCB0byBmaW5kIHVkZXZhZG06ICVzJyAlIHJlc3VsdC5vdXRwdXQpDQo+ICsgICAg
ICAgIGRiZ19zeW1ib2xzX3RhcmdldHMgPSByZXN1bHQub3V0cHV0LnNwbGl0bGluZXMoKQ0KPiAr
ICAgICAgICBzZWxmLmFzc2VydFRydWUoZGJnX3N5bWJvbHNfdGFyZ2V0cywgbXNnPSdGYWlsZWQg
dG8gc3BsaXQgdWRldmFkbTogJXMnICUgZGJnX3N5bWJvbHNfdGFyZ2V0cykNCj4gKyAgICAgICAg
Zm9yIHQgaW4gZGJnX3N5bWJvbHNfdGFyZ2V0czoNCj4gKyAgICAgICAgICAgIHJlc3VsdCA9IHJ1
bkNtZCgnb2JqZHVtcCAtLXN5bXMgJXMgfCBncmVwIGRlYnVnJyAlIHQpDQo+ICsgICAgICAgICAg
ICBzZWxmLmFzc2VydFRydWUoImRlYnVnIiBpbiByZXN1bHQub3V0cHV0LCBtc2c9J0ZhaWxlZCB0
byANCj4gKyBmaW5kIGRlYnVnIHN5bWJvbDogJXMnICUgcmVzdWx0Lm91dHB1dCkNCg0KVGhlIHRl
c3QgZmFpbGVkIG9uIHRoZSBhdXRvYnVpbGRlcjoNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy83OS9idWlsZHMvODU4DQpodHRwczovL2F1
dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzgwL2J1aWxkcy84
NTUNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRl
cnMvODYvYnVpbGRzLzg2MQ0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5
cGhvb24vIy9idWlsZGVycy84Ny9idWlsZHMvODQ5DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoN
Cg==
