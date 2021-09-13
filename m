Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.56])
 by mx.groups.io with SMTP id smtpd.web12.30516.1631543320392631179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 07:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=sa15tHTw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.56, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gutT7akO1MWl7vEw4em24293k+n/6fHHdrBX8uOyBugHTacLE7VV5VPDRiKBiIsBvSmLWb61Kbu0z5tnPjaV8TVHjxTxK4xuQhTzmxMObZ2iBcwxa2OPEd5O9VZOnvMag8w198n6TIJaaUEmgxmH2A/TpPt80LkIUDAAC+eq/1JitYd5Z1mGLnFPCIvgNWOPamSj/5Ncsq+N0SistjIZ1QjJ4RBWlDG+VGqs+pf1GNsgazk94p6GZrjEh4IfwzE/uejcsAavpW9b4PM7RJc4w7XOkYA6digBeulBie+jb/kK+wwZmDnwPCp2jNSjwWCHp8HFsz3bH+h/CMmm8zx2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wFsPyaXovy/0le4WQf0cidWH7SdOWh+Msyh01fL9UEk=;
 b=IivQsA7WJ+p6L3eidgH3ryCkykSUi+f5jiFzx6pOsCHXB3UneZ5zJ+eQePfxlIyOSSJK8Ddy5d88EvsO/B1JF6xOBslOEKdgMTEyPCTnjUzc8ZMSwGD1FnotkPKDpa3MjOUs5FNFN2+PkSmOlY+FdbQw1jHQ8UzM/4U9u5TZqsxCrih7XMmYuoOwOoraAUhG1F3kKWWN2dOaePRxo473OhNEVUQd5JxIKp9N615IgE0P3zbiivO4sNPorJh3bYvM3aVcnEfi+7MEWOqp6KBHOcuu8nCByAkwiYVythx334tvveL/9uUyYT9ZDZBPnqYjOMdxFr1mdhufoQm/nXGGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFsPyaXovy/0le4WQf0cidWH7SdOWh+Msyh01fL9UEk=;
 b=sa15tHTwxf13ZtCjfoFCYXj4l+cfwghLUsJEycTkfuSoks+mNfAn5tZdxXQNqaRjkM1KYnRCreYDvIHhtlW/v4HWDeAyuBlEFBU7igAjWie9g7Fq+BMciv3xZYq7E2b79vbmAlp28BYEiX23E5RCZbbgHeJJoih1Si5wgcAl3SvCWGdkbL0c21zqcj6dc5W93gQ/qhiBWVAYm+QbIrEeZGO+6jN5N3BWPqNUTgGp+hXE2ibUlruxLgMczNYd1b+hbTal5rkpqwbzU4ABtGou1OBwgcWGwxLJ+Q8Oqlt7qW1YweI+JaEepuwV073aOXfZEAIgg7QVjnytJuS8wDbJVQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16; Mon, 13 Sep 2021 14:28:39 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::90a6:948:7427:ff12]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::90a6:948:7427:ff12%9]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 14:28:39 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] bitbake: server: Fix early parsing errors preventing zombie bitbake
Thread-Topic: [OE-core] [hardknott][PATCH] bitbake: server: Fix early parsing
 errors preventing zombie bitbake
Thread-Index: AQHXnbcbeGibdJcGcUmBl4RSKZFfAauacc6wgACDcoCAByZUsA==
Date: Mon, 13 Sep 2021 14:28:38 +0000
Message-ID: 
 <DM8PR12MB54308C00258746EAA010947C8BD99@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <16A0207AC2905018.25648@lists.openembedded.org>
	 <DM8PR12MB543089FBA26942E145A386568BD49@DM8PR12MB5430.namprd12.prod.outlook.com>
 <5d91d5ef858723a85e9460cfeb62e251052e321e.camel@intel.com>
