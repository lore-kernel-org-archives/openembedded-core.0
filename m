Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.5132.1632304687464925772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 02:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=qygsmMsO;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="220362051"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="220362051"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 02:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="518523384"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2021 02:58:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 22 Sep 2021 02:58:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 22 Sep 2021 02:58:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 22 Sep 2021 02:58:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 22 Sep 2021 02:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdjP8LP+LTzLJq566dkU/rFnTsVYp6n4GGZJG0JUZbjTqPFiezPgLj1uVN77FncQDfKtOyQTiLBO4TAqKGRTrKg5oSdH7X8tywZe6axXEoEHNi5tHbscIqZAFjGzPqxj6P2ioPqX6lWnLUmw1G8i7kXXJP56VqTrO+Tw5XEu4yKYPeMe8oRdqMoVobDYnEnhWmFA5+z2GGYW7HGSc01oro4fl1cs5zk4S7i+GnOjc6zgCeZ2HmJwatYv9NCYxPuuKd+q/4AOjt5cviNrHWQLGupeHAj3fecDOVX8Pe5hz8yTPBZU9TsCzmoaHjKT9EYKQZ7DbOjfJU6ueiz6wZe4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oMDM3SB+oL4yz/QAsp+/DKEQfJmVqxsD/r9Ji0tBMKo=;
 b=dsfNfp4/+/jNsoqiQkCMbxIVoSMAMmjKcY/oVcovoH7JhszV+D00GljuPUpy3acI+bP2qU8xbE+9t9+HezvurFHQZ2rvUGsIGgkwkiISoyFxuTRO+AcuT6M6q6g0YiMQ+lckJIhCTG4I1iVUb9CV/Y1eb9oGrJV62q5lZPyfpBPOoplL6aLkEXLmbu23RSg51v0vNzAnky6dTuOT30naxWak1MXISWcJrvPmBIRddDBqquHlqmysqdsTC91Ht0IoD3J+TVTNzt0cqR/6X7OlOyN4G8vtymaBOk9SX1BhoLbtRd7qsqjABtbCjrKiJYqfw4aVVVg+aGVQzBA62q+7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMDM3SB+oL4yz/QAsp+/DKEQfJmVqxsD/r9Ji0tBMKo=;
 b=qygsmMsOmufbljJkj7G9Q+L/BBeXeb9TELdgeGWNESdf3EjuWbJhl88J84ysW7MZzK0e78KWrTHMaoKM3GgYYXbj/Exu1QBsX5a4YAftA2oZjB3xTxQ9Q77S/DSED8th2aBBD88K1ccnrGHJrPUPiSxCc1hC3iGk39R3d9IVHhE=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN7PR11MB2643.namprd11.prod.outlook.com (2603:10b6:406:b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 09:58:04 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c%9]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 09:58:03 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.11.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.11.rc2)
