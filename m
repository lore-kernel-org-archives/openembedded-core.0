Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 837726D181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 22:42:21 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id aq17so307360iec.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 15:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Odb2N7csQq8a98VHc7y/bm+8EbdUbabTg/AdSSGLv/4=;
	b=oWcJ93svO/0tSRYMffu2GlHtIiJa4+lfUYxvjaNWpRcWGtx9WnGqIJs2Dp31m3i+vZ
	dNBjBnfttGcKRs0kLfAm/SUFz+jdb9fxcXQbOhYJWN4r55603lFomhesRW2bgUVMh8+E
	V5B09tqAA1WfAzfML4gqyajSAchf3+6wIDCQYmE9G5ns3l7Rs+aQ4cAzZv8QLhl8gMHP
	iBmNSfduPgkj925fvv43GXnwOTS5tGpJc6Z2sdrhibVkvGg4uhBohamybrqf/p9vvL7l
	r8eENC3xk+OWCkqJ8QPAZHpCGiU9y7muljmNvMTesLYLz21AzD4bLI417xe92GqP0R7V
	Q+0g==
MIME-Version: 1.0
X-Received: by 10.50.61.179 with SMTP id q19mr11056810igr.33.1382395343254;
	Mon, 21 Oct 2013 15:42:23 -0700 (PDT)
Received: by 10.50.5.225 with HTTP; Mon, 21 Oct 2013 15:42:23 -0700 (PDT)
In-Reply-To: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
References: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
Date: Mon, 21 Oct 2013 15:42:23 -0700
Message-ID: <CAMKF1sqpTK+vypxO-2vrHvf34mqfDdF8AK2sgybnd62WtXvn1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: "patches@linaro.org" <patches@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] ltp: cleanup recipe
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
X-List-Received-Date: Mon, 21 Oct 2013 22:42:22 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109e5fd1d604e947ffd1

--047d7bdc109e5fd1d604e947ffd1
Content-Type: text/plain; charset=UTF-8

On Monday, October 21, 2013, Riku Voipio <riku.voipio@linaro.org> wrote:
> Cleanups for ltp:
>
> 1. Instead of using giturl like in Anders's patch use the sourceforge
mirror URL.

whats wrong with git url ?

