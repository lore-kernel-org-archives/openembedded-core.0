Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.6395.1588322207302713222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 01:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=oCnCYYuD;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: AcZas/wOjwLmlL0C9g/FuznsdYVMMUZ3vmWD8IkL6nprf7evSWz9qW1qYOE8a9ufaTm4+T6Um/
 vF/bq05NpMbw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 01:36:46 -0700
IronPort-SDR: /QMJKDO220oIYSH20fHFa1AZnfQRNcCC50kXWdhvE4jaXaxn6M5M5aahzPe3oAYJTEse8UWWC4
 Pl+rJFcGCphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; 
   d="scan'208";a="459860237"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2020 01:36:45 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 1 May 2020 01:36:44 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 1 May 2020 01:36:44 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 1 May 2020 01:36:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 1 May 2020 01:36:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBimfS0Zc9DJXBktgoW+ihkvQImJmU7qI72ljdMxtNTfMJWoMNJtqcnAuUUtWEp1hQQa3DR3NOimZhEUd1dboJmhvxHVoB2EO19kLM6Nv5l3CgqgexmXMTrPJIHajJkXhHdD8lEq9IixYLHaoDyuuVCGxogzAw5xY/EzpWy5rXat8HP8EYnfCSZBIlxBXaL15ZdlREldao5i11QvZPemE4+nqh5EOrgC7G+PzP+7X0Leqektoa6bjzWwwuyweWIIlZB6WkFKtiFlohpl+kzttvxiJZOBFGBo4JfBKLPbPsbgTCml4LzDBddop2F/PI+rLE1t2IYuI0tXKp6GvCDoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfuYYoIqSSmSjIbzCyaGiCLC7VouNug34awUqrlZFcI=;
 b=NNCKsSfRSGm0l0FlFsXtcWBPoUwxMzAqTtriIkKcGJ9wVyAofCKaWbeo47C++RZ5lFt3LEEjbAEthqoIp2NME4VhRTUPD87WeB4McMmqxhH5zLNkD5Qtv7/7t6rmRvfkwFNo63O4udSt1NAIMlonPLYrCpK5TlShwQj056oGKXrcQ5Ov8Q4yUfMZJLak1yCzD2AaqPcTmWGPMSFTtft/lR+4h5GzqXgYPdboXw/jFXBNjRRAiEToy4bqLWp1qlSEdsxv3pp5yLe/jYuvIsfmdi6OlmHaAnAKhXG1cQoF6g2MQ5iWW6a1mG1Krwu7u1ddHK6WFvRkZg05gRMmzQ8NhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfuYYoIqSSmSjIbzCyaGiCLC7VouNug34awUqrlZFcI=;
 b=oCnCYYuDd2RimCL8l8+0Q1soPmErJ8KzwUWXwVxFVc9WxGvCNcQwBvBFJoN+HRJ1rYWULod8vXxuu4/h4C8gcT77wxWFrom0VRcuPSRXP45lR7HEeVC6PD/8Z0eg6Emtekeiw5tx6vT78StPGDLHIyr9jWe4uPRDMyFEhxfUZQM=
Received: from BL0PR11MB3251.namprd11.prod.outlook.com (2603:10b6:208:64::23)
 by BL0PR11MB3217.namprd11.prod.outlook.com (2603:10b6:208:63::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 1 May
 2020 08:36:43 +0000
Received: from BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c]) by BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c%6]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 08:36:43 +0000
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Thread-Topic: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for
 IMAGE_GEN_DEBUGFS
Thread-Index: AQHWGUytfiUu1qpIlkeNbvSmc/98PKiS88tw
Date: Fri, 1 May 2020 08:36:43 +0000
Message-ID: <BL0PR11MB3251AB491A48E6A194DB0C4CC8AB0@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
 <38bd6d9fd2144ed8f5bd90da57c6dbd686d3c684.camel@linuxfoundation.org>
