Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1140AC88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 15:06:38 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25504.1789484787661550049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 08:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=YyvcHUhL;
 spf=pass (domain: einfochips.com, ip: 52.101.57.63, mailfrom: bhavesh.maheshwari@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS/4+g5ATHnB+p238Tmzta1TQcpWokB1ytDeIwoSlaFwTgnpavKTxJMfE0n/1zdMJLnFe1w1VuP0cBxkry/HCXcd8himOdkDHgqu9zDDO1m2zhcGiieJ+RmNz5aOQY+zHt8/568Q08IJC35A0y3U3jDuK5k1IN5tJnQ2jWG6IaAOsaK17hKkw33ycJuIW2W5XTS2kpG2OZQkwemhzTqf6Wc5zdMK5FzsLs2iMBL4T019YS0yYyCiPP4SAfTGQwmTY1BrYr9XT7KyJeTgwrLSqAmTRIDYe+MgAXXEwS/Qcd1T57/RM5FVYhtrYxtHZi1QL9F01pwZsoUq6iCMrnYqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRoEcPJBRk3aAY8/oxlAXLZIHJFP/MtHcLUpxio0mbE=;
 b=YsUikMSIJN4uxAf91QQZScS2x3L3MoSnACxgileUfBLWnq4p+GB2RmjC38qQWc45lUMRLgjgeLWsMk275S4NrbRPsALEgqyerCug4oRR4v7KFgMGYWJd9/9sRMs+SrXRO5X9nhl28O8HPVy1SiaCuRg20fpG9jH593KolGTm2SmzfPbltRyLdQ6Ku6y9ek0DJfdi5aQ/TeeeoRSA8oOeTVIP2BTFgt/+fDu/f9ksz4fihcfTZWMb4o4JB+/Wcdzugy5JfUgrmz88e47syCkiDEzYGzKPsnzCETbFEUEkAy4zo+tm7CCRGSkfDM4bzzitjGuRYqXO2SdjHw9aHweb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRoEcPJBRk3aAY8/oxlAXLZIHJFP/MtHcLUpxio0mbE=;
 b=YyvcHUhLpJ9icRLOUPxVigxXhFy3G55xaxF35zjKW2OXiAFdKJ4SwKPjA/esDC4sNZLHexxmnk+Poh0hCenH100/vXio+wxwwz7moG2fWnXMthOxw1GO8YhPU5HueEnYHadgGkLlzV+HFpSdvACPj8ktTQdzTTifpGwN6JfWb8Q=
Received: from SN4SPRMB0003.namprd04.prod.outlook.com (2603:10b6:806:211::12)
 by CY5PR04MB994665.namprd04.prod.outlook.com (2603:10b6:930:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 15:06:25 +0000
Received: from SN4SPRMB0003.namprd04.prod.outlook.com
 ([fe80::5b09:d102:984d:f086]) by SN4SPRMB0003.namprd04.prod.outlook.com
 ([fe80::5b09:d102:984d:f086%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:06:25 +0000
From: Bhavesh Rajesh Maheshwari <Bhavesh.Maheshwari@einfochips.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set
 CVE_STATUS for CVE-2026-64831
Thread-Topic: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set
 CVE_STATUS for CVE-2026-64831
Thread-Index: AQHdRR1d/pXbFWJ/M0mLHRNP2ef2jbbPvJF/
Date: Tue, 15 Sep 2026 15:06:24 +0000
Message-ID: 
 <SN4SPRMB00030ACE85CE3A3FE3D5DC08E5BA2@SN4SPRMB0003.namprd04.prod.outlook.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
 <20260910133357.452394-2-bhavesh.maheshwari@einfochips.com>
 <DLFYFNE7WFWL.3F3WFUFA1M1VX@smile.fr>
In-Reply-To: <DLFYFNE7WFWL.3F3WFUFA1M1VX@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-15T15:03:42.9462014Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4SPRMB0003:EE_|CY5PR04MB994665:EE_
x-ms-office365-filtering-correlation-id: 0a1feb98-f352-41df-476c-08df133ae909
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|55112099003|18002099003|22082099003|8096899003|13003099007|4133799003|38070700021|10067099003|5023799004|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: 
 pQVhWYAXJR6TYaRHgGmZxCnCEz/8/bxh0pemP1DS3xaTGWlUosuthNb1feuRQE8F1qh6QYC0CF6YydyTkuAbsfwbZCxN5mnG48M/ajwqlTZujc28tLDXhLFZOAxlbP7gQDd4oMD9idgRG0+A6Ck0469O1FCGsFjHhzXnjLufOk/Mu331tJUrZrvyIMtk7ADImvnCnkryiVv6WNO4K8ApQecCLCQX+3gcY2WBQtKVtbpGm7+pGuZccicbZICNIUUFCSAq8lx2bwkVPn6iLNjfs3Scu+CswhoFm97e2q3u47ZOtx2t3tpWCveHmCYK+PGkkuJtCmXwX9ldONY5scmVpj+VS5X84PU348+l8KIkqT9d9R01HDn8qigf4UnipXoGydyc33LB0p7svE61S2+dKN/Vp2e60unIEb7tdxZs1RuKe+vBDv7dEj5vKck4WhSzmNgmsAgAsFJeGK0Q5V0VEOTpK9dgk6C6z4u1t2/57OIXACyo1yHnQ/BaT16IW0q+8n/4J1VfywMpig48OC3pOTGdbh07bsdMhr5wvGfHpSKJcF5PpLtrLHYr/ewy0niAKAASE/zZx30x/I7eRaLEiOV13d2dRe4g6wocMQeMeyyLzncP8YE87E9WQpmQUvVF1nC8AXO869pcEJtJcmwp4hXj4uSRECm00lbaW8slVow=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4SPRMB0003.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(55112099003)(18002099003)(22082099003)(8096899003)(13003099007)(4133799003)(38070700021)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VcIvxD+0aa0ICUXpr9LSkqc6AJT34rCYJspWhY3oUgSoH0jYgesin4SSUZoZ?=
 =?us-ascii?Q?KJeI768mtl3nK2DrooBLfy7gXwqFE4vgBlTjvCuitRZ3uOyGvwOKGipTaKu7?=
 =?us-ascii?Q?ellT0RL6r31s/KayGtrNiWGQD5ZYBMElLNtZb6Fx8znGQ3H0xiy8dBclb3Hj?=
 =?us-ascii?Q?icdASEuTNyYyf8ud+/jqwhaIrbJU7krUuccFenNShi9Dg6/UlHlwNb7UY/Lv?=
 =?us-ascii?Q?1UDjsBitntghbOA75FqT6VTf8yt8jOyQAtYgVBHuJQ+LiykxMbGafx6FRKmm?=
 =?us-ascii?Q?43GMiSb/CnoUChRvRn0CeWHyhkgWUIp18HXtBFU2ptTTyCbzmfyZVnsQgqPJ?=
 =?us-ascii?Q?CXkiY4RYspowB0wpFU5a+vPC/josUZrHVrCNCEkJs7T45aPKpaF/EWsjkCtA?=
 =?us-ascii?Q?M5iPx34ejgeo4TBm++O0JurzqbP2nVgB1D0Or2gQSf1HslSGv3r3JNGMsceI?=
 =?us-ascii?Q?YjP5yFZrxkllE0u9SLT6IeZ7+JxBs6qd28h7HqApAInc1ZVMSSg7OLLPoh/6?=
 =?us-ascii?Q?x7sDMds4bslRYr5KKa5lhY/lH8V0H9L6ZeauGP2c53jUFF6W6dSmXMI46lNG?=
 =?us-ascii?Q?BmKXdbZTJYdK08Cu5a85gRyl48hi5X5jm7L6IbO+M4HHQ7/RcN2xQITLQAf1?=
 =?us-ascii?Q?OcHX/Hkbj492Y/zwWbHXRtYhDy/7m3mQ17jIeeSRt/ZZryvz88E4eEylHXv+?=
 =?us-ascii?Q?IhvSFkqDowOmvekGQVLgXSqGx5AqIaUlO9A+LpPEWS2GNFU6pUXbKUjMvYlT?=
 =?us-ascii?Q?U4MIflm58KcDu23kn70Q+9CDLZLMcux/rgkSSUqxtck7EPwH5VcgTkfVbUtI?=
 =?us-ascii?Q?sjsE69vL/rLaOj5oWbVCilDWQO8iMR4GU2obzg42dNz0F5TIK0GK3pezDdpH?=
 =?us-ascii?Q?PI3DrTsakdIoSreU/pztQTnhbe2hhRsfHvdNNX6JT1jMNA6fxEnm61w97q+P?=
 =?us-ascii?Q?iWiywH9j+m6E7dy9/tJuyqds3RIkL5eDL7b7DNDq66zFuSE/MAFZVhXE6loR?=
 =?us-ascii?Q?CcSz59HS+qEfI6ue0w+RGBop2279ZOwTZYBd3B0g0GbYjf3x7ysUiDhjdUHQ?=
 =?us-ascii?Q?OPtcK1VSO2Dks8Y3JG4WB+GZJyyYY1pDm0VWu+fhxiimHZNdHKSw2PoHuHpD?=
 =?us-ascii?Q?6tcZJw/ShEVbH9hfS/Yvqiri7+sucDLBb+vEqktw2ETrrKQu3PjX+MgvzuxE?=
 =?us-ascii?Q?PVtmeruUam/gULwNLmMFobUihOoJLmy4gJR03IQWcu8qcduYOVCz6hKc7JhR?=
 =?us-ascii?Q?kuB6CwcH40Gh+6/UXNqq2VqCZ7U0j2qJAB5cpgtCvV+tMuaU57iy1f+apu7y?=
 =?us-ascii?Q?yFF/XfvQsCuv507RYL6f/VWJpedeBcoCp9jAmEMrnQvUlAU4qLsRk5Ptgkye?=
 =?us-ascii?Q?rXUVH9kusj9R50JsyvgcRP8VXou8jEY9klpgaqaIb51rMXAYHZhKthNaFcKE?=
 =?us-ascii?Q?tsKU82Lh+ZmZ0NF90U0FIGv8jZlUzjabqmhdKlNDsTJDiK+fB4ARHxw/UIHe?=
 =?us-ascii?Q?+7kD02EMmAfHWy7bIqsmz6nvzfRdirVYbz10kOGUqAhgkbhFgZ6iJOAJPI5V?=
 =?us-ascii?Q?QkZ+jfyG2avcxBo5FvKOJAneIJ8xpgJmigMNW+rjIOQpRKSQbPtuGFIWF9as?=
 =?us-ascii?Q?34jZXPGRVDUnai+amhSud4WJpOn+Jd/x5Hj/6lZlq4kCxJVu2hFk9g6ZJSQJ?=
 =?us-ascii?Q?cUI7A8y56UDMaxlvD9BypjgCXD8KOT/AXrwgnVIro+ojpkm74DRAtEBfLRMm?=
 =?us-ascii?Q?xyfJhgXDMfTlBG5X26t+b5Ctytr8D2HYNTzJSMcROHfVOcm6Yhxm?=
Content-Type: multipart/alternative;
	boundary="_000_SN4SPRMB00030ACE85CE3A3FE3D5DC08E5BA2SN4SPRMB0003namprd_"
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4SPRMB0003.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1feb98-f352-41df-476c-08df133ae909
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 15:06:24.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBOby2ZLvnoD7V0hQ/gqhGnFWdq7O6LroNLP6yWvMAg3divkfvYLR0he4alJxPtEqJ0OBrKhoddR4KVKlTxdA5zw5OIjP4Lm4KIAed/lULqBEnTkGaZXJXlMDeERTiZO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR04MB994665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245856

--_000_SN4SPRMB00030ACE85CE3A3FE3D5DC08E5BA2SN4SPRMB0003namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the update. Request you to drop the whole series, will send you =
the updated series soon.

Thanks
Bhavesh Maheshwari

Thanks and Regards,
Bhavesh Maheshwari
Engineer
+91-8827543501

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Tuesday, 15 September 2026 19:50:20
To: Bhavesh Rajesh Maheshwari <bhavesh.maheshwari@einfochips.com>; openembe=
dded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set CVE_STA=
TUS for CVE-2026-64831


CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.


On Thu Sep 10, 2026 at 3:31 PM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Analysis:
> - CVE-2026-64831 affects Vulkan HEVC hardware acceleration.[1]
> - The ffmpeg recipe does not enable or build Vulkan HEVC hardware acceler=
ation by default.
> - Hence CVE is not applicable.
>
> Reference:
> [1] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fn=
vd.nist.gov%2Fvuln%2Fdetail%2FCVE-2026-64831&data=3D05%7C02%7Cbhavesh.mahes=
hwari%40einfochips.com%7C41484021a46a4dfe47bf08df13347c8e%7C0beb0c359cbb4fe=
b99e5589e415c7944%7C1%7C0%7C639250788317922015%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DyrPdD%2BheY4S%2BI%2Blk9W25PQl%2B48IbR6hD=
qkjhzHwdD38%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/CVE-2026-64831=
>
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> index 8c1969369b..af05ab4af9 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> @@ -186,3 +186,4 @@ CVE_STATUS[CVE-2025-59729] =3D "fixed-version: this C=
VE are fixed since v8.0"
>  CVE_STATUS[CVE-2025-59730] =3D "fixed-version: this CVE are fixed since =
v8.0"
>  CVE_STATUS[CVE-2026-8461] =3D "cpe-stable-backport: this CVE are fixed s=
ince v8.0.3"
>  CVE_STATUS[CVE-2026-40962] =3D "cpe-stable-backport: this CVE are fixed =
since v8.0.2"
> +CVE_STATUS[CVE-2026-64831] =3D "not-applicable-config: Vulkan HEVC hardw=
are acceleration is not enabled or built by this recipe."

Hello,

Nothing prevent a downstream layer from activating this feature.

The CVE fix[0] (per NVD) is quite simple and does apply on the ffmpeg
8.0.x branch. Can you send a backport of the fix instead?

I'll keep reviewing the rest of the series.

[0]: https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fco=
de.ffmpeg.org%2FFFmpeg%2FFFmpeg%2Fpulls%2F23665%2Fcommits%2Fea8087200ce91f3=
f296a30541a89b19ae4af19a2&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.=
com%7C41484021a46a4dfe47bf08df13347c8e%7C0beb0c359cbb4feb99e5589e415c7944%7=
C1%7C0%7C639250788317952327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7=
C%7C%7C&sdata=3DSvy41Azt9Tq9hacdbW%2BYKDW6HUUQGxDJ7n%2FWQKoUaus%3D&reserved=
=3D0<https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23665/commits/ea8087200ce9=
1f3f296a30541a89b19ae4af19a2>

Thanks!
--
Yoann Congal
Smile ECS


--_000_SN4SPRMB00030ACE85CE3A3FE3D5DC08E5BA2SN4SPRMB0003namprd_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Hi Yoann,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Thanks for the update. Request you to drop the whole series, will send you =
the updated series soon.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Thanks&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(33, 33, 33);" =
dir=3D"auto">
Bhavesh Maheshwari&nbsp;</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, =
-apple-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto" style=3D"font-family: =
Aptos, Aptos_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(33, 33, 33);">
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Thanks and Regards,&nbsp;</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Bhavesh Maheshwari</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Engineer</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
+91-8827543501</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, 15 September 2026 19:50:20<br>
<b>To:</b> Bhavesh Rajesh Maheshwari &lt;bhavesh.maheshwari@einfochips.com&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;<br>
<b>Subject:</b> [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set =
CVE_STATUS for CVE-2026-64831</font>
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
On Thu Sep 10, 2026 at 3:31 PM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:<br>
&gt; From: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.com&gt;<b=
r>
&gt;<br>
&gt; Analysis:<br>
&gt; - CVE-2026-64831 affects Vulkan HEVC hardware acceleration.[1]<br>
&gt; - The ffmpeg recipe does not enable or build Vulkan HEVC hardware acce=
leration by default.<br>
&gt; - Hence CVE is not applicable.<br>
&gt;<br>
&gt; Reference:<br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-64831">https:=
//nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%=
2Fvuln%2Fdetail%2FCVE-2026-64831&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40=
einfochips.com%7C41484021a46a4dfe47bf08df13347c8e%7C0beb0c359cbb4feb99e5589=
e415c7944%7C1%7C0%7C639250788317922015%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h=
cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%=
3D%3D%7C0%7C%7C%7C&amp;sdata=3DyrPdD%2BheY4S%2BI%2Blk9W25PQl%2B48IbR6hDqkjh=
zHwdD38%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.=
com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/rec=
ipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb<br>
&gt; index 8c1969369b..af05ab4af9 100644<br>
&gt; --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb<br>
&gt; @@ -186,3 +186,4 @@ CVE_STATUS[CVE-2025-59729] =3D &quot;fixed-version=
: this CVE are fixed since v8.0&quot;<br>
&gt;&nbsp; CVE_STATUS[CVE-2025-59730] =3D &quot;fixed-version: this CVE are=
 fixed since v8.0&quot;<br>
&gt;&nbsp; CVE_STATUS[CVE-2026-8461] =3D &quot;cpe-stable-backport: this CV=
E are fixed since v8.0.3&quot;<br>
&gt;&nbsp; CVE_STATUS[CVE-2026-40962] =3D &quot;cpe-stable-backport: this C=
VE are fixed since v8.0.2&quot;<br>
&gt; +CVE_STATUS[CVE-2026-64831] =3D &quot;not-applicable-config: Vulkan HE=
VC hardware acceleration is not enabled or built by this recipe.&quot;<br>
<br>
Hello,<br>
<br>
Nothing prevent a downstream layer from activating this feature.<br>
<br>
The CVE fix[0] (per NVD) is quite simple and does apply on the ffmpeg<br>
8.0.x branch. Can you send a backport of the fix instead?<br>
<br>
I'll keep reviewing the rest of the series.<br>
<br>
[0]: <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23665/commits/e=
a8087200ce91f3f296a30541a89b19ae4af19a2">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcode.ff=
mpeg.org%2FFFmpeg%2FFFmpeg%2Fpulls%2F23665%2Fcommits%2Fea8087200ce91f3f296a=
30541a89b19ae4af19a2&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.c=
om%7C41484021a46a4dfe47bf08df13347c8e%7C0beb0c359cbb4feb99e5589e415c7944%7C=
1%7C0%7C639250788317952327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C=
%7C%7C&amp;sdata=3DSvy41Azt9Tq9hacdbW%2BYKDW6HUUQGxDJ7n%2FWQKoUaus%3D&amp;r=
eserved=3D0</a><br>
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

--_000_SN4SPRMB00030ACE85CE3A3FE3D5DC08E5BA2SN4SPRMB0003namprd_--