Thread-Index: AQHXqsUt+xn8GFsriEKfCE5ku096Gauv2jwQ
Date: Wed, 22 Sep 2021 09:58:03 +0000
Message-ID: <BN9PR11MB53723CE293E5304DAD54E4D5BBA29@BN9PR11MB5372.namprd11.prod.outlook.com>
References: <c6530d49069932111797e610258038660a9f903c.camel@linuxfoundation.org>
In-Reply-To: <c6530d49069932111797e610258038660a9f903c.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47ba3ac8-79bd-4dbb-c753-08d97daf783c
x-ms-traffictypediagnostic: BN7PR11MB2643:
x-microsoft-antispam-prvs: <BN7PR11MB2643B8031BDA0B4E10E5578ABBA29@BN7PR11MB2643.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QGC/r/tXLvEMdnln4BvfZ/BpYAh6eTe3q3aITiy486vRUb1BuQKxUi/Nkb6//WtAkedXd8vAdueDGmJq5YJIXMXeOj+CAbR4rmnek2zHlQHLaw/qOs+d5c3Me/lFqOH/7jwLdMLyym8PWEMxQaVZZHIPVfIkltfVVWcjpRlXZGybdcjAlvqeOQkl/4iCvnx/vC+gvLT1aki2R49wlYoAjKjVO5A9sONd/sVot/SxwMn/A3TEWv37g3EoINPGOBCIfDtDp7ZFrz24nSqR15s15cZBLWYtBN4nGM6cCfCGEbydjrNmc/UMqIdNKNeg1NzHiUfd4uMucX5oVX0bkTP3DTpwAvZSIsoAY+iTlZlOP3hBJVzcy+P3VSOKjmpaC8rZn1Sznd8ovTClx6WsvNk7M1wUbHKz3BeU5gKnL5VnJJPsZLn/myp6f8N/SJHusuwPY2PCGu5tCQ0dSu7Eu8PpLJWCMnfJh17Fo6iApKphgJuGKIZkUOA3VkrRK1XhlJ8ktAuYZ8qkRIrK2TuqseF9QNaYm5WycAnmTQtXzFKEspgai1UMCXemX6KkPj7Qx0KK1VlzIU1fmSYobdOgGTSwti5EFxoxsXcvpSEsGSKhrZalTmTWgSas7LqwzlN/g+ANvddZuyg3adBqRJMlEsdLu2PbeMajKzksSMh3J2FDQhrfxOFA1x8594PTiZyV5CoWrK0oGXMJuzzNTDAK9nu3jHcA/Gupq5CxLlvw0sKfwsfu1OI0QYBrUZLsVQLL9Bip4h40RL2iqSX7PurIcp4f3Pf9qYK4JFSUdw/56TUQH9q75j10vs0FMthgZm7gAH+X8EHD8JgJq89KTi74hTi9Kw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(966005)(86362001)(9686003)(52536014)(5660300002)(38100700002)(8936002)(66556008)(64756008)(66446008)(55016002)(508600001)(71200400001)(15650500001)(66476007)(76116006)(2906002)(33656002)(66946007)(38070700005)(316002)(8676002)(53546011)(7696005)(6506007)(186003)(26005)(110136005)(122000001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGtITS9EUXprY05Wa1h4czRyTzRzbWQ4aHJ2eWZHb2N6d1NnSEdxcFp1OGZ4?=
 =?utf-8?B?c0Vlb25VU04rZEFoY1ZFaEtDTHpSYmtveFNUNHJLN1YzMkpIVkdrWlo2cm5D?=
 =?utf-8?B?S25PMSt2TzZlTE1jQjR5N01mZ2kvMXhJL0EyRkVtdnNMUTdTc0hTZG5DZ0Uy?=
 =?utf-8?B?UGY4Ull2cG82UXpGeElnQkptV01aakZwK0haVG9Jb1Y4Z3NUKy9PYVMvaks2?=
 =?utf-8?B?aU0rWXIrbEJiN1VHczl5MWxGU2s0ZXNkWStNKzdlYVZ6U1VhTWhNekRNNWhD?=
 =?utf-8?B?bjhJSVYzUzdRZjhYY1RIMnN4RGdZc1dmbTR0alZvamlZVmowcHB0ZDRxODRW?=
 =?utf-8?B?RFQ4a2YrYkpmWFFJdk5aN1lPQzg4TDIrOFBHaVVYSit3UDNZU1hXTzlrTVFV?=
 =?utf-8?B?ZnJubHNMQlltNnFKRVpxUmhrRG5jYlJRbXYyQVluV2ZDMHdtYlVKOUt0RFlH?=
 =?utf-8?B?cHZYVUI4NG4vd1k2U2JkYWp1a1dCblkzZkNpZklXV1J1RzltSWtCYlZDODk0?=
 =?utf-8?B?aVM4VkZrNGFuVlUveGVGSWZQb0JKcWQ1UmQwUkxpL0M4ejk3dUZYaGxzN3J3?=
 =?utf-8?B?MUhPZytuajIxenFVRVl0UTkxdXNmN1k5L1NuZTE1N0NQYmJrVDlxQ1lpSTli?=
 =?utf-8?B?ZHFtQTZpMFNmQUVaZnE3ZUxDRHp0REdOQ01GRXlWNDRVdW4wN0xmcnl4b0dk?=
 =?utf-8?B?bGIwVy94N0RZb1JiOTlXMFBFRHNWd0VyNDlGWmg3M1krOEpmT1U4d0pBelRm?=
 =?utf-8?B?MWxmWXpDamRxaTFocU00bnVKRlRJZzI1OEQ2RHV6dU9rYlhHV1loTEppQUQ3?=
 =?utf-8?B?VmVBQWF0YzVLSjlTQ0pUejhrdWhpTUp3OXcveU9DWlozUXZXSWExSkplL3VO?=
 =?utf-8?B?RUErY1R6b2t6UVVNSGhpRnlIampvMEhkWmE5RUNCalBGSWpJU0JZbUVQT25B?=
 =?utf-8?B?enpVbHBzNHAzOGpUYmwzTmlMQmtQQjl3VHZYODVTc055djk0b082NXYzazRJ?=
 =?utf-8?B?MmNndkhabVZiNHViVzNYd2Q3MFdGNUJQSXR0eFJuSlRHbm9SVkRUTnhDWUpB?=
 =?utf-8?B?Y3hqeXlFUzZLTEs4YTF6ckY3U0Y3bDJ2TkxYVnA4OW5OTlZ3anB3TzJhRDF0?=
 =?utf-8?B?N2U3QUFVRjFVYWpRV01pNWVnc21PUUxWa3dqOUtNVDVSTzFLQmtSNkxudTBr?=
 =?utf-8?B?WmpFS0NyU0Urd3RJQXJGdG41Vk41ejBUekIydXY5dUJRZSswVTVqN0xlZTd0?=
 =?utf-8?B?WjB5MTBVNmNBcllvMlRsY2pQMyt4a1VZUHV4VkFFaEdSa1JRYUh4UGFYSi9C?=
 =?utf-8?B?UnVMcTBRTmNaRkM0UEhQbkpLSHpiSlVWMTJOTTRhNUlzdnIxL3g5Q3BnaXB3?=
 =?utf-8?B?REN4SEx5VXM4b2U2QngwRy91c0NXOEg4MnVEY2NMNDZSbkp0YktwSlNvcjJ6?=
 =?utf-8?B?ejRJYnZSaWNLT2MrR2FlZ1ByaEFuSlVhcngzS3c2WWtvd2IzWnJTVnRqMDZD?=
 =?utf-8?B?YmdiVnJXRW9WeUFNeTJSOVRzUkhnTFJWL2hqNS9CMTFOUmxDY1pwQzRVNHNo?=
 =?utf-8?B?cURnWm4yVVozczZNMGYydnB6aGdVSHJyUlI3QkN1bGJxOElJUGp1MFhZYWQ1?=
 =?utf-8?B?aGhKcmQrb1liVlhnODJmMUFhRE5CSDRWTUovYVQ1eVZqdVJUUzJvck5wVFVC?=
 =?utf-8?B?Z3hhcElwSXZ6YXRxblFZemVzMW12WGI4bFVrSWViaCtxYjdVakd2ZGY0ZXlk?=
 =?utf-8?Q?kybVzgOZBSBx8V7/5enPBEsa1XBsOqYPBjFAsiq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ba3ac8-79bd-4dbb-c753-08d97daf783c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 09:58:03.7891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6gFH/RllGv/KvvNQoFiT0bHvUzpr39q854bXbPbyR1dLyoD4j4QdoUpMWgfmg4UAMhrmEFBW0mrPW7TvDOuWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2643
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjExLnJjMjog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuIA0KDQoxIG5ldyBp
c3N1ZSBmb3VuZCANCg0KQlVHIGlkOjE0NTU3IC0gb2Vfc3lzbG9nLlN5c2xvZ1Rlc3RDb25maWcu
dGVzdF9zeXNsb2dfc3RhcnR1cF9jb25maWcgZmFpbHVyZSAgIA0KICANCj09PT09PT0gQnVncyA9
PT09PT09PQ0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNDU1Nw0KDQpUaGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEt
YnVpbGQtDQo+IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYg
T2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogVGh1cnNkYXksIDE2IFNlcHRlbWJlciwgMjAyMSAy
OjM2IFBNDQo+IFRvOiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb24gPHFhLWJ1aWxk
LW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBbcWEtYnVp
bGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRl
ciBidWlsZA0KPiAoeW9jdG8tMy4xLjExLnJjMikNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3Ig
UUEgKHlvY3RvLTMuMS4xMS5yYzIpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyIGFu
ZA0KPiBpcyBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuMS4xMS5yYzINCj4gDQo+IA0KPiBCdWlsZCBo
YXNoIGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogYzJhM2JkYTNhMjllMTI0NzJlZjc4NjJl
NDI0ZWExNTUyZmFiMjk1OQ0KPiBtZXRhLWFnbDogNjAzNDRlZmE3YTUwZGMyNTQ4ZmM0YjVkNjhi
NWFkNGQ2MGM0MDIzYQ0KPiBtZXRhLWFybTogY2U1MzVkZmI5NmRlNGQyNTI5ZjA5MWQ3ZDg1YTcx
NzJjNjI2MDAxYw0KPiBtZXRhLWF3czogYzUxNjRjMWE3OTVjMjFmN2NhY2NjM2I2OGJiMmU4MWE1
NWJkZGIwZQ0KPiBtZXRhLWdwbHYyOiA2MGIyNTFjMjViYTg3ZTk0NmEwY2E0Y2RjOGQxN2IxY2Iw
OTI5MmFjDQo+IG1ldGEtaW50ZWw6IDY4Mzc1NTIzNjVkM2NhYzVmODA0NGE1YWU5MTBhYTg3NDQz
NWY3NjYNCj4gbWV0YS1taW5ndzogNTI0ZGU2ODYyMDViNWQ2NzM2NjYxZDQ1MzJmNWY5OGZlZTg1
ODliNw0KPiBtZXRhLW9wZW5lbWJlZGRlZDogMmU3ZTk4Y2QwY2I4MmRiMjE0YjEzMjI0YzcxMTM0
YjkzMzVhNzE5Yg0KPiBvZWNvcmU6IGM3ZDIyODFlYjZjZGE5YzE2MzdjMjBiMzU0MGIxNDIwNzNi
Y2EyMzUNCj4gcG9reTogNzRiMjJkYjY4NzliMzg4ZDcwMGY2MWUwOGNiM2YyMzljZjk0MGQxOA0K
PiANCj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3Rv
IFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95
b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmcNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQoNCg==
