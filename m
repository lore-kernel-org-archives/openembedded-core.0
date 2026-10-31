Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6122.1793453074213367457
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 06:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=Dr3FvigE;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.8, mailfrom: oe@myspectrum.nl)
Received: from submission11.mail.transip.nl (unknown [10.103.8.162])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4jGzG736zJzY75Yq
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 14:24:31 +0100 (CET)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission11.mail.transip.nl (Postfix) with ESMTPSA id 4jGzG64cP9z3R3nyw;
	Sat, 31 Oct 2026 14:24:30 +0100 (CET)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id B8B7220141;
	Sat, 31 Oct 2026 13:24:28 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Content-Type: multipart/alternative;
 boundary="------------QfQKYmTiLepxcbd8aagNnqDx"
Message-ID: <29941044-0317-4fa9-9b36-e891ab5b1d83@myspectrum.nl>
Date: Sat, 31 Oct 2026 14:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
References: <cover.1793405493.git.yoann.congal@smile.fr>
 <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr>
Content-Language: en-US
Cc: peter.marko@siemens.com
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr>
X-Scanned-By: ClueGetter at submission11.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1793453070; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=nMEG3/TleqLSwg1uaZO6Al83KfrocIA/pqSkLj2+dss=;
 b=Dr3FvigEv1R25RiM1HDtLcwXmLGIo1DsCy2goMLGUktcUnRkxwJtUu3ScqQSOUmf69hv9/
 0RW8BJVWesD/8jFCrHeisr7te1OvEON73AwcB7AttJrzhC+wi9+NhFFjFGGR6WOtbe0n1q
 gmZW3RwPg4NNyBZvbqwpHcJKz3zloYOQytsPdaJKSz49NEEWNhAWEIZYCAZ7LdHzTxNeQI
 ZFGuhm0jd0pCck5Wd4qVAds6ah68gKnLhmbKYVN9kxj+BRh10O+0/quqMEnj1vVx5nqfmw
 m4U0BgmBi7f6gE3IGqTqHHSeR1zN+GRE+qtBJ19kyvuO5Y08r3Ie1XrH7LVkdg==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 13:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249146

This is a multi-part message in MIME format.
--------------QfQKYmTiLepxcbd8aagNnqDx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yoann,

This is a low prio CVE, but that CVE: CVE-2026-18743 is incorrect in Fix 
CVE-2026-18739 and the fix is incomplete.

But that is already the case in master. I will send a patch for it as soon
as things finish building here. It can't hurt if you include it anyway.

With kind regards,

Jeroen

