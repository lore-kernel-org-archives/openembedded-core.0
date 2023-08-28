Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82072C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 07:18:27 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.105])
 by mx.groups.io with SMTP id smtpd.web10.8582.1693207105129714375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 00:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Qn6J5D5A;
 spf=pass (domain: prevas.dk, ip: 40.107.15.105, mailfrom: emkan@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbdoM2mM5jbacQ4KkMlFTMMJwPScHQt58OKfinY9xQRIwnLRM9c0dnlT2A80eMC3K4RBtBpNkfYVe8a9keY5Hc4i31ASUDRpuisQNqMbLHFy6fOfpPL0JggTR4CQC0FMamDI2pKEx8+xbx6EQqJ097QQqwRjcZhe+PsdHfgLkRqUecYuPhuguyZGYVQfOxURhUbKbto/QZXgsN7l2V9LmepgtYX3MjtnVGrQU1a4ZDAqOQWAXxAhXh3NBC0jonMyNQSlRuJ0szdTbg1dAnW6/+p7AcetKxchDLRtejvFAVXVFYczJyZcoSfQVK8tJ5JuH1ij0shdnPG7vEnhdWDWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xU2Fv45PPPqQw4drHJ3zLq3MrY3eLVIcdihHOic7WA0=;
 b=UlnyTOxNETWs2Fl1F/6nCVKj2vjnF6fQw9IzcuWH0KDJyMlrpUNDXgh5PNM9s4tLno/cyRUzp+Zv1htR+cxDVt8+vo3hvgq4uB2b6mtjITsSuPHsK15xAV4F3RBaMvMfTad6M8D6n/QzNu0kunteHhxnHhB6IOX3S3o0xvhwKSr5iecai3NnrJpOha3jvjQ2fEWSXaG/s9667Eev+n/7Q8AiIyWNXzTb/Ou7Be5IxJtwMceacDIx0gVFXhPkG9cUnn7ienF/2ZtzjYnD1/l6K/tEy7oz4N0K19XCxahLkS99DkdRm2zpE7l5xMA2JFU8YBrUN0y05uSE/58YKHLtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU2Fv45PPPqQw4drHJ3zLq3MrY3eLVIcdihHOic7WA0=;
 b=Qn6J5D5AqWiyWwljYBkjsJcEN3nJY2oXUwajf3wrLjmfkY9UGHZHpWn5L9WG70ezSWkE0vsJ+K1Q4aclBzy4m3ve+xXzeeLiUdBh+uxl1QSwaHVsLFCAqcp2QL4c+tb+rpeVX4SnvoG3vkQOFkC3eruMm9olMxBypasjn29diKs=
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by DU0PR10MB6274.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 07:18:22 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 07:18:22 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: AQHZ1pCnD8HIvlN4GE2Gd3/khZMp+q/7ISmAgAQw64I=
Date: Mon, 28 Aug 2023 07:18:22 +0000
Message-ID: 
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
 <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
In-Reply-To: <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB4576:EE_|DU0PR10MB6274:EE_
x-ms-office365-filtering-correlation-id: e40d805a-ea3e-4117-53e9-08dba796f674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nRvu55SxgZH6NrCyG6LZcIXsiNP+vKiHNcAGoj6yG1n9ly1AByVQ80SpuwhoN8YXaZ8t22wMflsd+DSg1l5Zr4Yc0Zz+r2Xfuu6Dw/QnJoBwyR+Md5hWC2L3RZ1JEG3zWtT1uusr9ANYnuE3hboHSJAqXx8R57vi6bJ+1TecP0rRJUizl2FebQBognVHI6JSHVjEkcskDy5idJrJgN8+TW1xWjpSFTeYvl645p317fMTqhWXKbjJWscm+UVJeZhhyoLeuvrDDLNCfjVvHymV1Q4Nan6o7Q17ltqu/VMEKxLq/WOaHbzlW0QEY2ajJI3IiYUgCQGr56FEWn1sSBs/YiCH1Zh6TChb7I3+Fs9m/bDx4hdq5ivtlY2uBgdVSSlE6fEsiNb4NWKgXvv7ETpG9V8mzox+7Be3ucXrxIUClObdS/ZIkpt3D5rgT7DYyNmGkxUaOuLkHXXUySn3JEaHiAnJnblklEkJwRuwhbKo8pPB+Y03mFDyupd9a+lBLO1WmURy2qizkRF4zGjyAxku39AtyU3XszpCWMno4fVFVhQvWm0kX5oijsTcgo4P755DTEJBSXTG6O5RJ1rLUnFuZWFsEs9vzRk5rud+aAxRBKxqdlWgCpZsbeQMurs1GQme
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39840400004)(346002)(1800799009)(186009)(451199024)(71200400001)(6506007)(7696005)(9686003)(53546011)(26005)(478600001)(6916009)(66556008)(64756008)(52536014)(316002)(66446008)(2906002)(8676002)(5660300002)(66946007)(76116006)(66476007)(8936002)(91956017)(4326008)(33656002)(86362001)(41300700001)(55016003)(38100700002)(122000001)(38070700005)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SkVEWHc4QzJsVEN4amlDVStSVDU4YjhIc0J5cjI5QXdMclhXNWNjYkdxN0VK?=
 =?utf-8?B?cS93VUVFL2tEWllLZUI1VEM4cFFXZXZ1OW5udEFzL0w3K0UyMUxpeHpDbmFF?=
 =?utf-8?B?NC8vRGZubXhmZENsUmEvYjYwUGtPNDBFbElFVzd0b0lMandKUWtROVRVN1Iv?=
 =?utf-8?B?cDdHdDFZcFBDMDBrSVBOZktDR2trRGVhSzl3Q0hRWk11eU14cWZWZXFjUnd4?=
 =?utf-8?B?WUVxMnZWeWxzZzFQUTRoN0pIYUh2S1dvaTJNYXhxekFRQURRUUxnbk40WnBZ?=
 =?utf-8?B?S29kVzdxbTU2bXQ4QWp6YnAwNUsvT29VdmtNWUhSNGF6ZjViWjdjU1ltVHpk?=
 =?utf-8?B?ZE85d2FQVXJ0cGk4SDMrNzN3L0J3MTRBcXhNTGtVR0xhQU9TbG54ekplbEFO?=
 =?utf-8?B?NCtsUzM1MWlFeWUzQURMV2N2ZG1CZERZb2FndjFPQXVYSVFjbU9wWTgwVVIy?=
 =?utf-8?B?NnFxVThZODlPb3B1dnc0RjFVbjNJWlgrUnNWN3dmdzUvbFlENGVhaHp4ZnpU?=
 =?utf-8?B?TXFLZGZCM0Z2T29remk0TlFiTGNuMmJEQzd5L04wYytYV09peUIveTlPZ1d6?=
 =?utf-8?B?T1pNUUQ1Z0ZTMElmNTlFZTRKektUY0Nmb1JSME9QQ1BCa0lOSzV5UE5odTJr?=
 =?utf-8?B?NzRCSWFjTFMvWTk5ZEI0WUkvZHJXL2VzUlZwQ2RuelJJd0Z6dGFLM0N2cXIz?=
 =?utf-8?B?dXJHd2djMm5mWUF0SUh3b2t0RGFHZDZHUS9HTFoxSmplYm9RTEhpYXd2NDRz?=
 =?utf-8?B?VldLbCt3a09qQ3padmpKcDZlbkVjdjhpdVlWdE5FYVQ3OEx5UzJ1RE1Dbkpy?=
 =?utf-8?B?TVR3dnVnREJ1R011Z01ibXpiOWJmYjZJcTNxY3d2QjcvZ2NLaG1JcDhoY0pi?=
 =?utf-8?B?NEpSQjh2cUpVWW95aXdVVHBYejE3eXJUOHFJMmJHZVVrcXc0cXJHQ3pIei9B?=
 =?utf-8?B?Q0FPOHNmRXZJbU1YKzdCMFRmMTY0dmtkMS9TVlVVTi9PZ2prTStoZCtZZ3NN?=
 =?utf-8?B?U0pDcVlYek9hN1BzV1hwWFMwZlRGQ0cwb0pFTVVtajE0LzNOWmdwZkVycjda?=
 =?utf-8?B?c1J6YnExVk5jMXVQcm1zNHZhOFE1K0tMdFcyMjNvLzhGQ2hmYWY3K0UvRkRP?=
 =?utf-8?B?OTlyNi92dXZPWEpFaWY0T1JyOXlqWEUxa3hObmxpbDFJZEExQXI4eGRLMzVN?=
 =?utf-8?B?bDE2aVNpL2xxTTFDS3FwZUlwU2Q4R2xvNXpWb2dRT29BVUUyUjhRN01uVmVp?=
 =?utf-8?B?UWlHa0xiTFR3b2ttdzFqZ1N5Y3pjVDNhWDY0U2MzYlZqL3lLa0VMRC9YTzBq?=
 =?utf-8?B?ZVRINXhiSkVXalFsZDRnUW9Wb1l0RnE2SEcyZ3piTUNkcG5VSDdIUlRjbk8y?=
 =?utf-8?B?TGppRG04aHBnalJzU3BsTVVZVDc3V3pETHdMVzhxdGJZNHZuOFBZa1pUUFJv?=
 =?utf-8?B?MjhEcW9MU1lleUQ2YTdsY0ZRbEdxNnRuMktlblFmdC94dzFKSWg3enNYbmhx?=
 =?utf-8?B?ajVzQkFqMTZORVBQQ0hqMW55RzRvY0dIcWZyYnZvUnpyNmhZOHJpSlI2Q2x1?=
 =?utf-8?B?QnZkNks2UHhTckhsZWRlbHhZNXE2aEo2NWpxeTdGUUFwazBLYlBVTWo2TTdP?=
 =?utf-8?B?SlVrTTJ5c2lyV0p2alA0QWZyd2pPWVM4Q29BMVF0UXo2SkJqSjY1NXR1K21V?=
 =?utf-8?B?UDJjL2wvOHVnekFlZWpmVXVDQlp2bVFUdXB6cmhoWU94aE5KMXpDWE42cUNP?=
 =?utf-8?B?MC9PcnFja2Y4dXlGZlNVcDZLeUtzSWVieThrMkphMytkb0JkYTBjTmFFWkI3?=
 =?utf-8?B?SWJYUVhLT0Y4TDJWd3k4dXYxT1doclN4ZHNsbGFNcmdUU21BMHhNdXYzTTdl?=
 =?utf-8?B?Y1VhUkVqc2hrNlVlNG9IYysxSUtkQ1NNU21aSnJUSEJiY3lONHlCQnF6Y2tY?=
 =?utf-8?B?SXBaTFE4VjIwbGh2Q2dKa3NoK2FMbkttM05lNWF3M3Boc3hpMGZLSXBjSnNP?=
 =?utf-8?B?ZUtucUxSc1BTZ1RrckNTZEVORThqVXA5SGpmeHV3NWU2RkNXaEk3Q2ZCa2xK?=
 =?utf-8?B?dWtMTFFzNTNORWRVNFdNTUJqaUUzeU9oWHo0aWhucm1CYlVtRmlwekwrcnFR?=
 =?utf-8?Q?Ppo5HIzibd54F3kFf1Wn1YZqk?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0APA4PR10MB4576EURP_"
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e40d805a-ea3e-4117-53e9-08dba796f674
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 07:18:22.4471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/R+mThEUKkhq9fOyEkNKvlaUqBTfW2fXoEwAJ58rzQEB9Y1cvYH+HIQRoe1prke9IWkJPUdzhUHN37heHcX9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 07:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186817

