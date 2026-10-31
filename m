Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3751.1793405766483129688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=WK8LrOZT;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1284907f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405765; x=1794010565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjqIiwlBLSKt4hgfzBBQFM4WYirL8dc6fmEyYAuTbxU=;
        b=WK8LrOZT0MdvuMi2J7r+AdAWjQ5PnZ04V92qCPGVfzAi9+OSsRGW6GtUZfn9UIpxWg
         OPGqtDWxiQFzLiboIK9JfcFLlXm/tRSV2SjF6wFDvxWSKlJE6i7QPBqOddMraIUslLXn
         oyr14TtCSU70Jaips6jmQ+WDOtPDuLBDJLZBnYJcIfdX1R9qhv6ncxLGw94dV9h3Wy3N
         PAdaxTOz9VqxptIJtWdzneSqIxIkJZEsHRr7zE+uxtrX/yy/zTt1nO9U1ursF/D5jw93
         t9aGsidLh1tTTHETYNbXGLpvRHK1xeNYvrdqD8k6BtAEffHWjw0PKbBqqf8gCcavN9SZ
         E2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405765; x=1794010565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjqIiwlBLSKt4hgfzBBQFM4WYirL8dc6fmEyYAuTbxU=;
        b=XvWQ09BuvqC0Sk+eUc7FswmAWg0NjXP5YcjLu0qQugWh/7otfxQyX7SgbmZqc3wpIY
         NPcqVdL/jGu+u0tE/drAbj3/bJxPGZqM94V6KGFIjcUAyNYECZW2iQi+j4WgGB6QNzxW
         Ge95y2B+WMszP+1Hi9KUAxdqihBYro6mxtNJaLl2UfRA7utJEuEDY1RJiUw/l074Mqsz
         u4kvzRXhUE7ctrL0SEqiKoNTS8wqcmaliqSSGyjgPxWUTfe87UHttP6+pFSBbZE/SGpb
         m/q+lM5i5yY9PcTYt54FW2KFSaq3ouCDoNJgWZ6dndmW/sI45UkR26hw5MCQ6HvaONKG
         Dncw==
X-Gm-Message-State: AFq9FYLK3YLevcRTYk8lX3L3B9/BlkJwdDLQBSIBjHSbclUIjOiV3op9
	ln/lEp4NTJIhn6Fu5Kq6vLiCYd/9yIaA9R45xa2nVlMCGK+02OGJEOZ0369/x2sDLFFHN1ihp8j
	81D/1lVw=
X-Gm-Gg: AYBFou3DCC+IajjZ28Q3SaXni2Alvysiz1Xki7vRJ+7ClDdebxUTqJ5/i4PCgXGTmMa
	I9LQ8Sveuk2roh9Nb6BvkOX1jyDvYWDdmsAo9Yc7DzDSdTV/FH2Hr4nbm6YFqixsrRo1UKKf/rt
	pfXxsszc5S/UPki13vMpfcxvndsnBls4p3jt+RKpwPsDnyvJ4MeKLAvPQrHaSh8D8HaGmUCmEJf
	xEAmq5KhX9aVEOrF0Dbclm5jgR3kVNRt7NG5Cfnd9aD9tV3AV9Z2s9Rwdq5CBAkE+hhJULeCbYm
	Dck6JKcoqJZJJSLClzDgTO1z3VNAMLVnpI67RypPHpoq8pPYDPuZEZSM5LCNwt23vVOzUHW2vff
	y7Y4bpkK1XnJTK+DKlFHYA9fcCSHUUXnF5kTdq6qLP/IvNYNAuOdHcYInsFvNxg+529p8BflT1e
	3ncRQprYLmnALUOygdJbC0tm2cKGTqyICAkWK1negF2Pq5vZxxKvGmWsfWevw1bZMuJ9eQdsvA+
	RXvr/1x0d/cwJ6ak9QGrnig37tzbNrI9Lzi3utY93VwNEvN9k9lsCBJbXtADoIqpJGRdY4Zgprw
	P405GpeSqt9nCc+hz5mW/6TrvpS7yA8Mq6lydo2FffR5IdAn9BT85l3zEYiXhURmGyuFeP47LkV
	GQq6/jvKWGFxEp5TncmqWP/gCZfVM
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr91188195e9.13.1793405764673;
        Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/55] python3: upgrade 3.12.15 -> 3.12.16
Date: Sat, 31 Oct 2026 01:14:58 +0100
Message-ID: <c236d9dd3dd75dfe58d0526e4a82b87c9c79c398.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249112
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

This is a security release of Python 3.12
Release information: [1]

This is an expedited security release to address the compromised eMudhra
intermediate CA keys. These keys are now blocked by the ssl module as a
last resort against their use.
Normal uses of pip, including to upgrade pip itself, are now safe from
attacks based on those compromised keys, even if pip hasn't been updated
yet.

Security content in this release
* CVE-2026-115557 gh-160040: Distrust compromised eMudhra intermediate CA keys
* CVE-2026-77214 CVE-2026-102633 gh-158876: Update bundled Expat to 2.9.0
* CVE-2024-3220 gh-159428: Don't read mimetypes.knownfiles by default on Windows
* CVE-2026-114583 gh-160097: Reject links replacing the destination in tarfile.tar_filter
* gh-87720: Fix additional header refolding-quoting edge case
* gh-157579: Fix race condition in the cleanup of tempfile.TemporaryDirectory
* gh-160300: Reject cookies with a negative version in http.cookiejar

[1] https://www.python.org/downloads/release/python-31216/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Avoid-shebang-overflow-on-python-config.py.patch       | 2 +-
 ...1-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch | 2 +-
 ...1-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch | 2 +-
 .../0001-test_ctypes.test_find-skip-without-tools-sdk.patch     | 2 +-
 meta/recipes-devtools/python/python3/makerace.patch             | 2 +-
 .../python/{python3_3.12.15.bb => python3_3.12.16.bb}           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.12.15.bb => python3_3.12.16.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 6c8b1bf6cd9..3da1b60f3bd 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2361,6 +2361,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2366,6 +2366,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 6066b26e38f..3cbde6c6cc5 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -13,7 +13,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 083f4c7..dce36a5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -663,8 +663,7 @@ profile-run-stamp:
+@@ -665,8 +665,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 5fdf5f4514e..3f59d824054 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 0a0f31e..4dfb67d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2721,7 +2721,8 @@ class TarFile(object):
+@@ -2735,7 +2735,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 307e4bf3069..d820e37e601 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -18,7 +18,7 @@ diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.
 index a41e949..eb5fe19 100644
 --- a/Lib/test/test_ctypes/test_find.py
 +++ b/Lib/test/test_ctypes/test_find.py
-@@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):
+@@ -133,10 +133,12 @@ class FindLibraryLinux(unittest.TestCase):
                  # LD_LIBRARY_PATH)
                  self.assertEqual(find_library(libname), 'lib%s.so' % libname)
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 4575a30bfcf..4fcf6468762 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2272,7 +2272,7 @@ COMPILEALL_OPTS=-j0
+@@ -2277,7 +2277,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.15.bb b/meta/recipes-devtools/python/python3_3.12.16.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.15.bb
rename to meta/recipes-devtools/python/python3_3.12.16.bb
index 6c6289b0e69..9946bb075dd 100644
--- a/meta/recipes-devtools/python/python3_3.12.15.bb
+++ b/meta/recipes-devtools/python/python3_3.12.16.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a"
+SRC_URI[sha256sum] = "b5796915dc45ff745cfb4e990a7e7c93d6f546328a102ce31448d69ebc37575c"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
