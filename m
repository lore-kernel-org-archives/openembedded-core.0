Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86EF4751D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 10:53:55 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p26so3525393edr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GjcbuWe5iNwVllBrxU9z/eeEsqhDeMvQty7VPFoO8hE=;
	b=ln0tCs2ctTk2YVfJlELNpIeQGYRneHGfJDKLi6BobEZYR4P3qLQZBFB+jpyPFSRmW0
	RUmZkDJmrmkyDC6+WRS5xcAR22pN5FyJd5xCcu3N5xR/gUFnuhq1lJRwMIPiFiN92xSd
	t0JJ00UvT3LqoCAJB+lowKXdJdw3ulBw88y8JwWiuBNU8Tv9K+lBxAYoHeAcVkTj/E9n
	NqGLddRtKkyjcrgC24YXun9CamztuIp2sCrzzlPoE1qpKgnhTDJOP/GpMpvwfCehUOsh
	Qt49rAt8B6QQVQ1I3nxr/bTPZAb0qz8A/u+6o59sciimYzu5BbvYmmKCKS456x07gXPR
	ryyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GjcbuWe5iNwVllBrxU9z/eeEsqhDeMvQty7VPFoO8hE=;
	b=kIuQ5NU9mRe5s/7izY7L5c6RVFuu5tKQSIwLdFHaPBHQYFftjiNzuQkCmkLn4Cg8ld
	lrK2qU7k/ngD/yuJpjk3jN1ERDjAqoSrjqGT58csL5XOQsgVj4B6C8xwthAE7pV2ee/L
	1GT/C68rKfPmHlCtWPp4Y9hErvSywgCKXlGjOp3twuRacYZjEsr5UbPkx6pzZwZ8etCR
	YLdcLjyd7Nr6tnhWxWPsVvenwO6dpMJCsRdmNvcshbhyxdKeaIFS6/VZdp5WRoiSW16j
	TgmrEoBn64eDn2x+Zwk9cJt+UkL0n0AUgeXQnyhEdNfbiD/nNVGQb5+N2DcZZIaf5VYj
	26ng==
X-Gm-Message-State: APjAAAXhfDi73P5x6Qljs8/3ww8Vdehf81ZkYeINIFxDrq/oTfzvYgvi
	Ep6f0AlJNQxw9lSEgYhdjBZSgpEl9lyhgGRvBsE=
X-Google-Smtp-Source: APXvYqxDeGE6h6PR9X9M8/QwxfvIEsUjtg2Bbw/2nU/dyHHr3Ky7cozMUtykfz9XNCssE5SRHt6GVK8ye9aoGVOTakE=
X-Received: by 2002:a17:906:6a02:: with SMTP id
	o2mr6186530ejr.164.1557917636082; 
	Wed, 15 May 2019 03:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <1554998483-26536-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1554998483-26536-1-git-send-email-mikko.rapeli@bmw.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 May 2019 12:53:44 +0200
Message-ID: <CA+chaQdCSbEj1PnfEkCPvMV8VAgsmFTWJHyyBwP-rwLvjAxzhA@mail.gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils: remove Elfutils-Exception and include GPLv2 for shared libraries
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
X-List-Received-Date: Wed, 15 May 2019 10:53:56 -0000
Content-Type: multipart/alternative; boundary="00000000000049c04c0588eaf7a9"

--00000000000049c04c0588eaf7a9
Content-Type: text/plain; charset="UTF-8"

Can we restore meta/files/common-licenses/Elfutils-Exception in oe-core to
be used by meta-gplv2 version:

recipes-devtools/elfutils/elfutils_0.148.bb:LICENSE = "(GPL-2+ &
Elfutils-Exception)"
causing:
do_rootfs: The license listed Elfutils-Exception was not in the licenses
collected for recipe elfutils

or should I send patch for meta-gplv2 to restore it there together with
another LICENSE_PATH += "${LAYERDIR}/licenses"?