On 10/31/26 01:14, Yoann Congal via openembedded-core wrote:
> From: Peter Marko<peter.marko@siemens.com>
>
> Pick patch referencing this CVE.
> Convert change in cmake file to autotools/makefile.
> Install the new test in recipe.
>
> Signed-off-by: Peter Marko<peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand<mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> (cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4)
> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
> [YC: backport translated cmake to automake
>       (the project migrated in between) ]
> ---
>   .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
>   meta/recipes-support/popt/popt_1.19.bb        |  2 +
>   2 files changed, 94 insertions(+)
>   create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
>
> diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
> new file mode 100644
> index 00000000000..0a1e8f35907
> --- /dev/null
> +++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
> @@ -0,0 +1,92 @@
> +From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17 00:00:00 2001
> +From: Yao Zhang<294772273@qq.com>
> +Date: Wed, 5 Aug 2026 14:52:10 +0800
> +Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffArgs()
> +
> +The poptStuffArgs function only checks whether (con->os - con->optionStack)
> +is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, and does
> +not increment the value by 1 to perform boundary pre-checking, as
> +handleAlias does.
> +
> +Add a new test program as a reproducer for this case.
> +
> +Co-authored-by: Panu Matilainen<pmatilai@redhat.com>
> +
> +Fixes: CVE-2026-18739
> +
> +CVE: CVE-2026-18743
> +Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
> +Signed-off-by: Peter Marko<peter.marko@siemens.com>
> +---
> + src/popt.c        |  2 +-
> + tests/Makefile.am |  5 ++++-
> + tests/testit.sh   |  2 ++
> + tests/tstuff.c    | 17 +++++++++++++++++
> + 4 files changed, 24 insertions(+), 2 deletions(-)
> + create mode 100644 tests/tstuff.c
> +
> +diff --git a/src/popt.c b/src/popt.c
> +index 9ea3dfe..458aadc 100644
> +--- a/src/popt.c
> ++++ b/src/popt.c
> +@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char ** argv)
> +     int argc;
> +     int rc;
> +
> +-    if ((con->os - con->optionStack) == POPT_OPTION_DEPTH)
> ++    if ((con->os - con->optionStack + 1) == POPT_OPTION_DEPTH)
> + 	return POPT_ERROR_OPTSTOODEEP;
> +
> +     for (argc = 0; argv[argc]; argc++)
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index c410389..99fbf64 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -11,7 +11,10 @@ EXTRA_DIST = testit.sh \
> +
> + AM_CPPFLAGS = -I. -I$(top_srcdir)/src
> +
> +-noinst_PROGRAMS = test1 test2 tdict test3
> ++noinst_PROGRAMS = test1 test2 tdict test3 tstuff
> ++tstuff_SOURCES = tstuff.c
> ++tstuff_LDFLAGS =
> ++tstuff_LDADD = $(top_builddir)/src/libpopt.la
> + test1_SOURCES = test1.c
> + test1_LDFLAGS =
> + test1_LDADD = $(top_builddir)/src/libpopt.la
> +diff --git a/tests/testit.sh b/tests/testit.sh
> +index 4078f51..d26be3a 100755
> +--- a/tests/testit.sh
> ++++ b/tests/testit.sh
> +@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=f1
> +
> + run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=-1
> +
> ++run tstuff "tstuff - 1" "-13"
> ++
> + if ! [ -e test3-data ]; then
> +   # create symlink for running during 'make distcheck'
> +   ln -s "${srcdir}/test3-data" test3-data
> +diff --git a/tests/tstuff.c b/tests/tstuff.c
> +new file mode 100644
> +index 0000000..b820c7b
> +--- /dev/null
> ++++ b/tests/tstuff.c
> +@@ -0,0 +1,17 @@
> ++#include <stdio.h>
> ++#include <popt.h>
> ++
> ++int main(int argc, char *argv[])
> ++{
> ++    poptContext ctx = poptGetContext(argv[0], argc, (const char **)argv, NULL, 0);
> ++    int rc = 0;
> ++    for (int i = 0; i < 100; ++i) {
> ++	const char *ea[] = { "a", NULL };
> ++	if ((rc = poptStuffArgs(ctx, ea)))
> ++	    break;
> ++    }
> ++    printf("%d\n", rc);
> ++
> ++    poptFreeContext(ctx);
> ++    return rc;
> ++}
> diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
> index c8b4875c1b7..18cc4f2867d 100644
> --- a/meta/recipes-support/popt/popt_1.19.bb
> +++ b/meta/recipes-support/popt/popt_1.19.bb
> @@ -11,6 +11,7 @@ DEPENDS = "virtual/libiconv"
>   SRC_URI ="http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \ 
> file://run-ptest \ file://CVE-2026-18743.patch \ + 
> file://CVE-2026-18739.patch \ "
>   SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
>   
> @@ -25,6 +26,7 @@ do_compile_ptest() {
>   do_install_ptest() {
>       install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
>       install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
> +    install ${B}/tests/.libs/tstuff ${D}/${PTEST_PATH}
>       install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
>       install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
>   }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249088):https://lists.openembedded.org/g/openembedded-core/message/249088
> Mute This Topic:https://lists.openembedded.org/mt/122021640/9720520
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [oe@myspectrum.nl]
> -=-=-=-=-=-=-=-=-=-=-=-
--------------QfQKYmTiLepxcbd8aagNnqDx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Yoann,</p>
    <div class=3D"moz-cite-prefix">This is a low prio CVE, but that=C2=A0=
<span
      style=3D"white-space: pre-wrap">CVE: CVE-2026-18743 is incorrect in
</span><span style=3D"white-space: pre-wrap">Fix CVE-2026-18739 and the f=
ix is incomplete. </span>
      <pre wrap=3D"" class=3D"moz-quote-pre">But that is already the case=
 in master. I will send a patch for it as soon
as things finish building here. It can't hurt if you include it anyway.

With kind regards,

Jeroen</pre>
      On 10/31/26 01:14, Yoann Congal via openembedded-core wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann=
.congal@smile.fr">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Peter Marko <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:peter.marko@siemens.com">&lt;peter=
.marko@siemens.com&gt;</a>

Pick patch referencing this CVE.
Convert change in cmake file to autotools/makefile.
Install the new test in recipe.

Signed-off-by: Peter Marko <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:peter.marko@siemens.com">&lt;peter.marko@siemens.com&gt;</a>
Signed-off-by: Mathieu Dubois-Briand <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:mathieu.dubois-briand@bootlin.com">&lt;mathieu.dubois-brian=
d@bootlin.com&gt;</a>
Signed-off-by: Richard Purdie <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfounda=
tion.org&gt;</a>
(cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4)
Signed-off-by: Yoann Congal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yoann.congal@smile.fr">&lt;yoann.congal@smile.fr&gt;</a>
[YC: backport translated cmake to automake
     (the project migrated in between) ]
---
 .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  2 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/r=
