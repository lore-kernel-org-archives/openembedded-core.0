Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5605.1794387814144353962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gPjy3GMF;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19844205e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387812; x=1794992612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TspG+xpTsUWduYoksj9gixzF6SBm0cxpPLRYk/gt0ac=;
        b=gPjy3GMFC6Wr35ptPtaVw7NaK5loPZJZ58AbFKFqJH75Xj3By36RKvMTzXCHqf5iww
         L1jmHtVJ3oyng8EoI/6D8qKF3SBipbrf+/rG4WATRWHRa2OVJxkbrRJheTbxv7YZByb0
         17O9hswngsDSrE2enD5uDPbbzpcQXjBTGLt5YoPAnJe5ErNl446paIBkZhpIC1dRi9LV
         01tCg1/VPgSWQOxRccfPOnvwfJuSkQ65Wl8zZEewNpIDCXGt3AlppWz0I0x7I+arPU6K
         OBkyfaPtIeVLum64iNPeAQjMrsx0JfGbqdLknmWDF21o+NCxkR6Hru+yI/zGPf2gbrRP
         BhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387812; x=1794992612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TspG+xpTsUWduYoksj9gixzF6SBm0cxpPLRYk/gt0ac=;
        b=mGIBdOfY6DovhEXMKG2B4LQTBzuJ+6BVFVN0ZNhyNAQechCi6+IQrUFUuFACGmq39x
         cYhvinAPjS/RrLKZGqW5sb1AYh/zof1uuPKZR4TJe0VNcdAMBWCKzq/06OCKfjsy66iQ
         NvsWbzApR2jqwlvBW7dBOUqqoZy3ElqbLz76pfeWZv+nLjzhXnQs32r0d33Xq2S7ZLGI
         BWN0RMfrQ2ADjRARJqoKDD5YKbWkZthB9eioSnqVKCxEa9ftK6ddIMH6WPU3pxHt3gwa
         VHpyIaD4dJLFmBAC6XFWxX+PaRIDgskWKiLwxUyimipfTbGvtg5oJTCR0uIU+3Kf08X/
         wjSA==
X-Gm-Message-State: APuU4Z8C3+Uuw5Jqd00PEADrcZfNzSGcrp2rzpGi8g3zt6XJhewX462I
	5fULVnDOlKOuYjyv6b4uuYYWtLzzWoJJSo6jrBZfk4HqaUamLnCcAluXWcCyuitfP7W1PGWST1v
	Vfzy55a0=
X-Gm-Gg: AYBFou2BEhpIXABcmtEm0DDvmj7C+g9FfxNdInDt6js3S8MP6OdMHbNwEinN1ClH815
	aih8j4ry/uAWzrhj8Q73BitWKBpo0Wjc8TteNQIpvrmIwZyFozUnMlgch6SmsZc+kz5RLPZ10V1
	PQYRp9c/sXbD7zSggFaA0iXb8rGD1Mn+E/Yo2i2Ymh78NlziUoQCc9pCAB2w3e5Vkx9gPLKDHbt
	bZu8H7pbG9BGwjG9e58joWjArxGiMmazsD9B+s2DQTZCtddbPmchnWu5tIBbo5ahaHnQYdrTtuI
	APeyYbzD/zatipl/up0Qw9OCy2xxfCHlWIcrZcDfukK5dci58ZqULkl1PtyZYBQp0N5chK8Qepo
	3xSuv59actpQLfjpcU0J22nTepM4l61MLGlep/ApviONtxCRKrnU5N78PufpEVuy5540RRhxnYE
	8UnGgfeU5VVp4AeXyPkWau1T/A4cbj4n8KNUoU9iFMGFyV7fnk4/IQ63Tn+ItS+9EZt7tRY3LDe
	hTGJjcvEtayI6gyttdJtpaCpRbBRvFo42FGqx0Z2qF1jjamJd9xKmzT010mOkBnEJG2y1bho2IK
	oOWAi81FtRde22IkEGgPfj0FAKwrRN4sopZ9IQP9hYHsM38+KR4CpkeXJKkQZHxjehvNPki2SaD
	m9zeIk2ot6WSp2e29zLnVGNPsJGGZ
X-Received: by 2002:a05:600c:e54a:20b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4ba0939d261mr17842745e9.11.1794387812261;
        Wed, 11 Nov 2026 01:03:32 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/35] python3: upgrade 3.14.7 -> 3.14.9
Date: Wed, 11 Nov 2026 10:02:43 +0100
Message-ID: <b5a8303c94026454fa776f2a15a81757fe4308a4.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249989
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

The release notes are long[1] but the highlight is upgrading the bundled
pip wheel to 26.2.2, as pip bundles certifi which needed upgrading due
to the eMudhra intermediate CA compromise.

[1] https://docs.python.org/release/3.14.9/whatsnew/changelog.html
[2] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 526baf80188308bc1e65b09ccb41186772cd6336)
Dropped parts updating patches for openssl-4 or ptests.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Avoid-shebang-overflow-on-python-config.py.patch       | 2 +-
 ...1-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 ...1-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch | 2 +-
 meta/recipes-devtools/python/python3/makerace.patch             | 2 +-
 .../python/{python3_3.14.7.bb => python3_3.14.9.bb}             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7a605383647..7cacaf0ff37 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726bd..580d38a4031 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
 index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -538,12 +538,12 @@ def _init_config_vars():
+@@ -539,12 +539,12 @@ def _init_config_vars():
      _CONFIG_VARS['py_version'] = _PY_VERSION
      _CONFIG_VARS['py_version_short'] = _PY_VERSION_SHORT
      _CONFIG_VARS['py_version_nodot'] = _PY_VERSION_SHORT_NO_DOT
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e0..4e41b04a3bb 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -861,8 +861,7 @@ profile-run-stamp:
+@@ -863,8 +863,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 248a521118c..b589dfb3460 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
+@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.9.bb
index e73dc8d7728..2a5279480b2 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
