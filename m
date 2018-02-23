Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B09377BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 18:18:53 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id 30so10717053iog.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=89MPooeFpB+QgwO7nDTIu3440mFlrGj7i5ScjUT0BHY=;
	b=XOnlZpU6/NFPH8BuMMnPcPMg4L1CzxgEVg7AJHV3fgOTPnzZ16JZT7+akeos3tvbee
	ObTQsTh7AlwYT2IWGLXjFQ/G6u4X02HqD0oVKZ8UOBwwuYDo01/k9XOU4rRKURUqsQtt
	4S3LvpWlny+tnoDfSyJtmVTHlnPKoMqzSBCd5UHKMZvzqmPsjSLuSzmtWEE+qzjsbNB7
	PuH3OTjV429HTBcxNSy38gi7b3fnm7IPRlz6I8c7/bzLbR4wbzmdsek/YzR2GIALbZV5
	vrF6KVypQ4yv2dizc6VE34JvOg6WAEBJawW1IJPOHPS9cc2FWz4ks/hbraA3/DrkpSTM
	8Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=89MPooeFpB+QgwO7nDTIu3440mFlrGj7i5ScjUT0BHY=;
	b=cF40oYA+nIwpzAWjypN6zAAMvfwxa+1qvpVFuxy9GWK4Io4H+iLB6l+Ks8YGnuqE21
	deVhvwmhi3bG24HIXPBtWBBhd3udYb9rvPT+mhKbrHWmbFvRQsfHVYF+b8ZpPUbd+8px
	iHpnmV+mBiYCKHv8XScqe5gYIkepis82/8shiPQGadaI+TKuGA7zzOFnecUq6e3Fu1sf
	EAZYqNLBrseH2bsiLOMDl/Zsn3VawqFG5TD/+b9yiXJ9oD1MJGXG6Ke0wbf6dTtk7McM
	36D2fj9FIAJu5HBnru48eTiG2/ZkiVhnsQsL1Jp1VAD4nIoUHI9bVHRShYWH5Swjt5UH
	GBsw==
X-Gm-Message-State: APf1xPCmh3iQGp8FfvWBIqL1ewCCjb6tVybStKmBKrUFTCuTU1hI8Dts
	HYd9rsjinSet8uvDkaEKq/YavTz+FP6tsESZc6zm0Q==
X-Google-Smtp-Source: AG47ELvzpJsh4qox3jUXty6TgdO5fMBj8tcgxgji2tzQtUNFSAhZznkCAtDPGV4qy2I2Tjfnm2mK2mu1c6008paM2iQ=
X-Received: by 10.107.183.76 with SMTP id h73mr2809907iof.201.1519409934657;
	Fri, 23 Feb 2018 10:18:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 23 Feb 2018 10:18:34 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64C6607C5@ORSMSX112.amr.corp.intel.com>
References: <20180223153535.11063-1-ross.burton@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C6607C5@ORSMSX112.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Feb 2018 18:18:34 +0000
Message-ID: <CAJTo0LZ2bVOuYY6m7jbZcND=T4p2dOQKn7iN4D7FtXrPg=RB+g@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xcb-proto: don't compile for Python 2
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
X-List-Received-Date: Fri, 23 Feb 2018 18:18:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b9e3a6c8b940565e5314a"

--94eb2c0b9e3a6c8b940565e5314a
Content-Type: text/plain; charset="UTF-8"

Indeed, meant to put that number in the message.

