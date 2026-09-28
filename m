Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDFFC9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 10:16:07 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55262.1790590559796729116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 03:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=b9FkDhtB;
 spf=pass (domain: einfochips.com, ip: 52.101.46.43, mailfrom: bhavesh.maheshwari@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRcet0LbPTB2m1zuxZRA9I/ZePPwM0qTZ2B2SaCrG2mIhsiW5SkRZFRfpb5DL+bTT5uM4YQzH0k1agN1+QHeBJrAYa8ELFlX2UKKC5lk/vRuT/38MTTXFkmbaTFfFqY7s/arVl2SmChVoSaUNC33d1C0xtvGdmYSGJ+TvPa/WHjHCepZ3Si4oz20XKgLtuAcnPoS1Ugdy2a2XFxdbv4TnlzNNCjII0gc4/QbrX7jLzVye/BLdXftflpQ0Z+6fQITmeCoaAJn+Ix+z0LwNnJCxs2maWOo6a3LN8dsQVZj5wpUaQiCRWMjE2P1UFNnKXMasr9BfBfI+6EyKzzJQlQvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqrrBWjSxT9Anuwxw7OkVaAyPvyD6Te1O2GpAG7fWa8=;
 b=cuf8twzduQxLQxzTXmkgNggXJZ2MiQV0kiXoXf3wY4aa+CS/541pnlj3OW23bEyOfzRP9LLLxmt+Aa0uIqxoRx/ofTAWAA3CPJfsA1XGnLuW2h8nJBuyUMDW1owOMH/H0UsdRplfYK0f6XtmEJkVp92QCGwTCVlCxigFiJGS81ERZ+asDuFVMI2CR6zektEX+xjsGSJTa1xa3okINVpcKoHaAme1UQ3UqSeHS6aP/8Y+SZ9BvVCGUBjZvIbbXFPuv4MpkJhLg7+vCYvJRioydVFAsje8D7vJhgJewCvBDiSBrpnOZQgB6jdp9q+Jv8M5uZB2BVo8Amf8/xey0+UykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqrrBWjSxT9Anuwxw7OkVaAyPvyD6Te1O2GpAG7fWa8=;
 b=b9FkDhtBVcfB579+/1rVxyrYL+zJJoJlt/t5cJHSEXGwG+COIo3trLrpf+hMJw6DNRp1mxqukMQWaC7PzYvdMcWOIl2HSp/cuXfkwgACBIvPD2tpwwekVLbWzarGKCK8RqV3/iPkUCbeYhcawhIshByQE83cFlXDJGcrgOywxes=
Received: from SN4PR04MB8398.namprd04.prod.outlook.com (2603:10b6:806:201::22)
 by PH0PR04MB994389.namprd04.prod.outlook.com (2603:10b6:510:43b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:15:57 +0000
Received: from SN4PR04MB8398.namprd04.prod.outlook.com
 ([fe80::4939:9b85:fbf:521d]) by SN4PR04MB8398.namprd04.prod.outlook.com
 ([fe80::4939:9b85:fbf:521d%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:15:57 +0000
From: Bhavesh Rajesh Maheshwari <Bhavesh.Maheshwari@einfochips.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [External] Re: [wrynose][oe-core][PATCH 1/5] ffmpeg: Fix for
 CVE-2026-66036
Thread-Topic: [External] Re: [wrynose][oe-core][PATCH 1/5] ffmpeg: Fix for
 CVE-2026-66036
Thread-Index: AQHdTfF153SY5EBnvUaPQDvXh8YknLbjyGLx
Date: Mon, 28 Sep 2026 10:15:57 +0000
Message-ID: 
 <SN4PR04MB83981510919C6B8254C23A02E58D2@SN4PR04MB8398.namprd04.prod.outlook.com>
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
 <DLPIIRL8T1SK.Z1VPO5EWVJQ1@smile.fr>
In-Reply-To: <DLPIIRL8T1SK.Z1VPO5EWVJQ1@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-28T10:15:56.602Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=1;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR04MB8398:EE_|PH0PR04MB994389:EE_
x-ms-office365-filtering-correlation-id: 459b3287-c9bd-42b3-3743-08df1d497cbb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|6049299003|23010399003|39142699007|31052699007|376014|1800799024|366016|10067099003|11063799006|260925021311599003|260925022911599003|260925021911599003|4133799003|6133799003|8096899003|18002099003|55112099003|22082099003|56012099006|4143699003|13003099007|4053099003|4013099003|38070700021;
x-microsoft-antispam-message-info: 
 G+QAC/yaRCQKxBy0kvH1T+g9omvlgYMAwqrmtDAHL3gmwXZst1Z9QYEyUK3AOiU4q0IogiODaBpwdvpn/LLiZFgHAMKAsSUnH10Ns5GpScrOIDdFD2p/kdDtuUP5cmL1IOljJ3bdxAXQSpdH42iB/37+7eofAahGxmdmkaL47L/syykNiREmy49XZNC0QDzQu9dnDfdu74a2bZDyZkSPlg5Gnkg0JKqiwXNeWKd1K7Kz59g9yyrmsoJk6rYve/ydE8Wu8Ac8o539fzt5QdnUxVX3m08j2R6/+r9vE/a63+04hEX/x1plA/ys/anDQ2eScL9Mx17zjTa0JslpKI/TzK2UIDJyXaobZLfNg5Lmem4TNlgvAjdHx3cenZh2j4ZIBGUwpim88Lu3khCcfv1NCvggAgNaOVYBaa8F867bI4EoMqh0BZXTVqeW0/opGaovVb6cyYQ6l0p+eWnPHVEJ0NnvIrWZ8RVGclp72m69M7agUW63u6xFrpBcaKt+Mo+GIjJbd+9xBYp+uPVqn/MIOEhUw+T4OFf+6666ftiRvDwYuv/4cruUxCuQhLqPwr0BEG0bWGfJ80Xn9C11rntRkCthEpGYpcmHzSuSCg+2cqma5xaVgSbgnyGTTx7HAxe9WFjP2QioiIE3S5lC5/pJTQGWD7dyOx3kOn/XA47VWs0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR04MB8398.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(23010399003)(39142699007)(31052699007)(376014)(1800799024)(366016)(10067099003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(4133799003)(6133799003)(8096899003)(18002099003)(55112099003)(22082099003)(56012099006)(4143699003)(13003099007)(4053099003)(4013099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?nHIUa1SQToYfhBJLruXuOeOG5YLHljYxBZPjMInC7nJwr90PtB7h8b8Q?=
 =?Windows-1252?Q?VEQJT2vLOjzqQQOw5b8HXJ6LoyjBeeVQ3R9cZzGIosB+5Zot7PM2QfDQ?=
 =?Windows-1252?Q?ou4/56TUf8HkqhBWyMjVPql4LnIqcjFrGltKt/3KatJBWsTZGkWo7PxJ?=
 =?Windows-1252?Q?MiGGgWqQ24isNXCrwMHJTkuqHxls/RzDNtgIgCWBVs9n7EctYFseSZEz?=
 =?Windows-1252?Q?Tm5N8mcixtZmIjb2nD/La+68/CUByDnwweLLaSoFWy+Q294Iu0Dnfox2?=
 =?Windows-1252?Q?JbPcqJpT7zyF595c2oEm6MjDVfHRv+UfEylUuolM8wLzvgdszqKojE3m?=
 =?Windows-1252?Q?5Uof24p+Tq7Eo8vpmR+Yp82baIEWlf6l5t90oP1cNFuqk8vU7suCoNL6?=
 =?Windows-1252?Q?za+K03oAYHokqXFSQXFCCJ/wPZXN4BQVKUGo2IWz4wfsAUj0xLAmqh6r?=
 =?Windows-1252?Q?zEgR5vBjFNOcR8YTMQRB4Vh6NVGoFHMlQ7ct43xYmtqo/sDDWY6DILgg?=
 =?Windows-1252?Q?BjJkEhZntP2UI+BmvHXy3Ga+3lCpH7VPdjj6ug8g9OFYaAeShxIOUCIu?=
 =?Windows-1252?Q?/Y0mI6GMAmVk/UnyfQddoJViceG5KcOKetVS5BVHayms9a5xSjE0Xw5Z?=
 =?Windows-1252?Q?3Dr+MtmtT6yvQkCAsKzwTo4Doy1gEDYPPsHQ7YhHMhOBfBvgZdBlHdY/?=
 =?Windows-1252?Q?d9FzWELFCltbB9TPqVJUFGDoRzetMOMSY6hQIcuCwMRnVP6gGyLLYQYc?=
 =?Windows-1252?Q?LMSfMyy4H4cMRa1MGj1gmbFh7GYxO0hh7g2RtuDrVDyNXEdrTCKjyTTS?=
 =?Windows-1252?Q?6WcpTpWK7KjptuZeWI00E/4PX5IgPoPu3gsYTLkTCarzRf3uE7apPHfn?=
 =?Windows-1252?Q?/y/Hc6cD+lOpOXt932zTfxtBnxEAe0/7vEuTew0L3UJO8iOzj1pXa2I6?=
 =?Windows-1252?Q?flPeHhe6X2ZbPvJBDyRH8AGJOYEkANWKdXSM4oPoz4bKOr6hDOB4WAz/?=
 =?Windows-1252?Q?9+Pk9AS8zf79gGQ3GAYRwN298yGADudw3LEsji+ksetuP7mTI7wUhV3G?=
 =?Windows-1252?Q?MIxUP95Xj9P8bhaJVadyPy8aYhq7vTqx9NomJZ0x0aq4qsvrW4W45555?=
 =?Windows-1252?Q?Qi9hYZ5W96KsrG0XJPjSgM6gPvkttdxP7EZuTO4ZEsJNTiFFxLDnVzGr?=
 =?Windows-1252?Q?JwFCzTvzeyLXduC5U+UUok+xjF7R9KF+Afhrd2TGhjnBQzWnLnAOUzYB?=
 =?Windows-1252?Q?5QTu8w04i93LiFM/8eqX1EB/3nion7zFYSgEK8ev9eNUanqilFsd8x/d?=
 =?Windows-1252?Q?pPCI2bTVriU3zgEWOR4KSQmQGB6kbb1fxUYzvXIYLzZK+/JFCxmzOI3F?=
 =?Windows-1252?Q?eznn94cw1HhyJIjTWGi6fTpm/MLUk98m4EfSyTagy1NRsQT8OPkYSokD?=
 =?Windows-1252?Q?OGwg9OelVOUCoU8OClsy3WRcYqT83nTlm6jYl5my+gcErPkKxn8RXHhB?=
 =?Windows-1252?Q?RPz6W5pSVk0x18Pb/XshhLoMwU+1Y9ovCOQL0XN4+9dn1zvPoVIzM7id?=
 =?Windows-1252?Q?9lIc4vcWVlkGMkg/n0hXkicvI0d0XZJJdwU21H2QSdshUOCcoXqIL15N?=
 =?Windows-1252?Q?il2GcO4iHJ088Yw1l+eQAF57GHHRmSGxyjdlphLG0NceU4duxlU+HG2m?=
 =?Windows-1252?Q?3BgvXfOqjo2SEDGP9Cn3pYsSxE0B7MxRlimmrJFKdzIt8jQw9rx7zitC?=
 =?Windows-1252?Q?BTbALlzSe+EpFdmhpmdqdpKG/FulT6ovGLsEt1SGuq4Q5X4vW8ptC7Re?=
 =?Windows-1252?Q?tGPVlkmESUxLqbvhBdo87qOpRGImeo6bVbLa3voPjpopgiG1caGgPe9l?=
 =?Windows-1252?Q?0PzaerbGExO8zfdQ3YcuhFH+ISjI11ghrbs=3D?=
Content-Type: multipart/related;
	boundary="_004_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR04MB8398.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459b3287-c9bd-42b3-3743-08df1d497cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 10:15:57.1800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdsBB5gmJ42FUzfisH9qh1GMft0fwc6X5L62c4eA9GXjiYVWtBimxTASz9cenA1NkD0eKgcuaUXxGpF7LqeGFviNvYZv+B1hOY6P14Xwcy6wpn5IVjuRE8co8F3BZVg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB994389
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246745

--_004_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_
Content-Type: multipart/alternative;
	boundary="_000_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_"

--_000_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Thanks for raising this. I checked the QuircContext definition and verified=
 the build with the patch applied.
QuircContext is defined in libavfilter/vf_quirc.c and used only as the quir=
c filter=92s private context. The new width and height fields enlarge that =
private context; they do not change a public FFmpeg API or a caller-visible=
 structure. The Doxygen page lists the struct because it is present in the =
source, but it is not evidence that the struct is part of the public API.
The patch records the configured dimensions and resizes the quirc buffer if=
 a later frame has different dimensions. I don=92t see a compatibility issu=
e for existing supported code.


Thanks

Bhavesh Maheshwari
Engineer
+91 8827543501
Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.com>
[cid:b7627589-92e3-4ba8-b5bd-95367dfda157]<https://www.einfochips.com/>
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 27 September 2026 01:28
To: Bhavesh Rajesh Maheshwari <bhavesh.maheshwari@einfochips.com>; openembe=
dded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: [External] Re: [wrynose][oe-core][PATCH 1/5] ffmpeg: Fix for CVE-2=
026-66036


CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.


On Tue Sep 22, 2026 at 9:01 AM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Pick the patch from [1] and [2], mentioned in PR#23783 [3] which is
> referenced in the NVD report [4]
>
> [1] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fc=
ode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2Ff0f634b6585fdc7bbb43ab3ae461499=
bfca9ad2e&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7Cc5cd2b5126=
294b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C6392604=
95345529147%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA=
wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D=
zvgjZiEO2XkQjfn7J5KJCJN8wQEAxqgM9fKJ103HPVQ%3D&reserved=3D0<https://code.ff=
mpeg.org/FFmpeg/FFmpeg/commit/f0f634b6585fdc7bbb43ab3ae461499bfca9ad2e>
> [2] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fc=
ode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F5d7112c60e6f0f0742ce47d448e6da0=
718a70f4c&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7Cc5cd2b5126=
294b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C6392604=
95345585689%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA=
wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D=
rDzwxbj4D6E%2BKtO69vqAdljWFAWdiuhPay8mzI2nkDM%3D&reserved=3D0<https://code.=
ffmpeg.org/FFmpeg/FFmpeg/commit/5d7112c60e6f0f0742ce47d448e6da0718a70f4c>
> [3] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fc=
ode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fpulls%2F23783&data=3D05%7C02%7Cbhavesh.m=
aheshwari%40einfochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f4%7C0beb0c359cb=
b4feb99e5589e415c7944%7C1%7C0%7C639260495345626523%7CUnknown%7CTWFpbGZsb3d8=
eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI=
sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DligCIg0tGRHfsFtp3l3p7ieKfT%2FaOjCwoc=
80XwdbnK4%3D&reserved=3D0<https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23783=
>
> [4] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fn=
vd.nist.gov%2Fvuln%2Fdetail%2Fcve-2026-66036&data=3D05%7C02%7Cbhavesh.mahes=
hwari%40einfochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f4%7C0beb0c359cbb4fe=
b99e5589e415c7944%7C1%7C0%7C639260495345659261%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D38KssgC9DDjSA7qbSyEmWzXix%2FkX1UekEjx015=
o3DYU%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/cve-2026-66036>
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-66036_p1.patch     | 120 ++++++++++++++++++
>  .../ffmpeg/ffmpeg/CVE-2026-66036_p2.patch     |  71 +++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   2 +
>  3 files changed, 193 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_=
p1.patch
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_=
p2.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patc=
h b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
> new file mode 100644
> index 0000000000..bce0265114
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
> @@ -0,0 +1,120 @@
> +From 7ac88955c4678fc10cc44a786ff9bf724bb12deb Mon Sep 17 00:00:00 2001
> +From: Michael Niedermayer <michael@niedermayer.cc>
> +Date: Sun, 12 Jul 2026 13:05:07 +0200
> +Subject: [PATCH 1/2] avfilter/vf_hqdn3d: reject unsupported frame parame=
ter
> + changes
> +
> +Fixes: out of array access
> +Fixes: 9aj_hqdn3d_dynamic_res.mjpg / 9aj_generate_hqdn3d_dynamic_res_mjp=
g.py
> +Fixes: wWDsy2oDvMuR
> +Found-by: Adrian Junge (vurlo) <adjun37@gmail.com>
> +
> +CVE: CVE-2026-66036
> +Upstream-Status: Backport [https://nam04.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fcode.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2Ff0f634b=
6585fdc7bbb43ab3ae461499bfca9ad2e&data=3D05%7C02%7Cbhavesh.maheshwari%40ein=
fochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589e41=
5c7944%7C1%7C0%7C639260495345690477%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGk=
iOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%=
3D%7C0%7C%7C%7C&sdata=3DKleDBcKlFXLeKVD1vYsjjgUuhemdi%2FJNocGwhbit2l8%3D&re=
served=3D0<https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f0f634b6585fdc7bbb4=
3ab3ae461499bfca9ad2e>]
> +
> +Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> +---
> + libavfilter/vf_hqdn3d.c | 34 +++++++++++++++++++++++++---------
> + libavfilter/vf_hqdn3d.h |  2 ++
> + 2 files changed, 27 insertions(+), 9 deletions(-)
> +
> +diff --git a/libavfilter/vf_hqdn3d.h b/libavfilter/vf_hqdn3d.h
> +index 3279bbcc77..3467f27145 100644
> +--- a/libavfilter/vf_hqdn3d.h
> ++++ b/libavfilter/vf_hqdn3d.h
> +@@ -36,6 +36,8 @@ typedef struct HQDN3DContext {
> +     double strength[4];
> +     int hsub, vsub;
> +     int depth;
> ++    int width, height;
> ++    enum AVPixelFormat format;
> +     void (*denoise_row[17])(uint8_t *src, uint8_t *dst, uint16_t *line_=
ant, uint16_t *frame_ant, ptrdiff_t w, int16_t *spatial, int16_t *temporal)=
;
> + } HQDN3DContext;

Hello,

This change touches exposed/documented API: https://nam04.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ffmpeg.org%2Fdoxygen%2F8.0%2Fstruc=
tHQDN3DContext.html&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C=
c5cd2b5126294b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0=
%7C639260495345715588%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO=
iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7=
C&sdata=3DrJt9AoaQCIyipSiOxP1rMdq2sR6ez9%2Fvh6lZxpc0Mgo%3D&reserved=3D0<htt=
ps://www.ffmpeg.org/doxygen/8.0/structHQDN3DContext.html>
Are you sure this does not break existing code?

Thanks!
--
Yoann Congal
Smile ECS


--_000_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Thanks for raising this. I checked the <code>QuircContext</code> definition=
 and verified the build with the patch applied.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<code>QuircContext</code> is defined in <code>libavfilter/vf_quirc.c</code>=
 and used only as the
<code>quirc</code> filter=92s private context. The new <code>width</code> a=
nd <code>
height</code> fields enlarge that private context; they do not change a pub=
lic FFmpeg API or a caller-visible structure. The Doxygen page lists the st=
ruct because it is present in the source, but it is not evidence that the s=
truct is part of the public API.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
The patch records the configured dimensions and resizes the quirc buffer if=
 a later frame has different dimensions. I don=92t see a compatibility issu=
e for existing supported code.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
<span style=3D"font-size: 12pt; color: gray;">Thanks</span><span style=3D"f=
ont-size: 12pt; color: black;"><br>
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
<a href=3D"mailto:Bhavesh.Maheshwari@einfochips.com" id=3D"OWA9f49a4d4-3d0a=
-c7c5-0f98-c69f9bbfd206" class=3D"OWAAutoLink"><u>Bhavesh.Maheshwari@einfoc=
hips.com</u></a></div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, s=
ans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://www.einfochips.com/" id=3D"OWAc7127d07-be2c-863f-450f-81=
0bba962d87" class=3D"OWAAutoLink" title=3D"https://www.einfochips.com/" sty=
le=3D"text-decoration: none;"><img id=3D"x_image_0" style=3D"max-width: 780=
px;" size=3D"9715" data-outlook-trace=3D"F:1|T:1" src=3D"cid:b7627589-92e3-=
4ba8-b5bd-95367dfda157"></a></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 27 September 2026 01:28<br>
<b>To:</b> Bhavesh Rajesh Maheshwari &lt;bhavesh.maheshwari@einfochips.com&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;<br>
<b>Subject:</b> [External] Re: [wrynose][oe-core][PATCH 1/5] ffmpeg: Fix fo=
r CVE-2026-66036</font>
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
&gt; Pick the patch from [1] and [2], mentioned in PR#23783 [3] which is<br=
>
&gt; referenced in the NVD report [4]<br>
&gt;<br>
&gt; [1] <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f0f634b658=
5fdc7bbb43ab3ae461499bfca9ad2e">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ff=
mpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2Ff0f634b6585fdc7bbb43ab3ae461499bfca9a=
d2e&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7Cc5cd2b512629=
4b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260495=
345529147%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM=
CIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DzvgjZiEO2XkQjfn7J5KJCJN8wQEAxqgM9fKJ103HPVQ%3D&amp;reserved=3D0</a><br>
&gt; [2] <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5d7112c60e=
6f0f0742ce47d448e6da0718a70f4c">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ff=
mpeg.org%2FFFmpeg%2FFFmpeg%2Fcommit%2F5d7112c60e6f0f0742ce47d448e6da0718a70=
f4c&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7Cc5cd2b512629=
4b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260495=
345585689%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM=
CIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DrDzwxbj4D6E%2BKtO69vqAdljWFAWdiuhPay8mzI2nkDM%3D&amp;reserved=3D0</a><br=
>
&gt; [3] <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23783">http=
s://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ffmpeg=
.org%2FFFmpeg%2FFFmpeg%2Fpulls%2F23783&amp;data=3D05%7C02%7Cbhavesh.maheshw=
ari%40einfochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f4%7C0beb0c359cbb4feb9=
9e5589e415c7944%7C1%7C0%7C639260495345626523%7CUnknown%7CTWFpbGZsb3d8eyJFbX=
B0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUI=
joyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DligCIg0tGRHfsFtp3l3p7ieKfT%2FaOjCwoc80=
XwdbnK4%3D&amp;reserved=3D0</a><br>
&gt; [4] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-66036">https:=
//nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%=
2Fvuln%2Fdetail%2Fcve-2026-66036&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40=
einfochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f4%7C0beb0c359cbb4feb99e5589=
e415c7944%7C1%7C0%7C639260495345659261%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h=
cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%=
3D%3D%7C0%7C%7C%7C&amp;sdata=3D38KssgC9DDjSA7qbSyEmWzXix%2FkX1UekEjx015o3DY=
U%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.=
com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../ffmpeg/ffmpeg/CVE-2026-66036_p1.patch&nbsp;&nbsp;&nbsp;&nbsp=
; | 120 ++++++++++++++++++<br>
&gt;&nbsp; .../ffmpeg/ffmpeg/CVE-2026-66036_p2.patch&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 71 +++++++++++<br>
&gt;&nbsp; .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |&nbsp;&nbsp; 2 +<=
br>
&gt;&nbsp; 3 files changed, 193 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-202=
6-66036_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-202=
6-66036_p2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.p=
atch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bce0265114<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch<br=
>
&gt; @@ -0,0 +1,120 @@<br>
&gt; +From 7ac88955c4678fc10cc44a786ff9bf724bb12deb Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Niedermayer &lt;michael@niedermayer.cc&gt;<br>
&gt; +Date: Sun, 12 Jul 2026 13:05:07 +0200<br>
&gt; +Subject: [PATCH 1/2] avfilter/vf_hqdn3d: reject unsupported frame par=
ameter<br>
&gt; + changes<br>
&gt; +<br>
&gt; +Fixes: out of array access<br>
&gt; +Fixes: 9aj_hqdn3d_dynamic_res.mjpg / 9aj_generate_hqdn3d_dynamic_res_=
mjpg.py<br>
&gt; +Fixes: wWDsy2oDvMuR<br>
&gt; +Found-by: Adrian Junge (vurlo) &lt;adjun37@gmail.com&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-66036<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://code.ffmpeg.org/FFmpeg/=
FFmpeg/commit/f0f634b6585fdc7bbb43ab3ae461499bfca9ad2e">https://nam04.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ffmpeg.org%2FFFmpeg%2=
FFFmpeg%2Fcommit%2Ff0f634b6585fdc7bbb43ab3ae461499bfca9ad2e&amp;data=3D05%7=
C02%7Cbhavesh.maheshwari%40einfochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f=
4%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260495345690477%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs=
IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DKleDBcKlFXLeKVD1v=
YsjjgUuhemdi%2FJNocGwhbit2l8%3D&amp;reserved=3D0</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips=
.com&gt;<br>
&gt; +---<br>
&gt; + libavfilter/vf_hqdn3d.c | 34 +++++++++++++++++++++++++---------<br>
&gt; + libavfilter/vf_hqdn3d.h |&nbsp; 2 ++<br>
&gt; + 2 files changed, 27 insertions(+), 9 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libavfilter/vf_hqdn3d.h b/libavfilter/vf_hqdn3d.h<br>
&gt; +index 3279bbcc77..3467f27145 100644<br>
&gt; +--- a/libavfilter/vf_hqdn3d.h<br>
&gt; ++++ b/libavfilter/vf_hqdn3d.h<br>
&gt; +@@ -36,6 +36,8 @@ typedef struct HQDN3DContext {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; double strength[4];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int hsub, vsub;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int depth;<br>
&gt; ++&nbsp;&nbsp;&nbsp; int width, height;<br>
&gt; ++&nbsp;&nbsp;&nbsp; enum AVPixelFormat format;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; void (*denoise_row[17])(uint8_t *src, uint8_=
t *dst, uint16_t *line_ant, uint16_t *frame_ant, ptrdiff_t w, int16_t *spat=
ial, int16_t *temporal);<br>
&gt; + } HQDN3DContext;<br>
<br>
Hello,<br>
<br>
This change touches exposed/documented API: <a href=3D"https://www.ffmpeg.o=
rg/doxygen/8.0/structHQDN3DContext.html">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ffm=
peg.org%2Fdoxygen%2F8.0%2FstructHQDN3DContext.html&amp;data=3D05%7C02%7Cbha=
vesh.maheshwari%40einfochips.com%7Cc5cd2b5126294b9c4d9108df1c0894f4%7C0beb0=
c359cbb4feb99e5589e415c7944%7C1%7C0%7C639260495345715588%7CUnknown%7CTWFpbG=
Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT=
WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DrJt9AoaQCIyipSiOxP1rMdq2sR=
6ez9%2Fvh6lZxpc0Mgo%3D&amp;reserved=3D0</a><br>
Are you sure this does not break existing code?<br>
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

--_000_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_--

--_004_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=9472;
	creation-date="Mon, 28 Sep 2026 10:14:24 GMT";
	modification-date="Mon, 28 Sep 2026 10:14:24 GMT"
Content-ID: <b7627589-92e3-4ba8-b5bd-95367dfda157>
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

--_004_SN4PR04MB83981510919C6B8254C23A02E58D2SN4PR04MB8398namp_--

