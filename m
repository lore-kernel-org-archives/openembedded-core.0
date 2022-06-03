Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9DBC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 00:22:13 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.2106.1654215729937300228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 17:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=R2D0ilf9;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654215730;
  x=1685751730;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yJqoxHD70vxfny9AUH2JfwprgbCsw85uZqvvOl4mKho=;
  b=R2D0ilf9i+ek5mUbd0jWJBGvGMmJXUUPogaU5lgDtsZCNDT5nGst3RFd
   DiHAWcnNSxUk2qR3NE+GbNiZcRsYH2w3kSacgACWbl9RT7pKkDrdWeHcn
   04cCSLMgZt6cfoQJ6V2lEL0noZDSfFfUuisJXOYFsghyZoRnAOd/KkeGx
   dpHQgkfWDaogkQg+kDMDyFWIRvCE4hzQAyO2UfG/Db09JgcrpEqex+5BJ
   sDTUt2Zu6Q4eFnc2AuX2jwwISnD1ciLD3ARUfikxph8nfdK8fmskKHorn
   l2ISE3N8hvJpMbvCFrjIu4YCsZyPe0Al6fwpJOjSQzOYIJcVYZEc+GDa1
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/2] libseccomp: Correct LIC_FILES_CHKSUM
Date: Fri, 3 Jun 2022 02:22:04 +0200
Message-ID: <20220603002205.6835-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 00:22:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166507

Previously, only the first line of the LICENSE file was included,
which only covered the license name and thus would not detect a change
to the version (or anything else for that matter).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
index e6260a7754..fefe2970ed 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The libseccomp library provides and easy to use, platform indepen
 HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
 DEPENDS += "gperf-native"
 

