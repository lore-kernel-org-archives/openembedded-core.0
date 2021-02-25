Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1312.1614276787118039657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 10:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=CO4biPHi;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.167.42, mailfrom: suji.velupillai@broadcom.com)
Received: by mail-lf1-f42.google.com with SMTP id h125so9933483lfd.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KM9NVMCycaQeV+txG9btoMIVDRqoGnSGItJhGy5nX1k=;
        b=CO4biPHi9P3rVUrshA3/UeyQu9jcIinQ95taNUjILpMA763M8xzQRkZnStnvtlzxSg
         xCpOAtfiZ00kWc5HSVJPtKlRAmYrAPy+w8ijCxialR7+zlvphaz1EtHpyqDI0O2vSmNj
         WbYpAklO45tS5/u1L+tAsn07F2wSQXCMCwRiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KM9NVMCycaQeV+txG9btoMIVDRqoGnSGItJhGy5nX1k=;
        b=ObG0Dv4VKw6c4i8hFjafRLFraoSumN80UoiQy8tkvEkfe55JZrLZoy9yJyScWQtxcl
         02OySJD1MMNcgFgAAvF5QFnyDuHSgV9bdD9LqzMfRsUtDEE2D0QO9bQg6TUp2lOF62IZ
         rxmckBaZNejJgVLujf8WYIhdfz4rGEFg0uUTn64b6afQ9lqzUTN9eUUu3IsPxn4xFHBU
         5qwxz7Qi0qn5qLOQ65qW74trzPa3TkHCc1LIqDveN733Dl/1zAaWodDYI5WqKc4U9Gtr
         2ewrOISvHrdS4kO+srSm69W1nV3oUM6co5j6+tOtvq9dHutKNQFCSjEIccyFUxAtnzXE
         GjvA==
X-Gm-Message-State: AOAM531jzyOgji0NZzneU35vyERHLsU29L4aXqBgLc+S7r4bBvlHRGev
	yTorMuvUP8JzWKW3/EkOOtvGFvmwEvpIzeBATAN74Q==
X-Google-Smtp-Source: ABdhPJw998TKdGf8pjlohv8Jtt7iME1EE0DXVyup2y7DA7/uKDDq6XsotwcDPwiXuTYgXUJg/d36x8N0AmkVW0SQQmc=
X-Received: by 2002:a19:dcd:: with SMTP id 196mr2461158lfn.590.1614276785002;
 Thu, 25 Feb 2021 10:13:05 -0800 (PST)
MIME-Version: 1.0
References: <16663BAB94E51B8F.6890@lists.openembedded.org>
In-Reply-To: <16663BAB94E51B8F.6890@lists.openembedded.org>
From: "Suji Velupillai" <suji.velupillai@broadcom.com>
Date: Thu, 25 Feb 2021 10:12:53 -0800
Message-ID: <CAJHBTCAnhk=5-EbbKeMTNY7w+98Zq+FdL4uG0yjJR7T9rGN99g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ffmpeg: add ptest install for ffmpeg
To: Suji Velupillai <suji.velupillai@broadcom.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jonathan Richardson <jonathan.richardson@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>
X-Groupsio-MsgNum: 148612
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005e5be505bc2d1a81"

--0000000000005e5be505bc2d1a81
Content-Type: multipart/alternative; boundary="00000000000057305405bc2d1a9c"

--00000000000057305405bc2d1a9c
Content-Type: text/plain; charset="UTF-8"

Hello

This change got dropped from the master-next branch.
Did it break any builds? Is there anything I can do to help to get this
change accepted?

Thank you
Suji

On Mon, Feb 22, 2021 at 5:18 PM Suji Velupillai via lists.openembedded.org
<suji.velupillai=broadcom.com@lists.openembedded.org> wrote:

> From: Suji Velupillai <suji.velupillai@broadcom.com>
>
> [YOCTO #5605] Add ptest for ffmpeg
>
> ffmpeg fate test requires full source code and copy of test suite
> data to run the full test. Test data is over 1GB thus cannot be
> included within Yocto. But it can be mounted on the target during
> the test or fate test can run limited tests without test suite
> data as well.
>
> Add ptest install such that it will only copy ffmpeg source code
> to the target image. The run-ptest script gets necessary
> configuration information from the shell environment variables
> at run time, which must be set prior to running the test.
>
>   FATEWORKDIR  - working directory to run fate testing,
>                  full test with samples requires about 6GB
>   FATECONFIG   - ffmpeg config options for fate
>   FATESAMPLES  - fate test suite samples directory, optional,
>                  but required for full test
>   FATEIGNORE_TESTS - list of tests to ignore during fate testing
>   FATECLEANUP - set to 1 to cleanup fate compile and install
>                 directories after testing
>
> Signed-off-by: Suji Velupillai <suji.velupillai@broadcom.com>
> ---
>  .../ffmpeg/ffmpeg/run-ptest                   | 130 ++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  16 ++-
>  2 files changed, 145 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
> new file mode 100644
> index 0000000000..ee866a58b2
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
> @@ -0,0 +1,130 @@
> +#!/bin/sh
> +
> +# Following can be set in the environment to overwrite
> +# FATEWORKDIR      - working directory for the fate test, needs about 6GB
> +# FATECONFIG       - ffmpeg config options
> +# FATESAMPLES      - fate test suite samples directory
> +# FATEIGNORE_TESTS - tests to ignore during fate test run (comma
> separated)
> +# FATECLEANUP      - set to 0 or 1 (default) to clean up after fate test
> +
> +# Following variables are set during Yocto build time
> +VERSION=""
> +FATECONFIG_DEFAULT=""
> +
> +CLEANUP_DEFAULT=1
> +make=make
> +src="$(dirname $(readlink -f $0))"
> +
> +echo "---------------------------------------------"
> +echo "ffmpeg fate test env config info: "
> +echo "   workdir       : [${FATEWORKDIR}]"
> +echo "   config        : [${FATECONFIG}]"
> +echo "   config_default: [${FATECONFIG_DEFAULT}]"
> +echo "   samplesdir    : [${FATESAMPLES}]"
> +echo "   ignore tests  : [${FATEIGNORE_TESTS}]"
> +echo "   clean up      : [${FATECLEANUP}]"
> +echo "---------------------------------------------"
> +
> +die() {
> +   echo "$@"
> +   echo "ffmpeg fate: FAILED"
> +   exit 1
> +}
> +
> +lock() {
> +   lock=$1/fate.lock
> +   (set -C; exec >$lock) 2>/dev/null || return
> +   trap 'rm $lock' EXIT
> +}
> +
> +prep_test_vector() {
> +   # If samples directory not provided, run the fate without samples.
> +   # In this case, limited test warning printed out to report by fate
> test.
> +   test -f "${FATESAMPLES}/md5sum" || FATESAMPLES=""
> +}
> +
> +prep_work_space() {
> +   test -z ${FATEWORKDIR} && die "Error: empty workdir: ${FATEWORKDIR}"
> +   test -d ${FATEWORKDIR} || die "Error: invalid workdir: ${FATEWORKDIR}"
> +   cd ${FATEWORKDIR}
> +   mkdir -p fatetest
> +   FATEWORKDIR+="/fatetest"
> +}
> +
> +check_version() {
> +   # if version is not set then try to get the version from src
> +   [ -z "${VERSION}" ] && VERSION=$(${src}/ffbuild/version.sh ${src})
> +}
> +
> +configure() {
> +   cd ${build} || return
> +
> +   ${src}/configure \
> +      --prefix="${install}" \
> +      ${FATESAMPLES:+--samples="$FATESAMPLES"} \
> +      ${FATEIGNORE_TESTS:+--ignore-tests="$FATEIGNORE_TESTS"} \
> +      ${FATECONFIG_DEFAULT:+$FATECONFIG_DEFAULT} \
> +      ${FATECONFIG:+$FATECONFIG}
> +}
> +
> +compile() {
> +   cd ${build} || return
> +   ${make} && ${make} install
> +}
> +
> +fate() {
> +   cd ${build} || return
> +   ${make} fate
> +}
> +
> +report() {
> +   date=$(date -u +%Y%m%d%H%M%S)
> +   echo "fate:1:${date}:${VERSION}:$1:$2" >${FATEWORKDIR}/report
> +   cat ${build}/ffbuild/config.fate >>${FATEWORKDIR}/report
> +   cat ${build}/tests/data/fate/*.rep >>${FATEWORKDIR}/report 2>/dev/null
> || \
> +      for i in ${build}/tests/data/fate/*.rep ; do cat "$i"
> >>${FATEWORKDIR}/report 2>/dev/null; done
> +   echo "fate test logs are in [${FATEWORKDIR}]"
> +}
> +
> +clean() {
> +   [ -z "${FATECLEANUP}" ] && FATECLEANUP=${CLEANUP_DEFAULT}
> +   if [[ "${FATECLEANUP}" -eq 1 ]]; then
> +      echo "Cleaning up fate build and install directories"
> +      rm -rf ${build} ${install}
> +   fi
> +}
> +
> +fail() {
> +    report "$@"
> +    clean
> +    echo "ffmpeg fate: FAILED"
> +    exit 1
> +}
> +
> +prep_work_space
> +prep_test_vector
> +
> +lock ${FATEWORKDIR} || die "${FATEWORKDIR} locked"
> +cd ${FATEWORKDIR} || die "cd ${FATEWORKDIR} failed"
> +build="${FATEWORKDIR}/build"
> +install="${FATEWORKDIR}/install"
> +mkdir -p $build
> +mkdir -p $install
> +PATH="$install/bin:$PATH"
> +LD_LIBRARY_PATH="$install/lib"
> +
> +check_version
> +echo "configuring for fate test"
> +configure >${FATEWORKDIR}/configure.log 2>&1 || fail 3 "error in fate
> configuring stage"
> +echo "compiling fate test"
> +compile   >${FATEWORKDIR}/compile.log   2>&1 || fail 2 "error in fate
> compiling stage"
> +echo "fate testing in progress"
> +fate      >${FATEWORKDIR}/test.log  2>&1 || fail 1 "error in fate testing
> stage"
> +echo "generate test report"
> +report 0 success
> +clean
> +if [ $? == 0 ]; then
> +    echo "ffmpeg fate: PASSED"
> +else
> +    echo "ffmpeg fate: FAILED"
> +fi
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> index bd21552332..c374694956 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> @@ -25,6 +25,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://mips64_cpu_detection.patch \
> +           file://run-ptest \
>
> file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
>
> file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>             file://CVE-2020-35964.patch \
> @@ -43,7 +44,7 @@ PROVIDES = "libav libpostproc"
>
>  DEPENDS = "nasm-native"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale
> postproc avresample \
>                     alsa bzlib gpl lzma pic pthreads shared theora x264
> zlib \
> @@ -141,6 +142,19 @@ do_compile_prepend_class-target() {
>          sed -i -e "s,${WORKDIR},,g" ${B}/config.h
>  }
>
> +RDEPENDS_${PN}-ptest += "make"
> +
> +do_install_ptest() {
> +    cd ${S}
> +    VERSION="`ffbuild/version.sh .`"
> +    tar -c --exclude='.git*' --exclude='oe-*' . | ( cd ${D}${PTEST_PATH}
> && tar -xf - )
> +    cd -
> +
> +    FATECONF="${PACKAGECONFIG_CONFARGS} ${EXTRA_PTESTCONF}"
> +    sed -i
> "s|FATECONFIG_DEFAULT=\"\"|FATECONFIG_DEFAULT=\"${FATECONF}\"|g"
> ${D}${PTEST_PATH}/run-ptest
> +    sed -i "s|VERSION=\"\"|VERSION=\"$VERSION\"|g"
> ${D}${PTEST_PATH}/run-ptest
> +}
> +
>  PACKAGES =+ "libavcodec \
>               libavdevice \
>               libavfilter \
> --
> 2.17.1
>
>
> 
>
>

--00000000000057305405bc2d1a9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div><br></div><div>This change got dropped from the =
master-next branch.</div><div>Did it break=C2=A0any builds? Is there anythi=
ng I can=C2=A0do to help to get this change accepted?</div><div><br></div><=
div>Thank you</div><div>Suji</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 22, 2021 at 5:18 PM Suji Velu=
pillai via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;suji.velupillai=3D<a href=3D"mailto:broadcom.com@lists.openembedde=
d.org">broadcom.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Suji Velupillai &lt;<a href=
=
=3D"mailto:suji.velupillai@broadcom.com" target=3D"_blank">suji.velupillai=
@broadcom.com</a>&gt;<br>
<br>
[YOCTO #5605] Add ptest for ffmpeg<br>
<br>
ffmpeg fate test requires full source code and copy of test suite<br>
data to run the full test. Test data is over 1GB thus cannot be<br>
included within Yocto. But it can be mounted on the target during<br>
the test or fate test can run limited tests without test suite<br>
data as well.<br>
<br>
Add ptest install such that it will only copy ffmpeg source code<br>
to the target image. The run-ptest script gets necessary<br>
configuration information from the shell environment variables<br>
at run time, which must be set prior to running the test.<br>
<br>
=C2=A0 FATEWORKDIR=C2=A0 - working directory to run fate testing,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0full test wi=
th samples requires about 6GB<br>
=C2=A0 FATECONFIG=C2=A0 =C2=A0- ffmpeg config options for fate<br>
=C2=A0 FATESAMPLES=C2=A0 - fate test suite samples directory, optional,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0but required=
 for full test<br>
=C2=A0 FATEIGNORE_TESTS - list of tests to ignore during fate testing<br>
=C2=A0 FATECLEANUP - set to 1 to cleanup fate compile and install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 directories after =
testing<br>
<br>
Signed-off-by: Suji Velupillai &lt;<a href=3D"mailto:suji.velupillai@broad=
com.com" target=3D"_blank">suji.velupillai@broadcom.com</a>&gt;<br>
---<br>
=C2=A0.../ffmpeg/ffmpeg/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 130 ++++++++++++++++++<br>
=C2=A0.../recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a> |=C2=A0 16 ++-<br>
=C2=A02 files changed, 145 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest<b=
r>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg/run-ptest<br>
new file mode 100644<br>
index 0000000000..ee866a58b2<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest<br>
@@ -0,0 +1,130 @@<br>
+#!/bin/sh<br>
+<br>
+# Following can be set in the environment to overwrite<br>
+# FATEWORKDIR=C2=A0 =C2=A0 =C2=A0 - working directory for the fate test, =
needs about 6GB<br>
+# FATECONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0- ffmpeg config options<br>
+# FATESAMPLES=C2=A0 =C2=A0 =C2=A0 - fate test suite samples directory<br>
+# FATEIGNORE_TESTS - tests to ignore during fate test run (comma separate=
d)<br>
+# FATECLEANUP=C2=A0 =C2=A0 =C2=A0 - set to 0 or 1 (default) to clean up a=
fter fate test<br>
+<br>
+# Following variables are set during Yocto build time<br>
+VERSION=3D&quot;&quot;<br>
+FATECONFIG_DEFAULT=3D&quot;&quot;<br>
+<br>
+CLEANUP_DEFAULT=3D1<br>
+make=3Dmake<br>
+src=3D&quot;$(dirname $(readlink -f $0))&quot;<br>
+<br>
+echo &quot;---------------------------------------------&quot;<br>
+echo &quot;ffmpeg fate test env config info: &quot;<br>
+echo &quot;=C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0: [${FATEWORKDI=
R}]&quot;<br>
+echo &quot;=C2=A0 =C2=A0config=C2=A0 =C2=A0 =C2=A0 =C2=A0 : [${FATECONFIG=
}]&quot;<br>
+echo &quot;=C2=A0 =C2=A0config_default: [${FATECONFIG_DEFAULT}]&quot;<br>
+echo &quot;=C2=A0 =C2=A0samplesdir=C2=A0 =C2=A0 : [${FATESAMPLES}]&quot;<=
br>
+echo &quot;=C2=A0 =C2=A0ignore tests=C2=A0 : [${FATEIGNORE_TESTS}]&quot;<=
br>
+echo &quot;=C2=A0 =C2=A0clean up=C2=A0 =C2=A0 =C2=A0 : [${FATECLEANUP}]&q=
uot;<br>
+echo &quot;---------------------------------------------&quot;<br>
+<br>
+die() {<br>
+=C2=A0 =C2=A0echo &quot;$@&quot;<br>
+=C2=A0 =C2=A0echo &quot;ffmpeg fate: FAILED&quot;<br>
+=C2=A0 =C2=A0exit 1<br>
+}<br>
+<br>
+lock() {<br>
+=C2=A0 =C2=A0lock=3D$1/fate.lock<br>
+=C2=A0 =C2=A0(set -C; exec &gt;$lock) 2&gt;/dev/null || return<br>
+=C2=A0 =C2=A0trap &#39;rm $lock&#39; EXIT<br>
+}<br>
+<br>
+prep_test_vector() {<br>
+=C2=A0 =C2=A0# If samples directory not provided, run the fate without sa=
mples.<br>
+=C2=A0 =C2=A0# In this case, limited test warning printed out to report b=
y fate test.<br>
+=C2=A0 =C2=A0test -f &quot;${FATESAMPLES}/md5sum&quot; || FATESAMPLES=3D&=
quot;&quot;<br>
+}<br>
+<br>
+prep_work_space() {<br>
+=C2=A0 =C2=A0test -z ${FATEWORKDIR} &amp;&amp; die &quot;Error: empty wor=
kdir: ${FATEWORKDIR}&quot;<br>
+=C2=A0 =C2=A0test -d ${FATEWORKDIR} || die &quot;Error: invalid workdir: =
${FATEWORKDIR}&quot;<br>
+=C2=A0 =C2=A0cd ${FATEWORKDIR}<br>
+=C2=A0 =C2=A0mkdir -p fatetest<br>
+=C2=A0 =C2=A0FATEWORKDIR+=3D&quot;/fatetest&quot;<br>
+}<br>
+<br>
+check_version() {<br>
+=C2=A0 =C2=A0# if version is not set then try to get the version from src=
<br>
+=C2=A0 =C2=A0[ -z &quot;${VERSION}&quot; ] &amp;&amp; VERSION=3D$(${src}/=
ffbuild/version.sh ${src})<br>
+}<br>
+<br>
+configure() {<br>
+=C2=A0 =C2=A0cd ${build} || return<br>
+<br>
+=C2=A0 =C2=A0${src}/configure \<br>
+=C2=A0 =C2=A0 =C2=A0 --prefix=3D&quot;${install}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 ${FATESAMPLES:+--samples=3D&quot;$FATESAMPLES&quot;}=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 ${FATEIGNORE_TESTS:+--ignore-tests=3D&quot;$FATEIGNO=
RE_TESTS&quot;} \<br>
+=C2=A0 =C2=A0 =C2=A0 ${FATECONFIG_DEFAULT:+$FATECONFIG_DEFAULT} \<br>
+=C2=A0 =C2=A0 =C2=A0 ${FATECONFIG:+$FATECONFIG}<br>
+}<br>
+<br>
+compile() {<br>
+=C2=A0 =C2=A0cd ${build} || return<br>
+=C2=A0 =C2=A0${make} &amp;&amp; ${make} install<br>
+}<br>
+<br>
+fate() {<br>
+=C2=A0 =C2=A0cd ${build} || return<br>
+=C2=A0 =C2=A0${make} fate<br>
+}<br>
+<br>
+report() {<br>
+=C2=A0 =C2=A0date=3D$(date -u +%Y%m%d%H%M%S)<br>
+=C2=A0 =C2=A0echo &quot;fate:1:${date}:${VERSION}:$1:$2&quot; &gt;${FATEW=
ORKDIR}/report<br>
+=C2=A0 =C2=A0cat ${build}/ffbuild/config.fate &gt;&gt;${FATEWORKDIR}/repo=
rt<br>
+=C2=A0 =C2=A0cat ${build}/tests/data/fate/*.rep &gt;&gt;${FATEWORKDIR}/re=
port 2&gt;/dev/null || \<br>
+=C2=A0 =C2=A0 =C2=A0 for i in ${build}/tests/data/fate/*.rep ; do cat &qu=
ot;$i&quot; &gt;&gt;${FATEWORKDIR}/report 2&gt;/dev/null; done<br>
+=C2=A0 =C2=A0echo &quot;fate test logs are in [${FATEWORKDIR}]&quot;<br>
+}<br>
+<br>
+clean() {<br>
+=C2=A0 =C2=A0[ -z &quot;${FATECLEANUP}&quot; ] &amp;&amp; FATECLEANUP=3D$=
{CLEANUP_DEFAULT}<br>
+=C2=A0 =C2=A0if [[ &quot;${FATECLEANUP}&quot; -eq 1 ]]; then<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;Cleaning up fate build and install direct=
ories&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 rm -rf ${build} ${install}<br>
+=C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+fail() {<br>
+=C2=A0 =C2=A0 report &quot;$@&quot;<br>
+=C2=A0 =C2=A0 clean<br>
+=C2=A0 =C2=A0 echo &quot;ffmpeg fate: FAILED&quot;<br>
+=C2=A0 =C2=A0 exit 1<br>
+}<br>
+<br>
+prep_work_space<br>
+prep_test_vector<br>
+<br>
+lock ${FATEWORKDIR} || die &quot;${FATEWORKDIR} locked&quot;<br>
+cd ${FATEWORKDIR} || die &quot;cd ${FATEWORKDIR} failed&quot;<br>
+build=3D&quot;${FATEWORKDIR}/build&quot;<br>
+install=3D&quot;${FATEWORKDIR}/install&quot;<br>
+mkdir -p $build<br>
+mkdir -p $install<br>
+PATH=3D&quot;$install/bin:$PATH&quot;<br>
+LD_LIBRARY_PATH=3D&quot;$install/lib&quot;<br>
+<br>
+check_version<br>
+echo &quot;configuring for fate test&quot;<br>
+configure &gt;${FATEWORKDIR}/configure.log 2&gt;&amp;1 || fail 3 &quot;er=
ror in fate configuring stage&quot;<br>
+echo &quot;compiling fate test&quot;<br>
+compile=C2=A0 =C2=A0&gt;${FATEWORKDIR}/compile.log=C2=A0 =C2=A02&gt;&amp;=
1 || fail 2 &quot;error in fate compiling stage&quot;<br>
+echo &quot;fate testing in progress&quot;<br>
+fate=C2=A0 =C2=A0 =C2=A0 &gt;${FATEWORKDIR}/test.log=C2=A0 2&gt;&amp;1 ||=
 fail 1 &quot;error in fate testing stage&quot;<br>
+echo &quot;generate test report&quot;<br>
+report 0 success<br>
+clean<br>
+if [ $? =3D=3D 0 ]; then<br>
+=C2=A0 =C2=A0 echo &quot;ffmpeg fate: PASSED&quot;<br>
+else<br>
+=C2=A0 =C2=A0 echo &quot;ffmpeg fate: FAILED&quot;<br>
+fi<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a> b/meta/recipe=
s-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ffmpeg_4.3.1.bb</a><br>
index bd21552332..c374694956 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a><br>
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db2=
34ee4d69f5fce4486a80fdaf4a4263 \<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/releases/$%7BBP%=
7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.ffmpeg.org/rele=
ases/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mips64_cpu_detection.patc=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lavf-srt-fix-build-f=
ail-when-used-the-libsrt-1.4.1.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libavutil-include-as=
sembly-with-full-path-from-sourc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-35964.patch \<br=
>
@@ -43,7 +44,7 @@ PROVIDES =3D &quot;libav libpostproc&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;nasm-native&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit autotools pkgconfig ptest<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;avdevice avfilter avcodec avformat swresam=
ple swscale postproc avresample \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa=
 bzlib gpl lzma pic pthreads shared theora x264 zlib \<br>
@@ -141,6 +142,19 @@ do_compile_prepend_class-target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s,${WORKDIR},,g&quot; ${=
B}/config.h<br>
=C2=A0}<br>
<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 cd ${S}<br>
+=C2=A0 =C2=A0 VERSION=3D&quot;`ffbuild/version.sh .`&quot;<br>
+=C2=A0 =C2=A0 tar -c --exclude=3D&#39;.git*&#39; --exclude=3D&#39;oe-*&#3=
9; . | ( cd ${D}${PTEST_PATH} &amp;&amp; tar -xf - )<br>
+=C2=A0 =C2=A0 cd -<br>
+<br>
+=C2=A0 =C2=A0 FATECONF=3D&quot;${PACKAGECONFIG_CONFARGS} ${EXTRA_PTESTCON=
F}&quot;<br>
+=C2=A0 =C2=A0 sed -i &quot;s|FATECONFIG_DEFAULT=3D\&quot;\&quot;|FATECONF=
IG_DEFAULT=3D\&quot;${FATECONF}\&quot;|g&quot; ${D}${PTEST_PATH}/run-ptest<=
br>
+=C2=A0 =C2=A0 sed -i &quot;s|VERSION=3D\&quot;\&quot;|VERSION=3D\&quot;$V=
ERSION\&quot;|g&quot; ${D}${PTEST_PATH}/run-ptest<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;libavcodec \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libavdevice \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libavfilter \<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000057305405bc2d1a9c--

--0000000000005e5be505bc2d1a81
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
IIpYKc33vzvKVDvs2IWxRv6MyW+eVUk+j/TVRY0v8wuN8GA9Xa2cWrCIF/nZBwZ6XV6cyWqbgHFU
Xv6uTwtYVz+ixpy1R32Pa50S9DA+AT2RLA5tZ56/62XL8dlXzDUCAwEAAaOCAd0wggHZMA4GA1Ud
DwEB/wQEAwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUu
Z2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggr
BgEFBQcwAYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAwTQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3
Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4
aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmww
JwYDVR0RBCAwHoEcc3VqaS52ZWx1cGlsbGFpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEF
BQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUSiB4fyCZFnFa
INRZOYTRblhwD7IwDQYJKoZIhvcNAQELBQADggEBALB7BzgCJ+VORdoeBmmNg2qfej6VLxIuLx1W
m3q3E2Tx2AKnbI6AUdempPrtgjw0UdLTAyhgnGnXbDn8u0GIPagiUT9VKTuIESp6pd/ByUMVZDu4
WiFyEQ6gixTfJJ08mXc6bC0koGLOcno1ewjWDPLnPuGuYe5B5xdG6tT2IZJYB0bCMTGlW/CqRe9X
d24scEswBsLEwTXimmxjiPwWLF8Bl9JjEC0cSsw83xFYFrMW21PK9GXwr69NgaTKY/xWrZuMyn87
vm9TA/rOkYj953t/G7ndwrCF4fKMR64iXGkhF+fAc6YMNauiXIDsQ0gTMn05JBAcHXy2CsCjCZm6
7DExggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNh
MTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgw/SHIb
YJZUlCWLN7owDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEID+rhD/wH9P06FKoLplz
cY3u60P6pXX9lIbzqzS1pt+XMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIxMDIyNTE4MTMwNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA2HtTM3buqc/JJi15APlHSF5EsvM5WgA3+qB8q
CM3xeCL9+Z9KoOnElHEM44Z0jo7jPEUDBLUlhaaQxLzlXMScUFMUztnGXUd58W4hUlhQnx73kdmY
E+fiP0EnFKZwieI9mvtrfyHz5njhtU5MvXmHSgsQP89Ls3cU0LCgFr81H7UxZ86z+s6fsPM+JEq7
STxzPk+vJa4Wbq0tt0MazL1zzYVMpkzcGiKnkn88kyreFCSVvDWHZ+F11/nXwA7UtmTwT0QL0x76
9KBmPyMkn7Glq0XaXiObHxv+08eo/EDFkm+Wt7mQQU59uapQB6qwmd0sywjEZnWRqt1EVueAp/WB

--0000000000005e5be505bc2d1a81--
