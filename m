Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.31163.1607928020731611626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=Ms5krTeD;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: fEDPCPSQw/3DATE62s63j18tAcByvCH+a+Y1huUFAsH43y4aFxItB1Pwl4L0X0o3QP9DdkUp77
 rV+gvmj2Hnxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="171154334"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="171154334"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 22:40:19 -0800
IronPort-SDR: SEGG/n8ltrGh0n5XJGg6cZbAFoA/H0H8c+ANS3dLWKf9lvq8NFPMUU9h8EG91hUsAgq+Q0pczQ
 XR0XpnbGah/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="351131515"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2020 22:40:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 22:40:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 13 Dec 2020 22:40:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 13 Dec 2020 22:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaMrn3WeyVvbixWNLKLRStCG8MWwUSCuxT/QYYskEi343a3SOyWWTPFtLBy+ltQzB4E/vRoxh/V33CGGkp2kvOsnMZYmhWbaz/R8O0uCyV83eHncfmdJV20vuuoB4BszuzwkraJ0xGxp4SaII9W1k2dPxrCG229Ob3JigVbOQsLHvE8JHHa4FnbZLlfd+BerRYAc1jYTzbOuu7J5EdFd1Qv8NsuraTXrIkUQ9L0AuWogEhbLDo8iv9oSHYorcX/Zg3NlM7dmG9EvUcLG2VyBE4ioeECr9660r3UK6OnGmc35thm2/GK8B8x9ICeVcQeptknrPquYyvr8xZ+G5nlFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3qXnO0VR925CThcgtshGRQcIvdFMH6QhHJq0j2prIg=;
 b=N6TDqjrkaa0kloyE4XeYzq9cIcJH70h86id8/6n/PZo+zQnpYqTR4TJIMruFbtf2QeNjaZM5QiouJ2Y+vyPIV8IakXRKwSf0yVS6UGHK0uj8/pIqYvziij5OqYNxsGx9poqu/MTOZmjQ7AP6r3R2ZzBqYfNtCEuY4z5A9HtAiRaw/z4SGXe8AOtgGbq6w+UFwcgzC56iFqywZeebKP9hOUk39pWcxJMA7pD/m6OI7GaY0J6mT5H5R//5dwnuZ4sJVPR1MIy/j/SrdWVhub+KFZOj6qLi4HyeSI4tfRfk5+xWHTrb1K15FvRKOua3rNXRoWz3TSP6BzvvqEzFp80/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3qXnO0VR925CThcgtshGRQcIvdFMH6QhHJq0j2prIg=;
 b=Ms5krTeD4BhJo8l2ESFfrXj53E6upLsL/cQaCdW1OfxgJ9rJq9VFu8wRZnIZ1yyG5ZAR15MVgzFsJIlHiaRHnOmcGITlAg40LGhoUVkxxl9+vJ9jV3xdzhQ+1BBM+uOsc20zcstA9vhWvK1Zfy0pw292iS6GC5a/74XMeolmumM=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.15; Mon, 14 Dec 2020 06:40:15 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::1091:a42d:eb3b:aed9]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::1091:a42d:eb3b:aed9%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 06:40:15 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][gatesgarth] go: 1.15.2 -> 1.15.6
Thread-Topic: [OE-core] [PATCH][gatesgarth] go: 1.15.2 -> 1.15.6
Thread-Index: AQHW0bvfr36q5UO76EejEsOGUS0rxan1ddKAgACuY5A=
Date: Mon, 14 Dec 2020 06:40:15 +0000
Message-ID: <DM5PR11MB1993FEC531F04602C090C309DEC70@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <1607910781-88071-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
 <057b4601a8f05a8360624234529920945584ea93.camel@intel.com>