On Thu, Apr 11, 2019 at 6:01 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> Elfutils-Exception no longer exists after upstream release 0.154
> and commit:
>
> commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2
> Author: Mark Wielaard <mjw@redhat.com>
> Date:   Tue Jun 5 17:15:16 2012 +0200
>
> NEWS file in the sources says this about switch from GPLv2 to
> GPLv3 license:
>
>
> https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=5a06047f255e3c9a63828953759fd18a4ba9a3f3;hb=HEAD#l362
>
>  362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for
> stand-alone
>  363 programs. There is now also a formal CONTRIBUTING document describing
> how to
>  364 submit patches.
>
> libasm, libdw and libelf are thus covered optionally by GPLv2 license.
>
> See also Debian copyright summary for elfutils:
>
> https://tracker.debian.org/media/packages/e/elfutils/copyright-0.176-1
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/conf/licenses.conf                          |  2 +-
>  meta/files/common-licenses/Elfutils-Exception    | 12 ------------
>  meta/recipes-devtools/elfutils/elfutils_0.176.bb | 14 +++++++++++++-
>  3 files changed, 14 insertions(+), 14 deletions(-)
>  delete mode 100644 meta/files/common-licenses/Elfutils-Exception
>
> v1:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281124.html
>
> v2:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281127.html
>  * removed Elfutils-Exception
>
> v3:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281137.html
>  * rebase to latest master branch with elfutils 0.176
>
> v4:
>  * fixed typo in comment; GPLv3+ -> LGPLv3+
>  * update commit message Debian copyright URL to same 0.176 version
>
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 1058084..7b01c57 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0
> CC-BY-SA-2.5 CC-BY-SA-3.0
>  SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B
> CECILL-C"
>  SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
>  SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0
> EFL-2.0"
> -SRC_DISTRIBUTE_LICENSES += "Elfutils-Exception Entessa EPL-1.0 EPL-2.0
> ErlPL-1.1"
> +SRC_DISTRIBUTE_LICENSES += "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
>  SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair
> Frameworx-1.0"
>  SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
>  SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
> diff --git a/meta/files/common-licenses/Elfutils-Exception
> b/meta/files/common-licenses/Elfutils-Exception
> deleted file mode 100644
> index 627d769..0000000
> --- a/meta/files/common-licenses/Elfutils-Exception
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -   This file describes the limits of the Exception under which you are
> allowed
> -   to distribute Non-GPL Code in linked combination with Red Hat elfutils.
> -   For the full text of the license, please see one of the header files
> -   included with the source distribution or the file COPYING found in the
> -   top level directory of the source.
> -
> -   The Approved Interfaces are the functions declared in the files:
> -
> -   libelf.h
> -   libdw.h
> -   libdwfl.h
> -
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> index fd901c9..4602544 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Utilities and libraries for handling compiled object files"
>  HOMEPAGE = "https://sourceware.org/elfutils"
>  SECTION = "base"
> -LICENSE = "(GPLv3 & Elfutils-Exception)"
> +LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  DEPENDS = "libtool bzip2 zlib virtual/libintl"
>  DEPENDS_append_libc-musl = " argp-standalone fts "
> @@ -53,6 +53,18 @@ BBCLASSEXTEND = "native nativesdk"
>
>  # Package utilities separately
>  PACKAGES =+ "${PN}-binutils libelf libasm libdw"
> +
> +# shared libraries are licensed GPLv2 or LGPLv3+, binaries GPLv3+
> +# according to NEWS file:
> +# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for
> stand-alone
> +# programs. There is now also a formal CONTRIBUTING document describing
> how to
> +# submit patches."
> +LICENSE_${PN}-binutils = "GPLv3+"
> +LICENSE_${PN} = "GPLv3+"
> +LICENSE_libelf = "GPLv2 | LGPLv3+"
> +LICENSE_libasm = "GPLv2 | LGPLv3+"
> +LICENSE_libdw = "GPLv2 | LGPLv3+"
> +
>  FILES_${PN}-binutils = "\
>      ${bindir}/eu-addr2line \
>      ${bindir}/eu-ld \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000049c04c0588eaf7a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Can we =
restore meta/files/common-licenses/Elfutils-<span class=3D"gmail-il">Except=
ion in oe-core to be used by meta-gplv2 version:</span><div><span class=3D"=
gmail-il"><br></span></div><div><span class=3D"gmail-il">recipes-devtools/e=
lfutils/elfutils_0.148.bb:LICENSE =3D &quot;(GPL-2+ &amp; Elfutils-Exceptio=
n)&quot;<br></span></div><div><span class=3D"gmail-il">causing:</span></div=
><div><span class=3D"gmail-il">do_rootfs: The license listed Elfutils-Excep=
tion was not in the licenses collected for recipe elfutils<br></span></div>=
<div><span class=3D"gmail-il"><br></span></div><div><span class=3D"gmail-il=
">or should I send patch for meta-gplv2 to restore it there together with a=
nother=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;?</span></div=
></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Apr 11, 2019 at 6:01 PM Mikko Rapeli &lt;<a href=
=3D"mailto:mikko.rapeli@bmw.de">mikko.rapeli@bmw.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Elfutils-Exception no lo=
nger exists after upstream release 0.154<br>
and commit:<br>
<br>
commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2<br>
Author: Mark Wielaard &lt;<a href=3D"mailto:mjw@redhat.com" target=3D"_blan=
k">mjw@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Jun 5 17:15:16 2012 +0200<br>
<br>
NEWS file in the sources says this about switch from GPLv2 to<br>
GPLv3 license:<br>
<br>
<a href=3D"https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3DNEWS;h=
=3D5a06047f255e3c9a63828953759fd18a4ba9a3f3;hb=3DHEAD#l362" rel=3D"noreferr=
er" target=3D"_blank">https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob=
;f=3DNEWS;h=3D5a06047f255e3c9a63828953759fd18a4ba9a3f3;hb=3DHEAD#l362</a><b=
r>
<br>
=C2=A0362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for=
 stand-alone<br>
