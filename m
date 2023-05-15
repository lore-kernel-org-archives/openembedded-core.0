Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1419EC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:40:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.86391.1684150839784088781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 04:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bXtNC1ZS;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d84f5ce4so3546058f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684150838; x=1686742838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sN4JMwTaT9kvrR4Z/k+AFT+kRtf+iYYz+PxU86HXiMY=;
        b=bXtNC1ZSSbhskchb+/4QqBt5LmNDe4MBUv62+kqVC42YRvgoQ5S8LZXhStDR8GdMs7
         cXzqbY3VP7MxxtLOkvqakffJ7rRZGwKdTUEApeo02XT5mafslLvMQ4jcGs0oaS/RB0kp
         i/WZhoJuryiczTJ6jJxbvL1ft0G5w9B3ErVdMmZBHCLxmELefwnhcuoj5rUfGtJE2mZL
         lVMaOfw0lxRGRM18sK61ZlIvCJPsr6jQCQ5UBvfrk3jtJ9JQzE7XF1F7huLs8taTb4Qf
         zuGX13XHUofAfVLb8ZMrsZZRsv/xe0gl8rvMQew8apcmsWC7WuHM+K1XRbUM7+TheF8a
         Z2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150838; x=1686742838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sN4JMwTaT9kvrR4Z/k+AFT+kRtf+iYYz+PxU86HXiMY=;
        b=fiWk4Gr+Ufoy8DUsiQq7M/U4Uq6DqR1kGF762WVPRwJ4azAdVni8Q8D8Qfs51WHRE9
         u0PmPrgKTMxr3KXZ/wWIARfASKzD4vJTPiAD9DvGEfR4nmPFcoJbASlBjREFA8QsUINz
         rgsuL8f52BLq3apWIN4szo+HcqvIsp1N+6vTDJn2iqvoiVeFooefYirH7LDA35QR8t82
         ZD3xrFWdUg1fInFnUzTcur+X4NNvJBvEgKgWrMdBnmjc3MEt9WdtxKfjdC/wCRDvJhph
         zIbS/E8GGBo3eFPoXNLxROJRd4QNE/JpGcvKMEPKdgAD598a/NP9I4THfmQj7JQejUF/
         tbTg==
X-Gm-Message-State: AC+VfDxpuaoqnWnyigx3z8fb79b7Z+bBYfszPVJKNCFwmqy6zR2sq36A
	1PVt0X0zthHZa/3Zny9H76aN7ODJhJd+kp8L8pM=
X-Google-Smtp-Source: ACHHUZ5JQPN6IMlMjMEV1tSbucCazPYAcRN+6ygdUUJr2ie0g9WaotlvfvF0W/UDmWP2285Q6SA9te/3d4R/4b0TCMY=
X-Received: by 2002:a5d:4810:0:b0:2fa:ce3:9a0 with SMTP id l16-20020a5d4810000000b002fa0ce309a0mr23945610wrq.36.1684150838137;
 Mon, 15 May 2023 04:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230403110646.2555294-1-kubiznak@2n.com>
In-Reply-To: <20230403110646.2555294-1-kubiznak@2n.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 May 2023 13:40:25 +0200
Message-ID: <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce dependencies
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000074977b05fbb9ecf2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 11:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181243

--00000000000074977b05fbb9ecf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 1:08=E2=80=AFPM Petr Kubiz=C5=88=C3=A1k <kubiznak@2n=
.com> wrote:

> When GI_DATA_ENABLED is 'False' (e.g. because
> 'gobject-introspection-data' is not in DISTRO_FEATURES),
> gobject-introspection, gobject-introspection-native and qemu-native
> should not be added to DEPENDS. This is to reduce dependency chain
> when g-i is disabled.
>
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/gobject-introspection.bbclass
> b/meta/classes-recipe/gobject-introspection.bbclass
> index 0c7b7d200a..98edb93761 100644
> --- a/meta/classes-recipe/gobject-introspection.bbclass
> +++ b/meta/classes-recipe/gobject-introspection.bbclass
> @@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['',
> '${GIRMESONBUILD}'][d.getVar('G
>
>  # Generating introspection data depends on a combination of native and
> target
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS:append:class-target =3D " gobject-introspection
> gobject-introspection-native qemu-native"
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
,
> 'True', 'gobject-introspection gobject-introspection-native qemu-native',
> '', d)}"
>
>  # Even though introspection is disabled on -native, gobject-introspectio=
n
> package is still
>  # needed for m4 macros.
> @@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk =3D "
> gobject-introspection-native"
>  export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
>
>  do_configure:prepend:class-target () {
> -    # introspection.m4 pre-packaged with upstream tarballs does not yet
> -    # have our fixes
> -    mkdir -p ${S}/m4
> -    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}"
> =3D "1" ] ; then
> +        # introspection.m4 pre-packaged with upstream tarballs does not
> yet
> +        # have our fixes
> +        mkdir -p ${S}/m4
> +        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4
> ${S}/m4
> +    fi
>

