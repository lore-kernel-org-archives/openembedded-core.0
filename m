Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 035B578C05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 21:36:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d2-v6so7115323wro.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ccckWCpovPFtV44I7qURiy4Q30eYeC/7nLK3PBvL2mA=;
	b=XqSQYI/39Gr3FY5nys5Uzz/t/nzX8fMaw5QGA+q15xv1bJMqGblP4KiWcmGPWGByc5
	wXcevVp6tVEdO5FWCvcU/cS6mkdM/X2V65kWYkETyv/aCcMh1KcfpmyHAVsiaSL8RzyY
	b5/m9mRXa6NGkpo+HOYTOTRSVNEqC9A64XMiVneSfvgM+qzoLXGE/5VOXWN24qy9CuL2
	fUoEJ0gR/we20LwASaC5/oV+/JLRSjG8n/ULThvvGubkO7PWpEEomuU8qtnyVlKREGhP
	QkjIn7T3gYLDVQxacNyjheI55TWUEEToXGmLPNVoroJMdKv/OOQvIA26L4ysGIBrCKy3
	8Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ccckWCpovPFtV44I7qURiy4Q30eYeC/7nLK3PBvL2mA=;
	b=nESKEl9DV3n2tCJsycXSTXx4NB2Lt/aiI+WgDIJU+OLlHt+4UgVLvpyHKuybdgnPAE
	SFRVSfOGW3nHflBasBzUT06KEDuu0NrVGomBjof6BaPjIVlS+50V5BfJABslmphhEC8C
	s1POgW4NOC2MlSrXNVgpKebKjreU06felOEelcZjwx+KfnFPdVkQ/HKIFveh/9uxQM5a
	EDR3DnmVDJ8R9Sn2lGdDbdPSD07sLUHTd8yzbbAc0bktibWlc7/m3+iR48o9JUggYPS3
	4IKTa9DyK2bdwyvZ7qNWYE4aGnMC1psUpN7SjOC99WKmtfQ5NPYheEl6jRpazSwyFizE
	fIxw==
X-Gm-Message-State: AGRZ1gLQd1/T51aj+rQx+VObwwlPttT1atqJI2q4ZV2yE2yGK29+glT9
	ntk1kM8uPkoBNJBVHKSrVSZPG4FzWLObotjDp+Gpgymj
X-Google-Smtp-Source: AJdET5cimCDnH75zmN47hELsx0l150snHqILa8JrKixaPK9Rv28SA/nWvQxZu48AG9vtAyqtuyzjQZ0qF7YIboGRLoQ=
X-Received: by 2002:a5d:4c84:: with SMTP id z4-v6mr1473352wrs.75.1540417000488;
	Wed, 24 Oct 2018 14:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181024202535.91869-1-mark.hatle@windriver.com>
In-Reply-To: <20181024202535.91869-1-mark.hatle@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Oct 2018 23:36:29 +0200
Message-ID: <CA+chaQdSyr2pL315ppQr6GTQMP9uvt+ereaSBvExyk_Kk-bBnw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston: Split out machine specific configuration
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
X-List-Received-Date: Wed, 24 Oct 2018 21:36:40 -0000
Content-Type: multipart/alternative; boundary="0000000000001ec3310579004865"

--0000000000001ec3310579004865
Content-Type: text/plain; charset="UTF-8"

You need to add weston-cfg to SIGGEN_EXCLUDERECIPES_ABISAFE otherwise
weston will still be effectively MACHINE_ARCH because of the do_package
signature depending on weston-cfg signature.

On Wed, Oct 24, 2018 at 10:25 PM Mark Hatle <mark.hatle@windriver.com>
wrote:

