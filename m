Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.1387.1614277026612630635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 10:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BsakZPMT;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id z5so4166870pfe.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 10:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZQN8Oux7CYK5lnjt0r9xWhFov6hE6b9a4jmsVFIqE8=;
        b=BsakZPMTn17X9rS1SmAEvFvZHppkcIyJS1dRndLNKa9jyuY7Cp50FLifT33lu96EV5
         4ZxYD5YcA1UfVTzHBNr2T8bFqj8xUg+svuni7qGmJhLyFuP99LyWuvwf7fOXMvZdLiuU
         qZ03UETrAVZ0alIcE+GtgVK01EEhkM2jHofGwHPkbinY6wwTcFyipQJ29EtstuWmeirg
         wKPF2rW8mrkYOJdqG5ZuWvEag1O2E1pbD9+Q11YNO62Djhp+2BshJwGkpj8Rsg5iSKdJ
         /aKRDwsdY/qJKwrgirZP5NETBSHFTC7f54teTFOl3hf/swUcmdHmZYXJwqympJDKiTrY
         TAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZQN8Oux7CYK5lnjt0r9xWhFov6hE6b9a4jmsVFIqE8=;
        b=GKgjUO+Fg0V0sW1WrEDJwO+az8aJD+PXf2Cy9pU1bE/V7Trx41LYSQYtuGTtCHlkY/
         1L08wJewF3D2CcGY7xrJVufhFK0GKPxY+qubIxH1nNbYNiIcraymWSJ624Yk/J5CW3+y
         mkNVZHbEY4Kb3gqCaXPqwUTulTEXoU/NJ+oBZ/3MRs+b/XToA3rxzALeVLl6A4d/RNCv
         WY411G2H8JwScpWDAZ6EKe233PMK+ce7rL8U6Wd60LBP10agSL9+9cU+SDZMxD8izhSH
         qSqwvY5WSxUZ5KC7h/C1FKo41WkkYtGrDEiF8OT4qlwYNiWeL2VxYqLACfbonnIk+P/O
         8MZg==
X-Gm-Message-State: AOAM531UPhOhCBUGtryYDHvPFChxzoGqh/v8XRA42jSkXpKpchvHjOi/
	6ovsIws0S1Yw9mytAWyJ7WIr3a4N/DgKyg==
X-Google-Smtp-Source: ABdhPJyHkfoFHkQQ1K4+09i+JtOVoCv5+RAmtP03rKj6LjST/J2pG8XN53aI20k91WRcyIg7IVbPFg==
X-Received: by 2002:a63:389:: with SMTP id 131mr4062310pgd.316.1614277025606;
        Thu, 25 Feb 2021 10:17:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id n6sm7060216pfo.201.2021.02.25.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 10:17:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] binutils: Upgrade to 2.36.1 release
Date: Thu, 25 Feb 2021 10:17:02 -0800
Message-Id: <20210225181702.3407823-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Drop https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=8e03235147a9e774d3ba084e93c2da1aa94d1cec
    this patch causes binutils build to fail on mingw

 meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index ab0760621b..2968291889 100644
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
+SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.30.1

