Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F86FC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.45914.1747040638623560703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hKY6mLCb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040645; x=1778576645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FbQyWpl3JmXN3sqqbPAgeCr/l4LQqgGSqnZQoj5Ne08=;
  b=hKY6mLCbzJv8LMZ1X8sjot3kGgoY3VDeH7vJfsTIQ82Yf3VYzXwXD+Sr
   t44q4LQkofcfpCTH3KK4KqhQxMJ7zPDGnA/PLLmUq3zzfT6ESWhme8wGQ
   UXLvsHwpcB9gfVcSLup/wDUr9QYCZLBMeZWka/SrfMs+/pNnptZhwpT1d
   Gru+dH+i5EVw4CMXlYAV4uCm24v/FdFTWlkAUAtEJc6fKQp/ZXAv08wF/
   xg3rC8N4u2iZdFyGMzx2eHbgsQ4XDzFL9ZGoNWEzTT5ywXBe78FDQIrzm
   8rp78hRX/90akHeTt3lEMISAZbvy+nYmepCY7dehXyOFA3LHE3xLcocXT
   w==;
X-CSE-ConnectionGUID: ekLrGt11R5ec5z0VyDJGuw==
X-CSE-MsgGUID: H48zFAdeTWelX3VZNraP6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199533796"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199533796"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E4877D5051
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A83A7CFB76
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 67FF71A009B;
	Mon, 12 May 2025 17:03:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/56] kexec-tools: upgrade 2.0.30 -> 2.0.31
Date: Mon, 12 May 2025 17:03:02 +0800
Message-Id: <1747040619-7566-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216336

From: Wang Mingyu <wangmy@fujitsu.com>

0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
refreshed for 2.0.31

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 8 ++++----
 .../{kexec-tools_2.0.30.bb => kexec-tools_2.0.31.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.30.bb => kexec-tools_2.0.31.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
index 8dc5fed765..5d994d9ffb 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 1a09bf71c2f541c2cfb44a00661051597bbd0b76 Mon Sep 17 00:00:00 2001
+From 0b176595ca1610037d1175e1786d1a8aff1fb43f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 6 Aug 2024 21:42:43 -0700
 Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
@@ -18,10 +18,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 4f51987..8f02595 100644
+index 6bf12d7..2f8e7cc 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -60,6 +60,10 @@
+@@ -61,6 +61,10 @@
  #define KEXEC_LOADED_PATH "/sys/kernel/kexec_loaded"
  #define KEXEC_CRASH_LOADED_PATH "/sys/kernel/kexec_crash_loaded"
  
@@ -32,7 +32,7 @@ index 4f51987..8f02595 100644
  unsigned long long mem_min = 0;
  unsigned long long mem_max = ULONG_MAX;
  unsigned long elfcorehdrsz = 0;
-@@ -657,7 +661,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
+@@ -661,7 +665,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
  {
  	int fd, count;
  
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
index 6a67427888..d824859686 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "bb6b39bbe00099219e95ab34b25ea4348e1a95964eefc45c1e6fe32362ac9021"
+SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"
 
 inherit autotools update-rc.d systemd
 
-- 
2.43.0


