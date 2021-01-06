Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.56])
 by mx.groups.io with SMTP id smtpd.web08.2851.1609901939621274289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 18:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IFL+43XU;
 spf=pass (domain: windriver.com, ip: 40.107.92.56, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPGV6nL0hlW/EjARTZU7pKSijqNX5b1dXsfnI8jEuYQJQb7zmkKR6t3IV/fvD1To62NGvFjnjk+4Qo5rGjHCaZ7WG0FuoPMLMWYsMv2u6vHHR5NdLzHxT2teOwf8HMREvZ0fONedODy8kUnp2FjHu9Kp2jSznwo1kaAtxRCeLuUPcKrYVYG6Td/s0IS8Ucb6m9PCPP8d+VtzcQ1W/VHbW291uFH00WLPD5jkw6Gn26zGGKSaWpF4g2N6V83MBlFdX0z51pzv9RhsEyc1xqERCfR8I4jBMUsF02huFhlynr/WMKK35jxH1DLRHSnq/KRo8+Jc4cLcc7xfJAJBYUc60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0r3+DEDswh76m01wNsdzeHbKeJ2Hbq838sTuCKD4Qs=;
 b=QTikobIeHkGcTzEy48Rha2s+yXE7+iRfS+v7wQAIm/ONchQh33RYUAFVrN5e7s3yoVhSLexUG36lMd0Dh+fkB2ACvI+0kK9S1P2qxgbXTYuE99yChe1wBJGGZV7CaGKXRp+WxKPB/BeG8KsUkXg+LAo6YjfNKeNlDk/SNdnuzLqzLuNDiRTP+liU7nGKV3PGertICnbzwRHQJ5fQDZoD65Yorm5UXuESaE1BLwc5qzmuDclVILxlD2si+4EYe+8tN97YO0Zpbv2e6Q7W2SVmgISDd51uCxHkJ9vfDReQpa4eZ/g4Md9pOYBId1fi0ui/nLiMf0FFDTaUzD0d9uyQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0r3+DEDswh76m01wNsdzeHbKeJ2Hbq838sTuCKD4Qs=;
 b=IFL+43XUhBruOZDkzIpJvNWkyyYJtEZGVVuYeGD0wo9z321MIIFuZlPdh/kjzO0Lh+71AJkhT5OGYFUbv4Jtrypt0Dub5AU0Ru5oiQ/sICKUOB5WEXx5zUq8/NY1es+XNRH35Z1Mn+1guY2y6eoH8T54URt9dVsnAXlqZ5EN5qo=
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2112.namprd11.prod.outlook.com (2603:10b6:301:50::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Wed, 6 Jan
 2021 02:58:57 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 02:58:57 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Tanu Kaskinen <tanuk@iki.fi>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "armccurdy@gmail.com"
	<armccurdy@gmail.com>
Subject: Re: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=softfp for CC on armv5
Thread-Topic: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=softfp for
 CC on armv5
Thread-Index: AQHW4xQe+jlDZpONFk6SnpCjdjaoHaoY+MYAgABsSICAAIMEfg==
Date: Wed, 6 Jan 2021 02:58:57 +0000
Message-ID: 
 <CO1PR11MB5009226E20B28FFEAA184C44F1D00@CO1PR11MB5009.namprd11.prod.outlook.com>
References: 
 <CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
	 <20210105033719.809-1-mingli.yu@windriver.com>
	 <89cb1de79cc242d0545829a3138685ebc4ffe8cd.camel@linuxfoundation.org>,<25433ae4028ee7784430c585a71bf503a4a1d37d.camel@iki.fi>
In-Reply-To: <25433ae4028ee7784430c585a71bf503a4a1d37d.camel@iki.fi>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: iki.fi; dkim=none (message not signed)
 header.d=none;iki.fi; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ddfe3bf-1fc6-4638-7131-08d8b1ef02e0
x-ms-traffictypediagnostic: MWHPR1101MB2112:
x-microsoft-antispam-prvs: 
 <MWHPR1101MB211235A4AABE0A4167232B17F1D00@MWHPR1101MB2112.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k7u0XxKm+VGE++yvhotl/OsevaJ9vkwGiONRXpeywUjIH0JTKfG8w5w0FqiaN0eYxQPQ8vgpHJbVwmhGdCWKkcKKeeHJ905lMQMsKo4rLGfE3qZQMQb31vPOg+6Hkrbs9CbVqZ9cQA1srKRSd9qsdiu8ZXnYfxkuFUGWWrdOkYqiX3skmwNXbmz0N/Lehq2QbXx3imlV7Co/179E3azXA25BEawZxM0JHw+05J4gdmDwSX2KHwXX8oBEtLuS0uMuvclJkVldc3E6hD2z1Wf6lv03Kdy7jB6jPqcjC2xv+QScHFhtbjBmmL0HENeqSdNsmHcN97VcKHAElBhTpWiGB40kV9Oj99EN6hi66srQBqhjX9v/RbhMKkZrOUTRf/aGz/sHkZX3UE8/sVAD6Q6roaqTO6Mykb4i5LVz/LIw63k6IyvWGZDIGQNuPBrBdxpVnC2qx57OrE8YxpPxl7ZSgQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(19627405001)(8936002)(110136005)(55016002)(6506007)(7696005)(53546011)(166002)(186003)(33656002)(9686003)(52536014)(2906002)(316002)(5660300002)(478600001)(19627235002)(966005)(71200400001)(76116006)(83380400001)(64756008)(66446008)(66946007)(26005)(8676002)(91956017)(66476007)(66556008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?R0jvUIkRWsYQFkX7pxucadxAJJffNb4vsRmWnWFniuDSyJN+LrBM7mBe5CnM?=
 =?us-ascii?Q?kLC0bKOEAuX8WZppFwkl/FBDZpsobEQ9d/WtV2GX556ThbMjyJtGn9GLwO3e?=
 =?us-ascii?Q?aQuqMm/VIB4XwRaIXLAVpLRn1QsVEQvjYcc1eWVBtq2inua4Q/wDPxHa4xui?=
 =?us-ascii?Q?YuARhqk+/yt2JRggt1YsPaln6tEEmEX6pESLwU+PnFZJZJL9jS/u6VSpMGpo?=
 =?us-ascii?Q?sfKS8N1MZFo81H+SXGNLXeAdSSFz0O2S2BFSh7jhqGWDnDJFl0VArvB5pGuh?=
 =?us-ascii?Q?0KdY0vNeQDR1/xdzaMzQtQVOUEzPsjtbRuLMsZEit2P0Bqf0/zKX6kMIRhWU?=
 =?us-ascii?Q?kYmaEGaIwnMSJvWzsSU58tboAEL+sTsHvVbGPjLGF4Ih1upRclxLLLsHCDbZ?=
 =?us-ascii?Q?VXiN1sgPH52cO9kd93tuwqwsJs9PS0KC4VdipstgrXPIjVqOwKgqS66TgAwT?=
 =?us-ascii?Q?xtZNDQKMPPHXX0Y9EwoMyX7exrwkszFowL8yOO6JSh1P8XVGfbSDExmEwjig?=
 =?us-ascii?Q?iTaXeHo5ZMrtIFjV8mlg8WCouw3E/J+SLz3pudhtkV+8tqwUrxHnmcuws677?=
 =?us-ascii?Q?Zb/IUbZrCoarCqVJ9RSmDZQ36HSXhHFGux5O+rYISjxhUJmvSt50r7sX4qEA?=
 =?us-ascii?Q?h675i03HI+QctbQE7EBIJhnM756fAUCr8xqkFIY7oYjs+el/nHhoTOAITt0+?=
 =?us-ascii?Q?AK2P1jUSNMJOBFRgwlNYJh1OHDmlyjHkt6/qjUZXPXb38+w2oQ2kkojvNLCS?=
 =?us-ascii?Q?Z4U1JVl08JFkGjSjLgCm3J/sf1XaJspKcvXy9dUM96annow6UzNmtOob7oQt?=
 =?us-ascii?Q?1SsjSllPn9ORFHNqdR3Xxctce1bZgGfgFvo5aF2ldO2fvnTuLqJ7GZEcqXQb?=
 =?us-ascii?Q?Yd8ktOJDZ+vqoAxZFf8kjoceR9XcTxicM/igJ5I+yZl2SSE9ondXL/9jhpn7?=
 =?us-ascii?Q?b1lA4rihe6y8OCko/1t/DmavFsXqjIdBmRRiVB0bFlk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddfe3bf-1fc6-4638-7131-08d8b1ef02e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 02:58:57.5513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dc/vJMo7ELJF/N2LT4PBnQDrh2Khbyw/kVAJ3OniVohIm4oWZQbNPu0VbVIhqG9gGYdzwkcV5TVEsv9qStBwHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2112
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009226E20B28FFEAA184C44F1D00CO1PR11MB5009namp_"

--_000_CO1PR11MB5009226E20B28FFEAA184C44F1D00CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi RP,

The pulseaudio upstream doesn't support the option to disable neon with mes=
on per the the latest release note https://www.freedesktop.org/wiki/Softwar=
e/PulseAudio/Notes/14.0/ and also thanks Tanu to report the issue to upstre=
am as https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088 .

Will update the solution if there is any update.

Thanks,
<https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088>


________________________________
From: Tanu Kaskinen <tanuk@iki.fi>
Sent: Wednesday, January 6, 2021 03:04
To: Richard Purdie <richard.purdie@linuxfoundation.org>; Yu, Mingli <Mingli=
.Yu@windriver.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>; armccurdy@gmail.com <armccurdy@gmail.com>
Subject: Re: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=3Dsoftfp f=
or CC on armv5

On Tue, 2021-01-05 at 12:37 +0000, Richard Purdie wrote:
> On Tue, 2021-01-05 at 11:37 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> After pulseaudio upgrades from 13.0 to 14.0, it also switches from
> autotools
> to meson. In autotools, there is --disable-neon-opt option for
> disabling NEON
> optimizations, but there is no counterpart in meson.
>
> And the meson build system adds -mfpu=3Dneon at the end of the compiler
> command
> line which overrids any earlier -mfpu options and result below build
> failure
> on armv5:
>
> > /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-
> > r0/recipe-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-
> > linux-gnueabi/10.2.0/include/arm_neon.h:31:2: error: #error "NEON
> > intrinsics not available with the soft-float ABI.  Please use -
> > mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
> >  31 | #error "NEON intrinsics not available with the soft-float ABI.
> > Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
>       |  ^~~~~
> > ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function
> > 'pa_mix_ch2_s16ne_neon':
> > ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type
> > name 'int32x4_t'; did you mean 'int32_t'?
> >   38 |         int32x4_t sum0, sum1;
>
> Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index e40b8c1c40..761e4f74dc 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -123,6 +123,11 @@ PACKAGECONFIG[ipv6] =3D "-Dipv6=3Dtrue,-Dipv6=3Dfals=
e,"
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,"
>
>  export TARGET_PFPU =3D "${TARGET_FPU}"
> +# workaround build failure on qemuarmv5 as the neon optimizations is
> +# enabled by default and no option to disable neon with meson build
> +# system
> +CC_append_armv5 =3D " -mfloat-abi=3Dsoftfp"
> +export CC
>
>  set_cfg_value () {
>         sed -i -e "s/\(; *\)\?$2 =3D.*/$2 =3D $3/" "$1"
>
> I really don't want to add things like this to the recipe, I think it
> will interfere with other parts of the compilation. In many ways I'd
> prefer an option added to meson. Do we know what upstream are thinking
> in relation to this?

I think Meson should be fixed, but it may be necessary to add a build
option to PulseAudio to disable the neon code while waiting for Meson
to get fixed.

I now filed a bug for Meson:
https://github.com/mesonbuild/meson/issues/8156

and another for PulseAudio:
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088

so at least the relevant projects know about the issue now. I may work
on fixing these myself if nobody else does, but I don't expect that to
happen quickly.

--
Tanu


--_000_CO1PR11MB5009226E20B28FFEAA184C44F1D00CO1PR11MB5009namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi RP,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The pulseaudio upstream doesn't support the option to disable neon with mes=
on per the the latest release note&nbsp;<a href=3D"https://www.freedesktop.=
org/wiki/Software/PulseAudio/Notes/14.0/" id=3D"LPlnk">https://www.freedesk=
top.org/wiki/Software/PulseAudio/Notes/14.0/</a><span class=3D"ITWTqi_23IoO=
PmK3O6ErT"><mark data-markjs=3D"true">
</mark></span>and also thanks Tanu to report the issue to upstream as <a hr=
ef=3D"https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088">
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088</a> .</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Will update the solution if there is any update.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1"></div>
<a href=3D"https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/10=
88" id=3D"LPlnk"></a><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_2 _EReadonl=
y_1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<br>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tanu Kaskinen &lt;tan=
uk@iki.fi&gt;<br>
<b>Sent:</b> Wednesday, January 6, 2021 03:04<br>
<b>To:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; Yu, M=
ingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-core@lists.openembedded=
.org &lt;openembedded-core@lists.openembedded.org&gt;; armccurdy@gmail.com =
&lt;armccurdy@gmail.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=3Ds=
oftfp for CC on armv5</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 2021-01-05 at 12:37 +0000, Richard Purdie =
wrote:<br>
&gt; On Tue, 2021-01-05 at 11:37 +0800, Yu, Mingli wrote:<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; <br>
&gt; After pulseaudio upgrades from 13.0 to 14.0, it also switches from<br>
&gt; autotools<br>
&gt; to meson. In autotools, there is --disable-neon-opt option for<br>
&gt; disabling NEON<br>
&gt; optimizations, but there is no counterpart in meson.<br>
&gt; <br>
&gt; And the meson build system adds -mfpu=3Dneon at the end of the compile=
r<br>
&gt; command<br>
&gt; line which overrids any earlier -mfpu options and result below build<b=
r>
&gt; failure<br>
&gt; on armv5:<br>
&gt; <br>
&gt; &gt; /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-<br>
&gt; &gt; r0/recipe-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wr=
s-<br>
&gt; &gt; linux-gnueabi/10.2.0/include/arm_neon.h:31:2: error: #error &quot=
;NEON<br>
&gt; &gt; intrinsics not available with the soft-float ABI.&nbsp; Please us=
e -<br>
&gt; &gt; mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard&quot;<br>
&gt; &gt;&nbsp; 31 | #error &quot;NEON intrinsics not available with the so=
ft-float ABI. <br>
&gt; &gt; Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; ^~~~~<br>
&gt; &gt; ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function<br>
&gt; &gt; 'pa_mix_ch2_s16ne_neon':<br>
&gt; &gt; ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown =
type<br>
&gt; &gt; name 'int32x4_t'; did you mean 'int32_t'?<br>
&gt; &gt;&nbsp;&nbsp; 38 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
int32x4_t sum0, sum1;<br>
&gt; <br>
&gt; Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.<br=
>
&gt; <br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 +++++<br>
&gt;&nbsp; 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; index e40b8c1c40..761e4f74dc 100644<br>
&gt; --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; @@ -123,6 +123,11 @@ PACKAGECONFIG[ipv6] =3D &quot;-Dipv6=3Dtrue,-Dipv=
6=3Dfalse,&quot;<br>
&gt;&nbsp; PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,&qu=
ot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; export TARGET_PFPU =3D &quot;${TARGET_FPU}&quot;<br>
&gt; +# workaround build failure on qemuarmv5 as the neon optimizations is<=
br>
&gt; +# enabled by default and no option to disable neon with meson build<b=
r>
&gt; +# system<br>
&gt; +CC_append_armv5 =3D &quot; -mfloat-abi=3Dsoftfp&quot;<br>
&gt; +export CC<br>
&gt;&nbsp; <br>
&gt;&nbsp; set_cfg_value () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e &quot;s/\(; =
*\)\?$2 =3D.*/$2 =3D $3/&quot; &quot;$1&quot;<br>
&gt; <br>
&gt; I really don't want to add things like this to the recipe, I think it<=
br>
&gt; will interfere with other parts of the compilation. In many ways I'd<b=
r>
&gt; prefer an option added to meson. Do we know what upstream are thinking=
<br>
&gt; in relation to this?<br>
<br>
I think Meson should be fixed, but it may be necessary to add a build<br>
option to PulseAudio to disable the neon code while waiting for Meson<br>
to get fixed.<br>
<br>
I now filed a bug for Meson: <br>
<a href=3D"https://github.com/mesonbuild/meson/issues/8156">https://github.=
com/mesonbuild/meson/issues/8156</a><br>
<br>
and another for PulseAudio: <br>
<a href=3D"https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/10=
88">https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088</a><=
br>
<br>
so at least the relevant projects know about the issue now. I may work<br>
on fixing these myself if nobody else does, but I don't expect that to<br>
happen quickly.<br>
<br>
-- <br>
Tanu<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009226E20B28FFEAA184C44F1D00CO1PR11MB5009namp_--
