Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.100.1594057150187990977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 10:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=eCknSyoo;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.65, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f65.google.com with SMTP id f18so33991891wrs.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qlpckCsHrlE3TDLX2SPL9OFQ/o5OCTquPhfNhwvOTsg=;
        b=eCknSyooMS2uDtJWzXuTpPW+aIwrv0YHPBQXivw+1kuRo2UG8eHQHzeyWh+d9u8W4Q
         5vbn//cw6tFR0z/UTvF0gQHQY8GyT7Q7Du/x8T1EC1N+JXOQH7n38ybnBzagFrujbM/0
         a+CodL6ZJGrRRt1d/xwJC4RCS+arxMY3oBGlw+BuZb0ulgQ9Jl3nCm89Z7qulItzgeh+
         yeDf4VXk6F2jp5dxy3sbI+bkF82s6XdKUuRAnLTpOxkYvNTL/1tEufE/ZkCY1W/pvLPY
         8WdCOv1n9ueTlU7pCdm8SB+Ychs/Rjfqv8hesom5Wh2xZJIcCH6xq0aSk2kNNKhoaFvS
         wuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qlpckCsHrlE3TDLX2SPL9OFQ/o5OCTquPhfNhwvOTsg=;
        b=E46fnjsswYVditj5Rvt577/vfsfEJtFuEvVRLYkSvbK8Eau1hY0J9kj/2jnisnKRZA
         jzyU/5LOkaYSwoueFp1CWUP+g1IyGHYhzBGw3ZO7lIKq+fo5auZIDdqlK3n1sY/etaoh
         iPF7f9KDiaqOSQ7sQtUgeieGcjCuhf5dEmvq5PLEIY5KuhsZRhwEYTglNu2+U/9TEA53
         meB3Da4CB8vPpmhW9rlUPRLH274/dC6ePsBvz2wzldyYfLeKcEbjjAnwG1fCg1PY4KhH
         QIU13ATJd56n/DrAtcoHk9wOqongtBRg1U43YJ3KF3HJVhxowo/LTrA4lcnEj35yMKyu
         5FqA==
X-Gm-Message-State: AOAM530Aa3Z4T2qZjfngoowB8QrB+dJnAQhi7yJjkeyfqOa7sT9C8/Wa
	Akl7YCI+kq3x0jNLWUbzzXn1ry+IM7cPQzcIlDtiyw==
X-Google-Smtp-Source: ABdhPJyQsyyUNEWMMHiE7w3n56g44di1CLVrNb3nW4nkoMYHCe+nBz4ATwFkM5oaYn/XLn/zZULaR4axpq5lEixF+cU=
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr50473906wrx.352.1594057148532;
 Mon, 06 Jul 2020 10:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <1593090687-4781-1-git-send-email-rahulk@mvista.com>
In-Reply-To: <1593090687-4781-1-git-send-email-rahulk@mvista.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Mon, 6 Jul 2020 23:08:57 +0530
Message-ID: <CANv91vM+qS9U0UCJhbfcHfPtStBEy8jF_DAgfodb_rUwzWD4hA@mail.gmail.com>
Subject: Re: [PATCH v4] bzip2: Add test suite for bzip2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000172d0705a9c95a4a"

--000000000000172d0705a9c95a4a
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Gentle reminder.
I have submitted the Patch V4 for Bug 13444
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=13444>which is in NEW
state.
kindly take a look.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Thu, Jun 25, 2020 at 6:41 PM Rahul Kumar <rahulk@mvista.com> wrote:

> Source: git://sourceware.org/git/bzip2-tests.git
> Type: Enhancement
> Description:
> bzip2 now has a test suite available at git://
> sourceware.org/git/bzip2-tests.git.
>
> This is a collection of "interesting" .bz2 files that can be used to
> test bzip2 works correctly. They come from different projects.
>
> Some files are deliberately bad, and are use to see how bzip2 handles
> corrupt files. They are explicitly not intended to decompress correctly,
> but to catch errors in bzip2 trying to deal with deliberately bad data.
> All such files have a name ending in .bz2.bad.
>
> All non-bad files end in bz2. And should come with a .md5 file for
> the original input file. The .md5 file is used to check that bzip2
> could correctly decompress the file. The original (non-compressed)
> files are deliberately not checked in.
>
> It will by default test with the command 'bzip2', running under
> valgrind (if installed on the system).
>
> For each .bz2 file found it is decompressed, recompressed and
> decompressed again. Once with the default bzip2 settings and
> once in --small (-s) mode.
>
> For each .bz2.bad file decompression is tried twice also. In
> default mode and small mode. The bzip2 binary is expected to
> return either 1 or 2 as exit status. Any other exit code is
> interpreted as failure.
>
> License:
>    In bzip2-tests source code Each directory should contain a README
>    file explaining where the .bz2 files originally came from.
>    Plus a reference to the (Free Software) license that the project
>    files were distributed under.
>
> Test Summery:
>    On qemux86-64/kvm the ptest results with extra filesystem space
> (atleast 114688) are:
>
> TOTAL:      396
> PASS:       396
> SKIP:       0
> XFAIL:      0
> FAIL:       0
> XPASS:      0
> ERROR:      0
>
> All tests passed
> DURATION: 517
>
> [YOCTO #13444]
>
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> ---
>  meta/recipes-extended/bzip2/bzip2/Makefile.am |  1 +
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb    | 31
> ++++++++++++++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> index dcf6458..d449894 100644
> --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> @@ -46,6 +46,7 @@ runtest:
>         else echo "FAIL: sample2 decompress"; fi
>         @if cmp sample3.tst sample3.ref; then echo "PASS: sample3
> decompress";\
>         else echo "FAIL: sample3 decompress"; fi
> +       ./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"
>
>  install-ptest:
>         sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index d58f553..70eb67f 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -4,10 +4,25 @@ Huffman coding. Compression is generally considerably
> better than that achieved
>  LZ77/LZ78-based compressors, and approaches the performance of the PPM
> family of statistical compressors."
>  HOMEPAGE = "https://sourceware.org/bzip2/"
>  SECTION = "console/utils"
> -LICENSE = "bzip2-1.0.6"
> -LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> +LICENSE = "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause &
> Zlib"
> +LICENSE_${PN} = "bzip2-1.0.6"
> +LICENSE_${PN}-dev = "bzip2-1.0.6"
> +LICENSE_${PN}-dbg = "bzip2-1.0.6"
> +LICENSE_${PN}-doc = "bzip2-1.0.6"
> +LICENSE_${PN}-src = "bzip2-1.0.6"
> +LICENSE_libbz2 = "bzip2-1.0.6"
> +LICENSE_${PN}-ptest = "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL &
> BSD-3-Clause & Zlib"
> +
> +LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664
> \
> +
> file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327
> \
> +
> file://${WORKDIR}/git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f
> \
> +
> file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f
> \
> +
> file://${WORKDIR}/git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +
> file://${WORKDIR}/git/lbzip2/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +"
>
>  SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> +           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
>             file://configure.ac;subdir=${BP} \
>             file://Makefile.am;subdir=${BP} \
>             file://run-ptest \
> @@ -15,6 +30,8 @@ SRC_URI = "
> https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
>  SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
>  SRC_URI[sha256sum] =
> "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>
> +SRCREV_bzip2-tests = "f9061c030a25de5b6829e1abf373057309c734c0"
> +
>  UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
>
>  PACKAGES =+ "libbz2"
> @@ -34,12 +51,20 @@ do_configure_prepend () {
>  }
>
>  do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/bzip2-tests
> +       cp -r ${WORKDIR}/git/commons-compress
> ${D}${PTEST_PATH}/bzip2-tests/commons-compress
> +       cp -r ${WORKDIR}/git/dotnetzip
> ${D}${PTEST_PATH}/bzip2-tests/dotnetzip
> +       cp -r ${WORKDIR}/git/go ${D}${PTEST_PATH}/bzip2-tests/go
> +       cp -r ${WORKDIR}/git/lbzip2 ${D}${PTEST_PATH}/bzip2-tests/lbzip2
> +       cp -r ${WORKDIR}/git/pyflate ${D}${PTEST_PATH}/bzip2-tests/pyflate
> +       cp ${WORKDIR}/git/README ${D}${PTEST_PATH}/bzip2-tests/
> +       cp ${WORKDIR}/git/run-tests.sh ${D}${PTEST_PATH}/bzip2-tests/
>         sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
>  }
>
>  FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
>
> -RDEPENDS_${PN}-ptest += "make"
> +RDEPENDS_${PN}-ptest += "make bash"
>
>  PROVIDES_append_class-native = " bzip2-replacement-native"
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
>

