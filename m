Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3E12C7ECC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:12:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r12so24999978edo.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z4s3WDNHIL7JkC5hOKNXFU8hQotfbl5mnfSkK/MtkUk=;
	b=oCrrGMKsh1HuAQ7q8Xj93W33lX3QZtCK6sg/Ka9RhVek/MJPkc10SyeWy9rpP2p9yt
	yZjZG52xMZ8051w8GQE8Qfdm7Vn4G2Zk8/XC7W3lU+Yc5N0iXlmFVlNEzzDf7gnhf3nE
	f1BcCTy6orRi3jjaQgA4Ypet2FddSfYbyMzwXMpLiuHlV6Z4wRQKRdZuJ7Kib3QBKxuR
	Ljp0zJGlUSvWorJLPevi22cLxznvXvxoWM/qO7eYnWlw4QehA2I2KNgszNjLfawiKoEY
	Bq+Ietdt4+1nfohB8JFa/Sua3GlikRrdPdhbleQA+InmhZBDQoX1ptMQiL/ZbzBvW91Y
	DYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z4s3WDNHIL7JkC5hOKNXFU8hQotfbl5mnfSkK/MtkUk=;
	b=tjvZ1NwHxOEoxMEF2tI6jssnRdPEF6h1y/QOrXp16DqIEtxWRgXhYFYQomkC0v1NdI
	jPpOo5zX4w30nSE62rmHYTMRRR+pF+X2nQKGT1wylvrib1ockrzb2+3jxuZ40euLuuVq
	VXLCsihXV9l99U8jGVkn4ZOdJGpx8zwtjykePOv03UJv61JSwlXZCDmnz/BUpUd0iMiw
	sFEPPBDbiTX19onhfXaeRw31e0Iy+Dssi6zHeHPKcoRyNI+xqJmwj7QXjr1+9axAOSVo
	06vtl4bB3Qj0xk1WQRvAan6v7kTX3IPmCHSchqCS89Nt9kzMHfVnKcKbBj5eQjk8Bm4Q
	mCLw==
X-Gm-Message-State: APjAAAW7uTcP2lWEMQ98J8c2+ujx/zREyzCz19DB34p9XVj9JsY9xraI
	7QE1V9WaXcCCPYHso5hclWyL/oTCVclWCl7GQ8c=
X-Google-Smtp-Source: APXvYqybB0wc+0AJL6W2LeQc2yBkqfj2uZnOssWg7B/EtDn1C5vug8afXWMxg+mEjztzZtOpTNhHPkXqbHa81ehu4Ck=
X-Received: by 2002:a50:f05a:: with SMTP id u26mr34433196edl.116.1563361937793;
	Wed, 17 Jul 2019 04:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190716215558.23327-1-adrian.ratiu@collabora.com>
In-Reply-To: <20190716215558.23327-1-adrian.ratiu@collabora.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Jul 2019 13:12:06 +0200
Message-ID: <CA+chaQdO2xLQR6z+xNTXYaqj4fvppguu6iVBZsLUXZLBgqC8xg@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg/package/rootfs_ipk: allow overwriting OPKGLIBDIR
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
X-List-Received-Date: Wed, 17 Jul 2019 11:12:17 -0000
Content-Type: multipart/alternative; boundary="000000000000f528d4058dde90d0"

--000000000000f528d4058dde90d0
Content-Type: text/plain; charset="UTF-8"

Why don't you overwrite it with an override? We're doing that for years
without any issues.

On Wed, Jul 17, 2019 at 12:01 AM Adrian Ratiu <adrian.ratiu@collabora.com>
wrote:

