Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web11.7577.1609212958843028296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 19:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eoTBUP2k;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGzS70+YyHflNtB4YGeLfp8Ayr43M3doy4DQpVHPXGlxU7COf/s7STtDYFV2PtKdy/mZEp6baB9wm7hCxD4hBXY3uO22KaVPvPEu5qMn4AaemcQuCDnghIAkJSKYCDjuM/u581ccSM2VEru4Qlt4aVMVSxjtBTvPa11l8y1DDDluqnEGaaSHo79kOH/HDTAb6QfVrORhD3oLUw46oVdGLUR1yC3f41OX0pI1CQTxsh5Da0YGoeOXmxzCDT0jL+b+ataKow6UR3D2DuOi6KYumRSGDn25n8Je0+z0xkTB+/5dRxSE/yerm9/jQ0L3NSMry0EeVssfwb6d0Yf3PIdlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6hAy/cbPwUSwiqBEPieBXfwHhvQ/6x9BJN+Qj+K9K0=;
 b=JrI2JTpk8pV/wyLgRfOoyGJR40rOjclU9elOxLBtFB4Um7ED8a7frMrlQgX7VHWJ3HHmc+Q4TmLjfLMywbGUZi/iiYZNPdCCe2sE/pHZ3TMzr8PGECpZb/jOc6qqossEMn8G9seJkiBuUtCR6XPdgaYAsNvvxXulaHqRC8hmPVjSiO71iHlRi1F3zm0NHBwB+A6L0UBQgFLM8xKauCsQSFz5YdqAUJSoMl3iqQ/ahheusL56ypclX0Ra1NKM67W2XLdqcHG2Iuhys4rsSHIq7+7uS+bFvf5TTgNr2GDilddU0dwjwb6eo4PNadDNrZR4+ShQ+DFsw+/sz6TXaQj0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6hAy/cbPwUSwiqBEPieBXfwHhvQ/6x9BJN+Qj+K9K0=;
 b=eoTBUP2kC+5ZbuX9Um3kvkFtmSqBApykOWq3gbzLSxt5Wn46o4HlL//Tu8MPwYKDuTE5Qp/iNgfNrTY0R8NJ4wys4odn44cOnC6hnDvmWD3EiTnBydGtl3nBEacffHTRaTNUb+RbDcY73RcnhuzJeJJKFpqx1zR2/LW4PRaN1wE=
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:35:56 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:35:56 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pulseaudio: define -mfloat-abi=softfp for CC on armv5
Thread-Topic: [OE-core] [PATCH] pulseaudio: define -mfloat-abi=softfp for CC
 on armv5
Thread-Index: AQHW3Yt0LTweczlTxkWNxgmGLM3yP6oNapwAgAAA+WM=
Date: Tue, 29 Dec 2020 03:35:56 +0000
Message-ID: 
 <CO1PR11MB5009495636B5D4DC4F1A576EF1D80@CO1PR11MB5009.namprd11.prod.outlook.com>
References: 
 <20201229023626.14834-1-mingli.yu@windriver.com>,<CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f956a355-a8c8-4671-6669-08d8abaada5d