=C2=A0363 programs. There is now also a formal CONTRIBUTING document descri=
bing how to<br>
=C2=A0364 submit patches.<br>
<br>
libasm, libdw and libelf are thus covered optionally by GPLv2 license.<br>
<br>
See also Debian copyright summary for elfutils:<br>
<br>
<a href=3D"https://tracker.debian.org/media/packages/e/elfutils/copyright-0=
.176-1" rel=3D"noreferrer" target=3D"_blank">https://tracker.debian.org/med=
ia/packages/e/elfutils/copyright-0.176-1</a><br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" targ=
et=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/conf/licenses.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/files/common-licenses/Elfutils-Exception=C2=A0 =C2=A0 | 12 -----=
-------<br>
=C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.176.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.176.bb</a> | 14 ++++++++++++=
+-<br>
=C2=A03 files changed, 14 insertions(+), 14 deletions(-)<br>
=C2=A0delete mode 100644 meta/files/common-licenses/Elfutils-Exception<br>
<br>
v1: <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
19-April/281124.html" rel=3D"noreferrer" target=3D"_blank">http://lists.ope=
nembedded.org/pipermail/openembedded-core/2019-April/281124.html</a><br>
<br>
v2: <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
19-April/281127.html" rel=3D"noreferrer" target=3D"_blank">http://lists.ope=
nembedded.org/pipermail/openembedded-core/2019-April/281127.html</a><br>
=C2=A0* removed Elfutils-Exception<br>
<br>
v3: <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
19-April/281137.html" rel=3D"noreferrer" target=3D"_blank">http://lists.ope=
nembedded.org/pipermail/openembedded-core/2019-April/281137.html</a><br>
=C2=A0* rebase to latest master branch with elfutils 0.176<br>
<br>
v4:<br>
=C2=A0* fixed typo in comment; GPLv3+ -&gt; LGPLv3+<br>
=C2=A0* update commit message Debian copyright URL to same 0.176 version<br=
>
<br>
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf<br>
index 1058084..7b01c57 100644<br>
--- a/meta/conf/licenses.conf<br>
+++ b/meta/conf/licenses.conf<br>
@@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES +=3D &quot;CC-BY-SA-1.0 CC-BY-SA-=
2.0 CC-BY-SA-2.5 CC-BY-SA-3.0<br>
=C2=A0SRC_DISTRIBUTE_LICENSES +=3D &quot;CDDL-1.0 CECILL-1.0 CECILL-2.0 CEC=
ILL-B CECILL-C&quot;<br>
=C2=A0SRC_DISTRIBUTE_LICENSES +=3D &quot;ClArtistic CPAL-1.0 CPL-1.0 CUA-OP=
L-1.0 DSSSL&quot;<br>
=C2=A0SRC_DISTRIBUTE_LICENSES +=3D &quot;ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 E=
FL-1.0 EFL-2.0&quot;<br>
-SRC_DISTRIBUTE_LICENSES +=3D &quot;Elfutils-Exception Entessa EPL-1.0 EPL-=
2.0 ErlPL-1.1&quot;<br>
+SRC_DISTRIBUTE_LICENSES +=3D &quot;Entessa EPL-1.0 EPL-2.0 ErlPL-1.1&quot;=
<br>
=C2=A0SRC_DISTRIBUTE_LICENSES +=3D &quot;EUDatagrid EUPL-1.0 EUPL-1.1 Fair =
Frameworx-1.0&quot;<br>
=C2=A0SRC_DISTRIBUTE_LICENSES +=3D &quot;FreeType GFDL-1.1 GFDL-1.2 GFDL-1.=
3 GPL-1.0&quot;<br>
=C2=A0SRC_DISTRIBUTE_LICENSES +=3D &quot;GPL-2.0 GPL-2.0-with-autoconf-exce=
ption&quot;<br>
diff --git a/meta/files/common-licenses/Elfutils-Exception b/meta/files/com=
mon-licenses/Elfutils-Exception<br>
deleted file mode 100644<br>
index 627d769..0000000<br>
--- a/meta/files/common-licenses/Elfutils-Exception<br>
+++ /dev/null<br>
@@ -1,12 +0,0 @@<br>
-=C2=A0 =C2=A0This file describes the limits of the Exception under which y=
ou are allowed<br>
-=C2=A0 =C2=A0to distribute Non-GPL Code in linked combination with Red Hat=
 elfutils.<br>