--_000_PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0APA4PR10MB4576EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KTm8sIHlvdSBhcmUgcmlnaHQuIEhvd2V2ZXIsIEkgdGhpbmsgaXQgd291bGQg
bWFrZSBzZW5zZSB0byBpbmNsdWRlIENWRV9QUk9EVUNU4oCLIGluIHhvcmctbGliLWNvbW1vbi5p
bmPigIsgaW5zdGVhZC4gV2hhdCBkbyB5b3UgdGhpbms/DQoNCkVtaWwNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQpGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4NClNlbnQ6IEZyaWRheSwgQXVndXN0IDI1LCAyMDIzIDE3OjE2DQpUbzogRW1pbCBLcm9uYm9y
ZyBBbmRlcnNlbiA8ZW1rYW5AcHJldmFzLmRrPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAzLzNdIGxpYngxMS1jb21wb3NlLWRh
dGE6IGFkZCBDVkVfUFJPRFVDVA0KDQpPbiAyNCBBdWcgMjAyMywgYXQgMTQ6NDEsIEVtaWwgS3Jv
bmJvcmcgQW5kZXJzZW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGVta2FuPXByZXZhcy5k
a0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4NCj4gU2lnbmVkLW9mZi1ieTogRW1p
bCBLcm9uYm9yZyBBbmRlcnNlbiA8ZW1rYW5AcHJldmFzLmRrPg0KPiAtLS0NCj4gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44LjQuYmIgfCAyICsr
DQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4MTEtY29tcG9zZS1kYXRhXzEuOC40LmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44
LjQuYmINCj4gaW5kZXggMjEzMWY0NjIxMy4uNWQ1NzYyNDU2YyAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44LjQuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRh
dGFfMS44LjQuYmINCj4gQEAgLTMzLDMgKzMzLDUgQEAgZG9faW5zdGFsbCgpIHsNCj4gUEFDS0FH
RVMgPSAiJHtQTn0iDQo+DQo+IEZJTEVTOiR7UE59ID0gIiR7ZGF0YWRpcn0vWDExL2xvY2FsZSAk
e2xpYmRpcn0vWDExL2xvY2FsZSINCj4gKw0KPiArQ1ZFX1BST0RVQ1QgKz0gIngub3JnOmxpYngx
MeKAnQ0KDQpUaGlzIGlzIF9qdXN0XyB0aGUgY29tcG9zZSBkYXRhLCBpcyBpdCBmZWFzaWJsZSBm
b3IgdGhpcyB0byBoYXZlIGEgQ1ZFPw0KDQpSb3NzDQoNCg==