In-Reply-To: <057b4601a8f05a8360624234529920945584ea93.camel@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [175.140.125.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5feba841-2a4e-486e-40c1-08d89ffb1d7c
x-ms-traffictypediagnostic: DM5PR11MB1244:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB124450AEAC09E0181E16257CDEC70@DM5PR11MB1244.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DUKMxQSjnFq9Cp122MMKhY4hajyKbSZGBvoNCEioJk3nTuHWI6/o/9cJKCNy8yLr3ajGfc6y8pKkBMRRJwp5xQPagNMhCEHxqPHfrMmuCKrHh3sAxIC/GbeqEOX62LX66nX1NOIxnrXCmshXtO+ztqCepWBlVtglkEuztE7arwa6Hb7szEgYprYoKVqb/Wda+30cboS8WYIODoO7SN613F91ZeKrJh11XoKuR8TL662Enj/DEfMWjt7I96a+1E6CpqtO/rZHKWmlZOxct2bjcWgR7Iz7GsO29/vhYn2ju1jWB8ALBQVr05itNCo401Y+iIL6Cde9VR126WkbxQ0um13Fo507IVBbrtVTiDLVZADHbF7hjEXFC2bOIKGOsN2YZpxgj1Dt3waR3DD8Nz/hiC5N9Gurh8DkrcHulwJkR2Ubz2jFvOau0zZJA2Awb1MNxYssYW5449xNbh3vuWUv9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(83080400002)(66946007)(76116006)(66556008)(9686003)(26005)(55236004)(55016002)(4001150100001)(66446008)(186003)(110136005)(53546011)(7696005)(71200400001)(83380400001)(966005)(2906002)(8676002)(64756008)(508600001)(66476007)(6506007)(86362001)(33656002)(52536014)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZzdWL1pJcFlCOXg2QlRsdVFHeEwvb1V3Zk5RWnVqbm5jblErL3RQc1k3MFVQ?=
 =?utf-8?B?emk0eVNueGhWQzJtVUtwWkxjVUN1Q28yK1gxNDNxZDZFSUR2YkFVN1VrVXla?=
 =?utf-8?B?ZkRsdC82dDhvOWJPQlRwN2RJdldoV0lJRnhYRkVTeFcxME1DazFzUTNHQkhm?=
 =?utf-8?B?alQ0VU9McXZSZWg5blNGQmo2MlZ5bkhtci82T1h1aDFKOTdKeGxOVU9oZkVR?=
 =?utf-8?B?VkxTU2dIcW5nOFd3aGE2Ym9NZWdveVlMY3BhOURBbTVyUG1nS05mcjMzYXBh?=
 =?utf-8?B?MEl2T3hraDUxVlhtLzdVSmhhdFFPV0ZsbEVGRFZ0L0hmWjRWNWprZ1hqcThX?=
 =?utf-8?B?NDVXbmxZVWtZblVOYjA5MW82bGQzK0dlL012dlF1WmgzUDk5Nzd5UjBjYXlu?=
 =?utf-8?B?UFRiU0xscGV3WVpOZ3YrbndhMkIrWVp0Z0ttbHdHK3VDWHlhZTNMUm9Ha3p6?=
 =?utf-8?B?MVhEcHd3ck5yb2xLVmRBTERKWjRTMVB6b2JMczR0ZU5xSGhCWnptWGl4cW5D?=
 =?utf-8?B?Z2JLM0VoaHFxTHZiY1J6Wnh0ZnFYM0hnaG9GN00xc3hpSlVTUlFlU3FnNEUv?=
 =?utf-8?B?dEpaenlrOWtuNTlNNTdBZEtqSUFzeFJHMTRnY2ZOS1dZd05BQkRUd1p0NmNR?=
 =?utf-8?B?RzU2VWcwVHR3dTdoNHNOZnJEZ1daWG5XN0V2VjhyenZHREZTMjQxRjNQVmNK?=
 =?utf-8?B?MHA3a2o3aFVkN1ZXSmloTkJmaWhWajBITkVvQmo5Wkd5WWRnWGVUQXNTNzE0?=
 =?utf-8?B?UHhKcHh1SkVvMG9mdVk0aGdkWUNBSjJmZEl1VGl3ZkUwY1BIc3N6YU1pb2Iz?=
 =?utf-8?B?SGxBR21sUGJFdE9TQlJSaEN3KzV1KzFDODViUGRXcFA1NHpGbTBYM0dyQTdn?=
 =?utf-8?B?WW1QVlpyMjQxdGhIbVdCdmhJT3ZrK0FWQ0tZQ3E4eGNrVG1IeDJ4aVhsbEMx?=
 =?utf-8?B?M29oVFlZTVdQaGp4ZGJlNUlrdjg1aGZQR1pHQ3NGcEV3aEd4MkRQOWU3OWxt?=
 =?utf-8?B?ZzdNYU1WalJWOXdiMWhEblV5dTdPakllZXh3L2sxSDhiZlQ3ak9WalBldEFn?=
 =?utf-8?B?SDhlbURhRGJJMGl5WTJzNitubVVEZDA5cVJWbzhhWFdOQ2plbmZDOVdYbE1D?=
 =?utf-8?B?UnZYaUtNUXcwN3RjUmpjTlFtVFRSWGozb0k2aFc0eGl0elZiSjRlNThINVI0?=
 =?utf-8?B?MjJBUVpDRDdrc21XdVN5aUdEeUNWNkJaUHZFWDVWczVrSlJrcGd3WllnVmhV?=
 =?utf-8?B?cTdHQ3RFZERrd2pNT1FHL2ZtK3c3L1EybVpBTXhvOWlsK0IvRU1VcXJWSWFZ?=
 =?utf-8?Q?zwP/ki1NjEKtk=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feba841-2a4e-486e-40c1-08d89ffb1d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 06:40:15.2595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6iItq7sgJKy6fd950AHnxLEEQ3RJ0D7g8CFV4iPwHA2J+/McYvlPjLsCEDFxCwz24L/BaoLBUvlt3OmZhhRFrYA5NQsur++yQafTtPEAfajNVOZYhe8gfnOgclu5sQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1244
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW51aiwNCg0KRHVseSBub3RlZC4gUGxlYXNlIGRvIHByb2NlZWQgYXMgbmVlZGVkLg0KDQpU
aGFuayB5b3UgJiBLaW5kIHJlZ2FyZHMsDQpLaGFpcnVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGludGVsLmNvbT4gDQpTZW50
OiBNb25kYXksIERlY2VtYmVyIDE0LCAyMDIwIDEyOjE1IFBNDQpUbzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgSmFtYWx1ZGRpbiwgS2hhaXJ1bCBSb2hhaXp6YXQg
PGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdW2dhdGVzZ2FydGhdIGdvOiAxLjE1LjIgLT4gMS4xNS42DQoNCkhpIEto
YWlydWwNCg0KT24gTW9uLCAyMDIwLTEyLTE0IGF0IDA5OjUzICswODAwLCBKYW1hbHVkZGluLCBL
aGFpcnVsIFJvaGFpenphdCB3cm90ZToNCj4gRnJvbTogS2hhaXJ1bCBSb2hhaXp6YXQgSmFtYWx1
ZGRpbiA8DQo+IGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5AaW50ZWwuY29tPg0KPiANCj4g
dXBkYXRlIG1pbm9yIHZlcnNpb24gdG8gMS4xNS42DQo+IA0KPiBnby0xLjE1LjMgaW5jbHVkZXMg
Zml4ZXMgdG8gY2dvLCB0aGUgY29tcGlsZXIsIHJ1bnRpbWUsIHRoZSBnbyANCj4gY29tbWFuZCwg
YW5kIHRoZSBieXRlcywgcGx1Z2luLCBhbmQgdGVzdGluZyBwYWNrYWdlcy4NCj4gZ28tMS4xNS40
IGluY2x1ZGVzIGZpeGVzIHRvIGNnbywgdGhlIGNvbXBpbGVyLCBsaW5rZXIsIHJ1bnRpbWUsIGFu
ZCANCj4gdGhlIGNvbXByZXNzL2ZsYXRlLCBuZXQvaHR0cCwgcmVmbGVjdCwgYW5kIHRpbWUgcGFj
a2FnZXMuDQo+IGdvLTEuMTUuNSBpbmNsdWRlcyBzZWN1cml0eSBmaXhlcyB0byB0aGUgZ28gY29t
bWFuZCBhbmQgdGhlIG1hdGgvYmlnIA0KPiBwYWNrYWdlLg0KDQptYXN0ZXIgaGFzIDEuMTUuNSBz
byBJIHdvdWxkIGxpa2UgdG8gY2hlcnJ5LXBpY2sgdGhvc2UgdXBkYXRlcyBmcm9tIG1hc3RlciBp
bnN0ZWFkLg0KDQo+IGdvLTEuMTUuNiBpbmNsdWRlcyBmaXhlcyB0byB0aGUgY29tcGlsZXIsIGxp
bmtlciwgcnVudGltZSwgdGhlIGdvIA0KPiBjb21tYW5kLCBhbmQgdGhlIGlvIHBhY2thZ2UuDQoN
Ckkgd2lsbCBjaGVycnktcGljayAxLjE1LjYgdXBkYXRlIHRoYXQgeW91J3ZlIHNlbnQgZm9yIG1h
c3RlciBvbmNlIHRoYXQgaXMgbWVyZ2VkIHRoZXJlLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiAN
Cj4gUmVmZXJlbmNlczoNCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIw
MjAtMjgzNjINCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjAtMjgz
NjYNCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjAtMjgzNjcNCj4g
aHR0cHM6Ly9nb2xhbmcub3JnL2RvYy9kZXZlbC9yZWxlYXNlLmh0bWwjZ28xLjE1Lm1pbm9yDQo+
IA0KPiBVcGRhdGVzIGluY2x1ZGVzIGZpeCBmb3I6DQo+IENWRS0yMDIwLTI4MzYyDQo+IENWRS0y
MDIwLTI4MzY2DQo+IENWRS0yMDIwLTI4MzY3DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLaGFpcnVs
IFJvaGFpenphdCBKYW1hbHVkZGluIDwgDQo+IGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5A
aW50ZWwuY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE1Lmlu
YyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4x
NS5pbmMgYi9tZXRhL3JlY2lwZXMtIA0KPiBkZXZ0b29scy9nby9nby0xLjE1LmluYyBpbmRleCA5
N2Q3NDhiLi5jNWUzZmUwIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28v
Z28tMS4xNS5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTUuaW5j
DQo+IEBAIC0xLDcgKzEsNyBAQA0KPiAgcmVxdWlyZSBnby1jb21tb24uaW5jDQo+ICANCj4gIEdP
X0JBU0VWRVJTSU9OID0gIjEuMTUiDQo+IC1HT19NSU5PUiA9ICIuMiINCj4gK0dPX01JTk9SID0g
Ii42Ig0KPiAgUFYgLj0gIiR7R09fTUlOT1J9Ig0KPiAgRklMRVNFWFRSQVBBVEhTX3ByZXBlbmQg
Oj0gIiR7RklMRV9ESVJOQU1FfS9nby0ke0dPX0JBU0VWRVJTSU9OfToiDQo+ICANCj4gQEAgLTE3
LDQgKzE3LDQgQEAgU1JDX1VSSSArPSAiXA0KPiAgICAgIGZpbGU6Ly8wMDA3LWNtZC1nby1tYWtl
LUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoIFwNCj4gICAgICBmaWxlOi8vMDAwOC11
c2UtR09CVUlMRE1PREUtdG8tc2V0LWJ1aWxkbW9kZS5wYXRjaCBcICAiDQo+IC1TUkNfVVJJW21h
aW4uc2hhMjU2c3VtXSA9DQo+ICIyOGJmOWQwYmNkZTI1MTAxMWNhYWUyMzBhNGEwNWQ5MTdiMTcy
ZWEyMDNmMmE2MmYyYzJmOTUzMzU4OWQ0YjRkIg0KPiArU1JDX1VSSVttYWluLnNoYTI1NnN1bV0g
PQ0KPiAiODkwYmJhNzNjNWUyYjE5ZmZiMTE4MGUzODVlYTIyNTA1OWViMDA4ZWI5MWI2OTQ4NzVk
ZDg2ZWE0ODY3NTgxNyINCj4gDQo+IA0KPiANCg0KDQo=
