Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id B0001754EC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 07:29:04 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id x18-v6so9947235uaj.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hR3mUJ3Ws6sQTKfJJyyu9069sxcwVyB927D4v+0ouBo=;
	b=cWXE7XBQ5vhgjVNs32ljf8wt3dlAjSP5Rk0KgYNPmEPI6jOSC82uymL2hp+l+k76iQ
	Pa3KsVhD3G0qmFtbggRjYoqWe4FpaZohaWLwGpx17AuaT8TpQBFPOQmj/l7njLwVlnSw
	ut05IWjUKoGqH8HphEWg1zC+1BXjpr6G3KFh1bdGXP/V1MGMzYJMnh2Brdjv2bRBHgKH
	c2w2rx3hqh/2Frvpr/4/O/kR/qLtebHa8uecYBi5SioZ+S7/3qoljKlDLXir0MJfz28Y
	9/pN9EURDsshs7lK4foNi1jMfH6uNRAM/YcjGwSvQlt4vk1+4USZRZ+UV2haU6v2DNZ/
	QG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hR3mUJ3Ws6sQTKfJJyyu9069sxcwVyB927D4v+0ouBo=;
	b=IFPwUOpXzm+3A5Q5yVBfuyqvnrih9kxOf35OPC9rFbUsLsc1izDwnMt0guKOg+Hion
	nVc6i29TpFdRbrkOy7tUN6O5wpB4X3wZU4FjHtwwKcOfiKokyT6Z0t3MzIOib+kPIveo
	ssNHWD1j7PvIGqo9bUCpahpTYfZITiWOpXW0hmjqaXpur7oEU4WiStI0Oc7P+s/I9nBC
	Pv75wyKZT3Rve/doW+/i9JJ9kDfnN3hJ3YY8seD7RAzuzjkBDz2vpkKJlPoEjUMH7QIR
	WoLQ3dwCRYxFg0pPJ0z5uiEkeN8VqPj6AN+zTbKa5e+k/CtDtEBPewWQlnk2NTmE+BJo
	Y6Iw==
X-Gm-Message-State: APt69E2sPyFAG2xWOei4UeMLFFiqEhjNR1K1q88WGTEVIhLZJYiAOaaU
	i3xRER6syJXxA9ywL7Vgm8p21kAIFLvk5PfGlYs=
X-Google-Smtp-Source: AAOMgpchy1ZT8V+vL+4fdC0ozmbNZYxH9fd2srsgtdsrKBl1Qx/5rxkRKeAaPv7roO6ms66sYzQfFottJsY7cC6it8k=
X-Received: by 2002:ab0:16dc:: with SMTP id g28-v6mr9956681uaf.7.1531034934520;
	Sun, 08 Jul 2018 00:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180706154749.19324-1-ross.burton@intel.com>
In-Reply-To: <20180706154749.19324-1-ross.burton@intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 8 Jul 2018 00:28:43 -0700
Message-ID: <CANx9H-BuNP_+EeFJSooZk+awTn3qG5_YU63dypoAWjNvE3k4iQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] minicom: remove dead URL from UPSTREAM_CHECK_URI
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
X-List-Received-Date: Sun, 08 Jul 2018 07:29:04 -0000
Content-Type: multipart/alternative; boundary="000000000000692f35057077d9be"

--000000000000692f35057077d9be
Content-Type: text/plain; charset="UTF-8"

All the alioth.debian.org URLs should be changed to use salsa.debian.org.
Quick search showed:
https://salsa.debian.org/minicom-team/minicom
On Fri, Jul 6, 2018 at 8:47 AM Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb
> b/meta/recipes-extended/minicom/minicom_2.7.1.bb
> index be0b48dfdf5..1e6f1317ebe 100644
> --- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
> +++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
> @@ -16,8 +16,6 @@ SRC_URI =
> "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
>  SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
>  SRC_URI[sha256sum] =
> "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
>
> -UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
> -
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000692f35057077d9be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All the <a href=3D"http://alioth.debian.org">alioth.debian.org</a> URLs sho=
uld be changed to use <a href=3D"http://salsa.debian.org">salsa.debian.org<=
/a>.<br>Quick search showed:<br><a href=3D"https://salsa.debian.org/minicom=
-team/minicom">https://salsa.debian.org/minicom-team/minicom</a><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jul 6, 2018 at 8:47 AM Ross Bu=
rton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Ross Bur=
ton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.bur=
ton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a> | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a> b/meta/recipe=
s-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">minicom_2.7.1.bb</a><br>
index be0b48dfdf5..1e6f1317ebe 100644<br>
--- a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a><br>
+++ b/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a><br>
@@ -16,8 +16,6 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_$=
{PV}.orig.tar.gz \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;9021cb8c5445f6e6e74b2acc39962d62&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;532f836b7a677eb0cb1dca8d70302b73729c3d30=
df26d58368d712e5cca041f1&quot;<br>
<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://alioth.debian.org/frs/?gro=
up_id=3D30018" rel=3D"noreferrer" target=3D"_blank">https://alioth.debian.o=
rg/frs/?group_id=3D30018</a>&quot;<br>
-<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[lockdev] =3D &quot;--enable-lockdev,--disable-lockdev,l=
ockdev&quot;<br>
<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000692f35057077d9be--
