Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5585.1794387814768006842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Xi5ZVzme;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so18794165e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387813; x=1794992613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PDlkWfzbBy8b0yGZsy4NN5g6+T1EgwfGRyRUT5uQVRs=;
        b=Xi5ZVzmeQ5kLPjQkcEjyVm8Zl6Aop6a5t1lUdZ+ivojR+s9UFGviuSOa8hFuA7QbVn
         La/I5sh1VudNEe0Hm5hqbkjHAnORpITevtNdiCrqIFfAS+M3chGZBhUr4E3EVrrzMYOT
         twUp/vB7iKEOpEtrD9NZIbEZoDr+T8/tQv8kD2/bNYWc6O15lDrUqI8fCdl1IvUtsuVQ
         sGw/EQqQdpYb7yV44ZKU6UrEZXr9XztHaat6AUGlRdnApagqfbhHryuUaTjBAfm6thFa
         /iVepN2P+NE2ol+IqKAlbflnum3pVZv+R8sq8N1CcODQ+ebwFp2jdlmkKbBjjsggQYOi
         0seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387813; x=1794992613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PDlkWfzbBy8b0yGZsy4NN5g6+T1EgwfGRyRUT5uQVRs=;
        b=pvR+ZgV1QQYWB3kIpdT6xXMNVV3LctPE73Br4eYTfVyDpX1GXfMSsER0HMMjlbMrrY
         ctqTJrZA+xiXmAY2mgWp1yF5frMSXupP1HOAwLjwm6LECzRu8mI+by65N89G4hDvzSTE
         sqXEhbObmp6EMDdq6QqTfJzGBF1tzCKPAx1oWhTmLvH/P0k2ZSE6Q23rYYcIvoExZSgO
         S7CIv4QfABmDtfx02lYyPaINeRfnGV9JtNkQR2csR12u20Z2LQKzGa3S7EHJo0Qdzn0C
         7Rlgx4gQ2e93oFUxmn7PvnoojBD2jghnd/jxFwAzGiMHwTq7FB7XSwfAq1qnpbQwfZxV
         88Dw==
X-Gm-Message-State: APuU4Z+R9kr9ivZB1XAj7eplMaoBDqZfCQDevveO+PBsTmyCvedZ7ifs
	BTcVWJsIMxsEjf+u9t9xEJmwKKGi1/rIC4X1hZWZF7eYOeEQw24Tf2+L93X8Eddl/4lZUH9nC1g
	9gPnFH0k=
X-Gm-Gg: AYBFou2K7YRuCdbUxTcFH+b5wcB8K+NFo3omeSArFZzeubc+shp6mK3FLODI+MmgwB5
	FK4sX8hDr3mRZu57SC5dPo0Sdd5BhXS8Pkn00gNi8x9+E02tf6UieEMnn8skWqrck9YoxdUada5
	1QZ/X/niWJK+2OQRsKXfBxpRQfgs0KwJN4lN+WrSSaZvnVgDuvBF471aK/1DXyT4khW0v8z5usJ
	ap6V8WWI4/3otW81cnxY3avRR3Zp9y7WKGMSUrnln2M3sl/DR984UQfLSkyX3o+dJEWBU5Yat5m
	QuZGCi1Oj4FODbYg46cKz/Khs6KyGkOWpz+ABhFg/p1Jo/qQ0z3wfnertsErdP3NY7nlhC2Oxhq
	+BklU3wl98seYJx9q9astI5Bqqtequu3WEG/d6fB1aTS3WbSZWlYvjqtTM7AZIf2ThNbgRE/NvV
	zdUIhum++8+wG+vVuvoqHfiTu/8PT2J+I+vcv2ugh8FKNp9+0Lr8l1em1IDUGeFEbRwo1wakS3G
	00Spc+QUbSkyLUq4/XH7g2E5ZCJdKJjB2gO+xEiD9+08xxapeBzmMAOWbhEuGLw67Pa1HfootLX
	Yqezr0xSfOJA3pd3Ao1Izli6L2+0EfTWZMo+jdtXr+Hgath728baYEpZXGT70DYQl5eWguAG12Q
	Yq4Pi39Th4LXeyKzN803V/EgULwY/zVPR53hfyJeBWlITYPG+PA==
X-Received: by 2002:a05:600c:8708:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ba0931c301mr32216735e9.2.1794387812956;
        Wed, 11 Nov 2026 01:03:32 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/35] python3: upgrade 3.14.9 -> 3.14.10
Date: Wed, 11 Nov 2026 10:02:44 +0100
Message-ID: <fd2bf473b9d7173b7f0872aa96e25a41dc26357b.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249990
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

This is an expedited security release to address the compromised eMudhra
intermediate CA keys. These keys are now blocked by the ssl module as a
last resort against their use. Normal uses of pip, including to upgrade
pip itself, are now safe from attacks based on those compromised keys,
even if pip hasn't been updated yet.

Release information: [1]
Security content in this release
* CVE-2026-115557 gh-160040: Distrust compromised eMudhra intermediate CA keys
* CVE-2026-114583 gh-160097: Reject links replacing the destination in tarfile.tar_filter
* gh-160300: Reject cookies with a negative version in http.cookiejar

[1] https://www.python.org/downloads/release/python-31410/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4041f4a2e031f76e5a90207e855c735fd14259b1)
Dropped parts updating patches for openssl-4 or ptests.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Avoid-shebang-overflow-on-python-config.py.patch       | 2 +-
 ...1-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch | 2 +-
 .../0001-Update-test_sysconfig-for-posix_user-purelib.patch     | 2 +-
 meta/recipes-devtools/python/python3/makerace.patch             | 2 +-
 .../python/{python3_3.14.9.bb => python3_3.14.10.bb}            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.9.bb => python3_3.14.10.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7cacaf0ff37..79fee9803fe 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2844,6 +2844,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 4e41b04a3bb..d3f46c372a6 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -863,8 +863,7 @@ profile-run-stamp:
+@@ -864,8 +864,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 5509b7475a9..0864f23926a 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 1fe4b68..383142a 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
+@@ -435,7 +435,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b589dfb3460..7167d5b4e82 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=-j0
+@@ -2750,7 +2750,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.9.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.9.bb
rename to meta/recipes-devtools/python/python3_3.14.10.bb
index 2a5279480b2..73d6e89854d 100644
--- a/meta/recipes-devtools/python/python3_3.14.9.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53"
+SRC_URI[sha256sum] = "de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
