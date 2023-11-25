Return-Path: <pawan.badganchi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0B7C61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 07:47:22 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.43])
 by mx.groups.io with SMTP id smtpd.web10.21878.1700898433379442708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 23:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=uDeQVHJY;
 spf=pass (domain: kpit.com, ip: 40.107.222.43, mailfrom: pawan.badganchi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL4kta2KZRckuwm8PCjTn5LX2kt8eBD6p4X0bETZo+zx3O7V+yUoHmkApBs6XPncGttYN8CzdGWnzfreZbUEsJY749RDWrgVWjUwvec3ezgV2nHJXzPkJKFfaKN1zkZBDPFCDikXrIFMY+CoqeGeP+VGjt4wWc86JV0RPp+m2+ucV0ZQ8RP6UWtJURwfuW/lk7GaQ2jl5V3vdN8UnYYkqEBHj3Oj6WmMmfNt6udS8zpVaYmGee5M9I46MTcuuZcZ8Jk8/iqtvgB2mIPe14EN/TmXokn/ZlhkLlUTZsGfheIwUYuhxL14/B67WdkBuzylrkEJftf3zPJZ63J3avQ1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSMOpxFuJTWMbLi/SlpUKGHRiXqneX7duPLsUYLjTPI=;
 b=KcUm2+ErNFzzk2Xh9YMW2+BNHNpMPCtxtHYl+qvwG0fmm6ngJcK6x9YVyv/kIACOi7hWbA3moKOCWIZidE3gF7H0U9innXLFaG1z9SYRn/5o73rU71F+s9Hz6ng8csSGbAouDbBRij/2W2hn6Fc8et1X2wvLWQOl0A4ZpCScwEioTU24E3j+vP1nuuEcZRMxkEPnu/bOSeUpBWFigaZV7+ei0iMzmfQW2Jn8eUeSCXxQBcuV0aM2/irp0NNufSyzwK/b7NyoIt0rTQUgSTmvUuxfZt9B7u30ik8qokjm6KBYC883S5xBxH3hAQeTXtqLL5DkTLDynR7v2jFPzXud/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSMOpxFuJTWMbLi/SlpUKGHRiXqneX7duPLsUYLjTPI=;
 b=uDeQVHJYXJ9K19SrIBYCT2Ahf7Tvu7VZYakYTXWBXrQ17woQ5CDVKfhO8X6v1t8/TAS6/l+We+6s4D/Pu8LJGRyay4oUBdjhFiTRqkCJzS8z5LRW4N3L9JCALsMb/0jC73jCtdJuVp3vPSJykJ6Zr6Y68IYbiP1x+yLWBzYiU4g=
Received: from MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:74::11)
 by MA1PR01MB4116.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.23; Sat, 25 Nov
 2023 07:47:08 +0000
Received: from MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d391:3ae4:32a3:a4f4]) by MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d391:3ae4:32a3:a4f4%5]) with mapi id 15.20.7025.022; Sat, 25 Nov 2023
 07:47:08 +0000
From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Regarding geographiclib cve scanning
Thread-Topic: Regarding geographiclib cve scanning
Thread-Index: AQHaH3N+BOQiVpv0TUO1D0YQC5Hidg==
Date: Sat, 25 Nov 2023 07:47:07 +0000
Message-ID: 
 <MA1PR01MB354521DEC73A75A9EC70CB9F99BFA@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB3545:EE_|MA1PR01MB4116:EE_