> Some distributions for various reasons (like for example mounting a
> tmpfs over /var at runtime) can't use /var/lib to store the opkg
> metadata, so a different path is required to have a functioning
> package manager.
>
> ${localstatedir} can't be modified to something other than the
> hardcoded value in bitbake.conf because other recipes depending on it
> will fail to install.
>
> So the only recourse, which is also the least invasive, is to allow
> distros to overwrite the OPKGLIBDIR variable just like they are also
> allowed to overwrite OPKGBUILDCMD.
>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  meta/classes/package_ipk.bbclass         | 2 +-
>  meta/classes/rootfs_ipk.bbclass          | 2 +-
>  meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index d1b317b42b..9f9da2f91d 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -14,7 +14,7 @@ OPKG_ARGS += "--force_postinstall
> --prefer-arch-to-version"
>  OPKG_ARGS += "${@['',
> '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
>  OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude
> '.join((d.getVar('PACKAGE_EXCLUDE') or
> "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() != ""]}"
>
> -OPKGLIBDIR = "${localstatedir}/lib"
> +OPKGLIBDIR ??= "${localstatedir}/lib"
>
>  python do_package_ipk () {
>      workdir = d.getVar('WORKDIR')
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass
> index aabc370cfc..e73d2bfdae 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -21,7 +21,7 @@ OPKG_PREPROCESS_COMMANDS = ""
>
>  OPKG_POSTPROCESS_COMMANDS = ""
>
> -OPKGLIBDIR = "${localstatedir}/lib"
> +OPKGLIBDIR ??= "${localstatedir}/lib"
>
>  MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> index 8c48d3097c..c663eff13b 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> @@ -28,7 +28,7 @@ PACKAGES =+ "libopkg"
>  inherit autotools pkgconfig systemd ptest
>
>  target_localstatedir := "${localstatedir}"
> -OPKGLIBDIR = "${target_localstatedir}/lib"
> +OPKGLIBDIR ??= "${target_localstatedir}/lib"
>
>  PACKAGECONFIG ??= "libsolv"
>
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f528d4058dde90d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why don&#39;t you overwrite it with an override? We&#39;re=
 doing that for years without any issues.</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2019 at 12:01 AM A=
drian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@collabora.com">adrian.ratiu@=
collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Some distributions for various reasons (like for example mount=
ing a<br>
tmpfs over /var at runtime) can&#39;t use /var/lib to store the opkg<br>
metadata, so a different path is required to have a functioning<br>
package manager.<br>
<br>
${localstatedir} can&#39;t be modified to something other than the<br>
hardcoded value in bitbake.conf because other recipes depending on it<br>
will fail to install.<br>
<br>
So the only recourse, which is also the least invasive, is to allow<br>
distros to overwrite the OPKGLIBDIR variable just like they are also<br>
allowed to overwrite OPKGBUILDCMD.<br>
<br>
Signed-off-by: Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@collabora.co=
m" target=3D"_blank">adrian.ratiu@collabora.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/package_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
=C2=A0meta/classes/rootfs_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.1.bb</a> | 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bb=
class<br>
index d1b317b42b..9f9da2f91d 100644<br>
--- a/meta/classes/package_ipk.bbclass<br>
+++ b/meta/classes/package_ipk.bbclass<br>
@@ -14,7 +14,7 @@ OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to=
-version&quot;<br>
=C2=A0OPKG_ARGS +=3D &quot;${@[&#39;&#39;, &#39;--no-install-recommends&#39=
;][d.getVar(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br=
>
=C2=A0OPKG_ARGS +=3D &quot;${@[&#39;&#39;, &#39;--add-exclude &#39; + &#39;=
 --add-exclude &#39;.join((d.getVar(&#39;PACKAGE_EXCLUDE&#39;) or &quot;&qu=
ot;).split())][(d.getVar(&quot;PACKAGE_EXCLUDE&quot;) or &quot;&quot;).stri=
p() !=3D &quot;&quot;]}&quot;<br>
<br>
-OPKGLIBDIR =3D &quot;${localstatedir}/lib&quot;<br>
+OPKGLIBDIR ??=3D &quot;${localstatedir}/lib&quot;<br>
<br>
=C2=A0python do_package_ipk () {<br>
=C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&#39;WORKDIR&#39;)<br>
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbcl=
ass<br>
index aabc370cfc..e73d2bfdae 100644<br>
--- a/meta/classes/rootfs_ipk.bbclass<br>
+++ b/meta/classes/rootfs_ipk.bbclass<br>
@@ -21,7 +21,7 @@ OPKG_PREPROCESS_COMMANDS =3D &quot;&quot;<br>
<br>
=C2=A0OPKG_POSTPROCESS_COMMANDS =3D &quot;&quot;<br>
<br>
-OPKGLIBDIR =3D &quot;${localstatedir}/lib&quot;<br>
+OPKGLIBDIR ??=3D &quot;${localstatedir}/lib&quot;<br>
<br>
=C2=A0MULTILIBRE_ALLOW_REP =3D &quot;${OPKGLIBDIR}/opkg|/usr/lib/opkg&quot;=
<br>
<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.4.1.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.4.1.bb</a><br>
index 8c48d3097c..c663eff13b 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.1.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.1.bb</a><br>
@@ -28,7 +28,7 @@ PACKAGES =3D+ &quot;libopkg&quot;<br>
=C2=A0inherit autotools pkgconfig systemd ptest<br>
<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
-OPKGLIBDIR =3D &quot;${target_localstatedir}/lib&quot;<br>
+OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
<br>
-- <br>
2.22.0<br>
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

--000000000000f528d4058dde90d0--
