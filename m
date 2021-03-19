Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.3572.1616143515861986079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cUkIcRGI;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x21so9813315eds.4
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jgzlcPa8VPV5B4XdqUc8NBhUroz9IQSgYoXdkKRlxWc=;
        b=cUkIcRGIaNyF4DbOZD/m8AGKe/IBbiMomC6LudZ5NB3zd5Wc+3uh6Oe7u4evjizrIr
         hhhmzd4WlpynIUa4QtgjG4uW2IZv7cAu2CUDNmohH5w1b6l61mBuNFXHrvDDGMTlnmAO
         3jPEfZWN+SjrExSw/b7NxX4ZtomIUZqj72YLnKlXgZXCuS5OyvRV+U0jWQdiHH66G+hT
         3jh1Tuz+iO0KbHrTrdS5ya/zUh9eXqjmTmy/PeXs8rPFfSkzoEPgTHf6V9EpFf++xlbL
         dUerDi55gKsQvFT6iLL3ieWIqtdzXwxkIZ+43ioRuvB6BGUgZK1mMkKODf0K8Tolh6AU
         xWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jgzlcPa8VPV5B4XdqUc8NBhUroz9IQSgYoXdkKRlxWc=;
        b=ufgPujjp1Sp0t9bKU1jU/ZGqrEb7OzrpKIFcFaEHhy+x74fF8XyjZakRxzK8AS6Gml
         p9hi2xlJXtxFh+c85m0f8clBdQUvNC+61rH3ucM9l03Z8HvtZkN2r4XdABP+iim8hEk4
         EzdvIrig5AOIYvEeRRkNn0PrqpMSGrA3YVg4h2WoJ+oUSV+2+Qq3/8CzSnv8JyEWBtNj
         uNAMZTimUSxkqdBftJi/8sXUBIr4YNDrpKFDRC2lrBWFDOtBFcpsJoEHKfHxLN8dN9fD
         XiZQ19f38D2cQy2Mt7QlQzzuX4icj+cwBLIswEBjE5+KEPNha1VNkilB13zQpymPuBGz
         7K8A==
X-Gm-Message-State: AOAM530xs7UuIflExlnOwUUDNgM2NBGsswu2P+O2EiH/Bzx7bXo1EtKe
	x1QMD7vl6/idtC2pK3rLNL+6BD2O6wX3rQ==
X-Google-Smtp-Source: ABdhPJxuOWzfbxUctKCa5mbANmcLTvZyl+5PMTltooj6u6Omv+elpx2GqYoPGBP7+G0kLkV0U9KAPA==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr8056586edp.167.1616143513934;
        Fri, 19 Mar 2021 01:45:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/16] libhandy: update 1.0.3 -> 1.2.0
Date: Fri, 19 Mar 2021 09:43:55 +0100
Message-Id: <20210319084401.576728-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libhandy/libhandy/determinism.patch       | 35 -------------------
 .../{libhandy_1.0.3.bb => libhandy_1.2.0.bb}  |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-gnome/libhandy/libhandy/determinism.patch
 rename meta/recipes-gnome/libhandy/{libhandy_1.0.3.bb => libhandy_1.2.0.bb} (89%)

diff --git a/meta/recipes-gnome/libhandy/libhandy/determinism.patch b/meta/recipes-gnome/libhandy/libhandy/determinism.patch
deleted file mode 100644
index 7c4177f5f5..0000000000
--- a/meta/recipes-gnome/libhandy/libhandy/determinism.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-hdy-enums*.c.in: Fix reproducibility issue
-
-When full filenames are used in generated sources it makes the resulting
-debug packages non-reproducible. Best practise is to use basename in
-comments instead.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/734]
-
-Index: a/src/hdy-enums-private.c.in
-===================================================================
---- a/src/hdy-enums-private.c.in
-+++ b/src/hdy-enums-private.c.in
-@@ -7,7 +7,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-Index: a/src/hdy-enums.c.in
-===================================================================
---- a/src/hdy-enums.c.in
-+++ b/src/hdy-enums.c.in
-@@ -13,7 +13,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb b/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
similarity index 89%
rename from meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
index a53a1388f9..1e37feb20a 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
@@ -9,9 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-0 \
-           file://determinism.patch"
-SRCREV = "7126d2e8da9dcdeb5751e60ff6a74930804f9637"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
+SRCREV = "7b38a860ffcec6c2ad28153358cc3d037ddb618f"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.29.2

