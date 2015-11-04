Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 476D376BD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 20:20:42 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so50689591qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 12:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=G0mWk+kZp++jrWIAZm5on0W8CZa9/W+LZY3lgq+mzms=;
	b=kP685xLmhcPFgdtNwVDkQ+925kXrAYj3g5Uk7yVeuc7Izlw79ROXT3Jt3ylGYKuDl2
	R9axtGFU0HyrpiBwjqt+iCrv9/bkyj4uhH5iLXQxIeYFIztTX57JV9Q0Th3dI0ICDSDk
	D4g6H4Zlq4o7OrCuJbXga+83/PGfAk4UdAizrD5NMgSwSc4oa4qTipunc0kf5NiNEFNQ
	JEYHVD/7DXRytGpkwCWTgD/Sq+1O4pMCBRWhGPYS4ey5JpbTrZii6FJgK0uPZxQvGWad
	wpRB/Qlng72qGXnZEV1CuhP0p1Muig6AJjcTPjvEkexpJIsTwRgXYW3WUdaoZFhjtAtX
	lLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=G0mWk+kZp++jrWIAZm5on0W8CZa9/W+LZY3lgq+mzms=;
	b=QGd1IqMfq2UkbiFrrZwTYIAacjS21dqg4Mwp6QVGDLNknP+yMuCm9HZgN6Z3Ftx5CO
	KqdUJfsQRrv36kgnmPVKVochy3N3lRgJwzkxW9qT7Ztu5seEAR+ZWuioGl4brjd2ER7r
	vOu+DV5O7MjwmOqmEXvtIiHlzbtXg2mDoO/fVnNfPpYEkLq7h4Y1W4pUG5Y3h6vT9Zur
	jSwrUsFboJ2jW6hfhYcDaG20ytapmsQ/Og8WJZJQumCbYMNItt44XdyY17S/zskh+TdN
	MrDrMwmGsPFFNsPLzethm82leeGd3ZDP9nl9jQ4rJiNk8aWp5HrDin5qua5PaNYFNEDr
	bgFw==
X-Gm-Message-State: ALoCoQkYiIdkyq/zgt71PnGisdLv9TcWiTy6rfM/oIjjI/KdOsh9WFN7eUev2KupWvoGDUGcbp9w
X-Received: by 10.140.46.119 with SMTP id j110mr3697149qga.77.1446668442786;
	Wed, 04 Nov 2015 12:20:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 4 Nov 2015 12:20:23 -0800 (PST)
In-Reply-To: <1446666421-2549-3-git-send-email-ross.burton@intel.com>
References: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
	<1446666421-2549-3-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Nov 2015 20:20:23 +0000
Message-ID: <CAJTo0LbgKKZC+iGewifxjOO5agRPq=j_fFw0von0Ap+80a+Nhw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gcr: remove Vala dependency
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
X-List-Received-Date: Wed, 04 Nov 2015 20:20:43 -0000
Content-Type: multipart/alternative; boundary=001a11395aaaa3f9ab0523bcbe30

--001a11395aaaa3f9ab0523bcbe30
Content-Type: text/plain; charset=UTF-8

Retracting this, gcr needs vala's m4 file.  Back to wondering if we should
have a vala-stub too...

Ross

On 4 November 2015 at 19:47, Ross Burton <ross.burton@intel.com> wrote:

> The Vala support in GCR requires gobject-introspection so even with the
> build
> dependency on Vala it isn't enabled, so remove the build dependency and
> explicitly disable Vala support.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/gcr/gcr_3.16.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
> b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
> index 057c815..cf4be84 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
> @@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>
> -DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
> +DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
>
>  inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check
>  # depends on gtk+3
> @@ -14,6 +14,8 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  SRC_URI[archive.md5sum] = "d5835680be0b6a838e02a528d5378d9c"
>  SRC_URI[archive.sha256sum] =
> "ecfe8df41cc88158364bb15addc670b11e539fe844742983629ba2323888d075"
>
> +EXTRA_OECONF = "--disable-vala"
> +
>  FILES_${PN} += " \
>      ${datadir}/dbus-1 \
>      ${datadir}/gcr-3 \
> --
> 2.1.4
>
>

--001a11395aaaa3f9ab0523bcbe30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Retracting this, gcr needs vala&#39;s m4 file.=C2=A0 Back =
to wondering if we should have a vala-stub too...<div><br></div><div>Ross</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4 No=
vember 2015 at 19:47, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The Vala support in GCR requires=
 gobject-introspection so even with the build<br>
dependency on Vala it isn&#39;t enabled, so remove the build dependency and=
<br>
explicitly disable Vala support.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.16.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcr_3.16.0.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">gcr_3.16.0.bb</a> b/meta/recipes-gnome/gcr/<=
a href=3D"http://gcr_3.16.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr_3.=
16.0.bb</a><br>
index 057c815..cf4be84 100644<br>
--- a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.16.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcr_3.16.0.bb</a><br>
+++ b/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.16.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcr_3.16.0.bb</a><br>
@@ -5,7 +5,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.org/=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/</a>&quot=
;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D55ca817ccb7d5b5b66355=
690e9abc605&quot;<br>
<br>
-DEPENDS =3D &quot;gtk+3 p11-kit glib-2.0 libgcrypt vala&quot;<br>
+DEPENDS =3D &quot;gtk+3 p11-kit glib-2.0 libgcrypt&quot;<br>
<br>
=C2=A0inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_ch=
eck<br>
=C2=A0# depends on gtk+3<br>
@@ -14,6 +14,8 @@ ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&qu=
ot;<br>
=C2=A0SRC_URI[archive.md5sum] =3D &quot;d5835680be0b6a838e02a528d5378d9c&qu=
ot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;ecfe8df41cc88158364bb15addc670b1=
1e539fe844742983629ba2323888d075&quot;<br>
<br>
+EXTRA_OECONF =3D &quot;--disable-vala&quot;<br>
+<br>
=C2=A0FILES_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1 \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/gcr-3 \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11395aaaa3f9ab0523bcbe30--
