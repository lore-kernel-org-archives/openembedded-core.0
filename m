Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4388C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:15:52 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.70009.1701342949308459420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=JZ4bgZSI;
 spf=pass (domain: snapchat.com, ip: 209.85.218.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a187cd4eb74so73049666b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701342948; x=1701947748; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=atz/EDv+gKT6j2Lpo+aOo39seO4tXWPDu3uVf5F+p9U=;
        b=JZ4bgZSI35pZOoodHB/mpr3WyxONf/diw7fowHxyt4bEqG3C2GQHrgus6yWsxkibXw
         N6RNws0nU3M2y2aZsHwo+bnNsU9G+MJJMwSdnSiF77XVjQ3dk7ay4VhsHBO2j5mzhxUo
         KCVHI/9cfNtCgxfv3r9g0C6SDjUQGpDpW3+5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701342948; x=1701947748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atz/EDv+gKT6j2Lpo+aOo39seO4tXWPDu3uVf5F+p9U=;
        b=M0/2j3txlhQ+PePA9ctGbKZ71r/x8AjXP6XSqgVZ7tHGufVBbVoR7YfbMqTrKXolDS
         UH7/3YX32z9SWE8OV8mATiLpCMKDwruS6lShr6nWZpZy0oSCPfHyW90dKfNzGj38WlGe
         RzJX9IcYdGgq+8Mvfgg2mixuTQEzYRd1booyg424J/7CtmbknAUHGdksc7H20OrjUn9Y
         JwnL2UfKgbxn1RaOYCdX8g1uxAsmWNAA88pUlV6RGMjUFdlzjdQWR4G7H7iDW6YupJO3
         wHsbMvwEUPueyrzWF72cBBTqi43uIC+AQKH3Rct6fIafU61epe0aVTXfq1rbR6yuRh1p
         RRlQ==
X-Gm-Message-State: AOJu0YxKO78AO+xY/Slci/2celtAZpc/Uiumyy8nZbkuVaQ4JQA1wDgQ
	Gsvwsitap/elgJgf95WrU1sJwpxQpOqkhUQP6ph+Dw==
X-Google-Smtp-Source: AGHT+IFxzqoAIlDpc9ne/gJ3+eBmDtght8a8OGop1QCyjkmcPw8FoSiFAG9xiKp7LLKv4CEnBTVIX6zBJZ9NmB4odP4=
X-Received: by 2002:a17:906:179b:b0:9de:cfa1:f072 with SMTP id
 t27-20020a170906179b00b009decfa1f072mr13311124eje.25.1701342947497; Thu, 30
 Nov 2023 03:15:47 -0800 (PST)
MIME-Version: 1.0
References: <179C617DA6240870.31732@lists.openembedded.org>
In-Reply-To: <179C617DA6240870.31732@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 30 Nov 2023 12:15:36 +0100
Message-ID: <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support conditionally
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000748b9060b5cc697"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191495

--0000000000000748b9060b5cc697
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all, I sent this patch to start the conversation, but I guess
PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES before
this can be merged.
I tested this with core-image-sato after enabling systemd in local.conf. I
then started:
$ vi
In other terminal:
$ kill -SEGV $(pidof vi)
$ coredumpctl info

Before the patch, I didn't get a call-stack with symbols. After the patch,
I get a call-stack including function names inside busybox.nosuid
("read_key()").

This is a very useful feature for debugging and/or bug reporting, so I
think it would make sense to make it easy to enable via a DISTRO_FEATURES.
I was just not sure why MINIDEBUGINFO was not a DISTRO_FEATURES in the
first place, and whether you would be willing to enable systemd-coredump
via the MINIDEBUGINFO DISTRO_FEATURES.

On Thu, Nov 30, 2023 at 11:59=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Enabling minidebuginfo is not useful if gdb and systemd-coredump
> are unable to parse it.
>
> In order to parse it, gdb needs xz support. Systemd needs coredump
> enabled, as
> well as elfutil enabled as well (systemd-coredump loads libdw which is
> part of elfutils using dlopen).
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb       | 1 +
>  meta/recipes-devtools/elfutils/elfutils_0.189.bb | 3 ++-
>  meta/recipes-devtools/gdb/gdb-common.inc         | 3 ++-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> index ecf693ef92..f3e56bf94c 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -70,6 +70,7 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
> 'link-udev-shared', d)} \
> +    ${@'coredump elfutils' if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '=
1'
> else ''} \
>      backlight \
>      binfmt \
>      gshadow \
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> index d8bf82b022..4f097e5b5c 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> @@ -39,7 +39,8 @@ BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
>  DEPENDS_BZIP2 =3D "bzip2-replacement-native"
>  DEPENDS_BZIP2:class-target =3D "bzip2"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod=
',
> 'debuginfod libdebuginfod', '', d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod=
',
> 'debuginfod libdebuginfod', '', d)} \
> +                   ${@'xz' if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '=
1'
> else ''}"
>  PACKAGECONFIG[bzip2] =3D "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
>  PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"
>  PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc
> b/meta/recipes-devtools/gdb/gdb-common.inc
> index 3349719a6b..c444af62b3 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -30,7 +30,8 @@ EXTRA_OECONF =3D "--disable-gdbtk --disable-x
> --disable-werror \
>                  --with-libgmp-prefix=3D${STAGING_EXECPREFIXDIR} \
>  "
>
> -PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES',
> 'debuginfod', d)} python"
> +PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES',
> 'debuginfod', d)} python \
> +                   ${@'xz' if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '=
1'
> else ''}"
>  # Use --without-system-readline to compile with readline 5.
>  PACKAGECONFIG[readline] =3D
> "--with-system-readline,--without-system-readline,readline"
>  PACKAGECONFIG[python] =3D
> "--with-python=3D${WORKDIR}/python,--without-python,python3,python3-codec=
s"
> --
> 2.36.1.vfs.0.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191493):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_191493&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DhIJuYfiJHr9GFKRELhnwn96gLMBgh_mp9x4xUGbJgon0FWJJ5jnlxx1XaSOKLhdI&s=3Dm-F=
8Rs9jc8nYVkwZ6tVpeEnQ3Ka6WesbxwvuQbo4xCY&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_102891486_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DhIJuYfiJHr9GF=
KRELhnwn96gLMBgh_mp9x4xUGbJgon0FWJJ5jnlxx1XaSOKLhdI&s=3DkA0ZAZrvS23OaO3PpSW=
redRNZRqodA4pdr2LOIO4di4&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DhIJuYf=
iJHr9GFKRELhnwn96gLMBgh_mp9x4xUGbJgon0FWJJ5jnlxx1XaSOKLhdI&s=3DOQS2e4tCqxw_=
s3J_gabhUAfSjZxmBRl95PLjCFQyXM4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000748b9060b5cc697
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all, I sent this patch to start the conversation, but I=
 guess PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES b=
