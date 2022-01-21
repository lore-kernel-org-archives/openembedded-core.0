Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97978C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 09:20:39 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.9806.1642756838569962754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 01:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L6smniXL;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id m90so15822987uam.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 01:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bxlhPd3bG8TYgGusk4Qq9m6tEoSInx/FvEIglJn62OM=;
        b=L6smniXLLRcoskbiSmDyqz3hFqUlPyZmutWEody28DJl/uR6L0FmkCjKxz8WqcTFxc
         /8xIOEGpt7EC+WUAzanRNeTtg/rh2NMLWb/7n2m22bozXRQ8NATJTof7QVnQx1XrhdbL
         fKD/FBkhkS8D3mO9AyMpyBIz90rLBTYOCmH5nJ7ACn1A6MlWhMyeYEfJ46oCzB4GBeCW
         AVfVCj0nMKdvDVK+UuvV2P9xf/b+4hn63Fwd6AF9bAwaqgAcJVYwDvaR9sRvDgVwYkMa
         0FgzZMmzmnCuf+YjYIL+Dq2GV8ohVYBqlF/f6GcEv8/P471WO9/S3aKjAjVbpG44GHap
         0aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bxlhPd3bG8TYgGusk4Qq9m6tEoSInx/FvEIglJn62OM=;
        b=teWzoU4MQ4jjnpcsQm5HNktgaluIvB3dTlm6wFyb1HQ5IKjdm9M6PVQgolelcGZCJm
         cDn+SOomjsGSWJlM1L6SO9yqKAyDt2Q0Kembrjt+lFSm0gBz/s4S2eE71HzqT2lvkueb
         LpjvGnAQiQ6hZh9J7b5miKhTnc3xM0hQMmA7Y/qCUSJFw52zEWMaVqzTykggCj8Fctba
         TS7dCvWP0ZbUIhYqmiJN9RofN1W696t/8qrptrvp7XZtlG1TVGIJ1eqwo7l9nHesrsnf
         Tf+kHZ5zAo4zlAk7I34MdB9Lajmlyi5854rfmUhNafzlXhaDZIN99rYawaCd3mdZc5rG
         YcqQ==
X-Gm-Message-State: AOAM5323LsHclOpq0g8B8BAWHacx/1eq/weiS1TL9efQgcEhubjzKG5q
	N8RhMHA405GiulWPMIYK/CQNr2o8OUlZL1Bb+Jg=
X-Google-Smtp-Source: 
 ABdhPJzOEB6KVsA6iEUNiTncRNLovW6+U3YnIBmUQsODShmpoVdwTbJnGH+vtDQiukfgOaXJ0UtwzsXju+FC5Db942Q=
X-Received: by 2002:a67:6642:: with SMTP id a63mr1261175vsc.73.1642756837630;
 Fri, 21 Jan 2022 01:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20220121035639.230863-1-f_l_k@t-online.de>
In-Reply-To: <20220121035639.230863-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 10:20:26 +0100
Message-ID: 
 <CANNYZj-zFNuCR=W2EOcVQ53iubVN2e+DcJTLL2KC5REUMj9Cqw@mail.gmail.com>
Subject: Re: [OE-core][PATCHv2] libical: build gobject and vala introspection
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c2682f05d61421bd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 09:20:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160816

--000000000000c2682f05d61421bd
Content-Type: text/plain; charset="UTF-8"

Thanks, this should work :)

Alex

