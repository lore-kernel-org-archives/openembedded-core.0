Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.9831.1620227949406128258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cK9AhELs;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id n2so3452427ejy.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YK2eWJPJI0i5GJh5nX4OS6h9RuP15tmoXvmMLBGPZok=;
        b=cK9AhELsi78NjdAutZcBYaTM7wEXWwDytfFWzhhxuox0LqesC2P2p1Lqq9eB+Yimmb
         IDyBUz9+7iwCBIHvjPfXxDeH+A6kPjmarqUig5bg9ALN6AvSLozvJd40IMdSaW3Bhurt
         rCN7BIiWRCk+QuhiGmqnpQNQzVvVtP16IEAUQCg+Se+FMmqREHki2pBBR/yE7Lc8xKsI
         Eq3plIAqpq20IzxMt2oxFCrj/YQGREEmeEJWZ71wUD5w6i3kjPrjnvZ09am51JPeJ8Yq
         RTKPpoVRb2Cz7O3PsHK4p1KyV15DVaavRoJPu69VxZ7kom6N4xOeCu5ASMGCHKNpXFgU
         6ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YK2eWJPJI0i5GJh5nX4OS6h9RuP15tmoXvmMLBGPZok=;
        b=Ssob8wl0HlTVtHu9zg8IcvhDkN/Gsw8odc4vBFwGdxzpp8tAKpz2xzV8PN0fKRy0Eu
         mASJ8Lcd82cSl9LL8NfjEdxzBW1FDJITD7IaLiimSJCqrLv1U62XZ9q+qGPyFwBAP94M
         5t9M9Eev6NQlMwmjMNRj3M88lj51BNtLtuWVJxrFiTU4Fcr+CjhS5rnRckIb4a/pH2OO
         BIiEZmZkwssSLdlOB5C1mvNsL8VpFwPX5YdDDpD2sL9R4hem5z6AJGdL1FwskGL3tjje
         M2+ZGW7MtzvH8GFm5Ep6+GNg9hC9H1KN+OsrfuYZzEpF8pz2uio/tlnQTJ7wadXinsP4
         uknA==
X-Gm-Message-State: AOAM531gf2UPk/rloJkYD0kiAutQmDjXS4KF9oOf2PlVva9+NUDHHNCx
	e5XOYKt9kCMwz1sPKw+Iimv0VLXAQCcEaQ==
X-Google-Smtp-Source: ABdhPJyXtATI6h5th1CY9duh73vBJjizu4K0NvYwovD+BGQ+x+dY1t8/8EqPOSFrz4NLq4F07jdBSQ==
X-Received: by 2002:a17:907:2075:: with SMTP id qp21mr28576087ejb.421.1620227948040;
        Wed, 05 May 2021 08:19:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/61] bluez5: upgrade 5.56 -> 5.58
Date: Wed,  5 May 2021 17:18:04 +0200
Message-Id: <20210505151850.660512-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ....am-add-missing-mkdir-for-ell-shared.patch | 25 +++++++++++++++++++
 .../bluez5/{bluez5_5.56.bb => bluez5_5.58.bb} |  3 +--
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.56.bb => bluez5_5.58.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 74b59e406c..635cad813e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,6 +53,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch \
+           file://0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
new file mode 100644
index 0000000000..03b42f73cb
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
@@ -0,0 +1,25 @@
+From d341ba650af1b7068d9ad034732b4f41b91bb2c1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 25 Apr 2021 18:56:41 +0200
+Subject: [PATCH] Makefile.am: add missing mkdir for ell/shared
+
+This addresses build errors out of source tree.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index be5d5c7..72ad425 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -623,6 +623,7 @@ lib/bluetooth/%.h: lib/%.h
+ 	$(AM_V_GEN)$(LN_S) -f $(abspath $<) $@
+ 
+ ell/shared: Makefile
++	$(AM_V_at)$(MKDIR_P) ell
+ 	$(AM_V_GEN)for f in $(ell_shared) ; do \
+ 		if [ ! -f $$f ] ; then \
+ 			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.56.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.58.bb
index 676cb2dbb2..186a621c44 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
@@ -1,7 +1,6 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "e6c51b2aefa7c56ff072819a78611fa5"
-SRC_URI[sha256sum] = "59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d"
+SRC_URI[sha256sum] = "c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.31.1

