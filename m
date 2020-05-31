Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.17595.1590940413511775446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvwAClMX;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id l27so6906520ejc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HENSdCTz0SX498l22EXoqVHRwfI2wHzKcJtYFSpX6+U=;
        b=BvwAClMXlcieHXUOfe7bLc4uwqfgMRdBRCQQbl0W2/u91rrjCNcq3iMxvx32ngbbHi
         /9ROlJV3N7pnEyQ5FuEVXf1mePw6evERLR1CPg55WYy/+yTAfwbjnpWaeMEK8+tvNKgv
         uAUNngmsNnuJY+o18mJwmetYU0IG6HdyEdgmSVt3Cw01JjAlD0AFb/pm227qjotlim4D
         oXPs9uM2TZsg/B9gg4SSBaWOy3lFGZY8AaEyqc6KaCbikJVLYj/qPv8CvCvepYfL9vLk
         6lbyLh9KQAKnyvc+eOcpV28fL2e7Z+gCMpplCddCPNLo+iUfr5CeNPb1wpBLETOCPPRq
         hldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HENSdCTz0SX498l22EXoqVHRwfI2wHzKcJtYFSpX6+U=;
        b=SS6EptRwCJgM/RUpZu7aVmT1dTeggj6JWPsqjYr39dhqxisDLIBEAI6U2bR0FfI3D8
         nJMBoYN/B1i1ELM+oUGNe+mFpe1ojmCv9mH74+7xkA9V0PZG57lsAb5YHHXCGppWzXVc
         JdQw/CGBwTFg4wMq/3jYj+ue9BA/M7KoZYptkcAnH9sYkUw1TzUbip6qmpLyiIsatxvQ
         lXs3zHH+gEqG1jxY7fTIwmw9nO3LNIhc0IEPu3hqFTItpaoVGV2hwbEADYePjuTYHbbW
         2liC1zuqHBLt3IKO+92NgA4SQJaG9WofvH2q5kBKG3YyIh4alxtVRReY24jiBTbeJSXu
         QzjA==
X-Gm-Message-State: AOAM532ICzFLEZtnXTlxaSL2VqbOpFQUuoArfvGdGI2RZC2xdmH82+GX
	mC3ZqlxGCS00SHx+dTbQ3a0achMx
X-Google-Smtp-Source: ABdhPJwtVTHjvzNuHOfUpDdKAfPhA5hpNp9QAFI38sCDP2Iffq4JVzi4lbDheI4VQBEfcwvKQ0Dg7Q==
X-Received: by 2002:a17:906:5fcd:: with SMTP id k13mr3555209ejv.459.1590940411894;
        Sun, 31 May 2020 08:53:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/70] dpkg: upgrade 1.19.7 -> 1.20.0
Date: Sun, 31 May 2020 17:51:49 +0200
Message-Id: <20200531155254.10283-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dpkg/dpkg/tweak-options-require-tar-1.27.patch    | 11 ++++++++++-
 .../dpkg/{dpkg_1.19.7.bb => dpkg_1.20.0.bb}           |  4 ++--
 2 files changed, 12 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.20.0.bb} (87%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch b/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
index e9119918b1..ac59dce69e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
@@ -1,3 +1,8 @@
+From 48bcc51ce042d1b779b34fae454c52b15bdd9cae Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 22 Feb 2019 01:47:16 -0500
+Subject: [PATCH] dpkg: 1.18.25 -> 1.19.4
+
 GNU tar >= 1.27 is required for --owner=NAME:ID and --group=NAME:ID. And fails
 to build .deb packages with error:
 
@@ -11,9 +16,13 @@ Tweak tar options in dpkg-deb source code to make it work on old machines.
 Upstream-Status: Inappropriate [cross build specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ dpkg-deb/build.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 68d187511..86fe22e25 100644
+index 8436839..67c0c20 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
 @@ -462,7 +462,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
similarity index 87%
rename from meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
index 50fe54dee1..1e822bbdf5 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
@@ -19,5 +19,5 @@ SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
 "
 
-SRC_URI[md5sum] = "60f57c5494e6dfa177504d47bfa0e383"
-SRC_URI[sha256sum] = "4c27fededf620c0aa522fff1a48577ba08144445341257502e7730f2b1a296e8"
+SRC_URI[md5sum] = "f88f077236a3ff3decae3b25c989893d"
+SRC_URI[sha256sum] = "b633cc2b0e030efb61e11029d8a3fb1123f719864c9992da2e52b471c96d0900"
-- 
2.26.2