efore this can be merged.<br>I tested this with core-image-sato after enabl=
ing systemd in local.conf. I then started:<div>$ vi<br>In other terminal:<b=
r>$ kill -SEGV $(pidof vi)<br>$ coredumpctl info<br><br>Before the patch, I=
 didn&#39;t get a call-stack with symbols. After the patch, I get a call-st=
ack including function names inside busybox.nosuid (&quot;read_key()&quot;)=
.<br><br></div><div>This is a very useful feature for debugging and/or bug =
reporting, so I think it would make sense to make it easy to enable via a D=
ISTRO_FEATURES. I was just not sure why MINIDEBUGINFO=C2=A0was not a DISTRO=
_FEATURES in the first place, and whether you would be willing to enable sy=
stemd-coredump via the=C2=A0MINIDEBUGINFO=C2=A0DISTRO_FEATURES.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Nov 30, 2023 at 11:59=E2=80=AFAM Etienne Cordonnier via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a hr=
ef=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" targ=
et=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
Enabling minidebuginfo is not useful if gdb and systemd-coredump<br>
are unable to parse it.<br>
<br>
In order to parse it, gdb needs xz support. Systemd needs coredump enabled,=
 as<br>
well as elfutil enabled as well (systemd-coredump loads libdw which is part=
 of elfutils using dlopen).<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
