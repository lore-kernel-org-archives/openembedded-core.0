Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0063CD10BE8
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 07:07:44 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.6263.1729926457235734689
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Oct 2024 00:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 81EB32765
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Oct 2024 09:07:35 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.187]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4atb-2qWIVt0; Sat, 26 Oct 2024 09:07:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] swig: update 4.2.1 -> 4.3.0
Date: Sat, 26 Oct 2024 09:09:41 +0200
Message-ID: <20241026070941.309659-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729926455-537F45D9-7DEA4645/0/0 CLEAN NORMAL
X-TOI-MSGID: ed96883e-a201-4509-80e0-7b4fe77609b4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Oct 2024 07:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206387

- refresh patch

SWIG-4.3.0 summary:
- Add experimental support for C as a target language.
- MzScheme/Racket is deprecated and planned for removal in SWIG-4.4.
- The distributed Windows binary is now a 64-bit executable.
- Add some missing use of move semantics for performance improvements.
- Enhanced handling of namespaces when using the nspace feature.
- STL wrapper enhancements for std::unique_ptr, std::string_view,
  std::filesystem.
- Various enum and enum class wrapping improvements.
- Other C++ handling improvements around templates, friends, C++11
  trailing return types and C++17 fold expressions.
- Many parser improvements for both C and C++, especially expressions.
- Improvements to handling of string and character literals.
- Minor preprocessor fixes.
- Python: Stricter stable ABI conformance, add support for python-3.13.
- C#: Add support for converting Doxygen comments into XML C# comments.
- Various other target language specific enhancements and updates for
  Java, Javascript, Lua, MzScheme, Ocaml, Octave, Perl, Python, R, Ruby.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/swig/swig/determinism.patch         | 8 ++++----
 .../swig/{swig_4.2.1.bb =3D> swig_4.3.0.bb}                 | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.2.1.bb =3D> swig_4.3.0.bb} (94=
%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/rec=
ipes-devtools/swig/swig/determinism.patch
index 9c49414ad7..0fdc03e7c1 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 28648b3873d83e26bd19b64ce2c0a41ced9292d3 Mon Sep 17 00:00:00 2001
+From 0b14e30e908301efd162836362755cc2ba08b8c3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
@@ -13,12 +13,12 @@ RP 2021/3/1
  1 file changed, 1 deletion(-)
=20
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index de0a512..ac9e825 100644
+index f68b609..0c2aba3 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -638,7 +638,6 @@ static void getoptions(int argc, char *argv[]) {
+@@ -633,7 +633,6 @@ static void getoptions(int argc, char *argv[]) {
  	}
-       } else if (strcmp(argv[i], "-version") =3D=3D 0) {
+       } else if (strcmp(argv[i], "-version") =3D=3D 0 || strcmp(argv[1]=
, "--version") =3D=3D 0) {
  	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
 -	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
  	fprintf(stdout, "\nConfigured options: %cpcre\n",
diff --git a/meta/recipes-devtools/swig/swig_4.2.1.bb b/meta/recipes-devt=
ools/swig/swig_4.3.0.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.2.1.bb
rename to meta/recipes-devtools/swig/swig_4.3.0.bb
index b564be9b36..a31ca68444 100644
--- a/meta/recipes-devtools/swig/swig_4.2.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.3.0.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "libpcre2 bison-native"
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] =3D "fa045354e2d048b2cddc69579e4256245d4676894858fcf0=
bab2290ecf59b7d8"
+SRC_URI[sha256sum] =3D "f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5a=
b53020ab7804aa9e"
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/swig/files/swig=
/"
 UPSTREAM_CHECK_REGEX =3D "swig-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.47.0