x-ms-office365-filtering-correlation-id: 33d51379-0b90-42d6-732a-08dbed8ab9b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p/ojK8a/suCIoqgwreUf6JdoZPbjAxG5tQ2w7K6TcSpMtDNS6VyizV4Jp+bu4bzXctunjKpXiy1sEU21MULoe6pVg8uZnjezKo6jDXycZrZfa8o827vmHVv4jaRUmhiC4+MYRA5s9X9q4x85VO6i06STnRPXnA+xYHTpBW4vQ2UGj2Cj4IUiwb7rqO3qMYDGEx9prppX34p76Hi4K1k1tSsXO/BZW6gfy0sLX0x/WNZw5tzPLHFMxmx97Cyn4QJTotNtMI/vDEuAr2jsmLEiJlSs8F/Hok4pO7NSs0SHTG3NL4kGGjB2e5CkvAdZodRNHZuUI1Tq4hG9Rf+XfwIAbTJ26sTS9zyhvlaD2JiPPkTZIoS++vKekRWBXZC9lX1j38mbRtnQ8dXGUYIxxgJy3pOV5H6jBmVTkZPL94tc+G5u2e8GTKG9bg/3C1YeUzdyMBmNDZd/JYTzGGd6rF72LDSiSt5IuwFM6wBm4nU6iLutGKs56wMwJyYmAyeHcuGrbfDUx8zfnB1GQABlOkjK0uEIkKNhrFHyg2cN5hFWa7qsoahVZTRb0N37JhtrIvus0IAYhYMgOKLXwzoCFxDNrlbRsTq3pMon+uc55Tm0mRuz0k+O9RgIX3IngTMgX29j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(38100700002)(66574015)(26005)(8936002)(8676002)(86362001)(3480700007)(9686003)(6506007)(7696005)(55016003)(122000001)(19627405001)(478600001)(71200400001)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(6916009)(316002)(4744005)(33656002)(38070700009)(41300700001)(52536014)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OXFRSmRLd0JxbEJmMGJYYmxwYUR4YUp6NzVmenExS1BObnhsUUFXeDU4bUdL?=
 =?utf-8?B?Z2lZTlMxWjUwejBuV2VVUjJYZXJzc2lTN0dJb3VuQWlIcTBaSzBWMnhhOGZh?=
 =?utf-8?B?NnNCWm0vbzZHbXcrY0FZbGZGYkM0OVpFa2Z1alZab1d6R2lvYmNyekdLTlVB?=
 =?utf-8?B?bXV3dGdCVy8vRCtZZjVERXg0MDhZTHJmRzRVVWFEcElHakNQYVNUVDg3V2hn?=
 =?utf-8?B?M012aWJDeGVTSXVyMFlHc3lPUVJqcVVIb28yWkFHNzdLZkc5NGo4THFnelBM?=
 =?utf-8?B?M1N4Y1didGtQNlVFTUNuWEpBN2I2V0tnbG5ubDBQdzdoY29YSXkwWXZaVEJV?=
 =?utf-8?B?dVdxK0w0d2RQZktic0hZT2Rva1g2cFNXOVIyN1dVbStCdms1QXl3djlyQXpR?=
 =?utf-8?B?dVBjRHFrU0ZLQ1VHMkU0eElWYkE0UFlvUW9JWUpEL2I4VVp6QzRzNnlSWUtN?=
 =?utf-8?B?TGVFVDlhbGtpWkVRQi9wdnc2cjhrWEZXam1GZEcvMDJrcXhFNktWZE9kN3RZ?=
 =?utf-8?B?VmZnandWbXdlelJVNStXdUdEUTFNWk1XbWlEalMxemJoblJOazF3YTFkVGcr?=
 =?utf-8?B?TzdNb2JyVTZUMDVXa3FpRHpuelBLdzdqd3V4Qm5wbGVOWlczOWEvQSs0SGFY?=
 =?utf-8?B?QlowVXF0T2hnZjIxUTlnNnJmbEI3ZXB3WFpwWktvUXVYZUNCY0FKbEJxdldE?=
 =?utf-8?B?YXB3eEpjOUxxSm9RYkRzZmUvVGR4NTZUTHNDRGpZK3BVMGhXeDhGWGpWVTI5?=
 =?utf-8?B?eXB6ditHUlFEZFN1SWxmVnZEQzRJR2lQMEsxMXBCYytXcytmbWxSUWxrQWFv?=
 =?utf-8?B?eUFrM1IweFh1dHVBZ255T1FBRkdtMEdxR3BjTHhFYisvd1ZKNS93aldMdWx5?=
 =?utf-8?B?NjNNUTkvNkt0amtBbGt0bWtGaHhnMWlTQzNoZ05Mcmk0YzZNdWR6MUhmZjRO?=
 =?utf-8?B?TEJDN0hKdUlOTEk0cEZibGg2eldjaDhQamhsdUFwV3BMOHhId3BDMmRMVVpw?=
 =?utf-8?B?anhFaXVqK3JHK1p5Q29JUHJFMUE1bjVpVGlsakxxSWdQM2QxTFZiT2VOVFcx?=
 =?utf-8?B?VjBpWmE5Vkh2UXhNZEp4YzliZDhhWlJMbVo2aGszZTJydEFNdDd1TXhZK2o5?=
 =?utf-8?B?b1hzZVYydmowNnZ0cnR0aG9LZTVJL2ZPbFVhYVJkcDhFVUVhOUlRdjhmeWh4?=
 =?utf-8?B?SDFaYUcxZHFQSU1SdDVIN04xb2NwWUgzeDZybWl1MVlkWlNuQWtlV0tITkxS?=
 =?utf-8?B?T3dOdnZLMVBpdzVGRGFUTDdiTW1BcGt0WWFrMFVFQ0cxNkoyU2ZkbFdJZ2Jq?=
 =?utf-8?B?bUk2akk3djdJaHFwNGsrNmh1UXBZc3NQbHZaSzMzQzdoMTFJdnhJNjhsZ3FB?=
 =?utf-8?B?Zml6dFRpQlc1WDZIOFRBK3dHdmNpZy94Nk1xWXJQdHA5ZVMzanE3czFJSnRQ?=
 =?utf-8?B?eVZ6RGJIOFY4U1IrdEU4aTY5M3JnK3E3RithQjl2dHJkQm4xOFNzbnZvUlRV?=
 =?utf-8?B?MzlVV2t6UVh2ZE5GVGFoN3Z1L2pPV1BJRE00ZG5vWGxYOUdxb1RYbFhQbkVp?=
 =?utf-8?B?MTFqeFdURFVRL1laOTBUd2hjMzlGejNPa0g1K214K3Z4L29oeURpOEE3dkdF?=
 =?utf-8?B?Q0hvczdVMFk3ZWhVTnpCQkJDYklBVFJYMmFEQ1BUWXNnT1dCNzFqcExIb2NG?=
 =?utf-8?B?N2s4UTU1TTliMU1xZG9obzRBSFVrTkJ3TU0zV2w5LzFNZUZXRGZQN1p5R1g4?=
 =?utf-8?B?aFRZbFYrRTJqanRHOEJJOGovbmVwcUw4bzB4WmRycFNLVU50K0pFYktLZTlj?=
 =?utf-8?B?SlpwN3NvZHh0VDd0dDdCNkFreVltdXVhY1Z5amNLT0Rvblo5R1JCbTlhQytx?=
 =?utf-8?B?QXQ3N3N2dDJ2Yk1tczZtZVpDZWhadnhPNk1TZzdMN0tMcSttQ3Z5QTFJNGlF?=
 =?utf-8?B?S1daeEhsTTcvbUE4VzMyS05vSkRyNkJ0Mm9UR2lEUjkyNG1TR0N6djJKOEFy?=
 =?utf-8?B?Ty9VNU51TklSNGdrYXh5K0YreE94TU95bURaUUp3c3VocGNtMklHTFdsV1NM?=
 =?utf-8?B?VXVPd1ZvYlQzNno4K0VOQnNXOHhKNGVWMWZWMkY1WUJ5N2VxUVdTY3RFelZn?=
 =?utf-8?Q?++R0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB354521DEC73A75A9EC70CB9F99BFAMA1PR01MB3545INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d51379-0b90-42d6-732a-08dbed8ab9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2023 07:47:07.9989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdSUGSJlUrdk7Gxu23U7ATHjObZ/Wt9VK9/sT+jXSFqVeWYAzYf3zNB8qHn5bM8qc1Hpqr7soWiaRbH6S6SK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 07:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191222

