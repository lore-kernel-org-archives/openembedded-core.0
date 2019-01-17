Return-Path: <kergoth@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id A29256025E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 15:19:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v6so6441929oif.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vzfTftlRdtun26Aw4usYvZ2Ygo/QzJ0zP+cTlY0NReg=;
	b=lJGrbD+ECkcYVH5NKWyoyVm4u3je6S/+vQ98m7fM6ui3LXZ2GQnE9nk3a3wlYzHnZt
	eZM4pmUygbbpC/RwBVLW+JaDI6M07KyODDzK7yt81JrvuqowOytJ+xZhcslMMB6Lhurm
	5lo1ey8JGg4Bp8uBqO9ngOAXJWMDAGVlGuiyzFF10RMAVgL0Xl0FYHyDq5eMAV/0Z3bX
	xRg+xxBDE6wfAAqRz8tY/An1/0V7oFFA6d3S4ebtn7evIeJz78jL7juzyNLmOGCtfkHI
	oRAMjyNw869X7CfDpwsApJOhjBOb2Mu6zhyuq+16125ZPllnjSOXCqKbAPx5PXDpr4Sa
	2K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vzfTftlRdtun26Aw4usYvZ2Ygo/QzJ0zP+cTlY0NReg=;
	b=TFlOKoHwHI7hu4YLdMCxVEbGY5pXIZPtPPix84pAiLpNaxznVTkm5Jkn/WBWPkoWux
	nHokY4b1R46UkbKMGB+WCWC6QIFrdqH62PR//Ns6ko7tv/ftxW8i9rlQcIeD5kXEe+Z+
	padmK1rniHSFVBYW21z/TksU9O+23+P2FodiJFIYoeyUMlNuRxkhWT3bhvLaE7cAf9Un
	TbS22ry+ih6scmS62mvJohpymaJ76xBxVMRYjW0NetY19haa86jf7V2Gc+yx2jbRP+Wd
	sJXStSUcWh3PXNKAWRB4Dq/LUUcQqAuKAPRUedH6CbbrZGLG5GFXZdWvMpJuCXffo841
	tvuQ==
X-Gm-Message-State: AJcUukfzA/T6j7jHaoDT0FzTelcduLiQVcon8QvIfMgHZeexFL+fIHbY
	W6NU4E01P2qMdPVLSJBWqt/4HA9QZfY7zzsROuk=
X-Google-Smtp-Source: ALg8bN6DBOCSMx1M3Kq6dewuQC05KlcOdP58ReyVNtD6OTzZXQ8T6NOFbaW6oosnLWVrV4IMfZR8Whzl7xuB6nvwIzk=
X-Received: by 2002:aca:3ed6:: with SMTP id l205mr3122931oia.158.1547738367379;
	Thu, 17 Jan 2019 07:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
In-Reply-To: <20190117071227.57387-1-kai.kang@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 17 Jan 2019 08:19:15 -0700
Message-ID: <CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 15:19:26 -0000
Content-Type: multipart/alternative; boundary="00000000000097ceea057fa8eb69"

--00000000000097ceea057fa8eb69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The commit message doesn=E2=80=99t match what you=E2=80=99re actually doing=
. "Specifying
-fdebug-prefix-map is equivalent to specifying all the individual
-f*-prefix-map options which means including -fmacro-prefix-map and
-fdebug-prefix-map currently=E2=80=9D I assume you mean "Specifying
-ffile-prefix-map=E2=80=9D there.

On Thu, Jan 17, 2019 at 12:13 AM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
> Specifying -fdebug-prefix-map is equivalent to specifying all the
> individual -f*-prefix-map options which means including
> -fmacro-prefix-map and -fdebug-prefix-map currently. Option
> -fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
> by __FILE__ macro expansion for packages such as llvm and librepo.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0bdcd04d74..d20460e845 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install =3D
> "${PARALLEL_MAKEINST} "
>  # Optimization flags.
>  ##################################################################
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D
> "-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-=
${PR} \
> -                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> -                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> +DEBUG_PREFIX_MAP ?=3D
> "-ffile-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-$=
{PR} \
> +                     -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> +                     -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>  "
>  DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
>
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000097ceea057fa8eb69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">The commit message doesn=E2=80=99t match =
what you=E2=80=99re actually doing. &quot;Specifying -fdebug-prefix-map is =
equivalent to specifying all the=C2=A0individual -f*-prefix-map options whi=
ch means including=C2=A0-fmacro-prefix-map and -fdebug-prefix-map currently=
=E2=80=9D I assume you mean &quot;Specifying -ffile-prefix-map=E2=80=9D the=
re.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Jan 17, 2019 at 12:13 AM &lt;<a href=3D"mailto:kai.kang@wi=
ndriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex=
">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_b=
lank">kai.kang@windriver.com</a>&gt;<br>
<br>
Reset default value of DEBUG_PREFIX_MAP with &#39;-fdebug-prefix-map&#39;.<=
br>
Specifying -fdebug-prefix-map is equivalent to specifying all the<br>
individual -f*-prefix-map options which means including<br>
-fmacro-prefix-map and -fdebug-prefix-map currently. Option<br>
-fmacro-prefix-map helps to avoid buildpaths qa warnings which caused<br>
by __FILE__ macro expansion for packages such as llvm and librepo.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 0bdcd04d74..d20460e845 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install =3D &quot;${PARALLEL_=
MAKEINST} &quot;<br>
=C2=A0# Optimization flags.<br>
=C2=A0##################################################################<br=
>
=C2=A0# Beware: applied last to first<br>
-DEBUG_PREFIX_MAP ?=3D &quot;-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/deb=
ug/${PN}/${EXTENDPE}${PV}-${PR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
+DEBUG_PREFIX_MAP ?=3D &quot;-ffile-prefix-map=3D${WORKDIR}=3D/usr/src/debu=
g/${PN}/${EXTENDPE}${PV}-${PR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
=C2=A0&quot;<br>
=C2=A0DEBUG_FLAGS ?=3D &quot;-g -feliminate-unused-debug-types ${DEBUG_PREF=
IX_MAP}&quot;<br>
<br>
-- <br>
2.20.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--00000000000097ceea057fa8eb69--
