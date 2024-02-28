Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82E6C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 15:04:24 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.15553.1709132660324594438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 07:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2leoNEI;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d2533089f6so69672141fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709132658; x=1709737458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RDB9+BROVYD9szJc90wid1UYunHmTINVKgwm9/SLtkU=;
        b=G2leoNEIhEAHUXgrhXQPsQYi+wOHd2BiKOfYNZpMf2MAu56K7E8D0goszUoc8Q3jPz
         xtqObaPPRB91fUTY0SD6W0egfsSu1iWKSTe3jDGlLAtvdNKpclIcAzX2bIKOQ8utl6Yd
         eO1FhVquZ51DNMMInjyIlfJtB6E+5U49j7KZx9IsCBEHFMVT5EL8vNi/9QmqfEKkytPx
         Q4CpmET9g/5kRvrgJrN+VCmhoYPmubowwQFRLo4WsRbbMEVC1MT6yZND0H3PRM0rx+az
         6C3wSuQI7wluT81WS3hQ+aB+LtpmVlrcUsmqbB/5uR9NWgO3c8Fw+TEM76nU/XPRhl+2
         8f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709132658; x=1709737458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDB9+BROVYD9szJc90wid1UYunHmTINVKgwm9/SLtkU=;
        b=VDj7+PMe/z3kgy2UhNevnhxtH8yaAvqFRuA4WH4Z2ScvBlIWa5LbP911SKQA8XUGQt
         60dQHC2l1qMtmeSf1b70pPCAOL4NYn/rTwawG+8EnaYDJzxNOuq7c1cr3T5woIjljcib
         L5DxVVlwbIOKfWk/BPaCWVnU4QpGEtjKZWYNFPh9Bk8+E1P7C0RD0k/eQEXnfAw8t+Yh
         GHEkSVHFmNcMpFzv+b8Uv39HR8zKlKBWEoXOAwiaqOayPo6y5K/sb5ETg6sV+vfTO5oA
         mpXL4QVp64CUx+r4KjRvThvU76hYdCkH3MBKuDXmQFSgfgAeIw0Mta5tllkyL9HKSVMd
         gP2g==
X-Gm-Message-State: AOJu0Yw+2j6ITBmkPFiCoaksim5UUdfxe/403FwK3QsNk3Y2zGfDC9GA
	HXGhl6qE0AvIbbizAb0PjAxvF7+3XDUMAoWFSf/oIXb4ycIFSgQgDojfgoqW6BYCyuN4K8TPnuR
	XKcrpRKZ34fBXOkLKPORHZNtCoJU=
X-Google-Smtp-Source: AGHT+IF+DKcePCR9shPHZm/rC3N4GL0yMqnpP1hC3hr6aDW2eF3hEb6FJBT/+RkgWDSf1afqEmy3z7ZNshgvgy9FL7s=
X-Received: by 2002:a2e:a0d3:0:b0:2d2:ab11:45ca with SMTP id
 f19-20020a2ea0d3000000b002d2ab1145camr2414053ljm.39.1709132658178; Wed, 28
 Feb 2024 07:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20240228150201.224875-1-omatiush@cisco.com>
In-Reply-To: <20240228150201.224875-1-omatiush@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Feb 2024 16:04:07 +0100
Message-ID: <CANNYZj8bv64qtm6hFxdzo=m3DysZLY-+pcKdG93OG1CrxyAFMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bash: improve reproducibility
To: omatiush@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6fd2a06127274eb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 15:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196388

--000000000000f6fd2a06127274eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don=E2=80=99t copy paste from target install. Make a function.

Alex

On Wed 28. Feb 2024 at 16.02, Oleh Matiusha via lists.openembedded.org
<omatiush=3Dcisco.com@lists.openembedded.org> wrote:

