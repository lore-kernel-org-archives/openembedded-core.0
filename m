Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF88C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:10:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lI7voyrZ;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385445; x=1673921445;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Qc3nZi2cUT5dRj9fXkooHi3axt4QEIjSuBMvNlF8PBg=;
  b=lI7voyrZy62zD2/wwZXDHCGrWRL2foZI87YqKa4csk/y8RHVkabDrYLR
   ULw1ybYSsAX/p0q5gr8gzOBV66eyxVobPSdZRBuL2+sVuYplJJqMHzgIq
   9jYI4pS7MBE1rLJzJty8jzw9HiVNLbVqNK7zpIv6NaTrzhey8jQtubDXi
   i/u3gAdwcBYdlaST5LJRFOeY4MpurK1GkBHmfL9dH8A0q7/+EIYWx4tyE
   OA7rKGGBrPl4lUcewnX1MVuFxlmoerZk/tqawFY22EOEIDeArW2vrDeRw
   yvu+K0JjhyZoEyqnUZxoppWfKzvJAJUqPzEajdaJVDBGKLZPT/9qqlQjY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094214"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220700"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/12] rootfs-postcommands.bbclass: Make two
 comments use the new variable syntax
Date: Mon, 17 Jan 2022 10:10:25 +0800
Message-Id: 
 <5293916ac660c4cfd6304826fb10de1454a40bf5.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:10:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160624

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb17cccaf2f51558bd1d320559bd792d5869688e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
-- 
2.34.1


