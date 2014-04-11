Return-Path: <kazuya.nisimura@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id C2EB165E4F
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 04:01:03 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so5378899qcx.38
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 21:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/G/HKgxdwoWQNBDcNIgmXWAfrG3lo/TvafCookC/gEg=;
	b=wcZjZ3cMWO7Arg/FFgty4O5LDVpbRLLvTcO5RFfN+IuPZMOZ9Uo9qPnGfqGyXjGsqi
	YP/NNcd1o5JnHJRvKRu0R/cjkjL2VFMwRHNjC3/1hu601NqSnNEzmnFk2I8f7nT1cW8U
	uFu94czm/uuKI1O6nvxXdR8dBnbat7IkBIaiNkiG3YFEZo+a9Hod4AKTttHMUFIx9/wd
	KJ4vCs3hAIDoTrpjSMUweYbWgf3dop8PPcfTjUh12xZPvArc77cU6rHwEJKJc3dB3eH+
	GZ8F27Mqvs7YInLbWfarwsB8uIB1qzsZVlsRt0kq5nHD+K/7AkWeFvZ0bOn7c5zNuSE/
	hZeQ==
MIME-Version: 1.0
X-Received: by 10.140.51.14 with SMTP id t14mr23939511qga.50.1397188864525;
	Thu, 10 Apr 2014 21:01:04 -0700 (PDT)
Received: by 10.96.148.194 with HTTP; Thu, 10 Apr 2014 21:01:04 -0700 (PDT)
Date: Fri, 11 Apr 2014 13:01:04 +0900
Message-ID: <CA+o05TyiR6EEpkbE0DJ6hKVQzFBwByarYfuB47+rVL+M5fmcRg@mail.gmail.com>
From: Kazuya Nishimura <kazuya.nisimura@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: [yocto] [meta-linaro][PATCH] external-linaro-toolchain: Fix for 32bit armhf build
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
X-List-Received-Date: Fri, 11 Apr 2014 04:01:07 -0000
Content-Type: multipart/alternative; boundary=001a1135343ef44c0404f6bc611e

--001a1135343ef44c0404f6bc611e
Content-Type: text/plain; charset=ISO-8859-1

Hi list,

I'm forwarding this patch to oe-core list.
Thank you, Khem, for guiding me.

Kaz

---------- Forwarded message ----------
From: Kazuya Nishimura <kazuya.nisimura@gmail.com>
Date: 2014-04-11 12:11 GMT+09:00
Subject: Re: [yocto] [meta-linaro][PATCH] external-linaro-toolchain: Fix
for 32bit armhf build
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>


Hi Khem,

> why is chown needed here ?
It is copied from original implementation.
Please check do_install() in meta/recipes-core/eglibc/eglibc-locale.inc

> secondly, this piece should go into OE-Core
maybe.

Best regards,
Kaz


2014-04-11 3:36 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

