Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F71EC54E71
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.45971.1747040639732804618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o2SIwA3T;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GErY6rTPmKXxWNtt+9Thp7NUq5fuWPzIGZpiDKH+0D0=;
  b=o2SIwA3TIIIEv/HYfoAGC+tT5jJG0P0t5KDs3IIy4d2UiXrZeXvdWTu+
   +jKtx/jWaUrqxll49np1++Od674SnLmmD1wNh4+GqAOekc5pLAlOTE11G
   Dl7N1ewqKwF4Irc7yCp07JiaBrzSk9JqXZB0RcueFtp3VlGHctyTroGyv
   RK8OJXEH4Ny5hyDzM9Cpvb/8VzEwEYx0CP806nOneNZMytANtGUwgcFWC
   sVu1FylfwJAvqivH5ijZyDqYWk+W4+zYJv+L5dMX3jRl6J1IGxRlBkX4t
   Y+0vsavbx4vNXSYSiRHjD8E8Agshws65747Nfyw5+qpZa+v1xi52jl2VT
   w==;
X-CSE-ConnectionGUID: nZyOVT4CRcey9EbMTyeVGA==
X-CSE-MsgGUID: 8LMDYE1ETpG+61f7QIdhag==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178629712"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178629712"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47259D5056
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F94DCFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C29001A009A;
	Mon, 12 May 2025 17:03:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/56] openssh: upgrade 9.9p2 -> 10.0p1
Date: Mon, 12 May 2025 17:03:16 +0800
Message-Id: <1747040619-7566-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216326

From: Wang Mingyu <wangmy@fujitsu.com>

0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
refreshed for 10.0p1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6 +++---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index b90cd2e69d..360b62af34 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
+From 9dcccafe44ea17e972e7cddea205bbe9fe71d8d6 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 5 insertions(+)
 
 diff --git a/regress/test-exec.sh b/regress/test-exec.sh
-index 7afc2807..175f554b 100644
+index 8a00c72..2891f27 100644
 --- a/regress/test-exec.sh
 +++ b/regress/test-exec.sh
-@@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
+@@ -179,6 +179,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
  fi
  
  # Path to sshd must be absolute for rexec
diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
index 5191725796..21e1e50759 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
+SRC_URI[sha256sum] = "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.43.0


