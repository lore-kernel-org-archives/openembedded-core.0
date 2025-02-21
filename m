Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49B2C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 14:16:14 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by mx.groups.io with SMTP id smtpd.web11.23712.1740147364949749495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 06:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=I5gbmgrW;
 spf=pass (domain: toradex.com, ip: 194.104.109.113, mailfrom: rogerio.borin@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1740147363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvAmkEwjDwkoJ6BTsAvzSs3i3jsXL3r23JUnH3nnAaI=;
	b=I5gbmgrWVT5FtRJR7B/gBzjjnUJefZoogVlVrMTP2z/q6UnU5qdnZ+RU6r7Cf5Gd1FZ1Ke
	XHA6r93IAZDAuZ0FYVFiT4APkOOeTBw6ONc+OfTbwHu82jP2nRilbhOaGymarX7RtYTem1
	0ZNVqOagIZaGvsJrX0Nx5nqBLzs+Fdk=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp17012050.outbound.protection.outlook.com
 [40.93.85.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-71-7dO6EUZvPDm6UysWmYqy3A-1; Fri, 21 Feb 2025 15:16:01 +0100
X-MC-Unique: 7dO6EUZvPDm6UysWmYqy3A-1
X-Mimecast-MFC-AGG-ID: 7dO6EUZvPDm6UysWmYqy3A_1740147360
Received: from GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::13)
 by ZR0P278MB0026.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:19::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 14:15:58 +0000
Received: from GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 ([fe80::797c:7290:661d:7a99]) by GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 ([fe80::797c:7290:661d:7a99%4]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 14:15:58 +0000
Message-ID: <da99bdf6-49d6-4efa-861b-9277f01e0588@toradex.com>
Date: Fri, 21 Feb 2025 11:15:50 -0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Sean Anderson <seanga2@gmail.com>, Marek Vasut <marex@denx.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
 <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
 <3341efe1-1515-4549-97ac-d3a82f71f16b@denx.de>
 <f5807fe9-d460-8f69-c480-84396db1fee8@gmail.com>
From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
In-Reply-To: <f5807fe9-d460-8f69-c480-84396db1fee8@gmail.com>
X-ClientProxiedBy: CP2PR80CA0241.lamprd80.prod.outlook.com
 (2603:10d6:102:42::13) To GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0321:EE_|ZR0P278MB0026:EE_
X-MS-Office365-Filtering-Correlation-Id: 13713f5f-b051-4f6e-d967-08dd528242ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mrIeuvdwfBRjIg+e/7LYXlOJyALcGuzbq8oJh4YJH6uT6vPlqm09dEnWdiOO?=
 =?us-ascii?Q?MS871L38m6gUpb7iQmF2t5m1VZOq4u7sduOvbRrI62tRyoaDmVK6ugmeGAJf?=
 =?us-ascii?Q?HXG6eKBEXNZ8dR8uSRHIuoUp6TmJuRP5eitZoLDEj5uZxoF46FehHwjtuA85?=
 =?us-ascii?Q?mC+oOUYkziKkCqjojvMqIOzck6ldjz1w/a7HkzyMYv8cLuk/narXk3bpefJr?=
 =?us-ascii?Q?nQcmhceHw4IF0sp8hV85gF5uy5SZ87M81EUlCbIbRgeN9NsghYNF9lhEV4xo?=
 =?us-ascii?Q?qLf/lb7/3/FFLz/wUncsTqrsgRD0TLHNY4xBQBlfxXlgrh80acJ1XxN+G3BE?=
 =?us-ascii?Q?+ahidbJwW62e35Ui/0Kky690JpD/xXO8gJeKixO+gk4XxyjwudYgOZrsihmZ?=
 =?us-ascii?Q?7VH/K2/TzE3ZxWgtP+wECswk0cD4AT8boZbywoM2RGdAjxLMee5Mp2ige+NQ?=
 =?us-ascii?Q?HGdaFNpeP9bryr+yyQX4+M3em3ibGwWcT3E/lLhzXXFcJDaVzHrNjdgI7JLy?=
 =?us-ascii?Q?uQM26GY7SmH3Pr0TVbMKgRggzYmutG1+Knq8OjLMzB3cmClyMtpe+iDFFe3G?=
 =?us-ascii?Q?oeJEUTbJWCKpu0EHaUar1E/RwN/p+Uptn2nZ+1IwYtKoosVxHWDrL619/o7u?=
 =?us-ascii?Q?lM6e/PFzquwB7cuqlh8+EmKKugv2JUjqlWv7Up10R7Y49JnJOYODm4YcuSGu?=
 =?us-ascii?Q?6qakMwwhxkcBLhnBoIFQSjY287tVjNFLfFO51ynv2uA+HGsvs14W9uaEx2ZC?=
 =?us-ascii?Q?Yr+lnrXPkvjo8evlT0JUtIJqY5iTUWuCfQ5E+x7fZ4yasdzV3MCZZfCGqyfG?=
 =?us-ascii?Q?1D81zT/rga9K4BOXc5BNl9yCaD65uM9I7jkVXlOt4SXcdyNicjxS14Ev8zv9?=
 =?us-ascii?Q?fl/8sRz/1A8gbXlDSuYT7nSqyVrIu0CqfmBOTmAstvNP8e6CAr662+gWWHlO?=
 =?us-ascii?Q?CqBAzG6jDP6+kLxZ+ON+hDhsFQ2zqM3YBuM2V3get1vyO7WDLMqYsBdvEk+P?=
 =?us-ascii?Q?63d1oXZgc9HeWHNYIBUGfU9GLZZwkzBaF/+tRx3yIAlXCI5FeW9jYAW8jdlj?=
 =?us-ascii?Q?chWuo2fGFIzOXIWn/SrDk4FUTMv8cCk3Cr7qwRe8oGJ7xCOZoMB50r0/Eqir?=
 =?us-ascii?Q?UQoQuXBR8sCWAl3Gj2XD2o6T6yVs5c/El9O2ctsuF6cA2o1kOR3m7pu6cwKw?=
 =?us-ascii?Q?v3cwUPlxCqd1Pq/6RJTnOzXZBI/NmKLxztC1GXNifw1WwUU/qyaL9Bpnrs+A?=
 =?us-ascii?Q?rVS4KhJISNvTw6+ERsow7hm/MnQQdEqvMTJAc16xrL1c3HL/3Nq3F6HMKkHu?=
 =?us-ascii?Q?Ev5ICxf7tTlFZew6Tl3mJqAjGyTw6i7Tf0bIIk9hOzHrYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iRTjAwFM45HRDg7HYsLZKR5dllU2XIatjfdoaKxwelSpY4pA8frXeS4cHHEh?=
 =?us-ascii?Q?u9tUyyWGwvCYQK0AMgUb6U0kifOc7R6EAiT4Ys+4IFRG/OipyX0n/Pb1OxRQ?=
 =?us-ascii?Q?Czm49PcC6FzY40lqYQLJbb+CFR+qg5qA+R5lZAk/6ihvcWjF0EGbs6PD4sF/?=
 =?us-ascii?Q?x0HBhTt+ouqUOG6JMWcSQ1ZJTv4tuTb+BB/ewgdm94TZkuB11SkjHVgpeM+p?=
 =?us-ascii?Q?5xVnHds7/JPDxT/qeHk3PXD+j8ur00vj4JO7vcOIQ8sme1DurS/inrLpRpHq?=
 =?us-ascii?Q?tTWCIJyiJTr9S5J9cb0dn7icDh18+rUS4ssE2qkE92WsYi6sdo9mPO25jUaB?=
 =?us-ascii?Q?qAW5Rq2JfjoFyMucq+t6w8VKWoLf3QqMeYRCWm88D0tONLNJ9GPY5DskVY4d?=
 =?us-ascii?Q?an+SzIRjS3kiaIb+rMbbLeZxHfE0QEyQmsr8pLmpAWDwm/MbAkBK8q84DuyE?=
 =?us-ascii?Q?lcSg+0bwhpSi19Z/jOzkVzV09T4FDYPGIwzI3D94wACk4Bm/bmRTJyYC1KgA?=
 =?us-ascii?Q?+s8jqUl0Jv76FmZT35ld5q13NX3eEx0embMQYmysdEAmlTR0I71AYm+t49Nm?=
 =?us-ascii?Q?SsGHxlYI++B+NZkoYPnN+Na+VKby7C0gervQic0O2tjQHRbZNmq3n+AYg8SX?=
 =?us-ascii?Q?/Q4lb6ikYUu0UFHmEstCz8B/GmM0hkFCjrlVcfpDvtEiAhjrEcAyQZ6WWVsS?=
 =?us-ascii?Q?hlXbnmE8Bd+MhXz7T/UkjpKx/HllXfwAZ/H0S+NGNc2BO7ORYazLnUT/nagZ?=
 =?us-ascii?Q?9CSaHABpwp37Mt8e2dt6u0Rrn8TfdSQV4ymKAlsDhVzkujGHwN9tjcEF7gYc?=
 =?us-ascii?Q?L91grp9VmUcStK0VPZT8ILtCk+nDS6vcwX4G/+7C4zl/GzbJD918udAxbLh5?=
 =?us-ascii?Q?CxqtPcLEHAUmJ5hLTHwqReAtDMd7k+z10EFI8nwJk0KYQHP7cysCK+XYukZW?=
 =?us-ascii?Q?KnD/v6yhI80uPzIKBiaUu4MouOVM+lf3qF5SjeUWZDmHwpDtu4szGNWp8dia?=
 =?us-ascii?Q?LEUXxOR/AqVuLpbrop2omgI5YfGNwcVoVbDb+mgFxYE0Zry3F7V0Do6JQ3lV?=
 =?us-ascii?Q?qJTS0e4ct1DqCC7Vb3UjM6PBo5OnDGDRzH8LAq3qO944wu9DT+X5508F7BhF?=
 =?us-ascii?Q?FmirHBib18NyfJdWXEJcp5R3yKZRusPhXllPOQ3brtcc22b+m0HijLUlDdUW?=
 =?us-ascii?Q?jxwszuKQzyY9X82/V6l8SiBe2t7KHO0Yo351XfUzSmxTkXFM7RKcKyd2XltR?=
 =?us-ascii?Q?JwjvQykqfbbQCqzPhqGete5AyXy4yRDj8MX5IstNl/G8VlVQBxGKZ6vnWZbc?=
 =?us-ascii?Q?MvRCrJQDg+dilzx1JUeEgCf7PBAdwgTgdDJdi1g4qvUbAza5PGiJtoKR5mo8?=
 =?us-ascii?Q?MKM4HbWoK7KDfHd82BqbiTK3htKg+y4bH70BczfrEotgCGptPIMb75r53+V3?=
 =?us-ascii?Q?2dp9f9fV79y/q6TdrpP8eyOik02Y9v12MNc77J3D4tAWDi2osgHsvRYUn4rt?=
 =?us-ascii?Q?b2xrv7k7N1HNLqvTkt7cS8N3mUYJ2K0P+U5bEv/ypi1+nxbAM63/NKpLADB5?=
 =?us-ascii?Q?/cwFWTGYqLDLJlr5T0X+wjCKUaKF/cpIOXumPBYytFnIv6vLa7F+CO9APqOE?=
 =?us-ascii?Q?q9dOeLPHLxqMAMr9JhIqqLc78wwqjoU+ZPmKufPYy9HvtfoIgs0DhLoXmQTn?=
 =?us-ascii?Q?ksfEJw=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13713f5f-b051-4f6e-d967-08dd528242ed
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 14:15:58.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +c+hrOTcmWW/EKRk3ADetJgMaMlK/NSl3W6/efLbIWZD7MXfMXNyG/DC5CPym/Ob3i9h9aztDMegAuvPrYyKSUfi5M/lj9njo4G2xKxcMR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0026
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ENkWM-Pq5EoPMuoBOeIiiqS2IBCHEaV76eFQ5oV8zTM_1740147360
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 14:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211799

Hey Marek and Sean,

I think we're discussing two different questions here and perhaps mixing=20
up them two :-)

One question is: Should people sign "only" the individual subimages=20
inside the FIT image? And I think we all agree that the answer is no=20
because that image would be susceptible to mix-and-match attacks.

Another question is: What's the behavior associated with the variable=20
FIT_SIGN_INDIVIDUAL? And we've got two conflicting answers:

(1) It selects between *either* signing individual images *or* signing=20
the configuration.
(2) It simply enables the signing of individual images but does not=20
impact the signing of the configuration (which is always performed if=20
UBOOT_SIGN_ENABLE=3D"1").

 From what we talked, Marek believes the behavior follows (or should=20
follow) item (1), but both the documentation and the observed behavior=20
so far (up until commit d7bd9c62) follow item (2).

So, in the end all we need to do is to decide on the *expected* behavior=20
between (1) and (2).

In my view, behavior (2), which is the documented one, is the best=20
choice because the user simply cannot sign *only* the individual images,=20
being thus more foolproof (that is, the user simply cannot produce a=20
signed image susceptible to the mix-and-match attack). Besides that,=20
since (2) is the observed behavior (up until commit d7bd9c62), changing=20
it would be a breaking change, at least in my understanding.

>>
>> See the U-Boot documentation:
>>
>> https://docs.u-boot.org/en/latest/usage/fit/signature.html
>>
>> And especially this section:
>>
>> https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-config=
urations
>>
>> That is why I find the signing of both images and configurations odd.

Checking the U-Boot docs, I see it says that it is possible to sign with=20
multiple keys. So I don't think it contradicts or prevents what Yocto is=20
doing (signing config or config+images).

Btw, the docs also says that each key has a property "required" which=20
accepts values "image" or "conf". Here's a snippet of the produced=20
U-Boot DTB (same on kirkstone and scarthgap pre d7bd9c62) when=20
FIT_SIGN_INDIVIDUAL=3D"1":

"""
$ fdtdump -s deploy/images/verdin-imx8mm/u-boot.dtb
deploy/images/verdin-imx8mm/u-boot.dtb: found fdt at offset 0
/dts-v1/;
// magic:               0xd00dfeed
// totalsize:           0x10de8 (69096)
// off_dt_struct:       0x38
// off_dt_strings:      0xf530
// off_mem_rsvmap:      0x28
// version:             17
// last_comp_version:   16
// boot_cpuid_phys:     0x0
// size_dt_strings:     0x1664
// size_dt_struct:      0xf4f8

/ {
     interrupt-parent =3D <0x00000001>;
     #address-cells =3D <0x00000002>;
     #size-cells =3D <0x00000002>;
     model =3D "Toradex Verdin iMX8M Mini WB on Verdin Development Board";
     compatible =3D "toradex,verdin-imx8mm-wifi-dev", "toradex,verdin-...
     signature {
         key-dev2 {
             required =3D "image";             <=3D=3D=3D
             algo =3D "sha256,rsa2048";
             rsa,r-squared =3D <0x3956dbd5 0x8b651d3b 0xa621244b...
             rsa,modulus =3D <0xbcb94b0f 0x77f059c2 0xfb77ccac...
             rsa,exponent =3D <0x00000000 0x00010001>;
             rsa,n0-inverse =3D <0x707813fd>;
             rsa,num-bits =3D <0x00000800>;
             key-name-hint =3D "dev2";         <=3D=3D=3D
         };
         key-dev {
             required =3D "conf";              <=3D=3D=3D
             algo =3D "sha256,rsa2048";
             rsa,r-squared =3D <0x06d11c22 0x56f31661 0x133143bb...
             rsa,modulus =3D <0xdb06864a 0x12a1e033 0x04b0b457...
             rsa,exponent =3D <0x00000000 0x00010001>;
             rsa,n0-inverse =3D <0x8925c5c7>;
             rsa,num-bits =3D <0x00000800>;
             key-name-hint =3D "dev";          <=3D=3D=3D
         };
     };
     aliases {
...
"""

Basically, the "dev2" key is marked as required for checking images=20
while the "dev" key is marked as required for checking the=20
configurations. This seems perfectly acceptable by the U-Boot=20
documentation and it works fine because the resulting kernel FIT image=20
does get both signatures. To prove, here's the snippet for the kernel:

"""
deploy/images/verdin-imx8mm/fitImage: found fdt at offset 0
/dts-v1/;
// magic:               0xd00dfeed
// totalsize:           0xb86379 (12084089)
// off_dt_struct:       0x38
// off_dt_strings:      0xb86010
// off_mem_rsvmap:      0x28
// version:             17
// last_comp_version:   16
// boot_cpuid_phys:     0x0
// size_dt_strings:     0xd0
// size_dt_struct:      0xb85fd8

/ {
     timestamp =3D <0x00000000>;
     description =3D "Kernel fitImage for Torizon OS/6.6.74";
     #address-cells =3D <0x00000001>;
     images {
         kernel-1 {
             description =3D "Linux kernel";
             data =3D [1f 8b 08 08 a6 ...
             type =3D "kernel";
             arch =3D "arm64";
             os =3D "linux";
             compression =3D "gzip";
             load =3D <0x48200000>;
             entry =3D <0x48200000>;
             hash-1 {
                 value =3D <0x4abf5358 0x1069f770 0x4eccebee 0x6fa2fce0...
                 algo =3D "sha256";
             };
             signature-1 {                   <=3D=3D=3D=3D
                 timestamp =3D <0x00000000>;
                 signer-version =3D "2024.01";
                 signer-name =3D "mkimage";
                 value =3D <0x1cc3293e 0x97759447 0x970a4cb2 0x4d904336...
                 algo =3D "sha256,rsa2048";
                 key-name-hint =3D "dev2";     <=3D=3D=3D=3D
             };
         };
...
     configurations {
         default =3D "conf-freescale_imx8mm-verdin-nonwifi-dahlia.dtb";
         conf-freescale_imx8mm-verdin-nonwifi-dahlia.dtb {
             description =3D "1 Linux kernel, FDT blob";
             kernel =3D "kernel-1";
             fdt =3D "fdt-freescale_imx8mm-verdin-nonwifi-dahlia.dtb";
             hash-1 {
                 algo =3D "sha256";
             };
             signature-1 {                  <=3D=3D=3D=3D
                 hashed-strings =3D <0x00000000 0x000000b4>;
                 hashed-nodes =3D "/",=20
"/configurations/conf-freescale_imx8mm-verdin-nonwifi-dahlia.dtb",=20
"/images/kernel-1", "/images/k...
                 timestamp =3D <0x00000000>;
                 signer-version =3D "2024.01";
                 signer-name =3D "mkimage";
                 value =3D <0x85d3c35c 0xeac899db...
                 algo =3D "sha256,rsa2048";
                 key-name-hint =3D "dev";     <=3D=3D=3D=3D
                 padding =3D "pkcs-1.5";
                 sign-images =3D "kernel", "fdt";
             };
         };
...
"""

Of course, I also agree with what Marek said that signing both=20
configurations and images is redundant, but the Yocto docs=20
(https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-FIT_SIG=
N_INDIVIDUAL)=20
says:

 > If set to =E2=80=9C1=E2=80=9D, then the kernel-fitimage class will sign =
the kernel,
 > dtb and ramdisk images individually *in addition* to signing the FIT
 > image itself. This could be useful if you are intending to verify
 > signatures in *another context than booting via U-Boot*.

Which leads me to the conclusion that the behavior pre d7bd9c62 is intended=
.

Having said all of that, notice that if the decision was really to=20
switch to interpretation (1) then other changes would be required=20
besides those made to concat_dtb(). In particular, I imagine=20
fitimage_emit_section_config() would require changes to avoid emitting=20
the signature node for the configurations.

Hope this clarifies things...


