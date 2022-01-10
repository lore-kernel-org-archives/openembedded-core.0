Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08584C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:55:46 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.31653.1641822944633176874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=g2FlrUOX;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641822945;
  x=1673358945;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GwvBZ6Avwn4QykebMOEToX0FbziZgpNHR53e6x1ATIY=;
  b=g2FlrUOX8w4sSrStpnv9tZ36523YeTtEvESyu7UYl9gar1HkPKX9sT9y
   nntiyELRmjv+n6HlTs0VTpnL1VR0fzfMmdLPaIjJequlOf9YjVKoAGFWr
   dr0Xj/u9JXGAE8RLYz99QmyT1o2GJmlfkVaF7Gsn5ZXi07D3nN0xp9X3t
   cB/++ZQcHa35R6VxZ2aRCkTissUGZHp6R/AhAavrWf/9+bGsDHs602P6J
   DBB/1EG0MhyHpcRTYlyoKL7RZOGPnYFJsW+jl/BERwEaXaStG0dS2c1gI
   2H7OMY+492rZZ2MGsM+46OYeE1FBxsaOtaoKE2Kkk5PO+3D/jXi2MNgN3
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rootfs-postcommands.bbclass: Make two comments use the new
 variable syntax
Date: Mon, 10 Jan 2022 14:55:39 +0100
Message-ID: <20220110135539.15428-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 13:55:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160352

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a3f96ef7ed..74035c30b7 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -21,7 +21,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
 # otherwise kernel or initramfs end up mounting the rootfs read/write
 # (the default) if supported by the underlying storage.
 #
-# We do this with _append because the default value might get set later with ?=
+# We do this with :append because the default value might get set later with ?=
 # and we don't want to disable such a default that by setting a value here.
 APPEND:append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
 
@@ -52,7 +52,7 @@ inherit image-artifact-names
 # the numeric IDs of dynamically created entries remain stable.
 #
 # We want this to run as late as possible, in particular after
-# systemd_sysusers_create and set_user_group. Using _append is not
+# systemd_sysusers_create and set_user_group. Using :append is not
 # enough for that, set_user_group is added that way and would end
 # up running after us.
 SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "

