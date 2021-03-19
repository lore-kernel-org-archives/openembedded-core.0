Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web12.3766.1616112551458190387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 17:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=NuN6oJoK;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: wangmy@fujitsu.com)
IronPort-SDR: 6ogNUOjcxZ9fCaaS53KZ/Ay/1yOSUN+udVWlpkogZZ2FdxdVj5fiqqKLeJDNVNtHQUjOGaMBiP
 MMzHd612BbY/9wNx4P3ynGebCNOVBHUho24SwfmfKyGkNc7qJztlUj7rToHRrpp/+2ss7wcbpc
 Ncb/x+EhSUJH8Im9GSylqqMR3Uec8K8Wrzyuffyb9irp0acudJXR35P5G8WcNUl/jwyHTcR5iC
 AltMGGjy4yrqGNdZWWrNWYNJgH+QqVZf/qNzT9RdKiBezcOHkeGrXkeUWC+OvnGf1bSCDrWurY
 Us4=
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="28156330"
X-IronPort-AV: E=Sophos;i="5.81,259,1610377200"; 
   d="scan'208";a="28156330"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 09:09:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/m6ztwZc6EFx8jBSF6EcYUrpgzsO5x++Mcp3xObJc7LFpuwHOOK4yBseNNYAyi9T/bAL5oqNdgTv0zWjyX42rUVU/OiAgGkqDCU8QfFTd7d99kCG2tWYT6MoPSIV6R34UIiamNfIMYdTZ//MKfy48pqsA/l4qY3mNrSCFq8suhZ8K+AVjBKwARfcx+OOhufVgR1J9Dy73pmOQ21RRbU78U59EMj6ZhYUnvYjXr/eKWCOc7b/q6C0qBbWwAGoBbFWdxd/T4NpcBYdfNFXsWBnku92T+BiwMeNbdytQUI208Xrc0JL/OEUm7cw4CrT7UOHf+qm2XDFd27JesenwhzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujuDXLW7tQqWJcmXTog0Y83SVRc79zG5du1XeWHvFrA=;
 b=kuhEtjaLKSQF5DPnEryVzE1NqXfmO2KEcrvc+mGufs+XXgH08KAIu3D88FJio3dE/s4R7c5te2Zrp9W1U9w/i/ry+kLtHpu5aBrIPdtaJhYS9jn0UpER7vTxwh5sbNaEIPJpntAeeF6agqyOjA3fg0KbQzlyulyslMrvYS3QATNj4KgPKp48FZYWwBehsWE8njdVLGI/bdkF0FwwMvkP+2S6z82jb+RrhN18Ff2H+bHOEDHAG1N7vPSdyYHJDTQ5cdutKWm/nR8eqlUALMXIqDIPtdCwztF3ZgPjZljs9L9DdXq+tApkpwRrjEs3x/TpkaOOLl544PRW15aw8RSjsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujuDXLW7tQqWJcmXTog0Y83SVRc79zG5du1XeWHvFrA=;
 b=NuN6oJoKJzVr7lwSWKEMLiSOubEkjNoT9pkJ+RgcKtc/0hwMeTd81AOKHrk/U7RERJk9pAnoMrTEyQMux6D5eveCWp+i563aFmZd7NsWC2kIKad2Kgvh4KkqC1Bb4n6x3kE5/Rmrd0pbdZma4tYOtWT7/07Xx/nfPereLCH3VNM=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSBPR01MB4807.jpnprd01.prod.outlook.com (2603:1096:604:3a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 00:09:05 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44%4]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 00:09:05 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Fix error in do_patch when using "PATCHTOOL = "patch""
Thread-Topic: [OE-core] Fix error in do_patch when using "PATCHTOOL = "patch""
Thread-Index: AQHXGTb3ehM/YxJRtkuZBho0VwPMO6qKVmOAgAAcuMA=
Date: Fri, 19 Mar 2021 00:09:05 +0000
Message-ID: 
 <OSBPR01MB1845BD741375BC0D3DC01474DC689@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1615770124-15950-1-git-send-email-wangmy@cn.fujitsu.com>
 <3f8fdefd12d982dea2e9bf36bef5e8de2fc627a8.camel@linuxfoundation.org>
In-Reply-To: 
 <3f8fdefd12d982dea2e9bf36bef5e8de2fc627a8.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50f480fd-279d-4d10-4c8b-08d8ea6b35ca
x-ms-traffictypediagnostic: OSBPR01MB4807:
x-microsoft-antispam-prvs: 
 <OSBPR01MB4807EA6850F5066C2AB971D6DC689@OSBPR01MB4807.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:425;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nhC73yUdioDEasI+X99K7WzT+FUBSszB99nNgNy4wFI4gxG8yZeCnjHtOHPxtw3wJmEnWl40n96xlDr14zdaZ2evyC+GAx0JG0xaDZ1cirOiglrjMqOZEDI6pYNa8dLVdTOA7jm0IM6Gc1yIjT3ZiHOpzqwIAM0RaorvWIJ5tuDywtcfxHUCdet051QY/oCuoZ0yvfT0yYoLBMqh3b5SFnCXFWbhAPqL+Ac8h8+eYCqjpQ38CECkznz1up+jamu7bhjN/2q54/eJf5BegHuLNZgqPY9ya64L20XPdP+pE85mpTq0SalBNfeV9UopwfzAcsMSe9jqOcDHfjhPjpvaX26XnqC/pzAnELVVAQxBl17WWJU9ZxJtHY5t3SM9IF09iNUU9HpR05gif+A4cj0PKkb/8yS7zsUGvyV04gH1EUPUATrBMvudF09ocRSX5SrzZGKgy7lFU4CkZDGF3ove4t/57rTcI57EELyYEjTsoNp6qmYGpYdLPsr03pbontv3ZS0shenTDeMl0xovDWz52/NAGbR0aZHxdJ+7c1oWmRZFapRzvzmuGJ/x0zBciptzkKSWQMIei4rigC1x5mZ6BBvw2f+VBst4l7RN1m6VuSjPJOfZMTptRTRnT6Nn9zKLTyobSgXsQCkvm2Lwjbb4ze8j6ePIxD8GUEt5GxSzZsEMU4mdmK38FZlpS8/a0RpAEa3kw06lTirWFhfXqnenbeYqnJ7VFNuZdWcHzUO4Ne0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(66946007)(966005)(66556008)(76116006)(38100700001)(66476007)(8676002)(33656002)(53546011)(5660300002)(478600001)(52536014)(64756008)(2906002)(66446008)(6506007)(55016002)(86362001)(71200400001)(8936002)(9686003)(186003)(7696005)(26005)(83380400001)(316002)(110136005)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?OVJwQ2l5Y1BLUUxrQ2hTc1JoWHlsVk0wWEtHekk0c3FWaitJRUYzU3hDYmlz?=
 =?utf-8?B?ZXViZDVYZFJuaTdLQkdxZVZKdGV6Q2xWVUw1TllqRG16UEFML1F2WjdCV0VU?=
 =?utf-8?B?QzhNZ0RVQ1M2Uys3dnlkVnM0UWxNMzVPeGFYb2NLTC9Gb3dFcmtPSEovV1Ur?=
 =?utf-8?B?c1lIMW14WUFqMjJnaGlSRlNpV3Y1c1lRcktEV202RzZZNHplZnhObXdtOU9T?=
 =?utf-8?B?Q3A4TUFGSTZ4alk0SUlrSCtOYmQ4emJ3WUxFRlpXdHZPY2huekQ1VVo3d0hK?=
 =?utf-8?B?WGRFemdWS3E0cTlDSTVaR0phdUNNSW0yTjBwYnlpeGpoU3NSSFljeVFDWmN0?=
 =?utf-8?B?UGtOWElLUXZuL3BPckkraWxxVnRKanZEMGo2U3RBQy9DNmlCUmdVMnZpSTc3?=
 =?utf-8?B?V0RnQWprcGNXT2FiR1pGZkRqbnBLQVhoZ2Ewcm5vdUM0d0NTNU1TenNiVXEz?=
 =?utf-8?B?dk9Kd2s5MW9OSEZSMDJGYTJpaU9QYWZiZ3Z6TUd5TTErQ0hTdFB6dElPNjRO?=
 =?utf-8?B?RGpScG13dU1sYkxCd2x0b2hQWVpjeFF3OU1hb1VrK0cxUkRJNG5TOEFLMm9D?=
 =?utf-8?B?bCtKZ2Z6aitMNlVLcitGcTRDU1lzOFBLMUs1UXhxaVY3TWcwZFA4bk54cWRv?=
 =?utf-8?B?Z2N2WjlJSmhtYUo1bUxBTHQvMzdnVnR5ZW1BRHZCcnVxdCtSUU8xNXhCZnRi?=
 =?utf-8?B?c1lLL3FraWhERk16UERCd285ZVNac1cvTmlGUjBqWGhXWEY4VzVJL1NVdUhI?=
 =?utf-8?B?OGdTZ081eThqOXFEbnlYamdTVHBVNWw4ekp3S0NzM0ZxWVFidGZzVHR2LzlJ?=
 =?utf-8?B?dzhxMk96ZU5IMERKMTJFMlRHeHF2MEJKby9sYUpDS2NualFORGRlQUN3cGE0?=
 =?utf-8?B?K2k1NlI5ZWQwNXRkSnVBZUI5djI4dXhmQUVwQ0hGVVZ6R29TT0hycU14OWt4?=
 =?utf-8?B?dmhmSnJvdTZQVjJrZnlCRGM0UlR3SDhnSEhkTTJ2RjRPVk9HenRySHErdGd4?=
 =?utf-8?B?ekZuUVJ0c2VoTVg0NXY3Qys4WWFtWW5YVFlNNW5uRXR6eWlpc2dWd3cwZHRt?=
 =?utf-8?B?TmVMOHdXbWlmNDVQTnk5K2J2OTBIWTBXVjk0RzVlRFl6TnRRNGJsZVJKZlhw?=
 =?utf-8?B?clpVWm1mcGY0bmJrS2ZVVWRDYWYxODdDQ2ttR0hjbXVteWpQQTFraUNBVTls?=
 =?utf-8?B?US96dndZenUrT1d5RHI1MDRxekFIZ2NGZmdzSno1amNRV1JFYXVsZ0JMbm9H?=
 =?utf-8?B?aUpUN2N0UHNjZXBiK01LRHduKzc1UzhOb09iOS9GZmVTYTJyQ2VpSW4vNTIr?=
 =?utf-8?B?MGFZTkdEWUtmMzYwRnVVR1J4WVhlNlhXTVFLSTBJNHd3NG9DZFFWWk9hSkpv?=
 =?utf-8?B?ajl4TlFaMVdzSXpDeXdZMEdWVURsRksyNjN0a1NIajRlVFpYRlRNTTd1TUVE?=
 =?utf-8?B?MnkrV0hPNzN0K2RNV1JwZDg2aVRobU0zWXp0cDZKTlZjUVllYzV4bWRjNkxJ?=
 =?utf-8?B?OTl6ZVVScUdYMzVUMTBWVmUzK2Yva0ROUmJnQjBYaGhnTklHdURTQjJiYWNz?=
 =?utf-8?B?ZEMybFE3T0pnM2RFVTRoQWMrWjB1aWpwQ1lxZWZUWUN1V2NIb3V3U3JVbmo1?=
 =?utf-8?B?YWt1RkdCQ2FzVHJRbjFLRUYrT2JpY21TVG9CT3NwYU5QVnRDbWloSTBodGFG?=
 =?utf-8?B?Y2JqKzUxb1Y4aFN2KzJnZnA3OXZNNUg2UUZZdm1ZQTcvOVNZZlp3YjZDb0R6?=
 =?utf-8?Q?KbVB7lmwtql2gibm9uBKNZL7f/ffL4mQwdbhpk1?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f480fd-279d-4d10-4c8b-08d8ea6b35ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 00:09:05.7126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0QxSmbafohkfptHD5IbjHMLwIrHUW9Q/3dIJmI24GpbBLyol2oc7TlkL4cWfOdbdF2TtchnXSugt+MtAhLVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4807
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBUaGUgc2hvcnRsb2cgaW4gdGhpcyBjb21taXQgaXNuJ3QgcmlnaHQsIGl0IGRvZXNuJ3Qgc3Rh
cnQgImdjYzoiIHRvIHNheSB3aGljaCBwaWVjZQ0KPiBvZiB0aGUgc3lzdGVtIGlzIGJlaW5nIG1v
ZGlmaWVkLiBJdCBhbHNvIGV4cGxhaW5zIHdoZXJlIHRoZSBlcnJvciBvY2N1cnMgYnV0IG5vdA0K
PiAqd2h5KiAoZmlsZSBiZWluZyBwYXRjaGVkIG11bHRpcGxlIHRpbWVzIGluIGEgc2luZ2xlIHBh
dGNoKS4NCg0KU29ycnksIHRoZSBrZXl3b3JkIGdjYyBpcyBtaXNzZWQgYXQgdGhlIGJlZ2lubmlu
ZyBvZiBwYXRjaC4gDQoNCkZvciB0aGUgc2FtZSB0eXBlIG9mIHByb2JsZW1zLCB3ZSB3aWxsIHBh
eSBhdHRlbnRpb24gdG8gdGhlIHJlYXNvbnMgd2hlbiB3ZSBzdWJtaXQgdGhlIHBhdGNoIGluIHRo
ZSBmdXR1cmUuDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERl
cHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNU
KSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUt
ODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJ
TDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2gg
MTksIDIwMjEgNjoxNyBBTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBm
dWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBGaXggZXJyb3IgaW4gZG9fcGF0Y2ggd2hlbiB1c2lu
ZyAiUEFUQ0hUT09MID0gInBhdGNoIiINCj4gDQo+IE9uIE1vbiwgMjAyMS0wMy0xNSBhdCAwOTow
MiArMDgwMCwgV2FuZyBNaW5neXUgd3JvdGU6DQo+ID4gZXJyb3IgbWVzc2FnZToNCj4gPiBjaGVj
a2luZyBmaWxlIGdjYy9jb25maWd1cmUuYWMgSHVuayAjMSBGQUlMRUQgYXQgNjYwMi4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAY24uZnVqaXRzdS5jb20+DQo+
ID4gLS0tDQo+ID4gwqAuLi4vMDAwMi1nY2MtcG9pc29uLXN5c3RlbS1kaXJlY3Rvcmllcy5wYXRj
aCAgfCAxMDUNCj4gPiArKysrKysrLS0tLS0tLS0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0
MyBpbnNlcnRpb25zKCspLCA2MiBkZWxldGlvbnMoLSkNCj4gDQo+IFRoZSBzaG9ydGxvZyBpbiB0
aGlzIGNvbW1pdCBpc24ndCByaWdodCwgaXQgZG9lc24ndCBzdGFydCAiZ2NjOiIgdG8gc2F5IHdo
aWNoIHBpZWNlDQo+IG9mIHRoZSBzeXN0ZW0gaXMgYmVpbmcgbW9kaWZpZWQuIEl0IGFsc28gZXhw
bGFpbnMgd2hlcmUgdGhlIGVycm9yIG9jY3VycyBidXQgbm90DQo+ICp3aHkqIChmaWxlIGJlaW5n
IHBhdGNoZWQgbXVsdGlwbGUgdGltZXMgaW4gYSBzaW5nbGUgcGF0Y2gpLg0KPiANCj4gSSd2ZSBm
aXhlZCB0aGlzIHBhdGNoIHVwIGJ1dCBpbiBmdXR1cmUgdGhpbmdzIHdpbGwgbWVyZ2UgbW9yZSBx
dWlja2x5IGlmIHRoZSBjb21taXQNCj4gbWVzc2FnZSBpcyBjb3JyZWN0Lg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQo+IA0KPiANCg0K
