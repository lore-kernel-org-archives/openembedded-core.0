Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDACBC9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 10:18:27 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54258.1790590699396335775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 03:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=d22/QJz/;
 spf=pass (domain: einfochips.com, ip: 52.101.85.45, mailfrom: bhavesh.maheshwari@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRXOV9AH0Rqg334TYl7VhZcTEe4SFnUmn8uFGmQpPu7e48UnHCLt0U5iKIootyS7w//oCU9dJrz6GHYfRCR3Uj3DYMiEHHbq9oCs9gBCQ9GjObm17S/yHeUYd5d0ivya27VRhLq3I4Zzctxhh1ULucKxya6laD0kQydL6OkePYFYrziTI/B7OP//d9kDVV7dJyG2sbT2YtRqmGPohqpCWCu4EQnWAkKh3bI8jA3LfUcHICBudrAfw43qY3YxcHU1FmN8X4RlrEs3OkqPTQjY2+ZT/5pnlKmsH3lb7A+DWade60rCXpMpgHNCZFfniAO9CQ/RTqIAG1/yNQ+RJ3Lurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2BV8ulziK0pcWNrh2KMC29dGrG7LCqOR8Guh++zWRU=;
 b=HD233XWjWULkDlKLMqQ5eNL9jk5SGcXOD1oYpb5DSoUFI8BMzbF24KvBTnEG/Dxv0ITJI4ynlkJ4EHzrLeKjdExzFmpyRcxlqbhHjuQ+ldkQSzFNALjUhl9yOqowa/dQ5g1Z1awSytahvQ5FEOu040X8xRCUzunptUD9Y7gWb/an/GJ8hW/VLdt0cxC8o5boByAn7PLe380R8GSEcCSRR2Bs4SsVw6MRxGVCPKjQ/VWeFzIS9iPou0GaCLzZuM5+vAYpEhMcG6t2/cVEOnG/v1qmSA+vJg7zZH47nPv+hJCi+ROvuSv5lNs/35KvN9HX4CjXDJ5Vf+pv52BgTifivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2BV8ulziK0pcWNrh2KMC29dGrG7LCqOR8Guh++zWRU=;
 b=d22/QJz/TpAEAyIcJ8MRR/2WRz2DPdaPcNa9RHLBER1/peQ3KPwirrZRYFoShLLUURQ+EfrVP5fGyJPaxhEakPWQthgnm0+LFx7YmMu8NUB/EfmcJKMMlK0H6N67UBtLJR+6whKMxTOl2bmq/q5pLrZt3JzTI/F5iBQVxO92F7g=
Received: from SN4PR04MB8398.namprd04.prod.outlook.com (2603:10b6:806:201::22)
 by PH0PR04MB994389.namprd04.prod.outlook.com (2603:10b6:510:43b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:18:11 +0000
Received: from SN4PR04MB8398.namprd04.prod.outlook.com
 ([fe80::4939:9b85:fbf:521d]) by SN4PR04MB8398.namprd04.prod.outlook.com
 ([fe80::4939:9b85:fbf:521d%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:18:11 +0000
From: Bhavesh Rajesh Maheshwari <Bhavesh.Maheshwari@einfochips.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for
 CVE-2026-66041
Thread-Topic: [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for
 CVE-2026-66041
Thread-Index: AQHdTfbW1nmIUypNQUiq3oE2xHbERbbjyTrq
Date: Mon, 28 Sep 2026 10:18:11 +0000
Message-ID: 
 <SN4PR04MB8398087B79EA4DA077A16DD1E58D2@SN4PR04MB8398.namprd04.prod.outlook.com>
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
 <20260922070209.2770399-5-bhavesh.maheshwari@einfochips.com>
 <DLPJC96BOERE.3M87L9353GN17@smile.fr>
In-Reply-To: <DLPJC96BOERE.3M87L9353GN17@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-28T10:18:10.928Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=1;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR04MB8398:EE_|PH0PR04MB994389:EE_
x-ms-office365-filtering-correlation-id: 37372c0b-2a2c-45cc-b8d6-08df1d49ccbc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|6049299003|23010399003|39142699007|31052699007|376014|1800799024|366016|10067099003|11063799006|260925021311599003|260925022911599003|260925021911599003|4133799003|8096899003|18002099003|55112099003|22082099003|56012099006|4143699003|13003099007|4053099003|4013099003|38070700021;
x-microsoft-antispam-message-info: 
 jol+y9era2E5sAQXYOWLCJADtl85fzPVKbXg07CRLVvafiG7dkjJWVh7BpyJv8dmtTT6BSLX2kJjCB/eLs6cNdHm6WTep1WIxJcTLolAiCa5ZPJANTNO6DWvkBt98X0/TRqjh4Bn4njOamMdB94BHN7ueYVmq2eH5fxyWp8ucQCjz0rQD1wmto64O+oVyBax+EZl0/oJWYUzsC2M2I/u9d7aqDEXad9DwPDpgnyVBjznDG7U/leYtiLddh9vqT21lK5shHhfkLK0hVqBuR2nAGtU9PIIpgwT5xlmwVJs4LSiILnbFmpW+ie28nhxbM25zbOuwYCvgrYLJujoE/FRKL+SRywJk7cQIpSrudW/PK+eEEgL8LV2I5Og4txmH1X8S70N3Ax/eCYXCUBhZTQTYi/hWWWMERw4/Um/+2lhPDWbsGCLSnQkKAzZst0pBZaipbsdxrMk9+JP3+N75TVdOiPme2HqSq/HOZtrEh7Rk+MPeZmpw/PiLTPtJcAXhq52bRi4C1+xPGxgnxqLzSc8ZoPMPih5N+04Q1l8ljM1TpUsIVZevYS1bSkw93xYXInyhVddu/5zIAXYodewYtbfi3MOghdbMEA0Wvulto6vxH4EVvKEnY8gucDJrTsK1vocA3v00/aLCe+LxzjoU01aI9V7deviZ2hM8X2WIQd6pJE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR04MB8398.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(23010399003)(39142699007)(31052699007)(376014)(1800799024)(366016)(10067099003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(4133799003)(8096899003)(18002099003)(55112099003)(22082099003)(56012099006)(4143699003)(13003099007)(4053099003)(4013099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?u7pNAWH7DrE/xdCmrgpIPwMPxInZozpi4PMQ6p6NyabuiLfjfYUJ7LLh?=
 =?Windows-1252?Q?HOkEml+GtPunoDFTo0lfvdF/esKbR026VAbvkWyerZtc7LKMOVU6D9We?=
 =?Windows-1252?Q?HkEFnCtIUW5AEBlxCAnN1M+MJMOfe8FnXmY5R3Xdxw4PJIbhrRgo6qPq?=
 =?Windows-1252?Q?A7QlWDQB8hJGpngW6J+PttxgMg6usr0Ju3HQhqzSRvSO6d+CQZYGnICg?=
 =?Windows-1252?Q?fuZPM6XcjNrr2sFSTdTfDoogMMyT2j+hGcknjhmxSalGXbWhlI48fHo0?=
 =?Windows-1252?Q?LzWmf7Ll/TzvW72vQCrDWI7bJ12OHtRg5vWANBJVHdNS9HmRSOJLPchs?=
 =?Windows-1252?Q?m/C6VQxEDXslCGYfTJ2gIUa8s57WQq6RCUFdh/dHQwTXLlGTZGhwa8c6?=
 =?Windows-1252?Q?vUmMSd/r/1Z2gmHuiv2XvbJtyfOzdqPdcvuHwNialaw8Kw8WYpP27TcX?=
 =?Windows-1252?Q?Z0HvfyQygZXl19Cd6UN17vErEqwJrf8DYYiQFGHPsoLf3Gghp7aemrGb?=
 =?Windows-1252?Q?zIXwhw5eH9y6gayHOpEqvOCkIRlANeQFaMzNz0Q9c6wp84t4+u/papn/?=
 =?Windows-1252?Q?biZDOG26rQ4UHVsrga7ZdPrkknw5Iw7BmTT2xPKee46+RwISSPkGacxf?=
 =?Windows-1252?Q?q5mMlt82zzEpixGv+fiJi8LM93mjIrNM1wzEx+zcu2m9IN1XdjAPIuQJ?=
 =?Windows-1252?Q?5IDe/+Do9ixngaPanxvAVT+iDX2dMH3HtgNVBiqvXSqQwosnKQB4u8G5?=
 =?Windows-1252?Q?QfQl73lnWgY5ue6hcB+2gIcr5P/snXOLmAGChy+NQJgIm6TNBl/hoYhX?=
 =?Windows-1252?Q?RKQW+enD4MMppH1h6MOvD3fQPvfebq16lXV8v7C575VugCdcOw9to3xW?=
 =?Windows-1252?Q?+ASHosZLZ6S2ZhpnkmCrkTHE+jP9/ybuP/DV34hykFgQeDPHcPTipZiG?=
 =?Windows-1252?Q?k9xXl3Ai4bTQezrcSvWje/VURBsFPehvL1JmdqOPYeHLOSeZnnLPauxV?=
 =?Windows-1252?Q?dmqTmTDYNYNQ1lwVYRScNAV6bu4SoSLf1OSzb6aDcg9bMObl9ptx/pm7?=
 =?Windows-1252?Q?f1AAn4LLNbvRb8UzjHWa0sc1zxrYdGiMHn13AK+XUSF014RFaX8a5jPv?=
 =?Windows-1252?Q?D5hOgXxt/hoRDFstQ2dNjZaMAZH9/0YzXF+J8bMSzNekAihJJ6s039Wb?=
 =?Windows-1252?Q?UxzAp0Uhd9kH/bQbQDyq6RZ5B4yW089I0afn5iAH+zOIuEriVS+ChCBv?=
 =?Windows-1252?Q?m49wCXrQvbIIUOqVRxVA/Xqkh7dgrFzwJDU0AyNgoB1Gy80kAsW29toF?=
 =?Windows-1252?Q?VWSea50DRuQjPjGvt9y2IEBDqPKZaWOSXGzeatZ3YssELbfUJWUvgH8A?=
 =?Windows-1252?Q?8DIc1k6UfbGuVNjqy4iIbpCDpeSm1jsV/NAoZYJfRkHH9zkKioY9CU94?=
 =?Windows-1252?Q?CHV2zsYXlu2e7JNb4vlzXboqwQRWpVy3r+siCgqeycCLgWfQUnBsheUc?=
 =?Windows-1252?Q?JaJ1YY0DGLYB2DEJ1SgYziyOteULEAustTcQDsm0x8aEakAjCqG2HSCO?=
 =?Windows-1252?Q?bYhm1AZxbMNqzQWMio0f3YshdN13QH6jyb6J8v3nZ+pkqEJpdOZ2b824?=
 =?Windows-1252?Q?GsxWG51UEyTQGtkFFLTAuhMn00VKH6/YtCDBUA2JHRwP760EVvcDZpmn?=
 =?Windows-1252?Q?YYNzIz4pOgSKZNI0plEepT8WS6HjRtU2n1gXBFrkVYn8262v10jqi/n2?=
 =?Windows-1252?Q?9MiPoOIOlmCdQ8QgYDMFEu22ctCRtCRr/9PllUwhl6EO07Ychzw/j8uV?=
 =?Windows-1252?Q?+eJEzJEpYKDgQMZqzfZYA+MqelJlnwaR5BVkjUke0oW5lPOJt85b1jpt?=
 =?Windows-1252?Q?8JQIwVR0DlZsYm2pVrBPNNx8uRSZxQscGgs=3D?=
Content-Type: multipart/related;
	boundary="_004_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR04MB8398.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37372c0b-2a2c-45cc-b8d6-08df1d49ccbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 10:18:11.4445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jaGebrZXfYiFuOxsMN0jLCJIZlzc3cYU8lVsypvBa11ooFsmLKThoTEGMHimRT7fFCc94t2yuT4xPWA9lfVYVozu5uS9nGP23efnlPOf6iLAqbKD0b2XTPR5b0GRsZdr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB994389
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246746

--_004_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_
Content-Type: multipart/alternative;
	boundary="_000_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_"

--_000_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Thanks for checking. I looked at the FFmpeg 8.0 QuircContext documentation =
and source. Although Doxygen lists the struct, it is defined in libavfilter=
/vf_quirc.c and used as the quirc filter=92s private context. It isn=92t pa=
rt of the public API.
The patch adds width and height fields to that private context, and the bui=
ld with the patch applied is verified. I don=92t expect this to break suppo=
rted external code. The only potential concern would be downstream code rel=
ying directly on this internal struct layout.

Thanks,

Bhavesh Maheshwari
Engineer
+91 8827543501
Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.com>
[cid:a6d6c0b2-4532-484b-9ec6-adca64de6f13]<https://www.einfochips.com/>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: 27 September 2026 02:07
To: Bhavesh Rajesh Maheshwari <bhavesh.maheshwari@einfochips.com>; openembe=
dded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for CVE-2=
026-66041


CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.


On Tue Sep 22, 2026 at 9:01 AM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fc=
ode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F4da9812e25894fb51d62a8875cfa8eb=
39b5e20f5&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7fe67053ed=
514d0a521d08df1c0df794%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C6392605=
18444725508%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA=
wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D=
yXRkqouFPx5rn7HcXqCIyLYvG6DGjw%2F5lRPYq544zPg%3D&reserved=3D0<https://code.=
ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d62a8875cfa8eb39b5e20f5>
> [2] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fn=
vd.nist.gov%2Fvuln%2Fdetail%2Fcve-2026-66041&data=3D05%7C02%7Cbhavesh.mahes=
hwari%40einfochips.com%7C7fe67053ed514d0a521d08df1c0df794%7C0beb0c359cbb4fe=
b99e5589e415c7944%7C1%7C0%7C639260518444753817%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DUvlOY1pB7KYXkF5k%2Bgyx5DEihvVKJ3yojDR%2F=
7QLFNpg%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/cve-2026-66041>
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-66041.patch        | 60 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.=
patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch b=
/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
> new file mode 100644
> index 0000000000..7a8c4e0c8b
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
> @@ -0,0 +1,60 @@
> +From 9db6b5816516b85e981e177863b2eb361dbec3c8 Mon Sep 17 00:00:00 2001
> +From: Michael Niedermayer <michael@niedermayer.cc>
> +Date: Sun, 28 Jun 2026 15:33:38 +0200
> +Subject: [PATCH] avfilter/vf_quirc: resize the quirc buffers when the in=
put
> + size changes
> +
> +Fixes: out of array access
> +Fixes: JbvzNObhorBp
> +Fixes: 030e140145 (lavfi: add quirc filter)
> +Found-by: Adrian Junge (vurlo)
> +Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
> +
> +CVE: CVE-2026-66041
> +Upstream-Status: Backport [https://nam04.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fcode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F4da9812=
e25894fb51d62a8875cfa8eb39b5e20f5&data=3D05%7C02%7Cbhavesh.maheshwari%40ein=
fochips.com%7C7fe67053ed514d0a521d08df1c0df794%7C0beb0c359cbb4feb99e5589e41=
5c7944%7C1%7C0%7C639260518444773405%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGk=
iOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%=
3D%7C0%7C%7C%7C&sdata=3DfL9bPK6QDy%2FfoOT4NV2UwWLNCNW3NU12RP0eKmsBr7Q%3D&re=
served=3D0<https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d6=
2a8875cfa8eb39b5e20f5>]
> +
> +Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> +---
> + libavfilter/vf_quirc.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/libavfilter/vf_quirc.c b/libavfilter/vf_quirc.c
> +index 59dc84caa8..d2ba48e7bc 100644
> +--- a/libavfilter/vf_quirc.c
> ++++ b/libavfilter/vf_quirc.c
> +@@ -36,6 +36,7 @@ typedef struct QuircContext {
> +     const AVClass *class;
> +
> +     struct quirc *quirc;
> ++    int width, height;
> + } QuircContext;

Same question as 1/5: https://nam04.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.ffmpeg.org%2Fdoxygen%2F8.0%2FstructQuircContext.html&d=
ata=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7fe67053ed514d0a521d0=
8df1c0df794%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260518444792117=
%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi=
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxB5mU5FhBSh=
AJ7zomz7F7lBWu2BBpYTDKNAdGXAR0QM%3D&reserved=3D0<https://www.ffmpeg.org/dox=
ygen/8.0/structQuircContext.html>
Are you sure this does not break existing code?

FYI, for the series as a whole: Since 2-4/5 are indenpendant of 1,5/5,
I'll keep 2-4/5 in my branch for tests/reviews but hold 1,5/5 while we
clarify the API change.

Thanks!
--
Yoann Congal
Smile ECS


--_000_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for checking. I looked at the FFmpeg 8.0 <code>QuircContext</code> d=
ocumentation and source. Although Doxygen lists the struct, it is defined i=
n
<code>libavfilter/vf_quirc.c</code> and used as the <code>quirc</code> filt=
er=92s private context. It isn=92t part of the public API.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The patch adds width and height fields to that private context, and the bui=
ld with the patch applied is verified. I don=92t expect this to break suppo=
rted external code. The only potential concern would be downstream code rel=
ying directly on this internal struct
 layout.</div>
<div id=3D"Signature" class=3D"elementToProof">
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
<span style=3D"font-size: 12pt; color: gray;">Thanks,</span><span style=3D"=
font-size: 12pt; color: black;"><br>
</span></p>
<table style=3D"text-align: left; background-color: rgb(255, 255, 255); col=
or: rgb(33, 37, 41); box-sizing: border-box; border-collapse: collapse; bor=
der-spacing: 0px;">
<tbody>
<tr>
<td colspan=3D"2" style=3D"text-align: left; color: rgb(0, 75, 118); box-si=
zing: border-box;">
<div class=3D"elementToProof" style=3D"text-align: left;"><span style=3D"fo=
nt-family: Calibri, sans-serif; font-size: 15px; color: rgb(0, 0, 0);"><b>B=
havesh Maheshwari</b></span><span style=3D"font-family: Calibri, sans-serif=
; font-size: 14px;"><br>
</span><span style=3D"font-family: Calibri; font-size: 15px; color: rgb(85,=
 85, 85);">Engineer</span><span style=3D"font-family: Calibri, sans-serif; =
font-size: 14px;"><br>
</span><span style=3D"font-family: Calibri; font-size: 15px; color: rgb(85,=
 85, 85);">+91 8827543501</span></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; paddi=
ng-bottom: 10px; font-family: Calibri; font-size: 15px;">
<a href=3D"mailto:Bhavesh.Maheshwari@einfochips.com"><u>Bhavesh.Maheshwari@=
einfochips.com</u></a></div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, s=
ans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://www.einfochips.com/" title=3D"https://www.einfochips.com=
/" style=3D"text-decoration: none;"><img id=3D"x_image_0" style=3D"max-widt=
h: 780px;" size=3D"9472" data-outlook-trace=3D"F:1|T:1" src=3D"cid:a6d6c0b2=
-4532-484b-9ec6-adca64de6f13"></a></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> 27 September 2026 02:07<br>
<b>To:</b> Bhavesh Rajesh Maheshwari &lt;bhavesh.maheshwari@einfochips.com&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;<br>
<b>Subject:</b> [External] Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix fo=
r CVE-2026-66041</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.<br>
<br>
<br>
On Tue Sep 22, 2026 at 9:01 AM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:<br>
&gt; From: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.com&gt;<b=
r>
&gt;<br>
&gt; Pick the patch from [1], also referenced in the NVD report [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25=
894fb51d62a8875cfa8eb39b5e20f5">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ff=
mpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F4da9812e25894fb51d62a8875cfa8eb39b5e2=
0f5&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7fe67053ed51=
4d0a521d08df1c0df794%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260518=
444725508%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM=
CIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DyXRkqouFPx5rn7HcXqCIyLYvG6DGjw%2F5lRPYq544zPg%3D&amp;reserved=3D0</a><br=
>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-66041">https:=
//nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%=
2Fvuln%2Fdetail%2Fcve-2026-66041&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40=
einfochips.com%7C7fe67053ed514d0a521d08df1c0df794%7C0beb0c359cbb4feb99e5589=
e415c7944%7C1%7C0%7C639260518444753817%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h=
cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%=
3D%3D%7C0%7C%7C%7C&amp;sdata=3DUvlOY1pB7KYXkF5k%2Bgyx5DEihvVKJ3yojDR%2F7QLF=
Npg%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.=
com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../ffmpeg/ffmpeg/CVE-2026-66041.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 60 +++++++++++++++++++<br>
&gt;&nbsp; .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 61 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-202=
6-66041.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patc=
h b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7a8c4e0c8b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch<br>
&gt; @@ -0,0 +1,60 @@<br>
&gt; +From 9db6b5816516b85e981e177863b2eb361dbec3c8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Niedermayer &lt;michael@niedermayer.cc&gt;<br>
&gt; +Date: Sun, 28 Jun 2026 15:33:38 +0200<br>
&gt; +Subject: [PATCH] avfilter/vf_quirc: resize the quirc buffers when the=
 input<br>
&gt; + size changes<br>
&gt; +<br>
&gt; +Fixes: out of array access<br>
&gt; +Fixes: JbvzNObhorBp<br>
&gt; +Fixes: 030e140145 (lavfi: add quirc filter)<br>
&gt; +Found-by: Adrian Junge (vurlo)<br>
&gt; +Signed-off-by: Michael Niedermayer &lt;michael@niedermayer.cc&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-66041<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://code.ffmpeg.org/FFmpeg/=
FFmpeg/commit/4da9812e25894fb51d62a8875cfa8eb39b5e20f5">https://nam04.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ffmpeg.org%2FFFmpeg%2=
FFFmpeg%2Fcommit%2F4da9812e25894fb51d62a8875cfa8eb39b5e20f5&amp;data=3D05%7=
C02%7Cbhavesh.maheshwari%40einfochips.com%7C7fe67053ed514d0a521d08df1c0df79=
4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260518444773405%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs=
IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DfL9bPK6QDy%2FfoOT=
4NV2UwWLNCNW3NU12RP0eKmsBr7Q%3D&amp;reserved=3D0</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips=
.com&gt;<br>
&gt; +---<br>
&gt; + libavfilter/vf_quirc.c | 12 ++++++++++++<br>
&gt; + 1 file changed, 12 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/libavfilter/vf_quirc.c b/libavfilter/vf_quirc.c<br>
&gt; +index 59dc84caa8..d2ba48e7bc 100644<br>
&gt; +--- a/libavfilter/vf_quirc.c<br>
&gt; ++++ b/libavfilter/vf_quirc.c<br>
&gt; +@@ -36,6 +36,7 @@ typedef struct QuircContext {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const AVClass *class;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct quirc *quirc;<br>
&gt; ++&nbsp;&nbsp;&nbsp; int width, height;<br>
&gt; + } QuircContext;<br>
<br>
Same question as 1/5: <a href=3D"https://www.ffmpeg.org/doxygen/8.0/structQ=
uircContext.html">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ffm=
peg.org%2Fdoxygen%2F8.0%2FstructQuircContext.html&amp;data=3D05%7C02%7Cbhav=
esh.maheshwari%40einfochips.com%7C7fe67053ed514d0a521d08df1c0df794%7C0beb0c=
359cbb4feb99e5589e415c7944%7C1%7C0%7C639260518444792117%7CUnknown%7CTWFpbGZ=
sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTW=
FpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DxB5mU5FhBShAJ7zomz7F7lBWu2B=
BpYTDKNAdGXAR0QM%3D&amp;reserved=3D0</a><br>
Are you sure this does not break existing code?<br>
<br>
FYI, for the series as a whole: Since 2-4/5 are indenpendant of 1,5/5,<br>
I'll keep 2-4/5 in my branch for tests/reviews but hold 1,5/5 while we<br>
clarify the API change.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_--

--_004_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=9472;
	creation-date="Mon, 28 Sep 2026 10:17:35 GMT";
	modification-date="Mon, 28 Sep 2026 10:17:35 GMT"
Content-ID: <a6d6c0b2-4532-484b-9ec6-adca64de6f13>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAaIAAABaCAYAAAD6vVKvAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDkuMS1jMDAyIDc5LmE2
YTYzOTY4YSwgMjAyNC8wMy8wNi0xMTo1MjowNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRm
PSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNj
cmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6
c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHht
cDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDI1LjkgKFdpbmRvd3MpIiB4bXBNTTpJbnN0
YW5jZUlEPSJ4bXAuaWlkOkIwQjkyNkM5Mzg0MTExRUY5Q0I1QTY1Njg3MUI5OUFBIiB4bXBNTTpE
b2N1bWVudElEPSJ4bXAuZGlkOkIwQjkyNkNBMzg0MTExRUY5Q0I1QTY1Njg3MUI5OUFBIj4gPHht
cE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QjBCOTI2QzczODQxMTFF
RjlDQjVBNjU2ODcxQjk5QUEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QjBCOTI2QzgzODQx
MTFFRjlDQjVBNjU2ODcxQjk5QUEiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94
OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6C+n3FAAAhcElEQVR42uxdMYwsSXmuQ08yweGb
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
AABJRU5ErkJggg==

--_004_SN4PR04MB8398087B79EA4DA077A16DD1E58D2SN4PR04MB8398namp_--