=C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a> | 3 ++-<br>
=C2=A0meta/recipes-devtools/gdb/gdb-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 3 ++-<br>
=C2=A03 files changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_254.4.bb</a><br>
index ecf693ef92..f3e56bf94c 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
@@ -70,6 +70,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wi=
fi&#39;, &#39;rfkill&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1&#39;, &#39;xkbcommon&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
svinit&#39;, &#39;&#39;, &#39;link-udev-shared&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@&#39;coredump elfutils&#39; if d.getVar(&#39;PACKAGE_MINI=
DEBUGINFO&#39;) =3D=3D &#39;1&#39; else &#39;&#39;} \<br>
=C2=A0 =C2=A0 =C2=A0backlight \<br>
=C2=A0 =C2=A0 =C2=A0binfmt \<br>
=C2=A0 =C2=A0 =C2=A0gshadow \<br>
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.18=
9.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a> b/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" rel=3D"noreferr=
er" target=3D"_blank">elfutils_0.189.bb</a><br>
index d8bf82b022..4f097e5b5c 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a><br>
@@ -39,7 +39,8 @@ BUILD_CFLAGS +=3D &quot;-Wno-error=3Dstringop-overflow&qu=
ot;<br>
=C2=A0DEPENDS_BZIP2 =3D &quot;bzip2-replacement-native&quot;<br>
=C2=A0DEPENDS_BZIP2:class-target =3D &quot;bzip2&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;debuginfod&#39;, &#39;debuginfod libdebuginfod&#39;, &#39;&#39;, d)}&q=
uot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;debuginfod&#39;, &#39;debuginfod libdebuginfod&#39;, &#39;&#39;, d)} \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@&#=
39;xz&#39; if d.getVar(&#39;PACKAGE_MINIDEBUGINFO&#39;) =3D=3D &#39;1&#39; =
else &#39;&#39;}&quot;<br>
=C2=A0PACKAGECONFIG[bzip2] =3D &quot;--with-bzlib,--without-bzlib,${DEPENDS=
_BZIP2}&quot;<br>
=C2=A0PACKAGECONFIG[xz] =3D &quot;--with-lzma,--without-lzma,xz&quot;<br>
=C2=A0PACKAGECONFIG[zstd] =3D &quot;--with-zstd,--without-zstd,zstd&quot;<b=
r>
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtoo=
ls/gdb/gdb-common.inc<br>
index 3349719a6b..c444af62b3 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-common.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-common.inc<br>
@@ -30,7 +30,8 @@ EXTRA_OECONF =3D &quot;--disable-gdbtk --disable-x --disa=
ble-werror \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-libgmp=
-prefix=3D${STAGING_EXECPREFIXDIR} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;debuginfod&#39;, d)} python&quot;<br>
+PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;debuginfod&#39;, d)} python \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@&#=
39;xz&#39; if d.getVar(&#39;PACKAGE_MINIDEBUGINFO&#39;) =3D=3D &#39;1&#39; =
else &#39;&#39;}&quot;<br>
=C2=A0# Use --without-system-readline to compile with readline 5.<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-system-readline,--without-sy=
stem-readline,readline&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${WORKDIR}/python,--w=
ithout-python,python3,python3-codecs&quot;<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191493): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
1493&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DhIJuYfiJHr9GFKRELh=
nwn96gLMBgh_mp9x4xUGbJgon0FWJJ5jnlxx1XaSOKLhdI&amp;s=3Dm-F8Rs9jc8nYVkwZ6tVp=
eEnQ3Ka6WesbxwvuQbo4xCY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_191493&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DhIJuYfiJHr9GFKRELhnwn96gLMBgh_mp9x4xUGbJgon0FWJJ5jnlxx1XaSOKLh=
dI&amp;s=3Dm-F8Rs9jc8nYVkwZ6tVpeEnQ3Ka6WesbxwvuQbo4xCY&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_102891486_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DhIJuYfiJHr9GFKRELhnwn96gLMBgh_mp9x4xUGbJgon0FW=
JJ5jnlxx1XaSOKLhdI&amp;s=3DkA0ZAZrvS23OaO3PpSWredRNZRqodA4pdr2LOIO4di4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_102891486_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DhIJuYfiJHr9GFKRELhnwn96gLMBgh_m=
p9x4xUGbJgon0FWJJ5jnlxx1XaSOKLhdI&amp;s=3DkA0ZAZrvS23OaO3PpSWredRNZRqodA4pd=
r2LOIO4di4&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DhIJuYfiJHr9GFKRELhnwn96gLMBgh_mp9x4xUGbJgon=
0FWJJ5jnlxx1XaSOKLhdI&amp;s=3DOQS2e4tCqxw_s3J_gabhUAfSjZxmBRl95PLjCFQyXM4&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DhIJuYfiJHr9GFKRELhnw=
n96gLMBgh_mp9x4xUGbJgon0FWJJ5jnlxx1XaSOKLhdI&amp;s=3DOQS2e4tCqxw_s3J_gabhUA=
fSjZxmBRl95PLjCFQyXM4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000748b9060b5cc697--

