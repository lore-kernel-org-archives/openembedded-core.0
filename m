Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.7417.1614229635846907639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 21:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GOQBpUBA;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id j24so2840189pfi.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 21:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysQXjCV+ueYiKH9xFATrIiuLF+DeT7/ruzhzgyYWM5w=;
        b=GOQBpUBAYTyQR2IfwEW2lgfzLXOTTSE17Df0QhAa2XG2R0VWsjDkyeSAvwXuTUkuwx
         cU/d6Yx6Zm2tBFHmbgmWGnxtMgGlloGuKq0zjICuTbGB2sPcdU62BnFqj5CKGYXx/gao
         5q+jtEmuo2yCDbOxkn9YSYzhIrpx/UApSnIEnU8RSohjbUW75J06cTEWMU0VpFFYFlQD
         fsvjrgjWrdpm/o9/WaSCQm+x1fl8ynssU3gfNp8fi54RM2i+Y7ZQEZLHARSSEwuIIXlR
         yPMuWVA3pQBi76IB22CLKNltIwXMGN+iM9QJO/QErf66DtZfPIA5e+j99gTTWvn4fWNC
         pARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysQXjCV+ueYiKH9xFATrIiuLF+DeT7/ruzhzgyYWM5w=;
        b=dVL2Su5v54gKhn1r9hPb1aAhSeLodhGm8gT+3ucHYxiOXuj81GHRT7EJZ/1oxX4V8y
         PYDvRR6y4yRYWSZ4CniMrJOnwKBIQpzdI0Ba6BA026U4HiW/UMJz66G8SjoLtWyf0LDv
         edfpiUKPqp/OGIAZIBNOXxNPp1tzxoar3KDwpdWbaMsPX6ZrdB1c528hsRb1s2nUdPWy
         eLqxPdWyL8vLGkkpCwvoTEkwWzEh6vvft3ISQZgpovNujKOn8Eg6Zn4V2nbLESMDmA9q
         LqyoYyYEdwEqq1abW0WXt1z8dfiiz+BtfX8v4eqwQ4+ANKAgBsVjIsw6k3RHzYwcxv4t
         gPZw==
X-Gm-Message-State: AOAM532GcHLHCrJhDdCnAP/2mLEbuMU97WJmgQ9TyRtAzjUqMnF7DcGQ
	w1EfRPQbYIph6nSNdpMaFoV8c/xkB6cbBA==
X-Google-Smtp-Source: ABdhPJw+PDh4dLi66KGqOZpamaL6K5TluXNWQtjbes0yoLPi+xLbjLGnAVTSbHMkdsEy71tR1xZKaw==
X-Received: by 2002:aa7:8c49:0:b029:1ed:c1dc:4421 with SMTP id e9-20020aa78c490000b02901edc1dc4421mr1561724pfd.43.1614229634739;
        Wed, 24 Feb 2021 21:07:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id u9sm4291752pgc.59.2021.02.24.21.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 21:07:14 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Upgrade to 2.36.1 release
Date: Wed, 24 Feb 2021 21:07:09 -0800
Message-Id: <20210225050709.1900936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index ab0760621b..489a72fa16 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -16,15 +16,15 @@ def binutils_branch_version(d):
 
 # When upgrading to 2.37, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.36"
-CVE_VERSION = "2.36"
+PV = "2.36.1"
+CVE_VERSION = "2.36.1"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
 BRANCH ?= "binutils-2_36-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "fe0e833171513c1d89668bc5f454192d2db39bce"
+SRCREV ?= "7b7c7090a2bf33812762a06a02b1719c94d1c3d8"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.30.1

