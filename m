Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7325.1793264078081543354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KT/WPq2G;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso340345c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264077; x=1793868877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VS6uyItG/+NB2NcXcEmp3vBI+YbmvI8XOmbJY4xMAus=;
        b=KT/WPq2GYXA4bo7T2GAUbtGbaja4MIPxCDjh8TrSY9Ha9vHOVEZMLHkPHv1NIf2UGu
         3WAipOGlk6yqTlb1+mjA/+TTtEzfdF2Xf/u9+4qCiYj8rRH6XbdzfYeR+8h+rbuVf73A
         Wt8t7tLAbUWEkEPPArRobD6oh999ZPqQjf7atonvAEMcTNdqWESwHzYDr4ODFeairdOb
         +u2M1lxWHXAM1+o7PBrOvaqo9yiIYiZmtFS6QGrmIk+Uh5sySTOkhtuwLNUdVhEn954f
         mqbZOcH7uGIYnxoLGbrYBEPXydsPHZUyWxg8dzdt11XYPeUcW4PO1fbZod3TWKHRtwRZ
         Fnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264077; x=1793868877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VS6uyItG/+NB2NcXcEmp3vBI+YbmvI8XOmbJY4xMAus=;
        b=PXzyzOGs4n60lla0hr5pANYOBBImKclyTSraFwZP5YE5yep3b+zLU6+rlKzndHOHQW
         PDxy06TSNxRxZb8v/6l8pMYDSeqDBCCBLohohdFghluSpVekK0A2nTI6USWabFXlYyn6
         Os23HiVJD+dvVFLmg9kZCpwQhXgyRkNSlnuHw25hEkF00Hh3ogyApY2fVDy9aVbQlhUj
         815/6TsqQcKJZL14E/iLuvlNJSA9/stzR/se7gubuvml6dg/0Bs1BC0/kQNFLXXw56Fy
         20vT7fr+RzTDnQtbV+CGxlKpIi/H3Hr+sTIdu9OHSW5L6hHLE0DrfxzikJZydFVEzXlL
         U+Nw==
X-Gm-Message-State: AFq9FYKtk/JdcVe95oe6A0PL2YyaBKdLiinVa0NoSJ/hr/+vA2NeAI8t
	KoqBhBqJ1O3SJv/Se2ReW9+mK3VZuhtvg5zTwCdx0Jz3trVJs2aU8S444qhqLg==
X-Gm-Gg: AYBFou0OyEflamU9HRS/zbma84qoFMmkE235eO8bcDJwL/KY3LNX3xcj/HBqzfMpx8z
	MLd/+AmF7sTaR5pzFVXUhzX67C33+2N/PyRBFhmuvNb3eRYTDD1eA4ufih3Z9VtQG1NRoZp13GP
	OXIhfvlxA5yOaDKclwqVaXxrTb8q8n8j3Ot2BUqOVY5nFWn5CPtdLlluxUIRoEF6kLBSspmVmBW
	vIoKW/CBmBP396UlsL3altoUgkeN0LYyoog8Qi5G9NZqYDQmPTpjXKbss+2aWIXmSjj4CWUhbAq
	EgEcw0X9u5hNC7ZKAJbKG3zeKU6VerIz3sd3EOy3dusUgRwEkfR1L7Pg3XbMKHrasdxSF94ddp3
	92Y+whmQup/YXoB4omAqPqeM9ainjw92GS1trTe2GWWEfsyh1S6OvVOaZ/3XUIC2f4slpSmE/pl
	7dU7ZKqW0MmBUvdsstu+0IVsYURk33j9p2QwauTJTZbahXR2hzdI2jcarKoekMv/H6VFrCMk+WF
	qsm9AYrRN73fTzAG+QNz3E7zNzm7JaJCQVSZYMm929n60Q+0LooyR5dHHP5+fxrkO1B+W06BTe1
	LY+qiYg4L7SlXUsG2R03FyvAkoxXI9RX8kJYzWF4rvCPLvfGMZfwVZ7Y0QPinpy8
X-Received: by 2002:a05:7022:ea8e:b0:146:5f73:d45b with SMTP id a92af1059eb24-1a941feb9b2mr2755807c88.3.1793264076916;
        Thu, 29 Oct 2026 01:54:36 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c81490csm15056178c88.8.2026.10.29.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/4] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Thu, 29 Oct 2026 21:54:27 +1300
Message-ID: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248914
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 44872c3637..d8dd7a3bce 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026e"
+PV = "2026f"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
-SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
+SRC_URI[tzcode.sha256sum] = "5a18da01393679ef2559214dc687563f7f3d05691f6f58b7fbc0166f3e796cd6"
+SRC_URI[tzdata.sha256sum] = "01b4a91cec5167ed48c11e8ab78f2048cead78ce94b0cafcad0ae8c5a3044d3d"