On Fri, 21 Jan 2022 at 04:57, Markus Volk <f_l_k@t-online.de> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-support/libical/libical_3.0.12.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libical/libical_3.0.12.bb
> b/meta/recipes-support/libical/libical_3.0.12.bb
> index b2b2211b9b..614a76ba5b 100644
> --- a/meta/recipes-support/libical/libical_3.0.12.bb
> +++ b/meta/recipes-support/libical/libical_3.0.12.bb
> @@ -16,7 +16,7 @@ SRC_URI = "
> https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.g
>  SRC_URI[sha256sum] =
> "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e9f8856cee6d35830"
>  UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
>
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig gobject-introspection vala
>
>  DEPENDS += "libical-native"
>
> @@ -32,6 +32,11 @@ EXTRA_OECMAKE +=
> "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
>  EXTRA_OECMAKE += "-DLIBICAL_BUILD_TESTING=false"
>  # doc build fails with linker error (??) for libical-glib so disable it
>  EXTRA_OECMAKE += "-DICAL_BUILD_DOCS=false"
> +# gobject-introspection
> +EXTRA_OECMAKE +=
> "-DGObjectIntrospection_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
> +EXTRA_OECMAKE +=
> "-DGObjectIntrospection_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
> +EXTRA_OECMAKE += "-DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen"
> +EXTRA_OECMAKE += "${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> '-DGOBJECT_INTROSPECTION=ON -DICAL_GLIB_VAPI=ON',
> '-DGOBJECT_INTROSPECTION=OFF', d)}"
>
>  # Tell the cross-libical where the tool it needs to build is
>  EXTRA_OECMAKE:append:class-target = "
> -DIMPORT_ICAL_GLIB_SRC_GENERATOR=${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160814):
> https://lists.openembedded.org/g/openembedded-core/message/160814
> Mute This Topic: https://lists.openembedded.org/mt/88576745/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c2682f05d61421bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this should work :)</div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 21 Jan 2022 at 04:57, Markus Volk &lt;<a href=3D"ma=
ilto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&g=
t;<br>
---<br>
=C2=A0meta/recipes-support/libical/<a href=3D"http://libical_3.0.12.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_3.0.12.bb</a> | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/libical/<a href=3D"http://libical_3.0.12.=
bb" rel=3D"noreferrer" target=3D"_blank">libical_3.0.12.bb</a> b/meta/recip=
es-support/libical/<a href=3D"http://libical_3.0.12.bb" rel=3D"noreferrer" =
target=3D"_blank">libical_3.0.12.bb</a><br>
index b2b2211b9b..614a76ba5b 100644<br>
--- a/meta/recipes-support/libical/<a href=3D"http://libical_3.0.12.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_3.0.12.bb</a><br>
+++ b/meta/recipes-support/libical/<a href=3D"http://libical_3.0.12.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_3.0.12.bb</a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7=
D/$%7BBPN%7D/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.g" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/${BPN}/${BPN}/releases/download/v${=
PV}/${BP}.tar.g</a><br>
=C2=A0SRC_URI[sha256sum] =3D &quot;35095a4cc1a061a3de0f332c2dc728226cf127fa=
0baa818e9f8856cee6d35830&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/libical/li=
bical/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/lib=
ical/libical/releases</a>&quot;<br>
<br>
-inherit cmake pkgconfig<br>
+inherit cmake pkgconfig gobject-introspection vala<br>
<br>
=C2=A0DEPENDS +=3D &quot;libical-native&quot;<br>
<br>
@@ -32,6 +32,11 @@ EXTRA_OECMAKE +=3D &quot;-DPERL_EXECUTABLE=3D${HOSTTOOLS=
_DIR}/perl&quot;<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DLIBICAL_BUILD_TESTING=3Dfalse&quot;<br>
=C2=A0# doc build fails with linker error (??) for libical-glib so disable =
it<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DICAL_BUILD_DOCS=3Dfalse&quot;<br>
+# gobject-introspection<br>
+EXTRA_OECMAKE +=3D &quot;-DGObjectIntrospection_COMPILER=3D${STAGING_BINDI=
R}/g-ir-compiler-wrapper&quot;<br>
+EXTRA_OECMAKE +=3D &quot;-DGObjectIntrospection_SCANNER=3D${STAGING_BINDIR=
}/g-ir-scanner-wrapper&quot;<br>
+EXTRA_OECMAKE +=3D &quot;-DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen&quot=
;<br>
+EXTRA_OECMAKE +=3D &quot;${@bb.utils.contains(&#39;GI_DATA_ENABLED&#39;, &=
#39;True&#39;, &#39;-DGOBJECT_INTROSPECTION=3DON -DICAL_GLIB_VAPI=3DON&#39;=
, &#39;-DGOBJECT_INTROSPECTION=3DOFF&#39;, d)}&quot;<br>
<br>
=C2=A0# Tell the cross-libical where the tool it needs to build is<br>
=C2=A0EXTRA_OECMAKE:append:class-target =3D &quot; -DIMPORT_ICAL_GLIB_SRC_G=
ENERATOR=3D${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmak=
e&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160814): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160814" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160814</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88576745/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88576745/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c2682f05d61421bd--