--_000_PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0APA4PR10MB4576EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KSGkgUm9zcyw8L2Rp
dj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
Q2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj4NCk5vLCB5b3UgYXJl
IHJpZ2h0LiBIb3dldmVyLCBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gaW5jbHVkZSA8
Y29kZT5DVkVfUFJPRFVDVDwvY29kZT7igIsgaW4NCjxjb2RlPnhvcmctbGliLWNvbW1vbi5pbmM8
L2NvZGU+4oCLIGluc3RlYWQuIFdoYXQgZG8geW91IHRoaW5rPzxicj4NCjxicj4NCkVtaWw8L2Rp
dj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5s
aW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RN
c2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9u
dC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUm9zcyBCdXJ0b24gJmx0
O1Jvc3MuQnVydG9uQGFybS5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IEZyaWRheSwgQXVndXN0
IDI1LCAyMDIzIDE3OjE2PGJyPg0KPGI+VG86PC9iPiBFbWlsIEtyb25ib3JnIEFuZGVyc2VuICZs
dDtlbWthbkBwcmV2YXMuZGsmZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnICZsdDtvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdIFtQQVRDSCAz
LzNdIGxpYngxMS1jb21wb3NlLWRhdGE6IGFkZCBDVkVfUFJPRFVDVDwvZm9udD4NCjxkaXY+Jm5i
c3A7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0i
MiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQi
Pk9uIDI0IEF1ZyAyMDIzLCBhdCAxNDo0MSwgRW1pbCBLcm9uYm9yZyBBbmRlcnNlbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyAmbHQ7ZW1rYW49cHJldmFzLmRrQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBFbWls
IEtyb25ib3JnIEFuZGVyc2VuICZsdDtlbWthbkBwcmV2YXMuZGsmZ3Q7PGJyPg0KJmd0OyAtLS08
YnI+DQomZ3Q7IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4MTEtY29tcG9zZS1k
YXRhXzEuOC40LmJiIHwgMiArKzxicj4NCiZndDsgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKTxicj4NCiZndDsgPGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44LjQuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvbGlieDExLWNvbXBvc2UtZGF0YV8xLjguNC5iYjxicj4NCiZndDsg
aW5kZXggMjEzMWY0NjIxMy4uNWQ1NzYyNDU2YyAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4MTEtY29tcG9zZS1kYXRhXzEuOC40LmJiPGJy
Pg0KJmd0OyArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExLWNvbXBv
c2UtZGF0YV8xLjguNC5iYjxicj4NCiZndDsgQEAgLTMzLDMgKzMzLDUgQEAgZG9faW5zdGFsbCgp
IHs8YnI+DQomZ3Q7IFBBQ0tBR0VTID0gJnF1b3Q7JHtQTn0mcXVvdDs8YnI+DQomZ3Q7IDxicj4N
CiZndDsgRklMRVM6JHtQTn0gPSAmcXVvdDske2RhdGFkaXJ9L1gxMS9sb2NhbGUgJHtsaWJkaXJ9
L1gxMS9sb2NhbGUmcXVvdDs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICtDVkVfUFJPRFVDVCArPSAm
cXVvdDt4Lm9yZzpsaWJ4MTHigJ08YnI+DQo8YnI+DQpUaGlzIGlzIF9qdXN0XyB0aGUgY29tcG9z
ZSBkYXRhLCBpcyBpdCBmZWFzaWJsZSBmb3IgdGhpcyB0byBoYXZlIGEgQ1ZFPzxicj4NCjxicj4N
ClJvc3M8YnI+DQo8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2JvZHk+DQo8
L2h0bWw+DQo=

--_000_PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0APA4PR10MB4576EURP_--

