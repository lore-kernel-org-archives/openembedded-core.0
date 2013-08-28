Return-Path: <baker@usgs.gov>
Received: from smtp1.doi.gov (SMTP1.doi.gov [137.227.82.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2D756BA72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 04:45:19 +0000 (UTC)
Received: from smtp4.smgd.doi.gov (10.10.82.14) by smtp1.doi.gov (10.10.82.21)
	with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 27 Aug 2013 22:45:18 -0600
X-AuditID: 89e35218-b7f716d000003f2d-0a-521d805c8a32
Received: from gsmtp1.doi.gov ( [10.10.82.15])	(using TLS with cipher
	AES128-SHA (128/128 bits))	(Client did not present a certificate)	by
	smtp4.smgd.doi.gov (Hello) with SMTP id B7.02.16173.C508D125;
	Tue, 27 Aug 2013 22:45:16 -0600 (MDT)
Received: from mail-pa0-f47.google.com (209.85.220.47) by gsmtp1.doi.gov
	(137.227.82.15) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 27 Aug 2013 22:45:18 -0600
Received: by mail-pa0-f47.google.com with SMTP id kl13so5739046pab.34
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2013
	21:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:content-type:subject:date:message-id:cc:to
	:mime-version;
	bh=TSel1HYlc0II4F5kMGqIxSLUuTBdRGk4c2Zu6s664ZQ=;
	b=p3kIeHYCZxBaTDQ5Rla7i5qAGq7YyMoahzAajrrmMnpxdLsTPTNveAVwfkSAzxv9By
	opByRAlEmuvtEUcbg/CnT3r+TlUG859aXKdUsZ33DYnq39GOMh+eHiR6GPPjlvPtNB4H
	vOX0rnzlLuxcMzxBoZi8mosVn2o0pst57A//sUr9RN7mQTknJTPdlcnSh+7oIHLykJmJ
	KxlCfZd2C2aMHdLnHqCnBjpKC7alyE6Gfl1rkMUrmej8Odpt3QsC2yPEA3LlrPmv/vMq
	02ePUqEq9SVmSDzthUaDVLSdDDSj6TLkf//rOvsRCLu9CyZp0kGzg2ENkUTtpU2AJ3Jl
	IjMg==
X-Gm-Message-State: ALoCoQnaBrTNtHU7r0WJXYvz9v4t/ZFF8s+tLPxdECAvXXfzJ+9JevA3AOIBc1n1Nn8ZDQlt/oAlh0h8EM7MVQ2LXXuaL1Usi9g93UVKGa2XKi/4BaIAjNcm9LWi/V/o+0kOF+6HmBBIFBzrlSBdcwNh3PnWdhTIrQLysMTJqqvwrMBu90uGDXJqCba2styzLZRSk78ShYYSIIvGAYjQdivmRIqrIC8Elbcrxop2H3KZp87uEbsvyvrAc6b/guHwPwARivYA79/S
X-Received: by 10.68.212.37 with SMTP id nh5mr25371440pbc.16.1377665115307;
	Tue, 27 Aug 2013 21:45:15 -0700 (PDT)
X-Received: by 10.68.212.37 with SMTP id nh5mr25371420pbc.16.1377665114944;
	Tue, 27 Aug 2013 21:45:14 -0700 (PDT)
Received: from [192.168.1.112] (adsl-71-135-44-131.dsl.pltn13.pacbell.net.
	[71.135.44.131])        by mx.google.com with ESMTPSA id
	s5sm28474804pbo.38.1969.12.31.16.00.00        (version=TLSv1
	cipher=ECDHE-RSA-RC4-SHA bits=128/128); Tue, 27 Aug 2013 21:45:14
	-0700 (PDT)
From: Larry Baker <baker@usgs.gov>
Date: Tue, 27 Aug 2013 21:45:11 -0700
Message-ID: <12F39B37-5963-490E-BE3F-4053AFDD76A2@usgs.gov>
To: <openembedded-core@lists.openembedded.org>
MIME-Version: 1.0 (Apple Message framework v1085)
X-Mailer: Apple Mail (2.1085)
X-Gm-Spam: 0
Received-SPF: Pass (GSMTP1.doi.gov: domain of baker@usgs.gov designates
	209.85.220.47 as permitted sender) receiver=GSMTP1.doi.gov;
	client-ip=209.85.220.47; helo=mail-pa0-f47.google.com;
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsXCxfTrnW5Mg2yQwfb1GhZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxuIjl1gLrgVU3H02h72B8bJbFyMnh4SAicSXqytYIWwxiQv3
	1rN1MXJxCAl8YZSYeHE3I4SzhlFi49N97BDOMkaJmRdesYI4EgJzWSXOz10L5SxgkviydTHU
	sCqJu5sms3QxcoDZP884gISFBGQlFj4/xwIxaS6TxP9bjcwgCTYBJYnnUxYzgdjMAm4ST9dc
	BbOFBbwlZq47wwZiswioSnQ3/2EBsXkFrCXmb5vADjKfWUBCYu3EUBBTREBP4uo/UYgKQ4kJ
	fw4zQVwjK7HzzmkWCJtHYsrci+wQ5+xjlHjbHAgRl5Q4uOIGywRG8VlIjpiFZBREXFti2cLX
	zBC2jsSC3Z/YMMW1Jc4ceMy0gJFtFaNQcW5JgYlecW56il5KfqZeen7ZJkZgxHU+DpLYwfhr
	l+UhRgEORiUeXovNMkFCrIllxZW5hxglOJiVRHhL/gOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ
	8171nx0oJJCeWJKanZpakFoEk2Xi4JRqYFQQsHr6aOYv9oWS4VZB6/iWV51duMhm7/F9nyRt
	Ykw319nMPJWV8IDB1DtLQ+5s8s++7MI3S+dwLf0wRX/XkZc5kRHdGl1SZ4Kry98q/17Mumr/
	wVVvYouen1n6ImrNcYMX+8vX77Y/8nW998Vt4ttUzk2uvFDEXDD53su+CtdlixgvvjATfvlY
	iaU4I9FQi7moOBEAvH6iJrQCAAA=
Cc: eldk@lists.denx.de
Subject: Fix for libtool-cross do_qa_configure error when building gfortran
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
X-List-Received-Date: Wed, 28 Aug 2013 04:45:21 -0000
Content-Type: multipart/alternative; boundary="Apple-Mail-1--74046379"

--Apple-Mail-1--74046379
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

I enabled the build of gfortran in the gcc-cross recipe using a =
gcc-cross_4.7.bbappend:

> # Build a gfortran cross-compiler
> FORTRAN =3D ",fortran"

The bitbake build fails in the libtool-cross do_qa_configure step.  See, =
for example, the report at =
http://www.mail-archive.com/yocto@yoctoproject.org/msg13845.html:

> configure: WARNING: unrecognized options: --disable-silent-rules, =
--with-
> sysroot=20
> DEBUG: Shell function do_configure finished=20
> DEBUG: Executing python function do_qa_configure=20
> NOTE: Checking autotools environment for common misconfiguration=20
> ERROR: This autoconf log indicates errors, it looked at host include =
and/or=20
> library paths while determining system capabilities.=20
> Rerun configure task after fixing this. The path was=20
> '/home/appusr/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-
> gnueabi/libtool-cross-2.4.2-r5.1/libtool-2.4.2'=20
> DEBUG: Python function do_qa_configure finished=20
> ERROR: Function failed: do_qa_configure

This is due to the incomplete support for gfortran in the bitbake =
recipes.  It looks like they were written for F77=3Dg77 and have not =
been updated to support FC=3Dgfortran.  The FC variable is not defined =
properly for cross-compiling: it is missing the --with-sysroot=3D =
option.  The result is a misconfiguration reported by =
--enable-poison-system-directories and discovered by insane.bbclass in =
do_qa_configure.

The patches below define the FC variables and update the default FORTRAN =
from f77 to fortran.  I use the DENX Yocto/ELDK-5.4 git =
(http://www.denx.de/wiki/ELDK-5/EldkBuilding), so the meta layer name =
and the line numbers may not be an exact match to the files in the OE =
git repository.  Also, I am sorry I cannot use diff --git on my CentOS =
development system.

Unfortunately, while these patches enable the creation of a gfortran =
cross compiler, gfortran cross compiles fail due to a missing =
libgfortran.spec file.  In fact, there are no libgfortran files at all.  =
I don't know why.  When I built my own gfortran cross compiler =
previously from the latest GCC 4.7 Code Sourcery sources, it made all =
the necessary pieces. I did not have to build any other tools, such as =
libtool or libgfortran.  Maybe there are more bitbake files that have to =
be updated to build a functioning gfortran cross compiler.  I'll keep =
working on that.

Larry Baker
US Geological Survey
650-329-5608
baker@usgs.gov


--- original/eldk/meta/classes/native.bbclass
+++ patched/eldk/meta/classes/native.bbclass
@@ -61,2 +61,3 @@
export CXX =3D "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
+export FC =3D "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"
export F77 =3D "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
--- original/eldk/meta/conf/bitbake.conf
+++ patched/eldk/meta/conf/bitbake.conf
@@ -448,2 +448,3 @@
export CXX =3D "${CCACHE}${HOST_PREFIX}g++ =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+export FC =3D "${CCACHE}${HOST_PREFIX}gfortran =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
export F77 =3D "${CCACHE}${HOST_PREFIX}g77 =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
@@ -463,2 +464,3 @@
export BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
+export BUILD_FC =3D "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
export BUILD_F77 =3D "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
--- original/eldk/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ patched/eldk/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -13,3 +13,3 @@
# gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
-FORTRAN ?=3D ",f77"
+FORTRAN ?=3D ",fortran"
LANGUAGES ?=3D "c,c++${FORTRAN}${JAVA}"


--Apple-Mail-1--74046379
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="us-ascii"

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><div>I enabled the build of gfortran in the gcc-cross recipe using a =
gcc-cross_4.7.bbappend:<br><br><blockquote type=3D"cite"># Build a =
gfortran cross-compiler<br></blockquote><blockquote type=3D"cite">FORTRAN =
=3D ",fortran"<br></blockquote><br>The bitbake build fails in the =
libtool-cross do_qa_configure step. &nbsp;See, for example, the report =
at&nbsp;<a =
href=3D"http://www.mail-archive.com/yocto@yoctoproject.org/msg13845.html:"=
>http://www.mail-archive.com/yocto@yoctoproject.org/msg13845.html:</a><br>=
<br><blockquote type=3D"cite">configure: WARNING: unrecognized options: =
--disable-silent-rules, --with-<br></blockquote><blockquote =
type=3D"cite">sysroot&nbsp;<br></blockquote><blockquote =
type=3D"cite">DEBUG: Shell function do_configure =
finished&nbsp;<br></blockquote><blockquote type=3D"cite">DEBUG: =
Executing python function =
do_qa_configure&nbsp;<br></blockquote><blockquote type=3D"cite">NOTE: =
Checking autotools environment for common =
misconfiguration&nbsp;<br></blockquote><blockquote type=3D"cite">ERROR: =
This autoconf log indicates errors, it looked at host include =
and/or&nbsp;<br></blockquote><blockquote type=3D"cite">library paths =
while determining system capabilities.&nbsp;<br></blockquote><blockquote =
type=3D"cite">Rerun configure task after fixing this. The path =
was&nbsp;<br></blockquote><blockquote =
type=3D"cite">'/home/appusr/poky/build/tmp/work/armv7a-vfp-neon-poky-linux=
-<br></blockquote><blockquote =
type=3D"cite">gnueabi/libtool-cross-2.4.2-r5.1/libtool-2.4.2'&nbsp;<br></b=
lockquote><blockquote type=3D"cite">DEBUG: Python function =
do_qa_configure finished&nbsp;<br></blockquote><blockquote =
type=3D"cite">ERROR: Function failed: =
do_qa_configure<br></blockquote><br>This is due to the incomplete =
support for gfortran in the bitbake recipes. &nbsp;It looks like they =
were written for F77=3Dg77 and have not been updated to support =
FC=3Dgfortran. &nbsp;The FC variable is not defined properly for =
cross-compiling: it is missing the --with-sysroot=3D option. &nbsp;The =
result is a misconfiguration reported by =
--enable-poison-system-directories and discovered by insane.bbclass in =
do_qa_configure.<br><br>The patches below define the FC variables and =
update the default FORTRAN from f77 to fortran. &nbsp;I use the DENX =
Yocto/ELDK-5.4 git (<a =
href=3D"http://www.denx.de/wiki/ELDK-5/EldkBuilding">http://www.denx.de/wi=
ki/ELDK-5/EldkBuilding</a>), so the meta layer name and the line numbers =
may not be an exact match to the files in the OE git repository. =
&nbsp;Also, I am sorry I cannot use diff --git on my CentOS development =
system.<div><br><div><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
'Lucida Grande'; font-size: 12px; font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: =
0px; -webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; =
"></span></div></div>Unfortunately, while these patches enable the =
creation of a gfortran cross compiler, gfortran cross compiles fail due =
to a missing libgfortran.spec file. &nbsp;In fact, there are no =
libgfortran files at all. &nbsp;I don't know why. &nbsp;When I built my =
own gfortran cross compiler previously from the latest GCC 4.7 Code =
Sourcery sources, it made all the necessary pieces. I did not have to =
build any other tools, such as libtool or libgfortran. &nbsp;Maybe there =
are more bitbake files that have to be updated to build a functioning =
gfortran cross compiler. &nbsp;I'll keep working on =
that.<br><br></div><div><div><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
'Lucida Grande'; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: 2; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"font-size: 12px; =
">Larry Baker</div><div style=3D"font-size: 12px; ">US Geological =
Survey</div><div style=3D"font-size: 12px; ">650-329-5608</div><div =
style=3D"font-size: 12px; "><a =
href=3D"mailto:baker@usgs.gov">baker@usgs.gov</a></div><div =
style=3D"font-size: 12px; "><br =
class=3D"khtml-block-placeholder"></div><div style=3D"font-size: 12px; =
"><br></div>--- original/eldk/meta/classes/native.bbclass<br>+++ =
patched/eldk/meta/classes/native.bbclass<br>@@ -61,2 +61,3 @@<br>export =
CXX =3D "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"<br>+export FC =3D =
"${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"<br>export F77 =3D =
"${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"<br>--- =
original/eldk/meta/conf/bitbake.conf<br>+++ =
patched/eldk/meta/conf/bitbake.conf<br>@@ -448,2 +448,3 @@<br>export CXX =
=3D "${CCACHE}${HOST_PREFIX}g++ =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"<br>+export FC =3D =
"${CCACHE}${HOST_PREFIX}gfortran =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"<br>export F77 =3D =
"${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"<br>@@ =
-463,2 +464,3 @@<br>export BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}g++ =
${BUILD_CC_ARCH}"<br>+export BUILD_FC =3D =
"${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"<br>export BUILD_F77 =
=3D "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"<br>--- =
original/eldk/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>+++ =
patched/eldk/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>@@ =
-13,3 +13,3 @@<br># gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and =
4.2 expect 'fortran'<br>-FORTRAN ?=3D ",f77"<br>+FORTRAN ?=3D =
",fortran"<br>LANGUAGES ?=3D =
"c,c++${FORTRAN}${JAVA}"<br><br></span></div></div></body></html>=

--Apple-Mail-1--74046379--