ecipes-support/popt/popt/CVE-2026-18739.patch
new file mode 100644
index 00000000000..0a1e8f35907
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -0,0 +1,92 @@
+From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17 00:00:00 2001
+From: Yao Zhang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:294772=
273@qq.com">&lt;294772273@qq.com&gt;</a>
+Date: Wed, 5 Aug 2026 14:52:10 +0800
+Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffArgs()
+
+The poptStuffArgs function only checks whether (con-&gt;os - con-&gt;opt=
ionStack)
+is equal to POPT_OPTION_DEPTH (10) before incrementing con-&gt;os, and d=
oes
+not increment the value by 1 to perform boundary pre-checking, as
+handleAlias does.
+
+Add a new test program as a reproducer for this case.
+
+Co-authored-by: Panu Matilainen <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:pmatilai@redhat.com">&lt;pmatilai@redhat.com&gt;</a>
+
+Fixes: CVE-2026-18739
+
+CVE: CVE-2026-18743
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7=
d4ee80920452d0287058">https://github.com/rpm-software-management/popt/com=
mit/14c42b415ba0c11640f7d4ee80920452d0287058</a>]
+Signed-off-by: Peter Marko <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:peter.marko@siemens.com">&lt;peter.marko@siemens.com&gt;</a>
+---
+ src/popt.c        |  2 +-
+ tests/Makefile.am |  5 ++++-
+ tests/testit.sh   |  2 ++
+ tests/tstuff.c    | 17 +++++++++++++++++
+ 4 files changed, 24 insertions(+), 2 deletions(-)
+ create mode 100644 tests/tstuff.c
+
+diff --git a/src/popt.c b/src/popt.c
+index 9ea3dfe..458aadc 100644
+--- a/src/popt.c
++++ b/src/popt.c
+@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char ** a=
rgv)
+     int argc;
+     int rc;
+=20
+-    if ((con-&gt;os - con-&gt;optionStack) =3D=3D POPT_OPTION_DEPTH)
++    if ((con-&gt;os - con-&gt;optionStack + 1) =3D=3D POPT_OPTION_DEPTH=
)
+ 	return POPT_ERROR_OPTSTOODEEP;
+=20
+     for (argc =3D 0; argv[argc]; argc++)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index c410389..99fbf64 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -11,7 +11,10 @@ EXTRA_DIST =3D testit.sh \
+=20
+ AM_CPPFLAGS =3D -I. -I$(top_srcdir)/src
+=20
+-noinst_PROGRAMS =3D test1 test2 tdict test3
++noinst_PROGRAMS =3D test1 test2 tdict test3 tstuff
++tstuff_SOURCES =3D tstuff.c
++tstuff_LDFLAGS =3D
++tstuff_LDADD =3D $(top_builddir)/src/libpopt.la
+ test1_SOURCES =3D test1.c
+ test1_LDFLAGS =3D=20
+ test1_LDADD =3D $(top_builddir)/src/libpopt.la
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 4078f51..d26be3a 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=3Df1
+=20
+ run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=3D-1
+=20
++run tstuff "tstuff - 1" "-13"
++
+ if ! [ -e test3-data ]; then
+   # create symlink for running during 'make distcheck'
+   ln -s "${srcdir}/test3-data" test3-data
+diff --git a/tests/tstuff.c b/tests/tstuff.c
+new file mode 100644
+index 0000000..b820c7b
+--- /dev/null
++++ b/tests/tstuff.c
+@@ -0,0 +1,17 @@
++#include &lt;stdio.h&gt;
++#include &lt;popt.h&gt;
++
++int main(int argc, char *argv[])
++{
++    poptContext ctx =3D poptGetContext(argv[0], argc, (const char **)ar=
gv, NULL, 0);
++    int rc =3D 0;
++    for (int i =3D 0; i &lt; 100; ++i) {
++	const char *ea[] =3D { "a", NULL };
++	if ((rc =3D poptStuffArgs(ctx, ea)))
++	    break;
++    }
++    printf("%d\n", rc);
++
++    poptFreeContext(ctx);
++    return rc;
++}
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-suppor=
t/popt/popt_1.19.bb
index c8b4875c1b7..18cc4f2867d 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -11,6 +11,7 @@ DEPENDS =3D "virtual/libiconv"
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://ftp.rpm.or=
g/popt/releases/popt-1.x/${BP}.tar.gz\file://run-ptest\file://CVE-2026-18=
743.patch\+file://CVE-2026-18739.patch\">"http://ftp.rpm.org/popt/release=
s/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-18743.patch \
+           file://CVE-2026-18739.patch \
            "</a>
 SRC_URI[sha256sum] =3D "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fda=
d3ca2758c63240f9"
=20
@@ -25,6 +26,7 @@ do_compile_ptest() {
 do_install_ptest() {
     install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
     install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
+    install ${B}/tests/.libs/tstuff ${D}/${PTEST_PATH}
     install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
     install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
 }
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#249088): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/249088">https:/=
/lists.openembedded.org/g/openembedded-core/message/249088</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/122021640/9720520">https://lists.openembedded.org/mt=
/122021640/9720520</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:oe@myspectrum.nl">oe@myspectrum.nl</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
</pre>
    </blockquote>
  </body>
</html>

--------------QfQKYmTiLepxcbd8aagNnqDx--