> Weston needs to be configured to load the fbdev driver when run on a QEMU
> system.
> Other MACHINEs may want to also provider their own configuration as well..
>
> Adding a new RRECOMMEND configuration package will allow this, but avoid
> installing empty packages/files in the majority case where it is not
> needed.
>
> Add maintainer entry as well.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  meta/recipes-graphics/wayland/weston-cfg.bb   | 34
> +++++++++++++++++++++++++++
>  meta/recipes-graphics/wayland/weston_5.0.0.bb |  8 +------
>  3 files changed, 36 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-cfg.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index d32e07d899..5b68336184 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -678,6 +678,7 @@ RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <
> denys@ti.com>"
>  RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com
> >"
>  RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
> +RECIPE_MAINTAINER_pn-weston-cfg = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-which = "Ross Burton <ross.burton@intel.com>"
> diff --git a/meta/recipes-graphics/wayland/weston-cfg.bb
> b/meta/recipes-graphics/wayland/weston-cfg.bb
> new file mode 100644
> index 0000000000..6a5cdbf915
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-cfg.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Weston, a Wayland compositor, configuration files"
> +HOMEPAGE = "http://wayland.freedesktop.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +CONFFILES_${PN} = "${sysconfdir}/xdg/weston/weston.ini"
> +
> +FILES_${PN} = "${sysconfdir}/xdg/weston/weston.ini"
> +
> +PACKAGES = "${PN}"
> +
> +do_compile[noexec] = '1'
> +
> +do_install() {
> +       :
> +}
> +
> +do_install_qemux86() {
> +       mkdir -p ${D}/${sysconfdir}/xdg/weston
> +       cat << EOF > ${D}/${sysconfdir}/xdg/weston/weston.ini
> +[core]
> +backend=fbdev-backend.so
> +EOF
> +}
> +
> +do_install_qemux86-64() {
> +       mkdir -p ${D}/${sysconfdir}/xdg/weston
> +       cat << EOF > ${D}/${sysconfdir}/xdg/weston/weston.ini
> +[core]
> +backend=fbdev-backend.so
> +EOF
> +}
> diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb
> b/meta/recipes-graphics/wayland/weston_5.0.0.bb
> index 299408b201..b87524ece5 100644
> --- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_5.0.0.bb
> @@ -29,12 +29,6 @@ WESTON_MAJOR_VERSION =
> "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
>  EXTRA_OECONF = "--enable-setuid-install \
>                  --disable-rdp-compositor \
>                  "
> -EXTRA_OECONF_append_qemux86 = "\
> -               WESTON_NATIVE_BACKEND=fbdev-backend.so \
> -               "
> -EXTRA_OECONF_append_qemux86-64 = "\
> -               WESTON_NATIVE_BACKEND=fbdev-backend.so \
> -               "
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'kms fbdev wayland egl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland',
> 'xwayland', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd
> x11', d)} \
> @@ -107,7 +101,7 @@ FILES_${PN}-xwayland =
> "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
>  RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
>
>  RDEPENDS_${PN} += "xkeyboard-config"
> -RRECOMMENDS_${PN} = "liberation-fonts"
> +RRECOMMENDS_${PN} = "weston-cfg liberation-fonts"
>  RRECOMMENDS_${PN}-dev += "wayland-protocols"
>
>  USERADD_PACKAGES = "${PN}"
> --
> 2.16.0.rc2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001ec3310579004865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">You need to add weston-cfg to=C2=A0SIGGEN=
_EXCLUDERECIPES_ABISAFE otherwise weston will still be effectively MACHINE_=
ARCH because of the do_package signature depending on weston-cfg signature.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 24,=
 2018 at 10:25 PM Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com=
">mark.hatle@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Weston needs to be configured to load the fbdev driver when run on a=
 QEMU system.<br>