In-Reply-To: <38bd6d9fd2144ed8f5bd90da57c6dbd686d3c684.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [192.198.147.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac071624-6a28-4c74-6dcf-08d7edaac730
x-ms-traffictypediagnostic: BL0PR11MB3217:
x-microsoft-antispam-prvs: <BL0PR11MB32172559BD3EA7A960619E82C8AB0@BL0PR11MB3217.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0390DB4BDA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3251.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(39860400002)(396003)(376002)(366004)(5660300002)(9686003)(8936002)(8676002)(7696005)(2906002)(55016002)(71200400001)(86362001)(76116006)(966005)(316002)(6506007)(66446008)(26005)(66946007)(53546011)(64756008)(186003)(33656002)(66556008)(66476007)(110136005)(478600001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZaDKAux+HAbds/O3fW/ysKf3PAMWxQTT91zq3nLyn4qVdigSxwv/9bwRfP3L9S07wDHJcX8yK8yyFkOelLX+oHHQ5EkhBkTEBbI39at7F7A+J86uMb6oDrSvEF89Hm9EG/aDFcHULp6FcXB0Ws5Ali5FeZklYFY/8eYBapwnBW6tMy3cJ6cyoV5FDFBqTU6PISsZmBuimVRiFBTgyhfXbkAMel/eAK5eaftjes8f/sGqTDxWXGlMIH5XFcR7BdcD0OaRnNI7ekkjj9Ehg+lpw0bolmOzu0ocFZfusWaFBNjid/RZhVOAuFZ1JxiTy71k2ixyBVHVHAUschJdX5J5s6La+AKY2kPazjk01T3OB2rVBM4boGzjCgmr1cRTwSG/s4MyjHPp9YdmYfqlgVIOoVQXHH8nwXHb8PNiOIbdJKpprwNuH2nNoDHtQt6F5Tva/GC/+jP+znVt5jSnMhD5LpmAvrR2k24Js4g8S1m4fzw7HBQh5NsZaNHLvl2VMlU48x2O9CSlzWXE0jLax5hFcQ==
x-ms-exchange-antispam-messagedata: X1nL/KqJXMAbFMjKdVyA/eSyGbT2ykt7H/GwnguaSwGeY8hCrFMsnp7t4/l5SBRDRTZV64MZljpYkGDz98SaUS7Fc9w2eweIkiAvPK+nczX07kH0kFzR2UqJ+omsmz9je22ftj4wfYe/+h4NK6nBwUvwo9K1iYs464IuZJKLVJH9ocKIpmcjZD4yHk+d0byu5QppfzGSflOpBgETlFKyBwe3A+vqlUtjfW9xg5+EJhobfa49YOLHtOAzidVf/Xb+M4gKnI3W3drWbk9UYrtVs55sGCphDrMJ56QG9zrDvPp3qXLivW/gWBP4N/0qhICbu7uLGKi3DGgfYRfY/Ne0aoJi+12kFgee6QkAEIpziNo+cvH12089qmAWiS4pdnXKl7TMt7GlL7LZmF7knH7xR6vvgMzQxblifekrVynGrIvv9CXygVG9HN56Op2iXYgH1KoTtqzAbcMK4vbUJHhGRd0LDgGmueD346vKcFXF6ig57iDsI0FAYcHSu65eND0snM1G/HhvGt1Spx1DFkXsIzbWqwnVA2EVIgxQvjLp/nE0vFDOVQVlee6eU2x76cEGvpwczZxzKP2mlT1RX93e7gVtQ4DM/eXnfW1S+5QeaybQjgXySOfy30wQeFTc7yWB7zhA6oklVvnB7ls2Bp3azqRDpMgaBE+9KjNLooNBzeNg7UxQxxzXjSNXGy26sNT4OAX4wchC3QHjxNih6EZ2P80u90us8LcGWtmvL60Mw/y58U0M3Q7P+v/X3o/KOxN60TkerqWBcMznF+90PmXDEiW/qjszYVQhtYaHxXw5VV3oGLE0mQzaSzmKADKW6RyH
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac071624-6a28-4c74-6dcf-08d7edaac730
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2020 08:36:43.7827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9fuYHUPPmVeKz1LlNI9/VvVY99VpbOekUcItlTq2PaKOpw1hjN6p381N/0gFBPzjMyING44hU+v5RZp6ez3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3217
Return-Path: ee.peng.yeoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBoYWQgaWRlbnRpZmllZCB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgZmFp
bHVyZSBhbmQgZml4ZWQgaXQuIFRoZSBlYXJsaWVyIHBhdGNoIHdhcyBjYWxsaW5nIHRoZSBnZXRf
YmJfdmFyKCdERVBMT1lfRElSX0lNQUdFJykgYmVmb3JlIHRoZSBzZXR0aW5nIGNvbmZpZ3VyYXRp
b24gYW5kIHRodXMgdXNpbmcgdGhlIHdyb25nIERFUExPWV9ESVIgdG8gY2hlY2sgdGhlIGRlYnVn
IGZpbGVzeXN0ZW0gYmVpbmcgZ2VuZXJhdGVkLiANCg0KSSBoYWQgc3VibWl0dGVkIHYwMiBwYXRj
aC4gDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9t
ZXNzYWdlLzEzNzY5Nw0KDQpCZXN0IHJlZ2FyZHMsDQpZZW9oIEVlIFBlbmcgDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgQXByaWwgMjMsIDIwMjAgNDo1
MyBQTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogSHVtYmVydG8gSWJhcnJhIDxo
dW1iZXJ0by5pYmFycmEubG9wZXpAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0hdIHNlbGZ0ZXN0L2ltYWdlZmVhdHVyZXM6IEVuYWJsZSBzYW5pdHkgdGVzdCBmb3IgSU1B
R0VfR0VOX0RFQlVHRlMNCg0KT24gV2VkLCAyMDIwLTA0LTAxIGF0IDEzOjM3ICswODAwLCBZZW9o
IEVlIFBlbmcgd3JvdGU6DQo+IEFkZCBuZXcgdGVzdGNhc2UgdG8gY2hlY2sgSU1BR0VfR0VOX0RF
QlVHRlMuIFRlc3QgbWFrZXMgc3VyZSB0aGF0IA0KPiBkZWJ1ZyBmaWxlc3lzdGVtIGlzIGNyZWF0
ZWQgYWNjb3JkaW5nbHkuIFRlc3QgYWxzbyBjaGVjayBmb3IgZGVidWcgDQo+IHN5bWJvbHMgZm9y
IHNvbWUgcGFja2FnZXMgYXMgc3VnZ2VzdGVkIGJ5IFJvc3MgQnVydG9uLg0KPiANCj4gW1lPQ1RP
ICMxMDkwNl0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1bWJlcnRvIEliYXJyYSA8aHVtYmVydG8u
aWJhcnJhLmxvcGV6QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWWVvaCBFZSBQZW5nIDxl
ZS5wZW5nLnllb2hAaW50ZWwuY29tPg0KPiAtLS0NCj4gIG1ldGEvbGliL29lcWEvc2VsZnRlc3Qv
Y2FzZXMvaW1hZ2VmZWF0dXJlcy5weSB8IDMzIA0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9pbWFnZWZlYXR1cmVzLnB5IA0KPiBiL21l
dGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvaW1hZ2VmZWF0dXJlcy5weQ0KPiBpbmRleCA1YzUx
OWFjLi45YWQ1YzE3IDEwMDY0NA0KPiAtLS0gYS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2Vz
L2ltYWdlZmVhdHVyZXMucHkNCj4gKysrIGIvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9p
bWFnZWZlYXR1cmVzLnB5DQo+IEBAIC0yNjIsMyArMjYyLDM2IEBAIFBOQkxBQ0tMSVNUW2J1c3li
b3hdID0gIkRvbid0IGJ1aWxkIHRoaXMiDQo+ICAgICAgICAgIHNlbGYud3JpdGVfY29uZmlnKGNv
bmZpZykNCj4gIA0KPiAgICAgICAgICBiaXRiYWtlKCItLWdyYXBodml6IGNvcmUtaW1hZ2Utc2F0
byIpDQo+ICsNCj4gKyAgICBkZWYgdGVzdF9pbWFnZV9nZW5fZGVidWdmcyhzZWxmKToNCj4gKyAg
ICAgICAgIiIiDQo+ICsgICAgICAgIFN1bW1hcnk6ICAgICBDaGVjayBkZWJ1Z2ZzIGdlbmVyYXRp
b24NCj4gKyAgICAgICAgRXhwZWN0ZWQ6ICAgIDEuIGNvcmUtaW1hZ2UtbWluaW1hbCBjYW4gYmUg
YnVpbGQgd2l0aCBJTUFHRV9HRU5fREVCVUdGUyB2YXJpYWJsZSBzZXQNCj4gKyAgICAgICAgICAg
ICAgICAgICAgIDIuIGRlYnVnIGZpbGVzeXN0ZW0gaXMgY3JlYXRlZCB3aGVuIHZhcmlhYmxlIHNl
dA0KPiArICAgICAgICAgICAgICAgICAgICAgMy4gZGVidWcgc3ltYm9scyBhdmFpbGFibGUNCj4g
KyAgICAgICAgUHJvZHVjdDogICAgIG9lLWNvcmUNCj4gKyAgICAgICAgQXV0aG9yOiAgICAgIEh1
bWJlcnRvIEliYXJyYSA8aHVtYmVydG8uaWJhcnJhLmxvcGV6QGludGVsLmNvbT4NCj4gKyAgICAg
ICAgICAgICAgICAgICAgIFllb2ggRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT4NCj4g
KyAgICAgICAgIiIiDQo+ICsgICAgICAgIGltcG9ydCBnbG9iDQo+ICsgICAgICAgIGltYWdlX25h
bWUgPSAnY29yZS1pbWFnZS1taW5pbWFsJw0KPiArICAgICAgICBkZXBsb3lfZGlyX2ltYWdlID0g
Z2V0X2JiX3ZhcignREVQTE9ZX0RJUl9JTUFHRScpDQo+ICsNCj4gKyAgICAgICAgZmVhdHVyZXMg
PSAnSU1BR0VfR0VOX0RFQlVHRlMgPSAiMSJcbicNCj4gKyAgICAgICAgZmVhdHVyZXMgKz0gJ0lN
QUdFX0ZTVFlQRVNfREVCVUdGUyA9ICJ0YXIuYnoyIlxuJw0KPiArICAgICAgICBmZWF0dXJlcyAr
PSAnTUFDSElORSA9ICJnZW5lcmljeDg2LTY0IlxuJw0KPiArICAgICAgICBzZWxmLndyaXRlX2Nv
bmZpZyhmZWF0dXJlcykNCj4gKw0KPiArICAgICAgICBiaXRiYWtlKGltYWdlX25hbWUpDQo+ICsg
ICAgICAgIGRiZ190YXJfZmlsZSA9IG9zLnBhdGguam9pbihkZXBsb3lfZGlyX2ltYWdlLCAiKi1k
Ymcucm9vdGZzLnRhci5iejIiKQ0KPiArICAgICAgICBkZWJ1Z19maWxlcyA9IGdsb2IuZ2xvYihk
YmdfdGFyX2ZpbGUpDQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0Tm90RXF1YWwobGVuKGRlYnVnX2Zp
bGVzKSwgMCwgJ2RlYnVnIGZpbGVzeXN0ZW0gbm90IGdlbmVyYXRlZCcpDQo+ICsgICAgICAgIHJl
c3VsdCA9IHJ1bkNtZCgnY2QgJXM7IHRhciB4dmYgJXMnICUgKGRlcGxveV9kaXJfaW1hZ2UsIGRi
Z190YXJfZmlsZSkpDQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwocmVzdWx0LnN0YXR1cywg
MCwgbXNnPSdGYWlsZWQgdG8gZXh0cmFjdCAlczogJXMnICUgKGRiZ190YXJfZmlsZSwgcmVzdWx0
Lm91dHB1dCkpDQo+ICsgICAgICAgIHJlc3VsdCA9IHJ1bkNtZCgnZmluZCAlcyAtbmFtZSAlcycg
JSAoZGVwbG95X2Rpcl9pbWFnZSwgInVkZXZhZG0iKSkNCj4gKyAgICAgICAgc2VsZi5hc3NlcnRU
cnVlKCJ1ZGV2YWRtIiBpbiByZXN1bHQub3V0cHV0LCBtc2c9J0ZhaWxlZCB0byBmaW5kIHVkZXZh
ZG06ICVzJyAlIHJlc3VsdC5vdXRwdXQpDQo+ICsgICAgICAgIGRiZ19zeW1ib2xzX3RhcmdldHMg
PSByZXN1bHQub3V0cHV0LnNwbGl0bGluZXMoKQ0KPiArICAgICAgICBzZWxmLmFzc2VydFRydWUo
ZGJnX3N5bWJvbHNfdGFyZ2V0cywgbXNnPSdGYWlsZWQgdG8gc3BsaXQgdWRldmFkbTogJXMnICUg
ZGJnX3N5bWJvbHNfdGFyZ2V0cykNCj4gKyAgICAgICAgZm9yIHQgaW4gZGJnX3N5bWJvbHNfdGFy
Z2V0czoNCj4gKyAgICAgICAgICAgIHJlc3VsdCA9IHJ1bkNtZCgnb2JqZHVtcCAtLXN5bXMgJXMg
fCBncmVwIGRlYnVnJyAlIHQpDQo+ICsgICAgICAgICAgICBzZWxmLmFzc2VydFRydWUoImRlYnVn
IiBpbiByZXN1bHQub3V0cHV0LCBtc2c9J0ZhaWxlZCB0byANCj4gKyBmaW5kIGRlYnVnIHN5bWJv
bDogJXMnICUgcmVzdWx0Lm91dHB1dCkNCg0KVGhlIHRlc3QgZmFpbGVkIG9uIHRoZSBhdXRvYnVp
bGRlcjoNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9i
dWlsZGVycy83OS9idWlsZHMvODU4DQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdHlwaG9vbi8jL2J1aWxkZXJzLzgwL2J1aWxkcy84NTUNCmh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODYvYnVpbGRzLzg2MQ0KaHR0cHM6
Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84Ny9idWls
ZHMvODQ5DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoNCg==
