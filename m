Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3C308755C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:13:39 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n21so3158578qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 01:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6ge+6H+qzjEqY0YBJo82O/Ja5xjy60XV4TPyjS7T30U=;
	b=N9mIRtnIJUZ+mSeMxF5hfIt6mZcfsE2wI99vD45YnO6ZP2F9bMyosTjhDe0sZXQD2L
	jWR6wSVCWA3VzhYN+lkBp7venbjl1qom4L/rLdTLY4Cw0Hy4REkU5UBFyIuDR6yxEuwT
	Pd1tefuiRufzaTBSnyvCxTyLjc+lMLb48AZKch9d2iJ+H0aeEAlKXnbvQoGJjqYxhlsT
	XBdwjc6LB+ADEI1An23269KJB4nCxxmAoaw+Vfde1WUWe6j073HWZkiQarXQCp/UDhmb
	Ye03qlld5QknCmL5MPQlXz3dXoGuJofrTS76RQb4ZxhYLSPOM1gyePK9OSVPBokFNWxf
	YGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6ge+6H+qzjEqY0YBJo82O/Ja5xjy60XV4TPyjS7T30U=;
	b=Lv1dh+m/HJmwHls1zxrKViUboPNq2qhKSADWs4p5FVXy9TIaSUMUL3O0w7OS8CrEZE
	R2qphd+mxvHDXhZiNk8DrGf6b102YiyMUFcyv6szmVVQl/3OswTnxDGuOFd8jUxc3NWg
	v6D3s6+1Gw5AfwvvUIRS2TSOgw/daScaO+WVcJny6LRK3h/J6k+EA0B1+5s7993gCVn+
	kbzHZSecJAn1WFQyJAYMu6UUsnZgCPgkWulFUyET0U5r2d41ldB7iiLK3yD0oi6QqJrB
	L2Up9GNueC84qOIY47ge9sS0Ei/KeOXK+ld92GJni82Kv1i/P2Oon4h8s4YBB0ePfF/6
	zrQA==
X-Gm-Message-State: AIkVDXKxe1pZMxomdUbUvh8tpy994E5WC8o0Tn0rzMs6K1T0FFsXPVJtiZ83u9pNBl29xs8ENUvkVIGY1sIFgycz
X-Received: by 10.55.49.67 with SMTP id x64mr362420qkx.190.1482138820867; Mon,
	19 Dec 2016 01:13:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Mon, 19 Dec 2016 01:13:10 -0800 (PST)
In-Reply-To: <20161219063957.18716-10-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-10-raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 19 Dec 2016 11:13:10 +0200
Message-ID: <CAHiDW_FRxBzxYbfq9ci9YDu3R-WZW5Qz_5qXXhtXp8F5XUDQOA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2 10/10] gdk-pixbuf: Update to 2.36.1
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
X-List-Received-Date: Mon, 19 Dec 2016 09:13:41 -0000
Content-Type: multipart/alternative; boundary=001a1147ffe0ed14580543ff555c

--001a1147ffe0ed14580543ff555c
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 08:39, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb}      | 7
> +++----
>

I'm pretty sure this breaks debian renaming because of the added
thumbnailer binary.

I've got this upgrade (with an added ${PN}-bin package) in a branch that I
plan to send after a quick test so no need to fix.

Jussi