On Thu, Apr 10, 2014 at 12:49 AM, Kazuya Nishimura
> <kazuya.nisimura@gmail.com> wrote:
> > From: Kazuya Nishimura <kazuya.nisimura@gmail.com>
> >
> > Use ld-linux-armhf.so.3 if call convention hard.
> > Fix QA issue errors by packaging approprieately.
> > Add eglibc-locale_2.19.bbappend to fix QA issue error.
> >   An empty directory is created while do_install.
> >
> > Signed-off-by: Kazuya Nishimura <kazuya.nisimura@gmail.com>
> > ---
> >  .../conf/distro/include/tcmode-external-linaro.inc |    1 +
> >  .../eglibc/eglibc-locale_2.19.bbappend             |   23 ++++++++++++
> >  .../external-linaro-toolchain.bb                   |   38
> > ++++++++++++++++----
> >  3 files changed, 56 insertions(+), 6 deletions(-)
> >  create mode 100755
> > meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappend
> >
> > diff --git
> > a/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro.inc
> > b/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro.inc
> > index 1d9fd59..26d464c 100644
> > ---
> a/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro.inc
> > +++
> b/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro.inc
> > @@ -41,6 +41,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace
> > libc-big-macros libc-bsd libc-c
> >   libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big \
> >   libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug
> libc-spawn
> > libc-streams libc-sunrpc \
> >   libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar
> libc-posix-regexp
> > libc-posix-regexp-glibc \
> > + libc-charsets libc-locales libc-locale-code \
> >   libc-posix-wchar-io"
> >
> >  ENABLE_BINARY_LOCALE_GENERATION = "0"
> > diff --git
> > a/meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappend
> > b/meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappend
> > new file mode 100755
> > index 0000000..3e91e74
> > --- /dev/null
> > +++
> b/meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappend
> > @@ -0,0 +1,23 @@
> > +do_install () {
> > + mkdir -p ${D}${datadir}
> > + if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > + mkdir -p ${D}${bindir}
> > + cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > + fi
> > + if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > + mkdir -p ${D}${localedir}
> > + cp -fpPR ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > + fi
> > + if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > + mkdir -p ${D}${libdir}
> > + cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > + fi
> > + if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > + cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > + fi
> > + if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > + cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > + fi
> > + chown root.root -R ${D}
> > + cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > +}
>
> why is chown needed here ?
> secondly, this piece should go into OE-Core
>
> > diff --git
> > a/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/
> external-linaro-toolchain.bb
> > b/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/
> external-linaro-toolchain.bb
> > index 240d550..47fd4ca 100644
> > ---
> > a/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/
> external-linaro-toolchain.bb
> > +++
> > b/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/
> external-linaro-toolchain.bb
> > @@ -41,6 +41,12 @@ PROVIDES += "\
> >   libitm \
> >   libitm-dev \
> >   libitm-staticdev \
> > + libasan \
> > + libasan-dev \
> > + libasan-staticdev \
> > + libatomic \
> > + libatomic-dev \
> > + libatomic-staticdev \
> >   virtual/linux-libc-headers \
> >  "
> >
> > @@ -50,12 +56,11 @@ PR = "r2"
> >  # https://launchpad.net/linaro-toolchain-binaries
> >  SRC_URI = "file://SUPPORTED"
> >
> > +LDLINUX32 = "${@base_contains("TUNE_FEATURES", "callconvention-hard",
> > "ld-linux-armhf.so.3", "ld-linux.so.3",d)}"
> > +
> >  do_install() {
> >   install -d ${D}${base_libdir}
> > - install -d ${D}${bindir}
> > - install -d ${D}${sbindir}
> >   install -d ${D}${libdir}
> > - install -d ${D}${libexecdir}
> >   install -d ${D}${datadir}
> >   install -d ${D}${includedir}
> >
> > @@ -79,7 +84,7 @@ do_install() {
> >   fi
> >
> >   # fix up the copied symlinks (they are still pointing to the multiarch
> > directory)
> > - linker_name="${@base_contains("TUNE_FEATURES", "aarch64",
> > "ld-linux-aarch64.so.1", "ld-linux.so.3",d)}"
> > + linker_name="${@base_contains("TUNE_FEATURES", "aarch64",
> > "ld-linux-aarch64.so.1", "${LDLINUX32}",d)}"
> >   ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> >   ln -sf ../../lib/libnsl.so.1 ${D}${libdir}/libnsl.so
> >   ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
> > @@ -144,6 +149,12 @@ PACKAGES =+ "\
> >   libitm \
> >   libitm-dev \
> >   libitm-staticdev \
> > + libasan \
> > + libasan-dev \
> > + libasan-staticdev \
> > + libatomic \
> > + libatomic-dev \
> > + libatomic-staticdev \
> >  "
> >
> >  INSANE_SKIP_${PN}-dbg = "staticdev"
> > @@ -282,14 +293,16 @@ FILES_libssp-staticdev = " \
> >
> >  FILES_libgfortran = "${base_libdir}/libgfortran.so.*"
> >  FILES_libgfortran-dev = " \
> > -  ${base_libdir}/libgfortran.so"
> > +  ${base_libdir}/libgfortran.so \
> > +  ${base_libdir}/libgfortran.spec"
> >  FILES_libgfortran-staticdev = " \
> >    ${base_libdir}/libgfortran.a \
> >    ${base_libdir}/libgfortranbegin.a"
> >
> >  FILES_libmudflap = "${base_libdir}/libmudflap*.so.*"
> >  FILES_libmudflap-dev = "\
> > -  ${base_libdir}/libmudflap*.so \
> > +  ${base_libdir}/libmudflap*.so"
> > +FILES_libmudflap-staticdev = "\
> >    ${base_libdir}/libmudflap*.a \
> >    ${base_libdir}/libmudflap*.la"
> >
> > @@ -313,6 +326,19 @@ FILES_libgomp-dev = "\
> >  FILES_libgomp-staticdev = "\
> >    ${base_libdir}/libgomp*.a \
> >    "
> > +
> > +FILES_libasan = "\
> > +  ${base_libdir}/libasan.so.* \
> > +  "
> > +FILES_libasan-dev = "\
> > +  ${base_libdir}/libasan.so \
> > +  "
> > +FILES_libatomic ="\
> > +  ${base_libdir}/libatomic.so.* \
> > +  "
> > +FILES_libatomic-dev = "\
> > +  ${base_libdir}/libatomic.so \
> > +  "
> >  ELT_VER_MAIN ??= ""
> >
> >  python () {
> > --
> > 1.7.9.5
> >
> >
> > --
> > _______________________________________________
> > yocto mailing list
> > yocto@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/yocto
> >
>

--001a1135343ef44c0404f6bc611e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi list,</div><div><br></div><div>I&#39;m forwarding =
this patch to oe-core list.</div><div>Thank you, Khem, for guiding me.</div=
><div><br></div><div>Kaz</div><br><div class=3D"gmail_quote">---------- For=
warded message ----------<br>
From: <b class=3D"gmail_sendername">Kazuya Nishimura</b> <span dir=3D"ltr">=
&lt;<a href=3D"mailto:kazuya.nisimura@gmail.com">kazuya.nisimura@gmail.com<=
/a>&gt;</span><br>Date: 2014-04-11 12:11 GMT+09:00<br>Subject: Re: [yocto] =
[meta-linaro][PATCH] external-linaro-toolchain: Fix for 32bit armhf build<b=
r>
To: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt;<br>Cc: &quot;<a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctopr=
oject.org</a>&quot; &lt;<a href=3D"mailto:yocto@yoctoproject.org">yocto@yoc=
toproject.org</a>&gt;<br>
<br><br><div dir=3D"ltr">Hi Khem,<div class=3D""><div><br></div><div><span =
style=3D"font-family:arial,sans-serif;font-size:14px">&gt; why is chown nee=
ded here ?</span><br></div></div><div><span style=3D"font-family:arial,sans=
-serif;font-size:14px">It is copied from original implementation.</span></d=
iv>

<div><font face=3D"arial, sans-serif"><span style=3D"font-size:14px">Please=
 check do_install() in meta/recipes-core/eglibc/eglibc-locale.inc</span></f=
ont></div><div class=3D""><div><font face=3D"arial, sans-serif"><span style=
=3D"font-size:14px"><br>

</span></font></div><div><font face=3D"arial, sans-serif"><span style=3D"fo=
nt-size:14px">&gt;=A0</span></font><span style=3D"font-family:arial,sans-se=
rif;font-size:14px">secondly, this piece should go into OE-Core</span></div=
></div>
<div>
<span style=3D"font-family:arial,sans-serif;font-size:14px">maybe.=A0</span=
></div><div><span style=3D"font-family:arial,sans-serif;font-size:14px"><br=
></span></div><div><span style=3D"font-family:arial,sans-serif;font-size:14=
px">Best regards,</span></div>

<div><span style=3D"font-family:arial,sans-serif;font-size:14px">Kaz</span>=
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2=
014-04-11 3:36 GMT+09:00 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>:<div=
>
<div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>On Thu, Apr 10, 2014 at 12:49 AM, =
Kazuya Nishimura<br>
&lt;<a href=3D"mailto:kazuya.nisimura@gmail.com" target=3D"_blank">kazuya.n=
isimura@gmail.com</a>&gt; wrote:<br>
&gt; From: Kazuya Nishimura &lt;<a href=3D"mailto:kazuya.nisimura@gmail.com=
" target=3D"_blank">kazuya.nisimura@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Use ld-linux-armhf.so.3 if call convention hard.<br>
&gt; Fix QA issue errors by packaging approprieately.<br>
&gt; Add eglibc-locale_2.19.bbappend to fix QA issue error.<br>
&gt; =A0 An empty directory is created while do_install.<br>
&gt;<br>
&gt; Signed-off-by: Kazuya Nishimura &lt;<a href=3D"mailto:kazuya.nisimura@=
gmail.com" target=3D"_blank">kazuya.nisimura@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../conf/distro/include/tcmode-external-linaro.inc | =A0 =A01 +<br>
&gt; =A0.../eglibc/eglibc-locale_2.19.bbappend =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 23 ++++++++++++<br>
&gt; =A0.../<a href=3D"http://external-linaro-toolchain.bb" target=3D"_blan=
k">external-linaro-toolchain.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 38<br>
&gt; ++++++++++++++++----<br>
&gt; =A03 files changed, 56 insertions(+), 6 deletions(-)<br>
&gt; =A0create mode 100755<br>
&gt; meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappend<=
br>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro.inc=
<br>
&gt; b/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro.inc=
<br>
&gt; index 1d9fd59..26d464c 100644<br>
&gt; --- a/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro=
.inc<br>
&gt; +++ b/meta-linaro-toolchain/conf/distro/include/tcmode-external-linaro=
.inc<br>
&gt; @@ -41,6 +41,7 @@ DISTRO_FEATURES_LIBC =3D &quot;ipv4 ipv6 libc-backtr=
ace<br>
&gt; libc-big-macros libc-bsd libc-c<br>
&gt; =A0 libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big \<br>
&gt; =A0 libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug lib=
c-spawn<br>
&gt; libc-streams libc-sunrpc \<br>
&gt; =A0 libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posi=
x-regexp<br>
&gt; libc-posix-regexp-glibc \<br>
&gt; + libc-charsets libc-locales libc-locale-code \<br>
&gt; =A0 libc-posix-wchar-io&quot;<br>
&gt;<br>
&gt; =A0ENABLE_BINARY_LOCALE_GENERATION =3D &quot;0&quot;<br>
&gt; diff --git<br>
&gt; a/meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappen=
d<br>
&gt; b/meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bbappen=
d<br>
&gt; new file mode 100755<br>
&gt; index 0000000..3e91e74<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-linaro-toolchain/recipes-core/eglibc/eglibc-locale_2.19.bba=
ppend<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +do_install () {<br>
&gt; + mkdir -p ${D}${datadir}<br>
&gt; + if [ -n &quot;$(ls ${LOCALETREESRC}/${bindir})&quot; ]; then<br>
&gt; + mkdir -p ${D}${bindir}<br>
&gt; + cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}<br>
&gt; + fi<br>
&gt; + if [ -n &quot;$(ls ${LOCALETREESRC}/${localedir})&quot; ]; then<br>
&gt; + mkdir -p ${D}${localedir}<br>
&gt; + cp -fpPR ${LOCALETREESRC}/${localedir}/* ${D}${localedir}<br>
&gt; + fi<br>
&gt; + if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then<br>
&gt; + mkdir -p ${D}${libdir}<br>
&gt; + cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}<br>
&gt; + fi<br>
&gt; + if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then<br>
&gt; + cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}<br>
&gt; + fi<br>
&gt; + if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then<br>
&gt; + cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}<br>
&gt; + fi<br>
&gt; + chown root.root -R ${D}<br>
&gt; + cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}<br>
&gt; +}<br>
<br>
</div></div>why is chown needed here ?<br>
secondly, this piece should go into OE-Core<br>
<div><div><br>
&gt; diff --git<br>
&gt; a/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/<a =
href=3D"http://external-linaro-toolchain.bb" target=3D"_blank">external-lin=
aro-toolchain.bb</a><br>
&gt; b/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/<a =
href=3D"http://external-linaro-toolchain.bb" target=3D"_blank">external-lin=
aro-toolchain.bb</a><br>
&gt; index 240d550..47fd4ca 100644<br>
&gt; ---<br>
&gt; a/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/<a =
href=3D"http://external-linaro-toolchain.bb" target=3D"_blank">external-lin=
aro-toolchain.bb</a><br>
&gt; +++<br>
&gt; b/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/<a =
href=3D"http://external-linaro-toolchain.bb" target=3D"_blank">external-lin=
aro-toolchain.bb</a><br>
&gt; @@ -41,6 +41,12 @@ PROVIDES +=3D &quot;\<br>
&gt; =A0 libitm \<br>
&gt; =A0 libitm-dev \<br>
&gt; =A0 libitm-staticdev \<br>
&gt; + libasan \<br>
&gt; + libasan-dev \<br>
&gt; + libasan-staticdev \<br>
&gt; + libatomic \<br>
&gt; + libatomic-dev \<br>
&gt; + libatomic-staticdev \<br>
&gt; =A0 virtual/linux-libc-headers \<br>
&gt; =A0&quot;<br>
&gt;<br>
&gt; @@ -50,12 +56,11 @@ PR =3D &quot;r2&quot;<br>
&gt; =A0# <a href=3D"https://launchpad.net/linaro-toolchain-binaries" targe=
t=3D"_blank">https://launchpad.net/linaro-toolchain-binaries</a><br>
&gt; =A0SRC_URI =3D &quot;file://SUPPORTED&quot;<br>
&gt;<br>
&gt; +LDLINUX32 =3D &quot;${@base_contains(&quot;TUNE_FEATURES&quot;, &quot=
;callconvention-hard&quot;,<br>
&gt; &quot;ld-linux-armhf.so.3&quot;, &quot;ld-linux.so.3&quot;,d)}&quot;<b=
r>
&gt; +<br>
&gt; =A0do_install() {<br>
&gt; =A0 install -d ${D}${base_libdir}<br>
&gt; - install -d ${D}${bindir}<br>
&gt; - install -d ${D}${sbindir}<br>
&gt; =A0 install -d ${D}${libdir}<br>
&gt; - install -d ${D}${libexecdir}<br>
&gt; =A0 install -d ${D}${datadir}<br>
&gt; =A0 install -d ${D}${includedir}<br>
&gt;<br>
&gt; @@ -79,7 +84,7 @@ do_install() {<br>
&gt; =A0 fi<br>
&gt;<br>
&gt; =A0 # fix up the copied symlinks (they are still pointing to the multi=
arch<br>
&gt; directory)<br>
&gt; - linker_name=3D&quot;${@base_contains(&quot;TUNE_FEATURES&quot;, &quo=
t;aarch64&quot;,<br>
&gt; &quot;ld-linux-aarch64.so.1&quot;, &quot;ld-linux.so.3&quot;,d)}&quot;=
<br>
&gt; + linker_name=3D&quot;${@base_contains(&quot;TUNE_FEATURES&quot;, &quo=
t;aarch64&quot;,<br>
&gt; &quot;ld-linux-aarch64.so.1&quot;, &quot;${LDLINUX32}&quot;,d)}&quot;<=
br>
&gt; =A0 ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}<br>
&gt; =A0 ln -sf ../../lib/libnsl.so.1 ${D}${libdir}/libnsl.so<br>
&gt; =A0 ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so<br>
&gt; @@ -144,6 +149,12 @@ PACKAGES =3D+ &quot;\<br>
&gt; =A0 libitm \<br>
&gt; =A0 libitm-dev \<br>
&gt; =A0 libitm-staticdev \<br>
&gt; + libasan \<br>
&gt; + libasan-dev \<br>
&gt; + libasan-staticdev \<br>
&gt; + libatomic \<br>
&gt; + libatomic-dev \<br>
&gt; + libatomic-staticdev \<br>
&gt; =A0&quot;<br>
&gt;<br>
&gt; =A0INSANE_SKIP_${PN}-dbg =3D &quot;staticdev&quot;<br>
&gt; @@ -282,14 +293,16 @@ FILES_libssp-staticdev =3D &quot; \<br>
&gt;<br>
&gt; =A0FILES_libgfortran =3D &quot;${base_libdir}/libgfortran.so.*&quot;<b=
r>
&gt; =A0FILES_libgfortran-dev =3D &quot; \<br>
&gt; - =A0${base_libdir}/libgfortran.so&quot;<br>
&gt; + =A0${base_libdir}/libgfortran.so \<br>
&gt; + =A0${base_libdir}/libgfortran.spec&quot;<br>
&gt; =A0FILES_libgfortran-staticdev =3D &quot; \<br>
&gt; =A0 =A0${base_libdir}/libgfortran.a \<br>
&gt; =A0 =A0${base_libdir}/libgfortranbegin.a&quot;<br>
&gt;<br>
&gt; =A0FILES_libmudflap =3D &quot;${base_libdir}/libmudflap*.so.*&quot;<br=
>
&gt; =A0FILES_libmudflap-dev =3D &quot;\<br>
&gt; - =A0${base_libdir}/libmudflap*.so \<br>
&gt; + =A0${base_libdir}/libmudflap*.so&quot;<br>
&gt; +FILES_libmudflap-staticdev =3D &quot;\<br>
&gt; =A0 =A0${base_libdir}/libmudflap*.a \<br>
&gt; =A0 =A0${base_libdir}/libmudflap*.la&quot;<br>
&gt;<br>
&gt; @@ -313,6 +326,19 @@ FILES_libgomp-dev =3D &quot;\<br>
&gt; =A0FILES_libgomp-staticdev =3D &quot;\<br>
&gt; =A0 =A0${base_libdir}/libgomp*.a \<br>
&gt; =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_libasan =3D &quot;\<br>
&gt; + =A0${base_libdir}/libasan.so.* \<br>
&gt; + =A0&quot;<br>
&gt; +FILES_libasan-dev =3D &quot;\<br>
&gt; + =A0${base_libdir}/libasan.so \<br>
&gt; + =A0&quot;<br>
&gt; +FILES_libatomic =3D&quot;\<br>
&gt; + =A0${base_libdir}/libatomic.so.* \<br>
&gt; + =A0&quot;<br>
&gt; +FILES_libatomic-dev =3D &quot;\<br>
&gt; + =A0${base_libdir}/libatomic.so \<br>
&gt; + =A0&quot;<br>
&gt; =A0ELT_VER_MAIN ??=3D &quot;&quot;<br>
&gt;<br>
&gt; =A0python () {<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt;<br>
</div></div><span><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; yocto mailing list<br>
&gt; <a href=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yocto@yoct=
oproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/yocto" target=3D"_b=
lank">https://lists.yoctoproject.org/listinfo/yocto</a><br>
&gt;<br>
</font></span></blockquote></div></div></div><br></div>
</div><br></div>

--001a1135343ef44c0404f6bc611e--