x-ms-traffictypediagnostic: MW3PR11MB4540:
x-microsoft-antispam-prvs: 
 <MW3PR11MB4540280C52692A15A62D4821F1D80@MW3PR11MB4540.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 orE7CbidsE18XAYQMo3/CxwMi1qXS+WxUOp4phOahwEjtEF58jdLcxkE9sQJaJ3mIQDXdDWVDFVufvI/qjIeHn6fJ2rRtU6VgfteRUPV461AnNgux1m6IkKEdX10/ZYZIjI0TSW7WJJFvP47iCoEe9tWCP5gRVQXuMY3PoIlF9ZzmQM+ot6M3xXwxTIXIAXqF18QwMmLxOJOdYtGfA/o4NXthZgjpQ678G3wOctESzvyXIa0TQZrXtsDwSMY2ZT8nxdIKvSsiShG7Gz9ifmK1IhoZy/lFef0vFQQ+PX/9BfgMnS/+d+Wof8I1/GOM88ZqqHC2OvJm+UO72iVv/DLvsBhCZwHuuepzyVjV+hiiHP7n0rMcuwvwJDaeaVcPzqvkk4Myl6teSKyUEnUBdlUHV8HwTx6Q4GnaJ7Bea6l/f1d4a9pb7ludUD92YndsmgcKZfIBoSZzxcycS++vIsY/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(966005)(6506007)(2906002)(4326008)(53546011)(55016002)(66556008)(66946007)(64756008)(66446008)(86362001)(66476007)(7696005)(186003)(166002)(52536014)(478600001)(8936002)(71200400001)(76116006)(8676002)(91956017)(9686003)(33656002)(6916009)(26005)(5660300002)(316002)(83380400001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?oXpezJ+lhmvz+c1GxSS805z+VgQtrPxHaTSYk5QcgiGmLhi8+MAqDRGf/BtD?=
 =?us-ascii?Q?u+G60ASzI9roqbz6McJhRytiwwmYgdx1qK0THJyC/Dtz9ErmXB5Hlg6itrxM?=
 =?us-ascii?Q?LFBp9PnAUBQYzWf2VIqbghjUanHHoWwwX6u8DZqBlUJdcvPlPKiTiLea5Y73?=
 =?us-ascii?Q?E+Jf88i4Pu49OMFu+lA8GysZvP3IyQVod2eOuGtFVz/HaSsXjF0QUa0ShHPK?=
 =?us-ascii?Q?6S1lpHWXJJv/ZMML82D3XdXjyGLL+2fs88BlqW+yADFDABM9+8rIAKqwfbn8?=
 =?us-ascii?Q?YlaKqgiG/vmMNJkatS8bzROsxNm7D+MSt43yQvyLrjxZ1JVRKdj68i9rv2OB?=
 =?us-ascii?Q?2fMYO0VtOETOlrTdl/7JQUEhbB7HXU2xsZG+mZWxobArw7QLYZssGY1ICmfg?=
 =?us-ascii?Q?pEzGvJMBShfPtm2zaN0KkkdQqSA0REj5g9llfRBtp1TTw5DqRN4KdaNTiM6M?=
 =?us-ascii?Q?gOVK/nwrKq4Yj6GaWhX3Yjz0mR38opn2GHLkyySkARQcpoNME7/Y08IMPTrb?=
 =?us-ascii?Q?pM81JI3Hk6gE5GwWKKmJmOlhlzif6KqvEYgAvEMzoV8IjCMcwTyyGdwGU59F?=
 =?us-ascii?Q?ltoPkRfs05mcVF+OeeaERqA1dPDXBgwEVyaqcIPMqPYF4AO2KdNhWmbX/fSL?=
 =?us-ascii?Q?Sw2JRhqDeuPkIWMt3hRQtYdi1LVwOHZsA31wcrr6TmA46bRF02xjU45xB66h?=
 =?us-ascii?Q?KqrxIb6D5Uv3kWIcbz8NWorbis/eeFVbhfSJZG0TGJDx5FaRucqH4f5Wy0hX?=
 =?us-ascii?Q?5vJhwQPeP2HP4pZYVOOjxJJQ00iq/BK2qtZvdMnL6bJiOL4GpLkxxdU+lcxK?=
 =?us-ascii?Q?3r2RLHt464xDIuCI4TprQMyegBoClCjH9xON6j5NAkcBxTJ8kevZ2NuKS5d1?=
 =?us-ascii?Q?mQwUlMbfMnJSYjMfPGUCrz3Wot/T8YVCTRnc/Onvc9SoiK+62Y8Ivo8FAsRR?=
 =?us-ascii?Q?T3QszAvpr4lcy+IE/BiadbLy7XrZKEfL3Lhlrny4Wng=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f956a355-a8c8-4671-6669-08d8abaada5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 03:35:56.8403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QL+SJFdQl9d+ovqbgTr6Nc/kA9D/NC27BraVjEy0b2Kvkvg+/YzpHaGqOtTt19fMHRs16Fxe4pGMn5HyTXJu/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009495636B5D4DC4F1A576EF1D80CO1PR11MB5009namp_"

--_000_CO1PR11MB5009495636B5D4DC4F1A576EF1D80CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

The override for CC is just for armv5 and it shouldn't affect other BSPS.

Thanks,
________________________________
From: Andre McCurdy <armccurdy@gmail.com>
Sent: Tuesday, December 29, 2020 11:29
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pulseaudio: define -mfloat-abi=3Dsoftfp for=
 CC on armv5

On Mon, Dec 28, 2020 at 6:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote=
:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> After pulseaudio upgrades from 13.0 to 14.0, it also switches from autot=
ools
> to meson and there's no option for disabling Neon optimizations with mes=
on.
> And the build system adds -mfpu=3Dneon at the end of the compiler comman=
d line
> which overrids any earlier -mfpu options and result below build failure:
>
> | /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/recipe=
-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/10.=
2.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available w=
ith the soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dh=
ard"
> |  31 | #error "NEON intrinsics not available with the soft-float ABI.  =
Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
>       |  ^~~~~
> | ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch2_s=
16ne_neon':
> | ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type =
name 'int32x4_t'; did you mean 'int32_t'?
> |   38 |         int32x4_t sum0, sum1;
>
> Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.

Doesn't look right. That forces the whole package to be compiled with
floating point instructions, which will break targets which need soft
float.

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/re=
cipes-multimedia/pulseaudio/pulseaudio.inc
> index e40b8c1c40..44a6a3055e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -123,6 +123,7 @@ PACKAGECONFIG[ipv6] =3D "-Dipv6=3Dtrue,-Dipv6=3Dfals=
e,"
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,"
>
>  export TARGET_PFPU =3D "${TARGET_FPU}"
> +export CC_append_armv5 =3D " -mfloat-abi=3Dsoftfp"

Aside from the fact that the change itself looks wrong, what is export
with a conditional append supposed to do? Export unconditionally (and
so have a side effect for targets other than armv5)? Export only if
the conditional append took effect? Since most people have no idea,
it's better to keep export and the conditional append separate.

>  set_cfg_value () {
>         sed -i -e "s/\(; *\)\?$2 =3D.*/$2 =3D $3/" "$1"
> --
> 2.26.2
>
>
>=20
>

--_000_CO1PR11MB5009495636B5D4DC4F1A576EF1D80CO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hi Andre,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
The override for CC is just for <font size=3D"2"><span style=3D"font-size:=
11pt">armv5</span></font> and it shouldn't affect other BSPS.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Andre McCurdy &lt;ar=
mccurdy@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, December 29, 2020 11:29<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> OE Core mailing list &lt;openembedded-core@lists.openembedded.o=
rg&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] pulseaudio: define -mfloat-abi=3Dsof=
tfp for CC on armv5</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">On Mon, Dec 28, 2020 at 6:36 PM Yu, Mingli &lt;mi=
ngli.yu@windriver.com&gt; wrote:<br>
&gt;<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;<br>
&gt; After pulseaudio upgrades from 13.0 to 14.0, it also switches from au=
totools<br>
&gt; to meson and there's no option for disabling Neon optimizations with =
meson.<br>
&gt; And the build system adds -mfpu=3Dneon at the end of the compiler com=
mand line<br>
&gt; which overrids any earlier -mfpu options and result below build failu=
re:<br>
&gt;<br>
&gt; | /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/rec=
ipe-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/=
10.2.0/include/arm_neon.h:31:2: error: #error &quot;NEON intrinsics not ava=
ilable with the soft-float ABI.&nbsp; Please use
 -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard&quot;<br>
&gt; |&nbsp; 31 | #error &quot;NEON intrinsics not available with the soft=
-float ABI.&nbsp; Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard&quo=
t;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; ^~~~~<br>
&gt; | ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch=
2_s16ne_neon':<br>
&gt; | ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown ty=
pe name 'int32x4_t'; did you mean 'int32_t'?<br>
&gt; |&nbsp;&nbsp; 38 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
t32x4_t sum0, sum1;<br>
&gt;<br>
&gt; Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.<b=
r>
<br>
Doesn't look right. That forces the whole package to be compiled with<br>
floating point instructions, which will break targets which need soft<br>
float.<br>
<br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta=
/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; index e40b8c1c40..44a6a3055e 100644<br>
&gt; --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; @@ -123,6 +123,7 @@ PACKAGECONFIG[ipv6] =3D &quot;-Dipv6=3Dtrue,-Dipv=
6=3Dfalse,&quot;<br>
&gt;&nbsp; PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,&q=
uot;<br>
&gt;<br>
&gt;&nbsp; export TARGET_PFPU =3D &quot;${TARGET_FPU}&quot;<br>
&gt; +export CC_append_armv5 =3D &quot; -mfloat-abi=3Dsoftfp&quot;<br>
<br>
Aside from the fact that the change itself looks wrong, what is export<br>
with a conditional append supposed to do? Export unconditionally (and<br>
so have a side effect for targets other than armv5)? Export only if<br>
the conditional append took effect? Since most people have no idea,<br>
it's better to keep export and the conditional append separate.<br>
<br>
&gt;&nbsp; set_cfg_value () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e &quot;s/\(;=
 *\)\?$2 =3D.*/$2 =3D $3/&quot; &quot;$1&quot;<br>
&gt; --<br>
&gt; 2.26.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009495636B5D4DC4F1A576EF1D80CO1PR11MB5009namp_--