--_000_MA1PR01MB354521DEC73A75A9EC70CB9F99BFAMA1PR01MB3545INDP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGVhbSwNCg0KV2Ugd2FudCB0byBzY2FuIHRoZSBDVkUgZm9yIHRoaXMgcGFja2FnZS4NCkNv
dWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB0aGUgQ1ZFX1BST0RVQ1QgbmFtZSBmb3IgZ2VvZ3JhcGhp
Y2xpYj8NCg0KDQpUaGFua3MgJiBSZWdhcmRzLA0KUGF3YW4NCuKAi0tQSVQgVGVjaG5vbG9naWVz
LFB1bmUNClRoaXMgbWVzc2FnZSBjb250YWlucyBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcml2
aWxlZ2VkIG9yIGNvbmZpZGVudGlhbCBhbmQgaXMgdGhlIHByb3BlcnR5IG9mIHRoZSBLUElUIFRl
Y2hub2xvZ2llcyBMdGQuIEl0IGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gdG8gd2hv
bSBpdCBpcyBhZGRyZXNzZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQs
IHlvdSBhcmUgbm90IGF1dGhvcml6ZWQgdG8gcmVhZCwgcHJpbnQsIHJldGFpbiBjb3B5LCBkaXNz
ZW1pbmF0ZSwgZGlzdHJpYnV0ZSwgb3IgdXNlIHRoaXMgbWVzc2FnZSBvciBhbnkgcGFydCB0aGVy
ZW9mLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgdGhpcyBtZXNz
YWdlLiBLUElUIFRlY2hub2xvZ2llcyBMdGQuIGRvZXMgbm90IGFjY2VwdCBhbnkgbGlhYmlsaXR5
IGZvciB2aXJ1cyBpbmZlY3RlZCBtYWlscy4NCg==

