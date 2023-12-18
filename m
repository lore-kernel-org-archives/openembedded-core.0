Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BE1C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 12:24:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.42844.1702902258382457492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 04:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=OCefZ9Cc;
 spf=pass (domain: snapchat.com, ip: 209.85.167.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e23c620e8so2455720e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702902256; x=1703507056; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EoxGQoa+8p+4NQKvrBwo3ZeZ7y9Lj+5zrPq4KdfL0Hg=;
        b=OCefZ9CcYSR1o8Nspo/8NVdjOifBJ3PQq9Y7fPxPIbSuKC0sWIxVqQE4HN6SW+KX7+
         e2SiH5ShM84ItSWS2H4ZN5xQ2swCaTPdx0bE/AsJRdlLjXbcONTrNNT7qX/bQomqxa78
         waBI/DinGmQXhDQpZ48DAjICnTVRIXjUDrhI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702902256; x=1703507056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoxGQoa+8p+4NQKvrBwo3ZeZ7y9Lj+5zrPq4KdfL0Hg=;
        b=YCxEFkBNfsg6ZWB3gTpmDAp8orBFW5qNcYOWuYR4Wh7vAQxvqn2astd5eop0OUPezw
         mGfrPNWD/CbjSjgU7LBA3TSP5qblkLP5IueVkksQ7L0nFCgnunMe4eUImpQbJmasSHnd
         DvgkT4AsOlUgtOJCLhHJTKfkguv70uHrv0XmtLF4ZSbqlplDTDMiS7Lhc+A3IQvOsVnl
         AEvLH/Ar0tNWiS9/9RYCzEBEC4WCPuJQ18I5vK13T2u/kzKUhLwz/ulqPH4xzukSlHU1
         8rpBM4JGR2uoYxf0nW3YuyUomrRI76YOXRFNnlclYvn6gGHCegNNVDK7ZJA4wqSHHFOg
         du/w==
X-Gm-Message-State: AOJu0Yy1ZnAkOZ2ij3kqdWg/KqZsyDCNjhniBKu8ke4MwkJxuvX4gH5a
	8phx2p/p+kVk7AhTEEWktbcczmNDpV03P+nKDu1+4g==
X-Google-Smtp-Source: AGHT+IEAXjam/pdPARPsYjRLvHOS2b2NQn2pfySbvPvOxnP56vPBuEAqEVOR5H6Oh53s/oXwWDQSpoIyMzT+xxCnWxk=
X-Received: by 2002:a05:6512:3d91:b0:50d:1479:f9db with SMTP id
 k17-20020a0565123d9100b0050d1479f9dbmr9689821lfv.98.1702902256339; Mon, 18
 Dec 2023 04:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20231215205140.2948964-1-JPEWhacker@gmail.com>
 <7c7052bbd533d3357b9c679736b7c40985a6b227.camel@linuxfoundation.org> <20231218110526aa418fee@mail.local>
In-Reply-To: <20231218110526aa418fee@mail.local>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 18 Dec 2023 13:24:05 +0100
Message-ID: <CAHUKmYY58D_2dqsSNAjd_515w7D_4LdCwwXFvbq_PQZyDYZ1cA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ipk: Switch to using zstd compression
To: alexandre.belloni@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="000000000000140f4a060cc7d433"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 12:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192638

--000000000000140f4a060cc7d433
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"In addition, it support parallel compression for additional compression
speed up."

It is not really clear what you mean with this sentence: xz also supports
parallel compression (in poky via XZ_THREADS), so zstd support for parallel
compression is not a reason to switch. zstd is rather known for fast
decompression, and in my own testing was much faster than xz for
compressing very big files (see this thread where I had done some
benchmarking of xz vs zstd for poky:
https://lists.openembedded.org/g/openembedded-core/topic/93654146#170610 )

Etienne

On Mon, Dec 18, 2023 at 12:05=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org <alexandre.belloni=3Dbootlin.com@lists.openembedded.=
org>
wrote:

> On 15/12/2023 22:48:51+0000, Richard Purdie wrote:
> > On Fri, 2023-12-15 at 13:51 -0700, Joshua Watt wrote:
> > >
> > > @@ -337,7 +335,7 @@ CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l
> ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.l
> > >  CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}.${type}"
> > >  CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL}
> ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
> > >  CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL}
> -mm=3D${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION}
> ${IMAGE_NAME}.${type}"
> > > -CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL}
> ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> > > +CONVERSION_CMD:zst =3D "zstd -f -k -c ${ZSTD_DEFAULTS}
> ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> > >  CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}.${type} -o
> ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> > >  CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.md5sum"
> > >  CONVERSION_CMD:sha1sum =3D "sha1sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha1sum"
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 55166d01784..4b1fe28c85a 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT
> XZ_THREADS"
> > >  ZSTD_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
> > >  ZSTD_THREADS[vardepvalue] =3D "1"
> > >
> > > +ZSTD_COMPRESSION_LEVEL ?=3D "-3"
> > > +ZSTD_DEFAULTS ?=3D "--threads=3D${ZSTD_THREADS} ${ZSTD_COMPRESSION_L=
EVEL}"
> > > +ZSTD_DEFAULTS[vardepsexclude] =3D "ZSTD_COMPRESSION_LEVEL ZSTD_THREA=
DS"
> > > +
> >
> > Threads, sure but the compression level does change the output...
>
> Indeed:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yoctop=
roject.org_typhoon_-23_builders_117_builds_4098_steps_12_logs_stdio&d=3DDwI=
BAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7=
FiZqqrai93ni13zQ_Q&s=3DgoqwfFCv1hUsFcfGiURrGxqTB99GLv91ufggcLAL_ps&e=3D
>
> >
> > Cheers,
> >
> > Richard
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&d=3DDw=
IBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV=
7FiZqqrai93ni13zQ_Q&s=3DT9Ac5z4SgDitQWd1B_cBzo1oOydXnG0V9MEr95tDUmQ&e=3D
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192630):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192630&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&s=3Dk68=
5ISY4i-G6Hp4zqVgYfnk-xew6vKgC-JT9kW2WLKw&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103198693_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DVXbIqF3VsSJLh=
fuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&s=3D70x-KZ_YKkAOtaXmyL5=
phwvgr8YbbWVpLg4RZFtitBA&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DVXbIqF=
3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&s=3DIj8_R9oYgqph=
ELn5UASAx5RKXsEUDZmuGqppiqL63cw&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000140f4a060cc7d433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;In addition, it support parallel compression for add=
itional compression speed up.&quot;<br><br>It is not really clear what you =
mean with this sentence: xz also supports parallel compression (in poky via=
 XZ_THREADS), so zstd support for parallel compression is not a reason to s=