In-Reply-To: <5d91d5ef858723a85e9460cfeb62e251052e321e.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5d765b5-d38e-488c-0251-08d976c2c761
x-ms-traffictypediagnostic: DM8PR12MB5399:
x-microsoft-antispam-prvs: 
 <DM8PR12MB53993680E99A24FAA6A1B53F8BD99@DM8PR12MB5399.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ASEOHbcu7PaZh5f+hAZn834FSK1/K9DwU+nWgK7jeIMlIcTrL2rGovgCw+05Mhh6z/jLo/002eJhcVmEikZ3+aYYnWp6MW02R/m30pFttdSjisEK7faad+g9YQgT1hLJZqitde0D9tgyTK7UEn8o1m6UbvO8Jr4uV/Nw2TSa+uTyrgliYv+6UU5tUhtoPGf7qE0m/KppkdAseCxtO1vDeqfzTbKvptJRODhF71CiLeGsOe4oNWPNxnBSFbHlhQSWqPio6VLBlEUuauzDRRzjE72c1IRhfOe6BopuyJQ9xR4hnZacLTlCH409BkjfL9JAyNovNzPEXqyRKx5meDL6TmZa3Q6e9LCy79EFq6xBTDiGEh+car89VrKnmLWBK1kV/lQP14uFKYu2f5QSiyumXK8T9z7SvFKRA4y8/C70ORx5LQaQqkBO6Z6xBef52PRV9xlzo5fK5PmSx1v6NY2ZDGZ70SkmwK/7YigdDXSeO1W/I9mROIFxlYgyqlvsnTOXWTHaCaMJD6SmFpxaHBT5qmWAoZbAqrVF2A/YntFuBPVVTUzJFpIZ58GTv4n1JQYyOhzYQ/lDSG/62HVVD69bE3PyVU44xHHiGXIIxm/EddUhdlHgazhF9MVLNidsj+Dr7fca5OpwfkFG2f392eNCQGLnb9IBZHNz6Ug9qe/jpTy/XOW0jz8d0He47UoY9i0EaxoF2tU42jRWnBefNq1cF+PUKtFY85sWxXctJA+F8ackAvCNPQj1XGZjoSKIlnXf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(29502001)(2906002)(316002)(6506007)(26005)(186003)(8676002)(558084003)(7696005)(71200400001)(122000001)(508600001)(66446008)(64756008)(66556008)(66476007)(66946007)(9686003)(110136005)(52536014)(5660300002)(55016002)(86362001)(83380400001)(4326008)(8936002)(76116006)(38100700002)(38070700005)(54906003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q2ZsMUl0NFR6NHlFWm1vZWd2WkR5REpPWlhxUmFQaVdvL1lBcFRLemVxVjN1?=
 =?utf-8?B?VlRmb0UrKzZPQi84aXlwQzFBV1lYQXB3K2YyWFJ2OTJPQXFabXlPd0pXSGc3?=
 =?utf-8?B?NE1xeTJTakxCeHgrY2UxcUltNVBLeUhUdEJERDJtNmJJTlpzb1d2cW1rMDhX?=
 =?utf-8?B?dk9KeDRVb3lxQ3V4RVBYV1hoRFNzb2xUblc1MWFISW1YMUJIM3F6QjVYZ2hx?=
 =?utf-8?B?RWJOSi8wVzlZbkRVeTl1VDZUVUREM3paR3NBT3QySk14Y0JjT0VrcnQvRzNq?=
 =?utf-8?B?NTFydHY2Y0IveGtBQzQ2ZmZRU2w2b2xDcnlDdU1DakEzVm92WkFDQnFCQXUv?=
 =?utf-8?B?U2NNRFFnS2RaS2pQYitucWt4RTdWNXVmL0Z6RzBTdDNrMmE0eVc4TXRHMkdF?=
 =?utf-8?B?T3JNY0Q3T2k1MEtjeXhFc29LSERobkZYZmFQQ1E0aUk5bUZJYVFXQzEvUnhI?=
 =?utf-8?B?S0l2Y3NMQldrcHlSNktPK010S3VPWEdQcW51ZkFrUWhBc0R4T1FqOTc3Zis3?=
 =?utf-8?B?TXhnZXJYYU13WU9PSXBDQlJIZ3NnaHdJRHJlRWZ3MzNLM293bVJldEVwcDhV?=
 =?utf-8?B?QkxKaFVxNWVUd2tyNGI4dHZRck16a0E2d2ROQ0xTeHU2ZmZGc2F6M2xGdUoz?=
 =?utf-8?B?dGtaUWdyUFRBVStVM0RsdlNVMnlTMC9MSTBITGlNaExFT2IyVE1jUGplSWRI?=
 =?utf-8?B?QWwrVkk5U2FHMk1nblpqYTdKRFRKcE8zZmFYMk5jUWhyS3QrMnhnTDJxN1ZV?=
 =?utf-8?B?QkpkWEdoQmEvUjJUR21sQVRYNjJKQys0SHRKUWxxOFBrZnVpQXZRcVNiZzVo?=
 =?utf-8?B?SE9zZEZVNkZ4R1BBd3lQZ1lleXJpQlFheEpuS1EyRXI1QnpWOS93SHR5VjNq?=
 =?utf-8?B?ZlRMVjhiNGp3Ylgwbi9CaGRJT3lzRE10dlJicm1OdU9mQW9mcEtnY2JYUWtB?=
 =?utf-8?B?aU8xQ2Q5TmFnZkdKQnlxNzhxMDdvM1JST1ZWTGpsNXJ2NkdDTmZPdkNxN2o4?=
 =?utf-8?B?ZHdjL3FIOTlvbkRxbnhKZUhOWmw2Sm9LdSs1TjdUYk02L0dKYVZ6Wis5aTQ3?=
 =?utf-8?B?MHVtdEdpdnNyd2tZYkoyYy94T3pSZ0FZMEFxa2thMTJOUkdHRjh3azBYQ1pt?=
 =?utf-8?B?UWQxaEdZbThOU1VpclhrZkxEaytHVzkvWUl0YlVPVjhVN3V1eTRuWHIvVkFE?=
 =?utf-8?B?VmFkUjhGRitqRVJ5NkJ1bU5SM01KN29Fek1xOE40OG14cG5KLzFwRU9tYWN5?=
 =?utf-8?B?M2pWZnVpd1hLWjBWYVVpZnBydkpUZ1F2akJuNk9hYTZpekgwbWNWOGhmVlFG?=
 =?utf-8?B?YTJhMHBROXR4bTBwS2ZSbUJCVVhDMVlRejBTUlhIbmQyQkRDNkJKUjlxSThv?=
 =?utf-8?B?T0dsbjdUdGtJL0tleFhrOUlwUWs0Mm5BV1F2cThJRzBQQU93N1dTb1QwZmtT?=
 =?utf-8?B?b2hYODJoNWRnaWdrME1NRnFHR2Y1OHBTU3RrQXdNTGZ4S00yQXc5N2pZeFEr?=
 =?utf-8?B?djJrZUxzVmh1U04vaWdlVVpFWWZaSW15OUFHTmlvSDEvejN4ZERZV0p6aksz?=
 =?utf-8?B?Z0ljODB4em52bWlJV1UvTi92Z210Y0ZCVUpWdVA3bC9kbGZVTTdaTlYyaWFr?=
 =?utf-8?B?M3JCUG03SnJjajQvWlN4aytJWmcwUDZvZHFPN2dMaDFpRWs2RGdSOXRhU0ZW?=
 =?utf-8?B?eUoyL05oK3Awcm1OcW1qREFmVG15c3hXbnp6bkhKM0NsMEtIejg4dXY3RDRL?=
 =?utf-8?Q?Z09R5m3uPz8u2pOErtvyHHGZ8KgK3NjmdanZ3S8?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d765b5-d38e-488c-0251-08d976c2c761
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 14:28:38.9247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49iChYlBDEbDYOEURf7Yg8TWYjFd2ALbnmWVR9oQqg8o5JNFEon5t64P8SLmn0ew5AmDhF69h+Ib9fS1OgixbR0V3QG5BEBUP6Wt4E1hgOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5399
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW51aiwNCg0KPiBUaGFua3MsIHRoaXMgaXMgdGhlIHJpZ2h0IHdheSB0byByZXF1ZXN0IGEg
YmFja3BvcnQuIEJ1dCBzaW5jZSB0aGlzIGlzIGEgYml0YmFrZQ0KPiBjaGFuZ2UsIHNob3VsZCBo
YXZlIGJlZW4gc2VudCB0byB0aGUgYml0YmFrZSBsaXN0LiBJIGhhZCBwaWNrZWQgdGhpcyB0aG91
Z2ggc28NCj4gbm8gbmVlZCB0byByZS1zZW5kLg0KDQpBaCByaWdodC4gVGhhbmsgeW91IQ0KQ2hy
aXMgDQo=