Was this extra .m4 file causing issues in builds without
gobject-introspection-data in DISTRO_FEATURES?

I've noticed some maybe unexpected side-effects from this change, see:
libblockdev:
https://lists.openembedded.org/g/openembedded-devel/message/102599
glade: https://lists.openembedded.org/g/openembedded-devel/message/102601

--00000000000074977b05fbb9ecf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Apr 3, 2023 at 1:08=E2=80=AFPM Pe=
tr Kubiz=C5=88=C3=A1k &lt;<a href=3D"mailto:kubiznak@2n.com">kubiznak@2n.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">When GI_DATA_ENABLED is &#39;False&#39; (e.g. b=
ecause<br>
&#39;gobject-introspection-data&#39; is not in DISTRO_FEATURES),<br>
gobject-introspection, gobject-introspection-native and qemu-native<br>
should not be added to DEPENDS. This is to reduce dependency chain<br>
when g-i is disabled.<br>
<br>
Signed-off-by: Petr Kubiz=C5=88=C3=A1k &lt;<a href=3D"mailto:kubiznak@2n.co=
m" target=3D"_blank">kubiznak@2n.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----<b=
r>
=C2=A01 file changed, 7 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/class=
es-recipe/gobject-introspection.bbclass<br>
index 0c7b7d200a..98edb93761 100644<br>
--- a/meta/classes-recipe/gobject-introspection.bbclass<br>
+++ b/meta/classes-recipe/gobject-introspection.bbclass<br>
@@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D &quot;${@[&#39;=
&#39;, &#39;${GIRMESONBUILD}&#39;][d.getVar(&#39;G<br>
<br>
=C2=A0# Generating introspection data depends on a combination of native an=
d target<br>
=C2=A0# introspection tools, and qemu to run the target tools.<br>
-DEPENDS:append:class-target =3D &quot; gobject-introspection gobject-intro=
spection-native qemu-native&quot;<br>
+DEPENDS:append:class-target =3D &quot; ${@bb.utils.contains(&#39;GI_DATA_E=
NABLED&#39;, &#39;True&#39;, &#39;gobject-introspection gobject-introspecti=
on-native qemu-native&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# Even though introspection is disabled on -native, gobject-introspec=
tion package is still<br>
=C2=A0# needed for m4 macros.<br>
@@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk =3D &quot; gobject-intro=
spection-native&quot;<br>
=C2=A0export XDG_DATA_DIRS =3D &quot;${STAGING_DATADIR}:${STAGING_LIBDIR}&q=
uot;<br>
<br>
=C2=A0do_configure:prepend:class-target () {<br>
-=C2=A0 =C2=A0 # introspection.m4 pre-packaged with upstream tarballs does =
not yet<br>
-=C2=A0 =C2=A0 # have our fixes<br>
-=C2=A0 =C2=A0 mkdir -p ${S}/m4<br>
-=C2=A0 =C2=A0 cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4=
 ${S}/m4<br>
+=C2=A0 =C2=A0 if [ &quot;${@bb.utils.contains(&#39;GI_DATA_ENABLED&#39;, &=
#39;True&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quot; =3D &quot;1&quot; ] ; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # introspection.m4 pre-packaged with upstream =
tarballs does not yet<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # have our fixes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${S}/m4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/in=
trospection.m4 ${S}/m4<br>
+=C2=A0 =C2=A0 fi<br></blockquote><div><br></div><div>Was this extra .m4 fi=
le causing issues in builds without gobject-introspection-data in DISTRO_FE=
ATURES?</div><div><br></div><div>I&#39;ve noticed some maybe unexpected sid=
e-effects from this change, see:</div><div>libblockdev: <a href=3D"https://=
lists.openembedded.org/g/openembedded-devel/message/102599">https://lists.o=
penembedded.org/g/openembedded-devel/message/102599</a><br></div><div>glade=
: <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/10=
2601">https://lists.openembedded.org/g/openembedded-devel/message/102601</a=
></div></div></div>

--00000000000074977b05fbb9ecf2--

