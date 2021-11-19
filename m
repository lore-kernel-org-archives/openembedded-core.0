Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26325C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:05:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.7587.1637319942675308737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ns4xwiJ/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id o29so8113450wms.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rO1/fB8jav1kvZ0t1g4hgxXZjt4Up/ihu9HHdE/lr6s=;
        b=Ns4xwiJ/S7RozpSnxjPTbytqgDul8E3nhoqBwFQRsrR8sFuhy6fa964dUdznLCG1Q7
         PkahLsS3wPEJtYQwUSeBpTItsiu+/hCmD3l3VSc8Q7El7xMaBpHGmyQM1LjXVmCKtt7M
         MMXSugOjCPEXlyZqRD3lXJvhlMFdGXr/dT0bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rO1/fB8jav1kvZ0t1g4hgxXZjt4Up/ihu9HHdE/lr6s=;
        b=NPEzISTWHsfmEq0w8xSrVRd7oEUn9wOnlDB64xAsff2ucmRMINLn1j8d8min4oZTp5
         tj7+bT1QIS1mwq52T+87sm7eJWCkD+3C8jV/gLoz9Bjl4yBHHA2CgY+ujtzT6ZoX/X+J
         058U1G1VUfz1H0UnL0edRqnMIYsHAgMhNdoVhlSdCsXRqddSqft2sztca7sl3LXO2kzS
         Kl7BWV2eQRYp+8gem0hnZGjB0+dMjcJTI1/fBSDwqTwoUxoxLVoifPjRHGmlnxhfdHrO
         UdWc8hykysJZtKYUE+MBxTf/gh+Vi45L2oXFslM4VGvrQo0eRrTqo4yiosNGMQmo7Zbp
         Ithg==
X-Gm-Message-State: AOAM5335+msopwQN+JCZmX6A+f+wcvzZWHCY+/z3Aq8TkK8TEq1pHH83
	SPumtw6dhR9zSotUkE/2t47dyyC+vvoFYg==
X-Google-Smtp-Source: 
 ABdhPJxDqLjpblR4SbSbOwkWHmQKTnQaqIlw4TiCK5sV3rADTtJl96Vp3/y6ceOyrNKbxZufGjcCsw==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr5788400wmi.46.1637319940756;
        Fri, 19 Nov 2021 03:05:40 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fa24:506c:323a:9c49])
        by smtp.gmail.com with ESMTPSA id
 d9sm2536186wre.52.2021.11.19.03.05.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:05:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Tweak Upstream-Status formatting
Date: Fri, 19 Nov 2021 11:05:39 +0000
Message-Id: <20211119110539.4095135-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:05:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158503

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch | 2 +-
 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch | 2 +-
 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch | 2 +-
 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
index 6b1d4e3fce4..e4aee10e370 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
@@ -20,7 +20,7 @@ gcc:
 	the command line.
 
 CVE: CVE-2021-35465
-Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=3929bca9ca95de9d35e82ae8828b188029e3eb70]
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=3929bca9ca95de9d35e82ae8828b188029e3eb70]
 Signed-off-by: Pgowda <pgowda.cve@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
index 98841e6d7c1..e09818fecf7 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
@@ -15,7 +15,7 @@ libgcc:
 	Add vlldm erratum work-around.
 
 CVE: CVE-2021-35465
-Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=574e7950bd6b34e9e2cacce18c802b45505d1d0a]
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=574e7950bd6b34e9e2cacce18c802b45505d1d0a]
 Signed-off-by: Pgowda <pgowda.cve@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
index d87be198669..c7a7c76bf87 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
@@ -16,7 +16,7 @@ gcc:
 	use when erratum mitigation is needed.
 
 CVE: CVE-2021-35465
-Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=30461cf8dba3d3adb15a125e4da48800eb2b9b8f]
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=30461cf8dba3d3adb15a125e4da48800eb2b9b8f]
 Signed-off-by: Pgowda <pgowda.cve@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
index 12dfe682fa7..9dd6a313c2d 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
@@ -17,7 +17,7 @@ gcc/testsuite:
 	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c: Likewise.
 
 CVE: CVE-2021-35465
-Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=809330ab8450261e05919b472783bf15e4b000f7]
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=809330ab8450261e05919b472783bf15e4b000f7]
 Signed-off-by: Pgowda <pgowda.cve@gmail.com>
 
 ---
-- 
2.32.0


