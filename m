Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FAAC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:22:55 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10832.1789550572136873734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 02:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=MHRZT551;
 spf=pass (domain: einfochips.com, ip: 52.101.48.55, mailfrom: bhavesh.maheshwari@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8TQyBpuFM3Sr5ZNHn7/DPJO8GB39guC6SWLYGJh5aPj+zUpjyiz9xkyK1HiFrDK3L1r7x2e/AjqXaoNDiA3zypU1P22Z8KP72gtJOiEoVOkr8maqMS0/7r9EE5R/F7tvhHTsvgNcMwv4BefXcDAYVVlks41DNI1InLIlQ128znw+r3D+p7tEeUhW6w5SRylYmPGQJ3CYsnnz19LMhx5YGwHzzJiQ2SMQr+KJyJezIg2f5RSGqX9EzzWt2S+/BW9PtPrAKub8vnYR8AikqfO1I1PP4eMgDC7U+niI82YHwdUksjqUGgmrnIcyFEg08KKFrwVg1ruB9ijxfdvybY+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeYoSW1x6joHBC9Bgsp5aRTZjp5FSeagoTpQRmG+1YQ=;
 b=uNa7VLmBmeSE6y858SNE7kbuhz62EE5AYQAsEmCNEo9TtLObGfOl2V5f7ufNrvZiJ/OVwU5GyRbqKmGqGWyLSTVMTl66HO8/oXuSn1Pf5D2SxAJTNrJAIp/ShZ7v44QHPQ0dF0itwyvxFlvtt3iDX6kitTUMntRthvEuMEUtA39PYoSkcvq8quadEyRGeidWFQiGI64plhWs7rpt3xwhM+ATZ7C15DPJ0BmISjXnuIsFCU9CQ7NUou+SCLIjw1Th3nHKFxzRtImYSIA1l4qXzJu5z3gBJf5LizyyR93qaPzERtbI8aC04RCtRL+2MX85hlQHaSm6YPAa4ItD09dBFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeYoSW1x6joHBC9Bgsp5aRTZjp5FSeagoTpQRmG+1YQ=;
 b=MHRZT55138K0jRzI3qVPgiET7uky46yFu4YFKcnjQaS1FZUX7x/0W8voJXzcuxFJWy3sbNQxe9TdCNwfChg0pWfaCtZVnHbu8ciCBnMKhOajCrh2QJ9xrtq9cD1nL68IbAj3kptzuG8MBysLTcRZfyAi3UOGRstxaVM3egxUeBc=
Received: from SN4SPRMB0003.namprd04.prod.outlook.com (2603:10b6:806:211::12)
 by CH8PR04MB994358.namprd04.prod.outlook.com (2603:10b6:610:35c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 09:22:49 +0000
Received: from SN4SPRMB0003.namprd04.prod.outlook.com
 ([fe80::5b09:d102:984d:f086]) by SN4SPRMB0003.namprd04.prod.outlook.com
 ([fe80::5b09:d102:984d:f086%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 09:22:49 +0000
From: Bhavesh Rajesh Maheshwari <Bhavesh.Maheshwari@einfochips.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set
 CVE_STATUS for CVE-2026-64831
Thread-Topic: [External] Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set
 CVE_STATUS for CVE-2026-64831
Thread-Index: AQHdRR1d/pXbFWJ/M0mLHRNP2ef2jbbQ72j1
Date: Wed, 16 Sep 2026 09:22:49 +0000
Message-ID: 
 <SN4SPRMB000391CFE6AF13DFA30508BBE5B92@SN4SPRMB0003.namprd04.prod.outlook.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
 <20260910133357.452394-2-bhavesh.maheshwari@einfochips.com>
 <DLFYFNE7WFWL.3F3WFUFA1M1VX@smile.fr>
In-Reply-To: <DLFYFNE7WFWL.3F3WFUFA1M1VX@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-16T09:22:48.448Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=1;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4SPRMB0003:EE_|CH8PR04MB994358:EE_
x-ms-office365-filtering-correlation-id: b59731e2-ceb6-41de-4e0f-08df13d41387
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|31052699007|39142699007|366016|23010399003|6049299003|4013099003|4053099003|13003099007|38070700021|6133799003|4133799003|10067099003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003|8096899003|55112099003;
x-microsoft-antispam-message-info: 
 3riH6Jep6RwknZSeP50CCaQJdZKCoUqfPe86aYOHVUz7TbjeQmNYozhMtIp18uh2BygCn+ZPUYy1r6z8xHt/8DX+6BgylJR5wjn7J/lAR3oCC2LbmF6PLnFkn5oh1puPhC32KwCOw5H7dgyp5asj01Zojlxa/6GTVRIuNH1i4Fhz9C4SFe5P17AWKSSKTrgO/krcvPVpKMh7q1b9gECoNnywtBmmv9b2LwQMRB2Z48NgxF/lwhNwfOiV9yvg47DiI9U637naJ0WUj1AJFcxH41pQbQBQps1r4SpfYGRYIwngBTMxI+mNVfCOGicTTZD3W9xSi7HVjT3nhdT6Y8dLSKnm5+5bzm8KyGvWlMG/522NtL9PCPwPgiGWwoKC73Y85s0xN2fu0DCl/uXMcbf5v0aKJbaI5eYKej1OmuqWtqeR/0frC+Pd5hIhK1BT7e5n+qgegnMtaS3NaakZXrn6+YqAtzHcRRCJUTGWkb9zX146iqUWOduDCXAF7tHdJDwtqprCIJgfzkHpNo0OxzHXMTZeE+9Tnq4LebG/KBGtQaFhHIj4mOFqI0Ys+W6sCMJJaFLB2QgKey3aGg6XDpHMeuU1iYu2NLZnxfY3fNRRtgRQHjaTpCTf6ne0BGGh6ULboSXNmM3A0lwjDKqFzhgXvB9WlDrzLk4wxlHvS49dh/Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4SPRMB0003.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(31052699007)(39142699007)(366016)(23010399003)(6049299003)(4013099003)(4053099003)(13003099007)(38070700021)(6133799003)(4133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(8096899003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?12gahJm7oyIwJY58l64PTq36HQeVf+HkKDt4Dfq+iM94/ej0AHkwfBCAXrST?=
 =?us-ascii?Q?zB5Lb8maOWv/eSW+dM4MLVuIty3GeS8hD80s+JVP8i/LcdOutWqHoBwb8xdU?=
 =?us-ascii?Q?Yg1XGmPhw6VJs0ipziEIrw+ERY0nO7CkJ7Ye4KSKEcS/lmXJBajCtqDjgoZk?=
 =?us-ascii?Q?oMizOKS5euoptAh89DpoQc+T3HVLBeWgpHfqvEPhw5nDrvcRc+hDPnp/8Upg?=
 =?us-ascii?Q?FTw+US+Sj29q0OH9EPmmgqE/1OcTShhb0qHgo+ytMHno74EjzPAZnWyoZGit?=
 =?us-ascii?Q?pfHS+Jkk2feT86nJo+F3YGDcHYvV+l7JAFNam+TwOLfUqQ0v5pSS31r5y1+f?=
 =?us-ascii?Q?S1CiluWN37elO89XxfaIc/0zIIGu+LJ6jywfasOmoAFIfN6YlclvEN8px9HR?=
 =?us-ascii?Q?WxlMklPh7a7zTxoisjs+nYqmcn5+ECLGS71CN8qqqllhWK0/w7Eq0PLiF0Rk?=
 =?us-ascii?Q?OJi4lo+aNqa16bCabWExA0sEDrO82xqVET1MY3OaEzPR3d8XZitPdrXzNfQL?=
 =?us-ascii?Q?oOOeeW7xTUoiStMFTlIt+AzVCmzr/WsiXZaXpXuNDZFoJJEjg0ZTbs4Rcs5G?=
 =?us-ascii?Q?fCvab+6PiuwG5aa+mSbdrdaV+vNkSgHK3btIG7xjszddDVerfmh9EU97cBSJ?=
 =?us-ascii?Q?Oe43d0ihs4AS1GLAkozuGzCoWiEgiuM48iWNjWkF7I9md2GVBYBiLOvnZQaW?=
 =?us-ascii?Q?wPZhRf3UjSu/bRsHdtUx0gp2PkuBcm7iMDaxJg5yFU+tyWfWOgW74hIWJt2k?=
 =?us-ascii?Q?c5GxukG0Os6/A6DRpMbKV3wl8uaEyfoE7waQj4sflXXqducSqSEDvbeFl8Ff?=
 =?us-ascii?Q?uWbqcDvDkB7elLBs+4opI1CF3E6YeS0O6yQ5Ikd6oYI+f9JPkIWCr9uAbKYB?=
 =?us-ascii?Q?GHAXcecUTR2HqtbuaJher7kdtM32/2IjZHelxQjbO/CqL1/hhTy4R5zzwABg?=
 =?us-ascii?Q?NvcniZUsbKZpLnU6V8/5fgiraGj75OrR6NJVPcVYIbieBlG9TR8mq4NG0y3Z?=
 =?us-ascii?Q?7k5fu12JIu3dvTnfjCeEixJgGZ0ofk/n7062/JMKGeFEN8vKuoQEiBF/b3+9?=
 =?us-ascii?Q?fWOdYmGIDTkh6Y/x4Y8KbvoP6ZtgwGEONYEZQWUbs57uwH6MDl/uBkWCyPs2?=
 =?us-ascii?Q?KCmCwkBDCzM/bJtAErL3r0iL7aImck2XVEHUmmeLwexC2mhfKxK5x6+oH0A0?=
 =?us-ascii?Q?E8gc7BqYYNMW4gFdF87bV9lzwIGq7fcoArVJJy0Yd4GFUhyTWi9hl4oztNid?=
 =?us-ascii?Q?xeNAWCVTB+zW3yTVKczhehXnwKUByePAqhDoKgz5kbskIxnBEMlEYz1jKudY?=
 =?us-ascii?Q?Vq9U5NgKrnQ+8y8pRG2Ibz/2jxlrVGLF4PqHV0UeUmucVilE7Kz9oH66FEfd?=
 =?us-ascii?Q?2I+hIGJKtjHF0HzJ/5MEtD8Xh91qLilYHFuZ7bC1IMCkJi1ytu4a8XLneDUv?=
 =?us-ascii?Q?ioeTMtNPf0zSlbpGQmPIwlICuLmz+dnwDY+aT77hOANI4QZlFlyeK5DWn5NX?=
 =?us-ascii?Q?38Mz9chHDT6gi3cHAzFs2T7bOtUxL/mlqT7keWNYB4fl6NvVwH6j2+0Q8m1K?=
 =?us-ascii?Q?O4O7CfP2/QWe9qM1jPymg5Q1Dh30w+WSzBmaxZNixTyaVbnM6J+9fXyxpcZ0?=
 =?us-ascii?Q?di1PvNSNVliaRAvWpyGVAcGB0GSufd1LBq0+Po8vnd8eIQR4ZyHvEAYpzBaU?=
 =?us-ascii?Q?y9+XzsZFs/q5Rj2J28QoQ1qwJZjmNqkkerEAaKDCuf5qhSMCU6trTqjaxqg4?=
 =?us-ascii?Q?1xpCGbwBIg1Y39wau50BLnOycw3KYYA=3D?=
Content-Type: multipart/related;
	boundary="_004_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4SPRMB0003.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59731e2-ceb6-41de-4e0f-08df13d41387
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:22:49.1003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pXc2U3Ig1hERJm9T+5L1jHV5ilFmMjo5ZT8wE99Ylfm2f0qFYJs4BT8wK7F7KmMR6fW3JfHJ//xTZ4BAoD/9A5tRVT0bPhXOhHfpYJf/yZYkUey/ylhQd3O+YES2ZPq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR04MB994358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245946

--_004_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_
Content-Type: multipart/alternative;
	boundary="_000_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_"

--_000_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,
Thanks for the review.
I agree that a downstream layer could enable Vulkan HEVC hardware accelerat=
ion. However, by default this configuration is not enabled or built by the =
ffmpeg recipe.
Since the affected Vulkan HEVC code is not built with the default recipe co=
nfiguration, the proposed fix would not be compiled or exercised in our def=
ault build.
Could we instead handle this using a conditional CVE_STATUS, so that the CV=
E is marked as not applicable when Vulkan HEVC hardware acceleration is not=
 enabled, while still allowing the CVE to be reported when the relevant con=
figuration is enabled by a downstream layer?

Thanks,

Bhavesh Maheshwari
Engineer
+91 8827543501
Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.com>
[cid:d82e07d2-bdd2-4ad9-b5ee-cc155ce89991]<https://www.einfochips.com/>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: 15 September 2026 19:50
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


--_000_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I agree that a downstream layer could enable Vulkan HEVC hardware accelerat=
ion. However, by default this configuration is not enabled or built by the =
ffmpeg recipe.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Since the affected Vulkan HEVC code is not built with the default recipe co=
nfiguration, the proposed fix would not be compiled or exercised in our def=
ault build.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Could we instead handle this using a conditional <code>CVE_STATUS</code>, s=
o that the CVE is marked as not applicable when Vulkan HEVC hardware accele=
ration is not enabled, while still allowing the CVE to be reported when the=
 relevant configuration is enabled
 by a downstream layer?</div>
<div id=3D"Signature" class=3D"elementToProof">
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
<span style=3D"font-size: 12pt; color: gray;">Thanks,</span><span style=3D"=
font-size: 12pt; color: black;"><br>
</span></p>
<table style=3D"text-align: left; background-color: rgb(255, 255, 255); col=
or: rgb(33, 37, 41); box-sizing: border-box; border-collapse: collapse; bor=
der-spacing: 0px;" id=3D"table_0">
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
h: 780px;" size=3D"9472" data-outlook-trace=3D"F:1|T:1" src=3D"cid:d82e07d2=
-bdd2-4ad9-b5ee-cc155ce89991"></a></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> 15 September 2026 19:50<br>
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

--_000_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_--

--_004_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=9472;
	creation-date="Wed, 16 Sep 2026 09:21:57 GMT";
	modification-date="Wed, 16 Sep 2026 09:21:57 GMT"
Content-ID: <d82e07d2-bdd2-4ad9-b5ee-cc155ce89991>
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

--_004_SN4SPRMB000391CFE6AF13DFA30508BBE5B92SN4SPRMB0003namprd_--