On 23 February 2018 at 17:21, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> Nice. This should fix Yocto #12543 as well.
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [
> openembedded-core-bounces@lists.openembedded.org] on behalf of Ross
> Burton [ross.burton@intel.com]
> Sent: Friday, February 23, 2018 7:35 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] xcb-proto: don't compile for Python 2
>
> Remove the do_install_append to create the Python 2 pyc files, as nothing
> in the
> build is using Python 2 anymore (libxcb is the only user, and that uses
> Python
> 3).
>
> Also use variables instead of a patch to control what Python binary and
> path the
> modules are installed to.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../xorg-proto/xcb-proto/no-python-native.patch    | 27
> ----------------------
>  meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 14 ++++-------
>  2 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/no-python-
> native.patch
>
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
> b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
> deleted file mode 100644
> index 09b6088db0a..00000000000
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream uses AM_PATH_PYTHON to find a python binary and ask it where to
> install
> -libraries.  This means we either need to depend on python-native (large
> build
> -dependency, early in the build) or use the host python (pythondir
> reflects the
> -host and not the target, breaks builds).
> -
> -The third option is to just hardcode the path where the module goes, as
> most
> -callers of the code use pkg-config to find where it was installed anyway.
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index d140bfe..c7b68da 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -14,7 +14,10 @@ if test "$XMLLINT" = "no"; then
> -    AC_MSG_WARN([xmllint not found; unable to validate against schema.])
> - fi
> -
> --AM_PATH_PYTHON([2.5])
> -+pythondir="${libdir}/xcb-proto"
> -+AC_SUBST(pythondir)
> -+PYTHON="python3"
> -+AC_SUBST(PYTHON)
> -
> - xcbincludedir='${datadir}/xcb'
> - AC_SUBST(xcbincludedir)
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> index be6b1a0200e..712ab6c59ab 100644
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
> @@ -11,8 +11,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
>                      file://src/dri2.xml;beginline=2;endline=28;md5=
> f8763b13ff432e8597e0d610cf598e65"
>
> -SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
> -           file://no-python-native.patch \
> +SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
>             file://0001-Make-whitespace-use-consistent.patch \
>             file://0002-print-is-a-function-and-needs-parentheses.patch \
>             "
> @@ -21,6 +20,10 @@ SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a8
> 7aa4c1fc7eb5ee550325c3216c48
>
>  inherit autotools pkgconfig
>
> +# Force the use of Python 3 and a specific library path so we don't need
> to
> +# depend on python3-native
> +CACHED_CONFIGUREVARS += "PYTHON=python3 am_cv_python_pythondir=${
> libdir}/xcb-proto"
> +
>  PACKAGES += "python-xcbgen"
>
>  FILES_${PN} = ""
> @@ -31,10 +34,3 @@ RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>
>  BBCLASSEXTEND = "native nativesdk"
> -
> -do_install_append() {
> -    # Makefile's do_install creates .pyc files for python3, now also
> create
> -    # them for python2 so that they will be recorded by manifest, and can
> be
> -    # cleaned correctly.
> -    (cd ${D}; python -m py_compile ./${libdir}/xcb-proto/xcbgen/*.py)
> -}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b9e3a6c8b940565e5314a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Indeed, meant to put that number in the message.</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 23 February 2018 a=
t 17:21, Bystricky, Juro <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystr=
icky@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Nice. This should fix Yocto #12543 =
as well.<br>
______________________________<wbr>__________<br>
From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org">o=
penembedded-core-bounces@<wbr>lists.openembedded.org</a> [<a href=3D"mailto=
:openembedded-core-bounces@lists.openembedded.org">openembedded-core-bounce=
s@<wbr>lists.openembedded.org</a>] on behalf of Ross Burton [<a href=3D"mai=
lto:ross.burton@intel.com">ross.burton@intel.com</a>]<br>
Sent: Friday, February 23, 2018 7:35 AM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Subject: [OE-core] [PATCH] xcb-proto: don&#39;t compile for Python 2<br>
<div><div class=3D"h5"><br>
Remove the do_install_append to create the Python 2 pyc files, as nothing i=
n the<br>
build is using Python 2 anymore (libxcb is the only user, and that uses Pyt=
hon<br>
3).<br>
<br>
Also use variables instead of a patch to control what Python binary and pat=
h the<br>
modules are installed to.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0.../xorg-proto/xcb-proto/no-<wbr>python-native.patch=C2=A0 =C2=A0 | 2=
7 ----------------------<br>
=C2=A0meta/recipes-graphics/xorg-<wbr>proto/<a href=3D"http://xcb-proto_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a> | 14 ++++-=
------<br>
=C2=A02 files changed, 5 insertions(+), 36 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-<wbr>proto/xcb-proto/no=
-python-<wbr>native.patch<br>
<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>proto/xcb-proto/no-python-<wbr=
>native.patch b/meta/recipes-graphics/xorg-<wbr>proto/xcb-proto/no-python-<=
wbr>native.patch<br>
deleted file mode 100644<br>
index 09b6088db0a..00000000000<br>
--- a/meta/recipes-graphics/xorg-<wbr>proto/xcb-proto/no-python-<wbr>native=
.patch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-Upstream uses AM_PATH_PYTHON to find a python binary and ask it where to i=
nstall<br>
-libraries.=C2=A0 This means we either need to depend on python-native (lar=
ge build<br>
-dependency, early in the build) or use the host python (pythondir reflects=
 the<br>
-host and not the target, breaks builds).<br>
-<br>
-The third option is to just hardcode the path where the module goes, as mo=
st<br>
-callers of the code use pkg-config to find where it was installed anyway.<=
br>
-<br>
-Upstream-Status: Inappropriate<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index d140bfe..c7b68da 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -14,7 +14,10 @@ if test &quot;$XMLLINT&quot; =3D &quot;no&quot;; then<b=
r>
-=C2=A0 =C2=A0 AC_MSG_WARN([xmllint not found; unable to validate against s=
chema.])<br>
- fi<br>
-<br>
--AM_PATH_PYTHON([2.5])<br>
-+pythondir=3D&quot;${libdir}/xcb-<wbr>proto&quot;<br>
-+AC_SUBST(pythondir)<br>
-+PYTHON=3D&quot;python3&quot;<br>
-+AC_SUBST(PYTHON)<br>
-<br>
- xcbincludedir=3D&#39;${datadir}/xcb&#39;<br>
- AC_SUBST(xcbincludedir)<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>proto/<a href=3D"http://xcb-pr=
oto_1.12.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a> b/m=
eta/recipes-graphics/xorg-<wbr>proto/<a href=3D"http://xcb-proto_1.12.bb" r=
el=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a><br>
index be6b1a0200e..712ab6c59ab 100644<br>
--- a/meta/recipes-graphics/xorg-<wbr>proto/<a href=3D"http://xcb-proto_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a><br>
+++ b/meta/recipes-graphics/xorg-<wbr>proto/<a href=3D"http://xcb-proto_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a><br>
@@ -11,8 +11,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d763b081cb10c223=
435b01e00dc0ab<wbr>a7 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/dri2.xml;beginline=3D<wbr>2;endline=3D28;md5=3D<wbr>f8763b13f=
f432e8597e0d610cf598e<wbr>65&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://xcb.freedesktop.org/dist/xcb-proto-${P=
V}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://xcb.freedesktop.org=
/<wbr>dist/xcb-proto-${PV}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-python-native.patch \<b=
r>
+SRC_URI =3D &quot;<a href=3D"http://xcb.freedesktop.org/dist/${BP}.tar.bz2=
" rel=3D"noreferrer" target=3D"_blank">http://xcb.freedesktop.org/<wbr>dist=
/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-whitespace-<wbr>=
use-consistent.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-print-is-a-<wbr>funct=
ion-and-needs-<wbr>parentheses.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -21,6 +20,10 @@ SRC_URI[sha256sum] =3D &quot;<wbr>5922aba4c664ab7899a29d=
92ea91a8<wbr>7aa4c1fc7eb5ee550325c3216c48<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
+# Force the use of Python 3 and a specific library path so we don&#39;t ne=
ed to<br>
+# depend on python3-native<br>
+CACHED_CONFIGUREVARS +=3D &quot;PYTHON=3Dpython3 am_cv_python_pythondir=3D=
${<wbr>libdir}/xcb-proto&quot;<br>
+<br>
=C2=A0PACKAGES +=3D &quot;python-xcbgen&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;&quot;<br>
@@ -31,10 +34,3 @@ RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
=C2=A0RRECOMMENDS_${PN}-dbg =3D &quot;${PN}-dev (=3D ${EXTENDPKGV})&quot;<b=
r>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 # Makefile&#39;s do_install creates .pyc files for python3, =
now also create<br>
-=C2=A0 =C2=A0 # them for python2 so that they will be recorded by manifest=
, and can be<br>
-=C2=A0 =C2=A0 # cleaned correctly.<br>
-=C2=A0 =C2=A0 (cd ${D}; python -m py_compile ./${libdir}/xcb-proto/xcbgen/=
*<wbr>.py)<br>
-}<br>
--<br>
2.11.0<br>
<br>
</div></div>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div><br></div>

--94eb2c0b9e3a6c8b940565e5314a--