--000000000000172d0705a9c95a4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi=C2=A0Richard,</div><div class=3D"gmail_default=
" style=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394"=
>Gentle reminder.<br></div><div class=3D"gmail_default" style=3D"font-famil=
y:verdana,sans-serif;color:#0b5394">I have submitted the Patch V4 for <a hr=
ef=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13444">Bug 13444<=
b style=3D"color:rgb(0,0,0);font-family:Verdana,sans-serif;font-size:16.25p=
x;font-weight:700">=C2=A0</b></a>which is in NEW state.=C2=A0</div><div cla=
ss=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394"=
>kindly take a look.</div><div class=3D"gmail_default" style=3D"font-family=
:verdana,sans-serif;color:#0b5394"><br></div><div><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"color:rgb(111,168,220)">=
	=09
  =09
 =20
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b>=
</span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"col=
or:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><sp=
an style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"c=
olor:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</sp=
an></span></div><div><span style=3D"color:rgb(11,83,148)">Software Engineer=
,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,8=
3,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"colo=
r:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mailt=
o:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span><=
span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener" =
target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:1=
0pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 25,=
 2020 at 6:41 PM Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com">rahul=
k@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Source: git://<a href=3D"http://sourceware.org/git/bzip2-tests.=
git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/bzip2-tests.gi=
t</a><br>
Type: Enhancement<br>
Description:<br>
bzip2 now has a test suite available at git://<a href=3D"http://sourceware.=
org/git/bzip2-tests.git" rel=3D"noreferrer" target=3D"_blank">sourceware.or=
g/git/bzip2-tests.git</a>.<br>
<br>
This is a collection of &quot;interesting&quot; .bz2 files that can be used=
 to<br>
