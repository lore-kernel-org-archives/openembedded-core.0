Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id CE1446057B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 08:01:49 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id f89so164831947ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 01:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RzqaqZybQnnoQGd6MncFXgtrsKgR3nYrtkBBW5PXPUA=;
	b=aYI7fwhtF3YyyW21IJNMKhtPihPwZ/Dti8JqlqypaboYe8Zg8o1thTTc/rdqnkQUiu
	vAI5/hokhPYWhYiCiRPuqWF8y4cfJvDqpf+WzjqT2OqaPay/UZgrP9vntK+ww4GWXC2Z
	OSnrMqkzgcgtJvt6ok2LOWw3vYhL3rjGhhihIJHVZwd74ykIOQePvrNn+GdwMJvRHBwR
	YsyaazacJ+fI9jmwvFJgnCYH+ZWhY/NV8ZE8YyxSo/Ly3PL04UgG8XUpiGeFYlNybroa
	TSRZAg7r+u+CE0h2MvieElb4TsPR/3gTIwBJW/jkYo4CvRpSA4u6kQcdRw0XX7nmDpUo
	vMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RzqaqZybQnnoQGd6MncFXgtrsKgR3nYrtkBBW5PXPUA=;
	b=ccNWVtqQ677wiRY+aZHeJaeooMOqp59pIVKRUbeGoNt8vphQZ+I1ZqzkPGy/0C2K4y
	qqdR26LNmgM1S7dSyd2FNZc0JtAIZWaJ4/MJWqq3EJWDzyWuYU/pOsPWAVr5yrjeZ2mC
	HLfbJl1MtcGsEkKnDv0vq6hUfvpmgVaqEDG9vr1zOB9PXof9D5oBr4JIwytXL8JIaklq
	ZKqvGUwWlDIYAA81emC7ZBhxD22LcW2DQj3eWlSq+6XsPynzDAtQ2uKfoT6QcijnAkSC
	R+bLUSglA7PLIDOvUGi1HZvUfO5P2Aee3Wrcb0Vj7v4/FB6UCemOvN0uyaq60SgPQdvw
	9fnA==
X-Gm-Message-State: AOPr4FWipcZLHIfa5oYtMehYHOLP6tutFHgbkKMC7xDg3s47EXYnWnwenBV8yexKqNnvodicEiXTwEXsvsRo1F0g
X-Received: by 10.107.135.211 with SMTP id r80mr38614609ioi.133.1462780909938; 
	Mon, 09 May 2016 01:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 9 May 2016 01:01:30 -0700 (PDT)
In-Reply-To: <1462728798-10477-1-git-send-email-dv@pseudoterminal.org>
References: <1462728798-10477-1-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 May 2016 09:01:30 +0100
Message-ID: <CAJTo0LYgODO918h3_nhLfE4FiiV3i3uQQYYFBD3dSGg7+HeF7g@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-player: Remove recipe: gstplayer is part of -bad package since 1.8
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
X-List-Received-Date: Mon, 09 May 2016 08:01:49 -0000
Content-Type: multipart/alternative; boundary=001a113ed20a85beb1053264386e

--001a113ed20a85beb1053264386e
Content-Type: text/plain; charset=UTF-8

gst-player the API is, but not the applications gtk-player or gst-player
which is the main reason this recipe exists in oe-core.

Current gst-player HEAD is now using non-trivial parts of GTK+ 3, so I
started to backport the API changes to gst-player so we could ship a GTK+ 2
gtk-player that links to the API in -bad 1.8, but didn't finish the work.
We plan on merging the GTK+ 3 Sato patches fairly soon so it may be that
the -bad 1.8 upgrade waits for that, then gst-player can switch to git HEAD
with GTK+ 3, and everything works again.


Ross

On 8 May 2016 at 18:33, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:

> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../recipes-multimedia/gstreamer/gst-player_git.bb | 39
> ----------------------
>  1 file changed, 39 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player_git.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> deleted file mode 100644
> index 8129169..0000000
> --- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "GStreamer playback helper library and examples"
> -LICENSE = "LGPL-2.0+"
> -LIC_FILES_CHKSUM =
> "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
> -
> -DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
> -
> -SRC_URI = "git://github.com/sdroege/gst-player.git \
> -           file://filechooser.patch \
> -           file://gtk2.patch \
> -           file://Fix-pause-play.patch \
> -           file://Add-error-signal-emission-for-missing-plugins.patch \
> -           file://gst-player.desktop"
> -
> -SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools gtk-doc lib_package pkgconfig distro_features_check
> gobject-introspection
> -
> -ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> -
> -do_configure_prepend() {
> -       touch ${S}/ChangeLog
> -}
> -
> -EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
> -
> -do_install_append() {
> -       install -m 0644 -D ${WORKDIR}/gst-player.desktop
> ${D}${datadir}/applications/gst-player.desktop
> -}
> -
> -FILES_${PN}-bin += "${datadir}/applications/*.desktop"
> -
> -RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
> -RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
> -                         gstreamer1.0-plugins-good-meta \
> -                         gstreamer1.0-plugins-bad-meta \
> -                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST",
> "commercial", "gstreamer1.0-libav", "", d)} \
> -                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST",
> "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ed20a85beb1053264386e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">gst-player the API is, but not the applications gtk-player=
 or gst-player which is the main reason this recipe exists in oe-core.<div>=
<br></div><div>Current gst-player HEAD is now using non-trivial parts of GT=
K+ 3, so I started to backport the API changes to gst-player so we could sh=
ip a GTK+ 2 gtk-player that links to the API in -bad 1.8, but didn&#39;t fi=
nish the work.=C2=A0 We plan on merging the GTK+ 3 Sato patches fairly soon=
 so it may be that the -bad 1.8 upgrade waits for that, then gst-player can=
 switch to git HEAD with GTK+ 3, and everything works again.</div><div><br>=
</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 8 May 2016 at 18:33, Carlos Rafael Giani <span =
dir=3D"ltr">&lt;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">=
dv@pseudoterminal.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudotermin=
al.org">dv@pseudoterminal.org</a>&gt;<br>
---<br>
=C2=A0.../recipes-multimedia/gstreamer/<a href=3D"http://gst-player_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">gst-player_git.bb</a> | 39 ----------=
------------<br>
=C2=A01 file changed, 39 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D"http:=
//gst-player_git.bb" rel=3D"noreferrer" target=3D"_blank">gst-player_git.bb=
</a><br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-player=
_git.bb" rel=3D"noreferrer" target=3D"_blank">gst-player_git.bb</a> b/meta/=
recipes-multimedia/gstreamer/<a href=3D"http://gst-player_git.bb" rel=3D"no=
referrer" target=3D"_blank">gst-player_git.bb</a><br>
deleted file mode 100644<br>
index 8129169..0000000<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-player_git.bb=
" rel=3D"noreferrer" target=3D"_blank">gst-player_git.bb</a><br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-SUMMARY =3D &quot;GStreamer playback helper library and examples&quot;<br>
-LICENSE =3D &quot;LGPL-2.0+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://lib/gst/player/gstplayer.c;beginline=3D1=
;endline=3D19;md5=3D03aeca9d8295f811817909075a15ff65&quot;<br>
-<br>
-DEPENDS =3D &quot;glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+&quo=
t;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/sdroege/gst-player.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/sdroege/gst-player.git</=
a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://filechooser.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gtk2.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Fix-pause-play.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Add-error-signal-emission-=
for-missing-plugins.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gst-player.desktop&quot;<b=
r>
-<br>
-SRCREV =3D &quot;5386c5b984d40ef5434673ed62204e69aaf52645&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobj=
ect-introspection<br>
-<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
-<br>
-do_configure_prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${S}/ChangeLog<br>
-}<br>
-<br>
-EXTRA_OECONF +=3D &quot;ac_cv_path_VALGRIND=3Dno ac_cv_path_GDB=3Dno&quot;=
<br>
-<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 -D ${WORKDIR}/gst-player.deskto=
p ${D}${datadir}/applications/gst-player.desktop<br>
-}<br>
-<br>
-FILES_${PN}-bin +=3D &quot;${datadir}/applications/*.desktop&quot;<br>
-<br>
-RDEPENDS_${PN}-bin =3D &quot;gstreamer1.0-plugins-base-playback&quot;<br>
-RRECOMMENDS_${PN}-bin =3D &quot;gstreamer1.0-plugins-base-meta \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-good-meta \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-bad-meta \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;LICENSE_FLAGS_WHITELIST&quot;, =
&quot;commercial&quot;, &quot;gstreamer1.0-libav&quot;, &quot;&quot;, d)} \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;LICENSE_FLAGS_WHITELIST&quot;, =
&quot;commercial&quot;, &quot;gstreamer1.0-plugins-ugly-meta&quot;, &quot;&=
quot;, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a113ed20a85beb1053264386e--
