Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.2855.1616820273904636508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 21:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a2+/23jG;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t20so1881810plr.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 21:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CkZqFpwFNz/PJZvx7BXcE012oa/m309E16a2ax6UJ4Q=;
        b=a2+/23jGXY3hQaFZ98CkY2wimgnHuFGX8bEdWMfS0eZT38wrdyGzPZ7BqC9gleF7Y2
         k64e5VXIf2NhB/bVk3NrkZv/DwXIEl37HpHiPpIfbevfXVHwqDmPjKYcl2Imnj1n6EB0
         ocaOVL82uJBLBc4jEnhcqUl9nzVUkhW/YKIRtsZe7BEi3+eZOnd+CA1cJ8SG3uX0na3g
         fKMKDbk/Sz1SM5O92s/aNeg3bG75SUcQ4IkqFCcyVw/vR4WU2pyF7RqfVxXmcP3xqJ9n
         5KBQHG0IM9N16mlKHraPir5AGsRQYpSBF+OvSCVrTsFLkf1me8R3BGylIy2hNndMgQJU
         Oidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CkZqFpwFNz/PJZvx7BXcE012oa/m309E16a2ax6UJ4Q=;
        b=jvRbQu52tqSU64c2ca4/e9LpsMnNI+912nUFhHnuTWkfWBOR2e6CWXqGmzOBxRy/Dk
         0OwJ/RH9xlEIlHhdLF8QXzMLJZ5fodH3kTzqQpAV1gfO3cC8Pmq+WuEXzZWt0V5/yqEJ
         XHfWAU+dEMQOAzAMOvMmZsisMd4O9RaUQTbxWw8H4e0zF/smc1f9GK4BNokH2bHBOFvr
         Iex1Dn3bVRKw8983mzsmUstF6/0mT8uTbgHrcFpxu5FugFfo4BM2+kJ98U+uZL8quU5h
         gmvg5TkTpOO3cTNMpOY5Ib8rTbrZtB7c1cR5OxBAwyctxnKygxBMf+Jc4xQS+6QWxcrn
         Hb3w==
X-Gm-Message-State: AOAM530Z1Pi5HEF34sIaD+sEnt7iUAmB/BlR2n7UrV/ktclHGTKkRHSS
	u6qmwZSAPnyDNXdHhwQ4MpH9WMqPn0fyuwYn
X-Google-Smtp-Source: ABdhPJzDxzoPr0yNgLbgJZ8Qd5kDOwLJr3p1S3SAr0FbthBEFwop2IG7OEL/4QnHH6ggvypVm295nA==
X-Received: by 2002:a17:90a:ff91:: with SMTP id hf17mr17451286pjb.34.1616820272955;
        Fri, 26 Mar 2021 21:44:32 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id k127sm10712314pfd.63.2021.03.26.21.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 21:44:32 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
X-Google-Original-From: Minjae Kim <flowrgom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowrgom@gmail.com>,
	Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] git: upgrade 2.30.1 -> 2.31.1
Date: Sat, 27 Mar 2021 13:44:12 +0900
Message-Id: <20210327044412.26281-1-flowrgom@gmail.com>
X-Mailer: git-send-email 2.17.1

Includes a fix for CVE-2021-21300

Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/git/{git_2.30.1.bb => git_2.31.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.30.1.bb => git_2.31.1.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.30.1.bb b/meta/recipes-devtools/git/git_2.31.1.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.30.1.bb
rename to meta/recipes-devtools/git/git_2.31.1.bb
index bc1635ada9..6bfa1f7a1e 100644
--- a/meta/recipes-devtools/git/git_2.30.1.bb
+++ b/meta/recipes-devtools/git/git_2.31.1.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "23a3e53f0d2dd3e62a8147b24a1a91d6ffe95b92123ef4dbae04e9a6205e71c0"
-SRC_URI[manpages.sha256sum] = "db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138"
+SRC_URI[tarball.sha256sum] = "46d37c229e9d786510e0c53b60065704ce92d5aedc16f2c5111e3ed35093bfa7"
+SRC_URI[manpages.sha256sum] = "d330498aaaea6928b0abbbbb896f6f605efd8d35f23cbbb2de38c87a737d4543"
-- 
2.17.1