>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.0.bb =>
> gdk-pixbuf_2.36.1.bb} (95%)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
> similarity index 95%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
> index 9efe374c0d..debc2d706a 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
> @@ -18,9 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz
> \
>             file://run-ptest \
>             file://fatal-loader.patch \
>             "
> -
> -SRC_URI[md5sum] = "1a3baf91956c7923dab49ee3de100ce1"
> -SRC_URI[sha256sum] = "85ab52ce9f2c26327141b3dcf21cca
> 3da6a3f8de84b95fa1e727d8871a23245c"
> +SRC_URI[md5sum] = "fe30b0420e013f2c4590ae6226d895d4"
> +SRC_URI[sha256sum] = "9d5ba72070460c1b5b74115d395a3e
> 33daeb7b7b67fb256cdccc9d7187c42a38"
>
>  inherit autotools pkgconfig gettext pixbufcache ptest-gnome
> upstream-version-is-even gobject-introspection gtk-doc
>
> @@ -46,7 +45,7 @@ PACKAGES =+ "${PN}-xlib"
>  FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
>  ALLOW_EMPTY_${PN}-xlib = "1"
>
> -FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
> +FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> ${datadir}/thumbnailers"
>
>  FILES_${PN}-dev += " \
>         ${bindir}/gdk-pixbuf-csource \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147ffe0ed14580543ff555c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
9 December 2016 at 08:39, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<=
br>
---<br>
=C2=A0.../gdk-pixbuf/{<a href=3D"http://gdk-pixbuf_2.36.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">gdk-pixbuf_2.<wbr>36.0.bb</a> =3D&gt; <a href=3D"ht=
tp://gdk-pixbuf_2.36.1.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_=
2.36.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 7 +++----<br></blockquote><div><br></d=
iv><div>I&#39;m pretty sure this breaks debian renaming because of the adde=
d thumbnailer binary.</div><div><br></div><div>I&#39;ve got this upgrade (w=
ith an added ${PN}-bin package) in a branch that I plan to send after a qui=
ck test so no need to fix.</div><div><br></div><div>Jussi</div><div>=C2=A0=
=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/gdk-pixbuf/<wbr>{<a href=3D"http://gdk-pixb=
uf_2.36.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.36.0.bb</a>=
 =3D&gt; <a href=3D"http://gdk-pixbuf_2.36.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gdk-pixbuf_2.36.1.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-gnome/gdk-<wbr>pixbuf/<a href=3D"http://gdk-pixbu=
f_2.36.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.36.0.bb</a> =
b/meta/recipes-gnome/gdk-<wbr>pixbuf/<a href=3D"http://gdk-pixbuf_2.36.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.36.1.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.36=
.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gdk-pixbuf_2.36.0.bb</a><b=
r>
rename to meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.36.1=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gdk-pixbuf_2.36.1.bb</a><br>
index 9efe374c0d..debc2d706a 100644<br>
--- a/meta/recipes-gnome/gdk-<wbr>pixbuf/<a href=3D"http://gdk-pixbuf_2.36.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.36.0.bb</a><br>
+++ b/meta/recipes-gnome/gdk-<wbr>pixbuf/<a href=3D"http://gdk-pixbuf_2.36.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.36.1.bb</a><br>
@@ -18,9 +18,8 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${MAJ_<wbr>VER}/=
${BPN}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fatal-loader.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>1a3baf91956c7923dab49ee3de100c<wbr>e1&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>85ab52ce9f2c26327141b3dcf21cca<wbr>3da6a=
3f8de84b95fa1e727d8871a23<wbr>245c&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>fe30b0420e013f2c4590ae6226d895<wbr>d4&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>9d5ba72070460c1b5b74115d395a3e<wbr>33dae=
b7b7b67fb256cdccc9d7187c4<wbr>2a38&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-=
version-is-even gobject-introspection gtk-doc<br>
<br>
@@ -46,7 +45,7 @@ PACKAGES =3D+ &quot;${PN}-xlib&quot;<br>
=C2=A0FILES_${PN}-xlib =3D &quot;${libdir}/*pixbuf_xlib*${<wbr>SOLIBS}&quot=
;<br>
=C2=A0ALLOW_EMPTY_${PN}-xlib =3D &quot;1&quot;<br>
<br>
-FILES_${PN} +=3D &quot;${libdir}/gdk-pixbuf-2.0/gdk-<wbr>pixbuf-query-load=
ers&quot;<br>
+FILES_${PN} +=3D &quot;${libdir}/gdk-pixbuf-2.0/gdk-<wbr>pixbuf-query-load=
ers ${datadir}/thumbnailers&quot;<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/gdk-pixbuf-csource \<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1147ffe0ed14580543ff555c--
