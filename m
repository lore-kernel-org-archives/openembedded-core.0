Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2083.1794939637714596056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=HzzUCX7Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so1517615e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939636; x=1795544436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=USvK6HDSmQQ/xXlMbg4bbpSCBi7FjCpGoB/dPgjTaxQ=;
        b=HzzUCX7ZFY3QpGWet2B2VwG0nO3cTWZYSEqL7bsE9HAocr/2Wk0ZQtz67U0XNfKof0
         44pOhQRcOKzFCRiYfXx5uQ7mVaPdKdtvJM79D1M/5GQGdAyIFV7ol/LQkan/NZ3oOW3b
         KXRu2+MQrqdzvXyuYPPOPEO8cTCiBukFmwp5Y7eIxhywqwzNwKyV6+AdZv/nYqbaH3PP
         lw8Tg4eh2b6D9P1EHfeDizZeWK+LWVcszPNrA63L20p96ZxjuL1wG49E2zjAQW9qgae9
         oOXwQI4Q3hryDy/G6zwcMyeaTVHFWE2+BBWA8XiKVgzOi2bXc8P7MGq6OBOYk05zySbG
         lnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939636; x=1795544436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=USvK6HDSmQQ/xXlMbg4bbpSCBi7FjCpGoB/dPgjTaxQ=;
        b=V8S6dun1dBjazKfLrsyfAYU2oWR+b0xvTyS3Ln5pDGlo/+0VDscDaan7MoatlDpeWe
         U4+AY34YrkdLCzDwTKwjx7u3J7xxAJN1idlOkXpUO8q9MdOPq/DlGaNoeO9xGxePcC2/
         U7I9YJyRPYEylLGP9VTYZSB9Ed8OFR/JZPxFWRURFqDn6nym/12bG5zFBTMD3I7Y+Qhk
         lGih9W/0ctY8jdjkdL75TnJPNqddCfLUwveeM5KQmMwSMLJLVvoomIgMYw/ikjpsNQyb
         aZBnAZFexmVG3LUiyfyTfQzdK+mk2OcO4zSYAE1JvuK6bTWRROHrQWpw1Lp2g6sBV5Nc
         s5TQ==
X-Gm-Message-State: APuU4Z+YhDf6n6mv8VFUSOHi8GVXPUePJSChH1hcaARrgBi5eOZz6hOw
	K2Ps6q5kgB7/BdFN/lB9NaupfJbzaRfck8VpX6/mh4stXRnsRwlsR1jcAQ+KJMmXqWQ82/afBMs
	IZXMbjTo=
X-Gm-Gg: AYBFou1S1rcIpzY/5CSDF0NfmCAgbVHFCa65L+BeqFCpWUh6POvTwt4yM6WeC1AlN35
	eWj5mBRA9aAFBafv9v0BXb3+dsZuCkhUFn3mfUlA7sJBYYBhBpiTxvhSNP+zyaYEQmlfo1V2zlR
	SB+6xe9CFyZbCKSI+WuzCJnLj3LNloJ/GNa/2Zt66DfMgGFJfJtWW/9D7koisYSTkD2+1AONK4c
	p2BeMheLuEoZAvo4eNzsHAT0/v4PpvC47NasAA8LvLEurUEOjqjnHVlAOJa7Csfjoam6ZjIW2+/
	XZFwH1FYnFWGjdwVOZLp1/5jtVl8NNdkaTS0LlVAK1zhbMjcsIy6QiXozmLUHfC1P1PYRS9b5m4
	YBYv8G2uflDemVtI2DBtwF4izT1IeujRu8IO8S56RMJYCbW7DmoaXKR6p59cEDr2qu8/Qo4duL8
	DzwU0fzrjjuDMxIG+8qR+BUrB5Dwj7HFnc8czOpmWeMP8eBwy2v5ltjNkhoAiL//2oDDOMwCD9Y
	vww0kJb7s8jZkV8fVAoK97FOpK4ld8qjeXf4hgis7YXr+I63GLjVBimTCmAqyrJaq0snEi+eIik
	TUtjhWPRmOJ5RiaKSxFekaablyKner0YJwXGMbN5HWNdsx+EWhzutGiXa67y5ugK/Sb3qG+48WJ
	/TLk25FpSuACZNOGcNUR+f6qggYI9
X-Received: by 2002:a05:600c:1912:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb55ad45admr311881785e9.35.1794939635946;
        Tue, 17 Nov 2026 10:20:35 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/17] rsync: upgrade 3.5.0 -> 3.5.1
Date: Tue, 17 Nov 2026 19:20:05 +0100
Message-ID: <99bf44ba0293c59b609db5bfb5fb3329536e644e.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250472
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NEWS: https://download.samba.org/pub/rsync/NEWS#3.5.1

Compare log: https://github.com/RsyncProject/rsync/compare/v3.5.0...v3.5.1

- Refresh existing patches
- ldn support added [1] and add packageconfig to support

[1] https://github.com/RsyncProject/rsync/commit/f0177d82a8fcbbebaac2bdf556f983160ae03988

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6367a867b6a6079bf83eeffcc8bca5f5ec22b7ab)
Suggested-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: The Yocto Project TSC granted an exemption to the stable release
policy for this rsync version upgrade, see:
https://lists.openembedded.org/g/openembedded-core/message/248203]
---
 ...01-Add-missing-prototypes-to-function-declarations.patch | 4 ++--
 meta/recipes-devtools/rsync/files/determism.patch           | 6 +++---
 meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch | 6 +++---
 .../rsync/{rsync_3.5.0.bb => rsync_3.5.1.bb}                | 3 ++-
 4 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.5.0.bb => rsync_3.5.1.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 5aed93e458d..1f1fc3f3b3e 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 64e62c659649593239ed39ed40a3ae689bf2d593 Mon Sep 17 00:00:00 2001
+From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -63,7 +63,7 @@ index 889b57b..19e5e98 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 6050d0e..45722c4 100644
+index ed6e554..b5f9448 100644
 --- a/main.c
 +++ b/main.c
 @@ -250,7 +250,7 @@ void read_del_stats(int f)
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index 2eea267bb2d..890275f6d7c 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From c4c9b52a864c3b9ff67771b9d881a78276448100 Mon Sep 17 00:00:00 2001
+From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,10 +25,10 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 91807d6..c18b4be 100644
+index de24949..bb9bb27 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
+@@ -28,6 +28,11 @@ MKDIR_P=@MKDIR_P@
  VPATH=$(srcdir)
  SHELL=/bin/sh
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 4ff070ea3c6..59255d15e72 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From bab7abb3c7c1c1db8ef6c3084c1ffb5152f5bf1e Mon Sep 17 00:00:00 2001
+From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 801e864..91807d6 100644
+index 716171d..de24949 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -265,60 +265,6 @@ conf: configure.sh config.h.in
+@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.5.0.bb b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.5.0.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.1.bb
index d9a4884d96e..6b121ab1a87 100644
--- a/meta/recipes-devtools/rsync/rsync_3.5.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33"
+SRC_URI[sha256sum] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
@@ -28,6 +28,7 @@ PACKAGECONFIG ??= "acl attr \
 
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
+PACKAGECONFIG[idn] = "--enable-idn,--disable-idn,libidn2"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