--_000_MA1PR01MB354521DEC73A75A9EC70CB9F99BFAMA1PR01MB3545INDP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFw
dG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+SGkgVGVhbSw8L3NwYW4+PC9kaXY+DQo8
ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwg
QXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij48YnI+DQo8L3NwYW4+PC9kaXY+DQo8
ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwg
QXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5XZSB3YW50IHRvIHNjYW4gdGhlIENW
RSBmb3IgdGhpcyBwYWNrYWdlLjwvc3Bhbj48L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1By
b29mIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQs
IEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Q291bGQgeW91IHBsZWFzZSBwcm92
aWRlIHRoZSBDVkVfUFJPRFVDVCBuYW1lIGZvciBnZW9ncmFwaGljbGliPzwvc3Bhbj48L2Rpdj4N
CjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBB
cHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8
YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGli
cmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgaWQ9IlNpZ25hdHVyZSI+DQo8ZGl2IHN0eWxl
PSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6IENvbnNvbGFzLCBDb3VyaWVyLCBtb25vc3BhY2U7IGNvbG9yOiByZ2IoMTIsIDEwMCwg
MTkyKTsiPjxpPlRoYW5rcyAmYW1wOyBSZWdhcmRzLDwvaT48L3NwYW4+PC9kaXY+DQo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsg
Zm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6IENvbnNvbGFzLCBDb3VyaWVyLCBtb25vc3BhY2U7IGNvbG9yOiByZ2IoMTIsIDEw
MCwgMTkyKTsiPjxpPlBhd2FuPC9pPjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQ29u
c29sYXMsIENvdXJpZXIsIG1vbm9zcGFjZTsgY29sb3I6IHJnYigxMiwgMTAwLCAxOTIpOyI+PGk+
4oCLS1BJVCBUZWNobm9sb2dpZXM8L2k+PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTog
Q29uc29sYXMsIENvdXJpZXIsIG1vbm9zcGFjZTsgY29sb3I6IHJnYigxMSwgOTIsIDE5MSk7Ij48
aT4sUHVuZTwvaT48L3NwYW4+PC9kaXY+DQo8L2Rpdj4NClRoaXMgbWVzc2FnZSBjb250YWlucyBp
bmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcml2aWxlZ2VkIG9yIGNvbmZpZGVudGlhbCBhbmQgaXMg
dGhlIHByb3BlcnR5IG9mIHRoZSBLUElUIFRlY2hub2xvZ2llcyBMdGQuIEl0IGlzIGludGVuZGVk
IG9ubHkgZm9yIHRoZSBwZXJzb24gdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgbm90IGF1dGhvcml6ZWQgdG8gcmVh
ZCwgcHJpbnQsDQogcmV0YWluIGNvcHksIGRpc3NlbWluYXRlLCBkaXN0cmlidXRlLCBvciB1c2Ug
dGhpcyBtZXNzYWdlIG9yIGFueSBwYXJ0IHRoZXJlb2YuIElmIHlvdSByZWNlaXZlIHRoaXMgbWVz
c2FnZSBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBk
ZWxldGUgYWxsIGNvcGllcyBvZiB0aGlzIG1lc3NhZ2UuIEtQSVQgVGVjaG5vbG9naWVzIEx0ZC4g
ZG9lcyBub3QgYWNjZXB0IGFueSBsaWFiaWxpdHkgZm9yIHZpcnVzDQogaW5mZWN0ZWQgbWFpbHMu
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_MA1PR01MB354521DEC73A75A9EC70CB9F99BFAMA1PR01MB3545INDP_--