> Nativesdk package contains host references in output packages.
> Remove them.
>
> Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> index 2c3e605511..c8275c0443 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -74,6 +74,7 @@ do_install:append () {
>                 mv ${D}${bindir}/bash ${D}${base_bindir}
>         fi
>  }
> +
>  do_install:append:class-target () {
>         # Clean buildhost references in bashbug
>         sed -i -e "s,--sysroot=3D${STAGING_DIR_TARGET},,g" \
> @@ -93,6 +94,26 @@ do_install:append:class-target () {
>                 ${D}${libdir}/bash/Makefile.inc
>  }
>
> +
> +do_install:append:class-nativesdk () {
> +       # Clean buildhost references in bashbug
> +       sed -i -e "s,--sysroot=3D${STAGING_DIR_TARGET},,g" \
> +               -e "s,-I${WORKDIR}/\S* ,,g" \
> +               -e 's|${DEBUG_PREFIX_MAP}||g' \
> +               ${D}${bindir}/bashbug
> +
> +       # Clean buildhost references in bash.pc
> +       sed -i -e "s,--sysroot=3D${STAGING_DIR_TARGET},,g" \
> +            ${D}${libdir}/pkgconfig/bash.pc
> +
> +       # Clean buildhost references in Makefile.inc
> +       sed -i -e "s,--sysroot=3D${STAGING_DIR_TARGET},,g" \
> +               -e 's|${DEBUG_PREFIX_MAP}||g' \
> +               -e 's:${HOSTTOOLS_DIR}/::g' \
> +               -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> +               ${D}${libdir}/bash/Makefile.inc
> +}
> +
>  do_install_ptest () {
>         make INSTALL_TEST_DIR=3D${D}${PTEST_PATH}/tests install-test
>         cp ${B}/Makefile ${D}${PTEST_PATH}
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196387):
> https://lists.openembedded.org/g/openembedded-core/message/196387
> Mute This Topic: https://lists.openembedded.org/mt/104624288/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f6fd2a06127274eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Don=E2=80=99t copy paste from target install. Make a func=
tion.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 28=
. Feb 2024 at 16.02, Oleh Matiusha via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;omatiush=3D<a href=3D"mailto:cisco.com=
@lists.openembedded.org">cisco.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">Nativesdk package contains host references in outpu=
t packages.<br>
Remove them.<br>
<br>
Signed-off-by: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" targ=
et=3D"_blank">omatiush@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/bash/bash.inc | 21 +++++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
<br>
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/ba=
sh/bash.inc<br>
index 2c3e605511..c8275c0443 100644<br>
--- a/meta/recipes-extended/bash/bash.inc<br>
+++ b/meta/recipes-extended/bash/bash.inc<br>
@@ -74,6 +74,7 @@ do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/ba=
sh ${D}${base_bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+<br>
=C2=A0do_install:append:class-target () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clean buildhost references in bashbug<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;s,--sysroot=3D${STAGING_DIR_TAR=
GET},,g&quot; \<br>
@@ -93,6 +94,26 @@ do_install:append:class-target () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/bash/=
Makefile.inc<br>
=C2=A0}<br>
<br>
+<br>
+do_install:append:class-nativesdk () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Clean buildhost references in bashbug<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s,--sysroot=3D${STAGING_DIR_TAR=
GET},,g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s,-I${WORK=
DIR}/\S* ,,g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_P=
REFIX_MAP}||g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${bindir}/bashb=
ug<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Clean buildhost references in bash.pc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s,--sysroot=3D${STAGING_DIR_TAR=
GET},,g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/pkgconfig/bash.pc<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Clean buildhost references in Makefile.inc<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s,--sysroot=3D${STAGING_DIR_TAR=
GET},,g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_P=
REFIX_MAP}||g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${HOSTTOO=
LS_DIR}/::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${BASE_WO=
RKDIR}/${MULTIMACH_TARGET_SYS}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/bash/=
Makefile.inc<br>
+}<br>
+<br>
=C2=A0do_install_ptest () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make INSTALL_TEST_DIR=3D${D}${PTEST_PATH}/tests=
 install-test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/Makefile ${D}${PTEST_PATH}<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196387): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196387" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196387</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104624288/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104624288/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f6fd2a06127274eb--