Other MACHINEs may want to also provider their own configuration as well..<=
br>
<br>
Adding a new RRECOMMEND configuration package will allow this, but avoid<br=
>
installing empty packages/files in the majority case where it is not needed=
.<br>
<br>
Add maintainer entry as well.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com" t=
arget=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston-cfg.bb" rel=3D=
"noreferrer" target=3D"_blank">weston-cfg.bb</a>=C2=A0 =C2=A0| 34 +++++++++=
++++++++++++++++++<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston_5.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_5.0.0.bb</a> |=C2=A0 8 +------<br>
=C2=A03 files changed, 36 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/<a href=3D"http://we=
ston-cfg.bb" rel=3D"noreferrer" target=3D"_blank">weston-cfg.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index d32e07d899..5b68336184 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -678,6 +678,7 @@ RECIPE_MAINTAINER_pn-wayland =3D &quot;Denys Dmytriyenk=
o &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-wayland-protocols =3D &quot;Denys Dmytriyenko &l=
t;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&qu=
ot;<br>
=C2=A0RECIPE_MAINTAINER_pn-webkitgtk =3D &quot;Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-weston =3D &quot;Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-weston-cfg =3D &quot;Denys Dmytriyenko &lt;<a href=3D=
"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-weston-init =3D &quot;Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br=
>
=C2=A0RECIPE_MAINTAINER_pn-wget =3D &quot;Yi Zhao &lt;<a href=3D"mailto:yi.=
zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&quot;<b=
r>
=C2=A0RECIPE_MAINTAINER_pn-which =3D &quot;Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&qu=
ot;<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston-cfg.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston-cfg.bb</a> b/meta/recipes-grap=
hics/wayland/<a href=3D"http://weston-cfg.bb" rel=3D"noreferrer" target=3D"=
_blank">weston-cfg.bb</a><br>
new file mode 100644<br>
index 0000000000..6a5cdbf915<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston-cfg.bb" rel=3D=
"noreferrer" target=3D"_blank">weston-cfg.bb</a><br>
@@ -0,0 +1,34 @@<br>
+SUMMARY =3D &quot;Weston, a Wayland compositor, configuration files&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"http://wayland.freedesktop.org" rel=3D"noref=
errer" target=3D"_blank">http://wayland.freedesktop.org</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+CONFFILES_${PN} =3D &quot;${sysconfdir}/xdg/weston/weston.ini&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${sysconfdir}/xdg/weston/weston.ini&quot;<br>
+<br>
+PACKAGES =3D &quot;${PN}&quot;<br>
+<br>
+do_compile[noexec] =3D &#39;1&#39;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
+}<br>
+<br>
+do_install_qemux86() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${sysconfdir}/xdg/weston<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt; EOF &gt; ${D}/${sysconfdir}/xdg/we=
ston/weston.ini<br>
+[core]<br>
+backend=3Dfbdev-backend.so<br>
+EOF<br>
+}<br>
+<br>
+do_install_qemux86-64() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${sysconfdir}/xdg/weston<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt; EOF &gt; ${D}/${sysconfdir}/xdg/we=
ston/weston.ini<br>
+[core]<br>
+backend=3Dfbdev-backend.so<br>
+EOF<br>
+}<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_5.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">weston_5.0.0.bb</a> b/meta/recipes-=
graphics/wayland/<a href=3D"http://weston_5.0.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">weston_5.0.0.bb</a><br>
index 299408b201..b87524ece5 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://weston_5.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_5.0.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston_5.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_5.0.0.bb</a><br>
@@ -29,12 +29,6 @@ WESTON_MAJOR_VERSION =3D &quot;${@&#39;.&#39;.join(d.get=
Var(&#39;PV&#39;).split(&#39;.&#39;)[0:1])}&quot;<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-setuid-install \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rdp=
-compositor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-EXTRA_OECONF_append_qemux86 =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WESTON_NATIVE_BACKE=
ND=3Dfbdev-backend.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-EXTRA_OECONF_append_qemux86-64 =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WESTON_NATIVE_BACKE=
ND=3Dfbdev-backend.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;wayland&#39;, &#39;kms fbdev wayland egl&#39;, &#39;&#39;, d)} \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 wayland&#39;, &#39;xway=
land&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;pam systemd x11&#39;, d)} \<b=
r>
@@ -107,7 +101,7 @@ FILES_${PN}-xwayland =3D &quot;${libdir}/libweston-${WE=
STON_MAJOR_VERSION}/xwayland.so&quot;<br>
=C2=A0RDEPENDS_${PN}-xwayland +=3D &quot;xserver-xorg-xwayland&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;xkeyboard-config&quot;<br>
-RRECOMMENDS_${PN} =3D &quot;liberation-fonts&quot;<br>
+RRECOMMENDS_${PN} =3D &quot;weston-cfg liberation-fonts&quot;<br>
=C2=A0RRECOMMENDS_${PN}-dev +=3D &quot;wayland-protocols&quot;<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
-- <br>
2.16.0.rc2<br>
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

--0000000000001ec3310579004865--
