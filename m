Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.11030.1599130063968655100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 03:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=SWHMWOS9;
 spf=pass (domain: burtonini.com, ip: 209.85.128.66, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f66.google.com with SMTP id q9so2380812wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZGcGMX/m3qqcq2Excqodvi42gc3DJvN/Jo4iVbvBjh0=;
        b=SWHMWOS9McqmHERcxTR9wTmUD8uBUNIcFB5+b8bpv8Gi+Bh4A1cII9FLTScdbXrAlo
         aCooiSHYg3EOMnk6enVGWuilZTMKwHeTVKkPqgtJsIdg28qOwQZT6PTfwcduxuS5LnAI
         qOSOW1mRHfEIaddCi2A6xfkMpwcDTg7t73VnhYVvlQ1YpCaq6dGXT8eEM+EGEItRLpPB
         dTEqAy+xZiLVtJMz4XSN0G9REqz2TJxs3mdJj6aJj9lgs1HH+GpW8LrJ0OT2iN1/7vQB
         DBcHyFyJcVLPZV2R++S9FwS0cg/Zy4UEMHuyCNIpL0/vqWRwcptXN774xFrRAWNIxEqh
         O/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZGcGMX/m3qqcq2Excqodvi42gc3DJvN/Jo4iVbvBjh0=;
        b=NnxWSlwVg1BFVZ60plhRMXvgrLtIyXz1Ezn+q25QXBackz1/hDvDUkHa/Vc0knGc/s
         Ax0ZbrezrX+Mq1GRRFmLy3oyn2PuitzgjhGTq/gmlnP0OKUD2H3eA9vBFXRIWCuEigUV
         eXe7I9SQ5lQTZLu9aaxq56Nva3hAGXGIMF08GTl5kjTNG1ug00F+7sGVl2FnKStxeKhT
         95m2VX9EsNeYCLRPwg3aEtffMDcPC+bUAhi99liCuhHKY50NT57RbOWcrzQQScdwir7R
         pghIhPOvXs3boCaClTEzGM8HgWHgr3BqNg8zHAM1zEDoeFKmdF2UcLwF3dySB0Vkm+rt
         kIJg==
X-Gm-Message-State: AOAM531Gbeb73yg/LR3Jy9pAs57Ee6ut1CIZxbJEgy5T/MjDa69aLlSL
	K0tBsn0Ud/OKKxRWKtzGkUEDv/Px/RYIggQR
X-Google-Smtp-Source: ABdhPJyIeuo+AKWEANlWXOJeB9eDs64KqqrsIp1voAd0UN2fYANyxtH7d3u5VFA47KbhIfRFBa7Mnw==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr1940903wmb.6.1599130061846;
        Thu, 03 Sep 2020 03:47:41 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id 5sm3668895wmz.22.2020.09.03.03.47.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 03:47:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kea: bump to 1.7.10
Date: Thu,  3 Sep 2020 11:47:31 +0100
Message-Id: <20200903104731.4165-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903104731.4165-1-ross.burton@arm.com>
References: <20200903104731.4165-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the latest release in the 1.7.x series so should be a safe
upgrade, and means we can drop a patch as the AC_TRY_RUN has an
optimistic fallback for cross-compiling now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../kea/files/0001-remove-AC_TRY_RUN.patch    | 34 -------------------
 .../kea/{kea_1.7.7.bb => kea_1.7.10.bb}       |  4 +--
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
 rename meta/recipes-connectivity/kea/{kea_1.7.7.bb => kea_1.7.10.bb} (92%)

diff --git a/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch b/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
deleted file mode 100644
index d7ca9ff8fa..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9d6b8321c5b46199baca907f3d42bdcaaf1958a8 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 23 May 2019 23:59:42 -0700
-Subject: [PATCH] remove AC_TRY_RUN
-
-AC_TRY_RUN doesn't work in cross compile env,
-use AC_COMPILE_IFELSE instead to fix below configure
-error:
- | checking for usuable C++11 regex... configure: error: in `/builddir/tmp/work/core2-64-poky-linux/kea/1.5.0-r0/build':
- | configure: error: cannot run test program while cross compiling
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c880b77..dd40c7c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -580,7 +580,7 @@ AC_TRY_COMPILE([
-         AC_MSG_RESULT(no))
- 
- AC_MSG_CHECKING(for usuable C++11 regex)
--AC_TRY_RUN([
-+AC_COMPILE_IFELSE([
- #include <regex>
- #include <iostream>
- int main() {
--- 
-2.21.0
-
diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
similarity index 92%
rename from meta/recipes-connectivity/kea/kea_1.7.7.bb
rename to meta/recipes-connectivity/kea/kea_1.7.10.bb
index c72ebff056..78e0a0e979 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.7.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -9,13 +9,11 @@ DEPENDS = "boost log4cplus openssl"
 
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0001-remove-AC_TRY_RUN.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "4f8d1251fd41ef2e822a4eb3f0797d46"
-SRC_URI[sha256sum] = "0bba8b045672884a928ff4b2a8575ac5ba420eb6ba47a9338f1932bc38dcf866"
+SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
 inherit autotools systemd
 
-- 
2.25.1

