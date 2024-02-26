Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E009FC5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:35:16 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.7217.1708986909110620126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zi7Sq9Ch;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68fb74416ccso15644716d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986908; x=1709591708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYvh/xMuTMXuPzuCfcvFpP4OPSOuZ1nnKKqpvSQ2moU=;
        b=Zi7Sq9Cham7LOfKdyTWvR6EEQjeVInLoGTLzpHJ42g2ll8hJhpbyE7qiEpr2cEH33K
         92sWELoXzBXpW8U102D8VcfDwndulZHRnVXph2R445eRIIqwGx/6ea9Emk1wZ/qUY2ak
         jH+JRxfO7NUKgjU1bdoMpfuntaCM1ofHV5fbAnAIDK2xRCZMIk90kmcJL4tQwNSwy3Ac
         nbDKKKMY8JbqbQmkC0uLU/7q9Et4KHHtA4ri30kexaQ3GO53E3LQuJQHHx9yzYMR4coG
         54O1i8EK3c0E/v+VupFdZnHtBwVz+gEU2XK/PHqXszW6t5UpEd/ko2V5be1bXQO/Rv+I
         lD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986908; x=1709591708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYvh/xMuTMXuPzuCfcvFpP4OPSOuZ1nnKKqpvSQ2moU=;
        b=TyFzKlWci+j7Qm6l81kGVdN92XHNK01JRr45lj/uzMNRBbOYsu/jA7Xu+fXAQLa61K
         WiD9OS710AlHDCdi9aiJU2BD/HK63OVy9U/ETvtUo968DjV6SrQsJY5AZcjA3DUmz3hg
         jYPA+tBXbsgs9eUNcNy04Px83hFdy0uH73NdH3J8A1KUfMzbFI+75ExDBF8/BOgD3MYx
         fT4kFd4EXpoybdYlbx2RTaEqeU8aMSNxT09uQyWps3E0XtYA+BqE/9xZwZEfgO1ARhb4
         s+L6MzXp+gsC7+oSjQ9SvlDyZvLkQRLzpoQK95huijA4N8na/dFGoGAKjV+19Dt7pHgX
         IfVw==
X-Gm-Message-State: AOJu0YwNw6JVGQcoJhDSLmNH2WKbUWrkHNub4yl6cN+CwokX2MZSIaBG
	znqxZwbOUJJQ/iZ2MrHBVgQrbMp5UJKblYmv5jOcsFmsjN6aH9H4cLmPL3kt
X-Google-Smtp-Source: AGHT+IGI+qo2ZlOaNTcnL716nTeDxmLG507sugQg5bjImBh6t/uBcO1Frx5n4NrsouOrz8ShIBmZew==
X-Received: by 2002:ad4:5de7:0:b0:68f:cf6f:6782 with SMTP id jn7-20020ad45de7000000b0068fcf6f6782mr433802qvb.14.1708986908041;
        Mon, 26 Feb 2024 14:35:08 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:35:07 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/6.6: update CVE exclusions
Date: Mon, 26 Feb 2024 17:34:53 -0500
Message-Id: <04fb0a35780a79670f04de4f04bd09571d76b95d.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708986570.git.bruce.ashfield@gmail.com>
References: <cover.1708986570.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196230

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.6.inc               | 124 +++++++++++++++++-
 1 file changed, 118 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 0274496da3..723a588429 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-21 00:38:40.167585+00:00 for version 6.6.17
+# Generated at 2024-02-26 20:14:05.493685+00:00 for version 6.6.18
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.17"
+    this_version = "6.6.18"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5144,6 +5144,70 @@ CVE_STATUS[CVE-2023-5197] = "fixed-version: Fixed from version 6.6rc3"
 
 CVE_STATUS[CVE-2023-52340] = "fixed-version: Fixed from version 6.3rc1"
 
+CVE_STATUS[CVE-2023-52429] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2023-52433] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-52434] = "cpe-stable-backport: Backported in 6.6.8"
+
+CVE_STATUS[CVE-2023-52435] = "cpe-stable-backport: Backported in 6.6.11"
+
+CVE_STATUS[CVE-2023-52436] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-52438] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-52439] = "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-52440] = "fixed-version: Fixed from version 6.6rc1"
+
+CVE_STATUS[CVE-2023-52441] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-52442] = "fixed-version: Fixed from version 6.5rc4"
+
+CVE_STATUS[CVE-2023-52443] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52444] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52445] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52446] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52447] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52448] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52449] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52450] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52451] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52452] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52453] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52454] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52455] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52456] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52457] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52458] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52459] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52460] = "fixed-version: only affects 6.7rc1 onwards"
+
+CVE_STATUS[CVE-2023-52461] = "fixed-version: only affects 6.7rc1 onwards"
+
+CVE_STATUS[CVE-2023-52462] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52463] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2023-52464] = "cpe-stable-backport: Backported in 6.6.14"
+
 CVE_STATUS[CVE-2023-5345] = "fixed-version: Fixed from version 6.6rc4"
 
 CVE_STATUS[CVE-2023-5633] = "fixed-version: Fixed from version 6.6rc6"
@@ -5234,6 +5298,8 @@ CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.6.14"
 
 CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.6.15"
 
+CVE_STATUS[CVE-2024-1151] = "cpe-stable-backport: Backported in 6.6.18"
+
 CVE_STATUS[CVE-2024-1312] = "fixed-version: Fixed from version 6.5rc4"
 
 # CVE-2024-21803 has no known resolution
@@ -5252,11 +5318,11 @@ CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.6.10"
 
 CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.6.15"
 
-# CVE-2024-23850 has no known resolution
+CVE_STATUS[CVE-2024-23850] = "cpe-stable-backport: Backported in 6.6.18"
 
-# CVE-2024-23851 has no known resolution
+CVE_STATUS[CVE-2024-23851] = "cpe-stable-backport: Backported in 6.6.18"
 
-# CVE-2024-24855 has no known resolution
+CVE_STATUS[CVE-2024-24855] = "fixed-version: Fixed from version 6.5rc2"
 
 # CVE-2024-24857 has no known resolution
 
@@ -5264,9 +5330,55 @@ CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.6.15"
 
 # CVE-2024-24859 has no known resolution
 
-# CVE-2024-24860 has no known resolution
+CVE_STATUS[CVE-2024-24860] = "cpe-stable-backport: Backported in 6.6.14"
 
 # CVE-2024-24861 has no known resolution
 
 # CVE-2024-24864 has no known resolution
 
+# CVE-2024-25739 has no known resolution
+
+# CVE-2024-25740 has no known resolution
+
+# CVE-2024-25741 has no known resolution
+
+CVE_STATUS[CVE-2024-25744] = "cpe-stable-backport: Backported in 6.6.7"
+
+CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
+
+CVE_STATUS[CVE-2024-26582] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2024-26583] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2024-26584] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2024-26585] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2024-26586] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26587] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26588] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26589] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26590] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26591] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26592] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26593] = "cpe-stable-backport: Backported in 6.6.18"
+
+CVE_STATUS[CVE-2024-26594] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26595] = "cpe-stable-backport: Backported in 6.6.14"
+
+# CVE-2024-26596 needs backporting (fixed from 6.8rc1)
+
+CVE_STATUS[CVE-2024-26597] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26598] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-26599] = "cpe-stable-backport: Backported in 6.6.14"
+
-- 
2.39.2


