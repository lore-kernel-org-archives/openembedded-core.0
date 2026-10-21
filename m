Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11964.1792590444916651950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 06:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=o5Vg9nSx;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 172BA16F8
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:47:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE0CF3FA7A
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792590444; bh=v/ViUZefPT9rXE32sI+WhG/PJTEJXnhdXh8XFMsurh8=;
	h=From:To:Subject:Date:From;
	b=o5Vg9nSxP6l79+wEdZ/jg95m26j6TZBgwx67vd52p0FcwtPblZvg2OtPl7XZ3VIz6
	 n5ItVrGvBfUEM4dhnXGGo9eFj7Fn2WtUlDNizzghhNTSMY+GeRDpxokc2u47h8Gp7b
	 k/tLTdZNS2aFZm0et1fIvpIGkye9zjfNfkjnHsF4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pip: upgrade 26.2.1 -> 26.2.2
Date: Wed, 21 Oct 2026 14:47:21 +0100
Message-ID: <20261021134721.2292749-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 13:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248400
Content-Type: text/plain; charset="utf-8"

Just one change, upgrading the vendorered certifi to 2026.10.19, removing
the compromised eMudhra intermediate certificates[1].

[1] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pip/no_shebang_mangling.patch          | 8 ++++----
 .../{python3-pip_26.2.1.bb =3D> python3-pip_26.2.2.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.2.1.bb =3D> python3-=
pip_26.2.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling=
.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.pat=
ch
index e8b2982b2ab..f388928230e 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
+From ea75b7fc017f7a1a3a47e9e2bef21209f0f36a04 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distli=
b/scripts.py
-index 195dc3f..a0e0d61 100644
+index ac9e909..1faa5b6 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -155,6 +155,8 @@ class ScriptMaker(object):
+@@ -157,6 +157,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#lengt=
h
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -25,7 +25,7 @@ index 195dc3f..a0e0d61 100644
          if os.name !=3D 'posix':
              simple_shebang =3D True
          elif getattr(sys, "cross_compiling", False):
-@@ -363,7 +365,7 @@ class ScriptMaker(object):
+@@ -367,7 +369,7 @@ class ScriptMaker(object):
                  return
 =20
              match =3D FIRST_LINE_RE.match(first_line.replace(b'\r\n', b=
'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.2.1.bb b/meta/re=
cipes-devtools/python/python3-pip_26.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.2.bb
index 7f041f822e3..c83c9e4468d 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
=20
 SRC_URI +=3D "file://no_shebang_mangling.patch"
=20
-SRC_URI[sha256sum] =3D "f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7=
883d660878e0813f"
+SRC_URI[sha256sum] =3D "3a8e5c800492787f33a4114ef54444546c340df428974ebb=
a17e0fd47e11af2f"
=20
 CVE_PRODUCT =3D "pypa:pip"
=20
--=20
2.43.0