-=C2=A0 =C2=A0For the full text of the license, please see one of the heade=
r files<br>
-=C2=A0 =C2=A0included with the source distribution or the file COPYING fou=
nd in the<br>
-=C2=A0 =C2=A0top level directory of the source.<br>
-<br>
-=C2=A0 =C2=A0The Approved Interfaces are the functions declared in the fil=
es:<br>
-<br>
-=C2=A0 =C2=A0libelf.h<br>
-=C2=A0 =C2=A0libdw.h<br>
-=C2=A0 =C2=A0libdwfl.h<br>
-<br>
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.17=
6.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.176.bb</a> b/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.176.bb" rel=3D"noreferr=
er" target=3D"_blank">elfutils_0.176.bb</a><br>
index fd901c9..4602544 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.176.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.176.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.176.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.176.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Utilities and libraries for handling compiled objec=
t files&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://sourceware.org/elfutils" rel=3D=
"noreferrer" target=3D"_blank">https://sourceware.org/elfutils</a>&quot;<br=
>
=C2=A0SECTION =3D &quot;base&quot;<br>
-LICENSE =3D &quot;(GPLv3 &amp; Elfutils-Exception)&quot;<br>
+LICENSE =3D &quot;GPLv2 &amp; LGPLv3+ &amp; GPLv3+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
=C2=A0DEPENDS =3D &quot;libtool bzip2 zlib virtual/libintl&quot;<br>
=C2=A0DEPENDS_append_libc-musl =3D &quot; argp-standalone fts &quot;<br>
@@ -53,6 +53,18 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0# Package utilities separately<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-binutils libelf libasm libdw&quot;<br>
+<br>
+# shared libraries are licensed GPLv2 or LGPLv3+, binaries GPLv3+<br>
+# according to NEWS file:<br>
+# &quot;The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for =
stand-alone<br>
+# programs. There is now also a formal CONTRIBUTING document describing ho=
w to<br>
+# submit patches.&quot;<br>
+LICENSE_${PN}-binutils =3D &quot;GPLv3+&quot;<br>
+LICENSE_${PN} =3D &quot;GPLv3+&quot;<br>
+LICENSE_libelf =3D &quot;GPLv2 | LGPLv3+&quot;<br>
+LICENSE_libasm =3D &quot;GPLv2 | LGPLv3+&quot;<br>
+LICENSE_libdw =3D &quot;GPLv2 | LGPLv3+&quot;<br>
+<br>
=C2=A0FILES_${PN}-binutils =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/eu-addr2line \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/eu-ld \<br>
-- <br>
1.9.1<br>
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

--00000000000049c04c0588eaf7a9--
