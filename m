Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 200C2613FD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 16:54:07 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id q9so5659073qvu.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kThlwCVMZG1Qj6AekS7YZDs4mF8ewYH211mikmXGGCc=;
	b=dxJJ0N3OM/2VaHF9LujjbRcZocFeT1Upq6nxX9+DK1rnAYH9nfzSzGD32l7I7ftNOp
	0fv1mjTyz6Z/aI200a/yDWYDWeFIYB/hL1bc5wzcdSM36se4hteqh4Dby86yQjih98eo
	iTvPsoZXomc7by35LGxal7TE1IvdcXxHk+MzAOtnpMy1B7DEemnFviZ131ih1cvuo5TD
	H+Fkc2l16NkkcmsBCJwT5ULU1Ax6SP+Xp/JUdQeGSijZYTYr0zMVUQPFB0PRE0bDhoKF
	BKvvvt90tlRjigZ6K0CoYZzSmxYGFK/M9igVxxgAMeNDHKd392GoCP/KiZ7X9jzwJCXs
	oL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kThlwCVMZG1Qj6AekS7YZDs4mF8ewYH211mikmXGGCc=;
	b=QcnjgHwdyPK+0FIFupgcSROHbF12YEl9pOX/lS+ml+Qle7VsAi5u7h5AolTugZ8KcF
	F+3CCi1VRXuTZVqMBIUb3J0IQYyhFNqVhWu6gKITaGscx5XNRPr4X+FeM3o0Mafiuyvr
	WMcXd1ItomWuZwz8IbiBvCeJm1T9Y6RJWcmK3gi35JK9VTEP0UYi8PYKR6OeYBH2p2+n
	wmOkRsBdAO3nxpkxGDCQFmJ7nd06kolYmkIGEM6XY3YABb94QTFcMmP7wxUNfDS8q3v6
	/Xcd/3Y77NaecaJCxQSfcYHkLPI0IikfoWO/ZDWp/5ZhIc3f4ObXooHZ9jqGczn01B6y
	j4hA==
X-Gm-Message-State: APjAAAX30ABuYBV4cEJKbM5vKfNYcmRnICLZ5dga68IzERBz94Ohlnp8
	2P7P46V3nuWFsI7m0rKTkwN0idIvH+UMrFLEcWw=
X-Google-Smtp-Source: APXvYqwUKGs8U/Dv11/hPstaji/QwOSzcAr+P6FUupI6g7PFDsYqaqHsQojsyPEbinOVODvyLN8BxnVrs7Lnu1wr7d4=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr9582248qvo.55.1581872048515; 
	Sun, 16 Feb 2020 08:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-2-alex.kanavin@gmail.com>
In-Reply-To: <20200216155015.21738-2-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 08:53:57 -0800
Message-ID: <CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] procps: upstream has switched to gitlab
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
X-List-Received-Date: Sun, 16 Feb 2020 16:54:08 -0000
Content-Type: multipart/alternative; boundary="000000000000883075059eb44926"

--000000000000883075059eb44926
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 7:51 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-extended/procps/procps_3.3.16.bb | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb
> b/meta/recipes-extended/procps/procps_3.3.16.bb
> index 60f90976bb..2810ebd285 100644
> --- a/meta/recipes-extended/procps/procps_3.3.16.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.16.bb
> @@ -12,14 +12,19 @@ DEPENDS = "ncurses"
>
>  inherit autotools gettext pkgconfig update-alternatives
>
> -SRC_URI = "
> http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz
> \
> +SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
>             file://sysctl.conf \
>             "
> +SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
>
> -SRC_URI[md5sum] = "e8dc8455e573bdc40b8381d572bbb89b"
> -SRC_URI[sha256sum] =
> "925eacd65dedcf9c98eb94e8978bbfb63f5de37294cc1047d81462ed477a20af"
> +S = "${WORKDIR}/git"
>
> -S = "${WORKDIR}/procps-ng-${PV}"
> +# Upstream has a custom autogen.sh which invokes po/update-potfiles as
> they
> +# don't ship a po/POTFILES.in (which is silly).  Without that file gettext
> +# doesn't believe po/ is a gettext directory and won't generate
> po/Makefile.

Do we miss .in file from tarball ? Or is it missing in a git checkout
This is expected when building in a maintainer mode
Tarballs are produced by maintainers for users
Who wants to build from source

>
> +do_configure_prepend() {
> +    ( cd ${S} && po/update-potfiles )
> +}
>
>  EXTRA_OECONF = "--enable-skill --disable-modern-top"
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000883075059eb44926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 16, 2020 at 7:51 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.bb" rel=
=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a> | 13 +++++++++----<b=
r>
=C2=A01 file changed, 9 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.b=
b" rel=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a> b/meta/recipes=
-extended/procps/<a href=3D"http://procps_3.3.16.bb" rel=3D"noreferrer" tar=
get=3D"_blank">procps_3.3.16.bb</a><br>
index 60f90976bb..2810ebd285 100644<br>
--- a/meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.bb" rel=
=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a><br>
+++ b/meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.bb" rel=
=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a><br>
@@ -12,14 +12,19 @@ DEPENDS =3D &quot;ncurses&quot;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig update-alternatives<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://downloads.sourceforge.net/project/proc=
ps-ng/Production/procps-ng-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">http://downloads.sourceforge.net/project/procps-ng/Production/procps=
-ng-${PV}.tar.xz</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/procps-ng/procps.git;=
protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.com/procps-ng=
/procps.git;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysctl.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRCREV =3D &quot;59c88e18f29000ceaf7e5f98181b07be443cf12f&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;e8dc8455e573bdc40b8381d572bbb89b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;925eacd65dedcf9c98eb94e8978bbfb63f5de37294cc1=
047d81462ed477a20af&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/procps-ng-${PV}&quot;<br>
+# Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y<br>
+# don&#39;t ship a po/POTFILES.in (which is silly).=C2=A0 Without that fil=
e gettext<br>
+# doesn&#39;t believe po/ is a gettext directory and won&#39;t generate po=
/Makefile.</blockquote><div dir=3D"auto">Do we miss .in file from tarball ?=
 Or is it missing in a git checkout=C2=A0</div><div dir=3D"auto">This is ex=
pected when building in a maintainer mode</div><div dir=3D"auto">Tarballs a=
re produced by maintainers for users</div><div dir=3D"auto">Who wants to bu=
ild from source=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 ( cd ${S} &amp;&amp; po/update-potfiles )<br>
+}<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-skill --disable-modern-top&quot;<br>
<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000883075059eb44926--