witch. zstd is rather known for fast decompression, and in my own testing w=
as much faster than xz for compressing very big files (see this thread wher=
e I had done some benchmarking of xz vs zstd for poky:=C2=A0<a href=3D"http=
s://lists.openembedded.org/g/openembedded-core/topic/93654146#170610">https=
://lists.openembedded.org/g/openembedded-core/topic/93654146#170610</a> )<b=
r><br>Etienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Dec 18, 2023 at 12:05=E2=80=AFPM Alexandre Belloni via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;a=
lexandre.belloni=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bo=
otlin.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 15/12/2023 22:48:51+0000, Richard Purdi=
e wrote:<br>
&gt; On Fri, 2023-12-15 at 13:51 -0700, Joshua Watt wrote:<br>
&gt; &gt; <br>
&gt; &gt; @@ -337,7 +335,7 @@ CONVERSION_CMD:lz4 =3D &quot;lz4 -9 -z -l ${I=
MAGE_NAME}.${type} ${IMAGE_NAME}.${type}.l<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:lzo =3D &quot;lzop -9 ${IMAGE_NAME}.${type}&=
quot;<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:zip =3D &quot;zip ${ZIP_COMPRESSION_LEVEL} $=
{IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}&quot;<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:7zip =3D &quot;7za a -mx=3D${7ZIP_COMPRESSIO=
N_LEVEL} -mm=3D${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTE=
NSION} ${IMAGE_NAME}.${type}&quot;<br>
&gt; &gt; -CONVERSION_CMD:zst =3D &quot;zstd -f -k -T0 -c ${ZSTD_COMPRESSIO=
N_LEVEL} ${IMAGE_NAME}.${type} &gt; ${IMAGE_NAME}.${type}.zst&quot;<br>
&gt; &gt; +CONVERSION_CMD:zst =3D &quot;zstd -f -k -c ${ZSTD_DEFAULTS} ${IM=
AGE_NAME}.${type} &gt; ${IMAGE_NAME}.${type}.zst&quot;<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:sum =3D &quot;sumtool -i ${IMAGE_NAME}.${typ=
e} -o ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}&quot;<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:md5sum =3D &quot;md5sum ${IMAGE_NAME}.${type=
} &gt; ${IMAGE_NAME}.${type}.md5sum&quot;<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:sha1sum =3D &quot;sha1sum ${IMAGE_NAME}.${ty=
pe} &gt; ${IMAGE_NAME}.${type}.sha1sum&quot;<br>
&gt; &gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; &gt; index 55166d01784..4b1fe28c85a 100644<br>
&gt; &gt; --- a/meta/conf/bitbake.conf<br>
&gt; &gt; +++ b/meta/conf/bitbake.conf<br>
&gt; &gt; @@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] +=3D &quot;XZ_ME=
MLIMIT XZ_THREADS&quot;<br>
&gt; &gt;=C2=A0 ZSTD_THREADS ?=3D &quot;${@oe.utils.cpu_count(at_least=3D2)=
}&quot;<br>
&gt; &gt;=C2=A0 ZSTD_THREADS[vardepvalue] =3D &quot;1&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +ZSTD_COMPRESSION_LEVEL ?=3D &quot;-3&quot;<br>
&gt; &gt; +ZSTD_DEFAULTS ?=3D &quot;--threads=3D${ZSTD_THREADS} ${ZSTD_COMP=
RESSION_LEVEL}&quot;<br>
&gt; &gt; +ZSTD_DEFAULTS[vardepsexclude] =3D &quot;ZSTD_COMPRESSION_LEVEL Z=
STD_THREADS&quot;<br>
&gt; &gt; +<br>
&gt; <br>
&gt; Threads, sure but the compression level does change the output...<br>
<br>
Indeed: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__a=
utobuilder.yoctoproject.org_typhoon_-23_builders_117_builds_4098_steps_12_l=
ogs_stdio&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLh=
fuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3DgoqwfFCv1hUsFcf=
GiURrGxqTB99GLv91ufggcLAL_ps&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yoctopr=
oject.org_typhoon_-23_builders_117_builds_4098_steps_12_logs_stdio&amp;d=3D=
DwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d=
1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3DgoqwfFCv1hUsFcfGiURrGxqTB99GLv91u=
fggcLAL_ps&amp;e=3D</a> <br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.c=
om&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnk=
EJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3DT9Ac5z4SgDitQWd1B_cBzo=
1oOydXnG0V9MEr95tDUmQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&amp;d=3DDwIBAg=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDM=
F_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3DT9Ac5z4SgDitQWd1B_cBzo1oOydXnG0V9MEr95t=
DUmQ&amp;e=3D</a> <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192630): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
2630&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHV=
nkEJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3Dk685ISY4i-G6Hp4zqVgY=
fnk-xew6vKgC-JT9kW2WLKw&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_192630&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ=
_Q&amp;s=3Dk685ISY4i-G6Hp4zqVgYfnk-xew6vKgC-JT9kW2WLKw&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103198693_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6QV7=
FiZqqrai93ni13zQ_Q&amp;s=3D70x-KZ_YKkAOtaXmyL5phwvgr8YbbWVpLg4RZFtitBA&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103198693_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d=
1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3D70x-KZ_YKkAOtaXmyL5phwvgr8YbbWVpL=
g4RZFtitBA&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnkEJmbESqEa7d1xzRDMF_I8T6=
QV7FiZqqrai93ni13zQ_Q&amp;s=3DIj8_R9oYgqphELn5UASAx5RKXsEUDZmuGqppiqL63cw&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVXbIqF3VsSJLhfuxHVnk=
EJmbESqEa7d1xzRDMF_I8T6QV7FiZqqrai93ni13zQ_Q&amp;s=3DIj8_R9oYgqphELn5UASAx5=
RKXsEUDZmuGqppiqL63cw&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000140f4a060cc7d433--