test bzip2 works correctly. They come from different projects.<br>
<br>
Some files are deliberately bad, and are use to see how bzip2 handles<br>
corrupt files. They are explicitly not intended to decompress correctly,<br=
>
but to catch errors in bzip2 trying to deal with deliberately bad data.<br>
All such files have a name ending in .bz2.bad.<br>
<br>
All non-bad files end in bz2. And should come with a .md5 file for<br>
the original input file. The .md5 file is used to check that bzip2<br>
could correctly decompress the file. The original (non-compressed)<br>
files are deliberately not checked in.<br>
<br>
It will by default test with the command &#39;bzip2&#39;, running under<br>
valgrind (if installed on the system).<br>
<br>
For each .bz2 file found it is decompressed, recompressed and<br>
decompressed again. Once with the default bzip2 settings and<br>
once in --small (-s) mode.<br>
<br>
For each .bz2.bad file decompression is tried twice also. In<br>
default mode and small mode. The bzip2 binary is expected to<br>
return either 1 or 2 as exit status. Any other exit code is<br>
interpreted as failure.<br>
<br>
License:<br>
=C2=A0 =C2=A0In bzip2-tests source code Each directory should contain a REA=
DME<br>
=C2=A0 =C2=A0file explaining where the .bz2 files originally came from.<br>
=C2=A0 =C2=A0Plus a reference to the (Free Software) license that the proje=
ct<br>
=C2=A0 =C2=A0files were distributed under.<br>
<br>
Test Summery:<br>
=C2=A0 =C2=A0On qemux86-64/kvm the ptest results with extra filesystem spac=
e (atleast 114688) are:<br>
<br>
TOTAL:=C2=A0 =C2=A0 =C2=A0 396<br>
PASS:=C2=A0 =C2=A0 =C2=A0 =C2=A0396<br>
SKIP:=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
XFAIL:=C2=A0 =C2=A0 =C2=A0 0<br>
FAIL:=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
XPASS:=C2=A0 =C2=A0 =C2=A0 0<br>
ERROR:=C2=A0 =C2=A0 =C2=A0 0<br>
<br>
All tests passed<br>
DURATION: 517<br>
<br>
[YOCTO #13444]<br>
<br>
Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" target=
=3D"_blank">rahulk@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/bzip2/bzip2/Makefile.am |=C2=A0 1 +<br>
=C2=A0meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a>=C2=A0 =C2=A0 | 31 ++++++++=
++++++++++++++++---<br>
=C2=A02 files changed, 29 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-e=
xtended/bzip2/bzip2/Makefile.am<br>
index dcf6458..d449894 100644<br>
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
@@ -46,6 +46,7 @@ runtest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample2 decompress&quot;;=
 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @if cmp sample3.tst sample3.ref; then echo &quo=
t;PASS: sample3 decompress&quot;;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample3 decompress&quot;;=
 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./bzip2-tests/run-tests.sh --tests-dir=3D&quot;=
$(PWD)/bzip2-tests&quot;<br>
<br>
=C2=A0install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed=C2=A0 -n &#39;/^runtest:/,/^install-ptest:/=
{/^install-ptest:/!p}&#39; \<br>
diff --git a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" =
rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a> b/meta/recipes-exte=
nded/bzip2/<a href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_=
blank">bzip2_1.0.8.bb</a><br>
index d58f553..70eb67f 100644<br>
--- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
+++ b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
@@ -4,10 +4,25 @@ Huffman coding. Compression is generally considerably bet=
ter than that achieved<br>
=C2=A0LZ77/LZ78-based compressors, and approaches the performance of the PP=
M family of statistical compressors.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://sourceware.org/bzip2/" rel=3D"n=
oreferrer" target=3D"_blank">https://sourceware.org/bzip2/</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
-LICENSE =3D &quot;bzip2-1.0.6&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;endline=3D37;md5=
=3D600af43c50f1fcb82e32f19b32df4664&quot;<br>
+LICENSE =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &amp; MS-PL &a=
mp; BSD-3-Clause &amp; Zlib&quot;<br>
+LICENSE_${PN} =3D &quot;bzip2-1.0.6&quot;<br>
+LICENSE_${PN}-dev =3D &quot;bzip2-1.0.6&quot;<br>
+LICENSE_${PN}-dbg =3D &quot;bzip2-1.0.6&quot;<br>
+LICENSE_${PN}-doc =3D &quot;bzip2-1.0.6&quot;<br>
+LICENSE_${PN}-src =3D &quot;bzip2-1.0.6&quot;<br>
+LICENSE_libbz2 =3D &quot;bzip2-1.0.6&quot;<br>
+LICENSE_${PN}-ptest =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &a=
mp; MS-PL &amp; BSD-3-Clause &amp; Zlib&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;endline=3D37;md5=
=3D600af43c50f1fcb82e32f19b32df4664 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd89=
86968f4327 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a=
54f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6=
de0a029f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/lbzip2/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \<b=
r>
+&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/$%7BBPN%7D/$%=
7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://sou=
rceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://sourcewar=
e.org/git/bzip2-tests.git;name=3Dbzip2-tests" rel=3D"noreferrer" target=3D"=
_blank">sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://configur=
e.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>;subdir=3D${BP} =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.am;subdir=3D${BP}=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
@@ -15,6 +30,8 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/$=
%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank"=
>https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822f7500d0e5&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ab5a03176ee106d3f0fa90e381da478ddae40591=
8153cca248e682cd0c4a2269&quot;<br>
<br>
+SRCREV_bzip2-tests =3D &quot;f9061c030a25de5b6829e1abf373057309c734c0&quot=
;<br>
+<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.sourceware.org/pu=
b/bzip2/" rel=3D"noreferrer" target=3D"_blank">https://www.sourceware.org/p=
ub/bzip2/</a>&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;libbz2&quot;<br>
@@ -34,12 +51,20 @@ do_configure_prepend () {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/bzip2-tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${WORKDIR}/git/commons-compress ${D}${PTE=
ST_PATH}/bzip2-tests/commons-compress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${WORKDIR}/git/dotnetzip ${D}${PTEST_PATH=
}/bzip2-tests/dotnetzip<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${WORKDIR}/git/go ${D}${PTEST_PATH}/bzip2=
-tests/go<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${WORKDIR}/git/lbzip2 ${D}${PTEST_PATH}/b=
zip2-tests/lbzip2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${WORKDIR}/git/pyflate ${D}${PTEST_PATH}/=
bzip2-tests/pyflate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/git/README ${D}${PTEST_PATH}/bzip=
2-tests/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/git/run-tests.sh ${D}${PTEST_PATH=
}/bzip2-tests/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;s|^Makefile:|_Makefile:|&quot; =
${D}${PTEST_PATH}/Makefile<br>
=C2=A0}<br>
<br>
=C2=A0FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
<br>
-RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
<br>
=C2=A0PROVIDES_append_class-native =3D &quot; bzip2-replacement-native&quot=
;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--000000000000172d0705a9c95a4a--
