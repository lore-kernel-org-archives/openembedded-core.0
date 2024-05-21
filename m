Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28838C25B75
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:04:14 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.16970.1716289443682751838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I93g550z;
 spf=pass (domain: mvista.com, ip: 209.85.160.43, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-244bdd730dcso1581174fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1716289442; x=1716894242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnD63ZYJA54yGtRr0+OxhNVmsJGV79mvm/gtKoneJBg=;
        b=I93g550zkUpmQyGOMITEotkanpQPhAW2UDazcRhhpSs45RIvvrs2DqU1Lv7tGYd/fP
         zzenm9+G0AJNhDB1akmbZEzd8y16jM/lXZdWh5+KpCgY4AREkGVExM1zhU7+0tBMRFIh
         GpUskKyMQRS9xpeTfdOPNdMsCHBrJuAtM6yeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289442; x=1716894242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnD63ZYJA54yGtRr0+OxhNVmsJGV79mvm/gtKoneJBg=;
        b=TlpxOB+BfvNeiGvgMmtMzn0mEwmQSzvyILib8OPKvAbmUXJ9rvZ9mFQOQHvdcD37zp
         w9Wp9gFD1MV5+/Qcr4ZIJmvi2x6o9+QTQvr+u1rfo9wJ7tKxK+774RrPYje3gzePk/Nu
         ux/6ZnrLYuJvpSbRzeQ3laIO1ULalYGhy+GyspKM1oDvpCpc45Y3xL2FwS4e8Qq8K8vw
         Vncg3Rl8rjeWMxYNLyoGuqGIr9YiXKLtVf3vIZdVdgYoQbbzqRtsbOQ8hug4cFlUZKHq
         JlfiqgeeL/C0q/FNWF9ANrClG4K3GzWzZeP9Xt2W26KoXKFDL+HCSmM5gYl3VvS/xvtD
         IaCg==
X-Gm-Message-State: AOJu0Yxgqxz1aEzTaP9NPTvVUShY8Qe4DsGNFiI8ch1CZmAvYDedd03I
	tftB5vJm1V/EwVrCODMgFi83NlVhMSVlnt8YcCgArus/mQvlIiG0gtl5mAte0kc6s0fpPvIDVwO
	a
X-Google-Smtp-Source: AGHT+IFjYF0Jh7mHgWZcACrzjoUD4hAJfLa3F0WDoncLOWgMi5yqXm1+zKQkeBlMf8Htae+CWo+7iQ==
X-Received: by 2002:a05:6870:a11e:b0:24c:53d4:2685 with SMTP id 586e51a60fabf-24c53d4c9cbmr1111721fac.1.1716289442460;
        Tue, 21 May 2024 04:04:02 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:7937:4aa8:4ee0:b627:d8cb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-24c4f05672fsm298382fac.9.2024.05.21.04.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:04:02 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] binutils: Rename CVE-2022-38126 patch to CVE-2022-35205
Date: Tue, 21 May 2024 16:33:51 +0530
Message-Id: <20240521110351.4397-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199616

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2022-38126 has been marked "REJECT" in the CVE List by NVD.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2022-38126

As commit changes in 0016-CVE-2022-38126.patch fixes CVE-2022-35205.
Hence renamed the patch.

Link: https://ubuntu.com/security/CVE-2022-35205

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc               | 2 +-
 .../{0016-CVE-2022-38126.patch => 0016-CVE-2022-35205.patch}   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{0016-CVE-2022-38126.patch => 0016-CVE-2022-35205.patch} (94%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bbe7bb57b2..4a8831b534 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -34,7 +34,7 @@ SRC_URI = "\
      file://0013-Avoid-as-info-race-condition.patch \
      file://0014-CVE-2019-1010204.patch \
      file://0015-CVE-2022-38533.patch \
-     file://0016-CVE-2022-38126.patch \
+     file://0016-CVE-2022-35205.patch \
      file://0017-CVE-2022-38127-1.patch \
      file://0017-CVE-2022-38127-2.patch \
      file://0017-CVE-2022-38127-3.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-35205.patch
similarity index 94%
rename from meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
rename to meta/recipes-devtools/binutils/binutils/0016-CVE-2022-35205.patch
index 8200e28a81..a582df4466 100644
--- a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-35205.patch
@@ -9,8 +9,9 @@ Subject: [PATCH] Replace a run-time assertion failure with a warning message
 	message.
 
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e3e5ae049371a27fd1737aba946fe26d06e029b5]
-
+CVE: CVE-2022-35205
 Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  binutils/dwarf.c   | 7 ++++++-
 
-- 
2.25.1