> 2. remove to the manual unpack rule and just set S variable to source
directory.
> 3. Follow the OE style guide for variable order.
> ---
>  meta/recipes-extended/ltp/ltp_20130904.bb | 50
+++++++++++++------------------
>  1 file changed, 21 insertions(+), 29 deletions(-)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20130904.bbb/meta/recipes-extended/ltp/
ltp_20130904.bb
> index 5e10448..43fe780 100644
> --- a/meta/recipes-extended/ltp/ltp_20130904.bb
> +++ b/meta/recipes-extended/ltp/ltp_20130904.bb
> @@ -21,44 +21,21 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>  DEPENDS = "attr libaio libcap acl openssl"
>
> -SRC_URI = "git://github.com/linux-test-project/ltp.git"
> +SRC_URI =
"${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2
\
> +           "
>
> -SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
> -S = "${WORKDIR}/git"
> +SRC_URI[md5sum] = "0cf2ccb7199f8318d413c62a085629f0"
> +SRC_URI[sha256sum] =
"662c3661a4d1bfbf3187d0835f35e613b43eedc35a840e3283e378a19606ee0b"
>
>  export prefix = "/opt/ltp"
>  export exec_prefix = "/opt/ltp"
>
>  inherit autotools
>
> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
> -
> -FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
> -FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
> -FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
> -FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
> -
> -FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
> -
> -FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/*
/opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*
/opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/*
/opt/ltp/testcases/open_posix_testsuite/conformance/*
/opt/ltp/testcases/open_posix_testsuite/Documentation/*
/opt/ltp/testcases/open_posix_testsuite/functional/*
/opt/ltp/testcases/open_posix_testsuite/include/*
/opt/ltp/testcases/open_posix_testsuite/scripts/*
/opt/ltp/testcases/open_posix_testsuite/stress/*
/opt/ltp/testcases/open_posix_testsuite/tools/*"
> +S = "${WORKDIR}/ltp-full-${PV}"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
>
> -do_unpack_append() {
> -    bb.build.exec_func('do_extract_tarball', d)
> -}
> -
> -do_extract_tarball() {
> -       if test -f ${WORKDIR}/ltp-full-${PV} ; then
> -           tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C
${WORKDIR}
> -           rm -rf ${WORKDIR}/ltp-${PV}
> -           mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
> -       fi
> -}
> -
>  do_install(){
>         install -d ${D}/opt/ltp/
>         oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> @@ -66,10 +43,25 @@ do_install(){
>         # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>         cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>
> -       # We need to remove all scripts which depend on /usr/bin/expect,
since expect is not supported in poky
> +       # We need to remove all scripts which depend on /usr/bin/expect,
since expect is not supported in oe-core
>         # We will add expect for enhancement in future
>         find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" |
awk -F":" '{print $1}' | xargs rm -f
>  }
>
> +FILES_${PN}-dbg += "/opt/ltp/runtest/.debug \
> +                    /opt/ltp/testcases/bin/.debug \
> +                    /opt/ltp/testcases/bin/*/bin/.debug \
> +                    /opt/ltp/testcases/bin/*/test/.debug \
> +                    /opt/ltp/scenario_groups/.debug \
> +                    /opt/ltp/testscripts/.debug \
> +                    /opt/ltp/testscripts/open_posix_testsuite/.debug \
> +                    "
> +
> +FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
> +
> +FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/*
/opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*
/opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/*
/opt/ltp/testcases/open_posix_testsuite/conformance/*
/opt/ltp/testcases/open_posix_testsuite/Documentation/*
/opt/ltp/testcases/open_posix_testsuite/functional/*
/opt/ltp/testcases/open_posix_testsuite/include/*
/opt/ltp/testcases/open_posix_testsuite/scripts/*
/opt/ltp/testcases/open_posix_testsuite/stress/*
/opt/ltp/testcases/open_posix_testsuite/tools/*"
> +
> +RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
> +
>  # Avoid generated binaries stripping. Otherwise some of the ltp tests
such as ldd01 & nm01 fails
>  INHIBIT_PACKAGE_STRIP = "1"
> --
> 1.8.3.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bdc109e5fd1d604e947ffd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 21, 2013, Riku Voipio &lt;<a href=3D"mailto:riku=
.voipio@linaro.org">riku.voipio@linaro.org</a>&gt; wrote:<br>&gt; Cleanups =
for ltp:<br>&gt;<br>&gt; 1. Instead of using giturl like in Anders&#39;s pa=
tch use the sourceforge mirror URL.<br>
<br>whats wrong with git url ?<br><br>&gt; 2. remove to the manual unpack r=
ule and just set S variable to source directory.<br>&gt; 3. Follow the OE s=
tyle guide for variable order.<br>&gt; ---<br>&gt; =C2=A0meta/recipes-exten=
ded/ltp/<a href=3D"http://ltp_20130904.bb">ltp_20130904.bb</a> | 50 +++++++=
++++++------------------<br>
&gt; =C2=A01 file changed, 21 insertions(+), 29 deletions(-)<br>&gt;<br>&gt=
; diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20130904.bb"=
>ltp_20130904.bb</a> b/meta/recipes-extended/ltp/<a href=3D"http://ltp_2013=
0904.bb">ltp_20130904.bb</a><br>
&gt; index 5e10448..43fe780 100644<br>&gt; --- a/meta/recipes-extended/ltp/=
<a href=3D"http://ltp_20130904.bb">ltp_20130904.bb</a><br>&gt; +++ b/meta/r=
ecipes-extended/ltp/<a href=3D"http://ltp_20130904.bb">ltp_20130904.bb</a><=
br>
&gt; @@ -21,44 +21,21 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D06=
36e73ff0215e8d672dc4c32c317bb3 \<br>&gt;<br>&gt; =C2=A0DEPENDS =3D &quot;at=
tr libaio libcap acl openssl&quot;<br>&gt;<br>&gt; -SRC_URI =3D &quot;git:/=
/<a href=3D"http://github.com/linux-test-project/ltp.git">github.com/linux-=
test-project/ltp.git</a>&quot;<br>
&gt; +SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-=
${PV}/ltp-full-${PV}.tar.bz2 \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;<br>&gt;<br>&gt; -SRCREV =3D &quot;a8c42db5f9314211811c36275a21f8390=
2830dc5&quot;<br>&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;0cf2ccb7199f8318d413c62a085629f0&quot;<br>&=
gt; +SRC_URI[sha256sum] =3D &quot;662c3661a4d1bfbf3187d0835f35e613b43eedc35=
a840e3283e378a19606ee0b&quot;<br>&gt;<br>&gt; =C2=A0export prefix =3D &quot=
;/opt/ltp&quot;<br>
&gt; =C2=A0export exec_prefix =3D &quot;/opt/ltp&quot;<br>&gt;<br>&gt; =C2=
=A0inherit autotools<br>&gt;<br>&gt; -RDEPENDS_${PN} =3D &quot;perl e2fspro=
gs-mke2fs&quot;<br>&gt; -<br>&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/runt=
est/.debug&quot;<br>
&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testcases/bin/.debug&quot;<br>&gt=
; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testcases/bin/*/bin/.debug&quot;<br>=
&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testcases/bin/*/test/.debug&quot;=
<br>
&gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/scenario_groups/.debug&quot;<br>&=
gt; -FILES_${PN}-dbg +=3D &quot;/opt/ltp/testscripts/.debug&quot;<br>&gt; -=
FILES_${PN}-dbg +=3D &quot;/opt/ltp/testscripts/open_posix_testsuite/.debug=
&quot;<br>
&gt; -<br>&gt; -FILES_${PN}-staticdev +=3D &quot;/opt/ltp/lib/libmem.a&quot=
;<br>&gt; -<br>&gt; -FILES_${PN} +=3D &quot;/opt/ltp/* /opt/ltp/runtest/* /=
opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*=
/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /op=
t/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_=
posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/fun=
ctional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testca=
ses/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/=
stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/ltp-full-${PV}&quot;<br>&gt;<br>&gt; =C2=A0TAR=
GET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>&gt;<br>&gt; -do_unpack_append()=
 {<br>&gt; - =C2=A0 =C2=A0bb.build.exec_func(&#39;do_extract_tarball&#39;, =
d)<br>&gt; -}<br>
&gt; -<br>&gt; -do_extract_tarball() {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 if te=
st -f ${WORKDIR}/ltp-full-${PV} ; then<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}=
<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${WORKDIR}/ltp-${PV}<b=
r>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${WORKDIR}/ltp-full-${PV} ${WO=
RKDIR}/ltp-${PV}<br>&gt; - =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; -}<br>&gt; -<br>=
&gt; =C2=A0do_install(){<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D=
}/opt/ltp/<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D${D} SK=
IP_IDCHECK=3D1 install<br>
&gt; @@ -66,10 +43,25 @@ do_install(){<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cp -r testcases/open_posix_testsuite ${D}/opt/ltp/=
testcases<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 # We need to remove all sc=
ripts which depend on /usr/bin/expect, since expect is not supported in pok=
y<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 # We need to remove all scripts which depend on=
 /usr/bin/expect, since expect is not supported in oe-core<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # We will add expect for enhancement in future<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${D} -type f -print | xargs grep &quot;\!=
.*\/usr\/bin\/expect&quot; | awk -F&quot;:&quot; &#39;{print $1}&#39; | xar=
gs rm -f<br>
&gt; =C2=A0}<br>&gt;<br>&gt; +FILES_${PN}-dbg +=3D &quot;/opt/ltp/runtest/.=
debug \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/opt/ltp/testcases/bin/.debug \<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/opt/ltp/testcases/bin/*/b=
in/.debug \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/opt/ltp/testcases/bin/*/test/.debug \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/opt/ltp/scenario_groups/.debug \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/opt/ltp/testscripts/.debug \<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/opt/ltp/testscripts/open_posix_testsuite/.debug \<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>&gt; +FILES_${PN}-staticdev +=3D &quot;/opt/ltp/lib/libmem.a&quot=
;<br>&gt; +<br>&gt; +FILES_${PN} +=3D &quot;/opt/ltp/* /opt/ltp/runtest/* /=
opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*=
/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /op=
t/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_=
posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/fun=
ctional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testca=
ses/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/=
stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*&quot;<br>
&gt; +<br>&gt; +RDEPENDS_${PN} =3D &quot;perl e2fsprogs-mke2fs&quot;<br>&gt=
; +<br>&gt; =C2=A0# Avoid generated binaries stripping. Otherwise some of t=
he ltp tests such as ldd01 &amp; nm01 fails<br>&gt; =C2=A0INHIBIT_PACKAGE_S=
TRIP =3D &quot;1&quot;<br>
&gt; --<br>&gt; 1.8.3.1<br>&gt;<br>&gt; ___________________________________=
____________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mail=
to:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openem=
bedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>&gt;

--047d7bdc109e5fd1d604e947ffd1--
