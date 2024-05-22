Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7639DC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:21:56 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.2399.1716412906946697032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 14:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TfFoSDgQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202405222121430ae66cf93447163ebf-wukby2@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202405222121430ae66cf93447163ebf
        for <openembedded-core@lists.openembedded.org>;
        Wed, 22 May 2024 23:21:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uNQPm97um+Elnnq34MAQ63upIY0OBxVRLJ0vggEmDho=;
 b=TfFoSDgQbXOPG0vQzITXlVSaLx+YC5ZwBUJM8o21buSO+pNr73SLqKEc8J35o3WwaY96TS
 I4L4m3lAiP4ku0WvayojPhlugUGEB/VFVUn3KBm3ODuB7jXZ2PVjlegPsf8hhnu6btCUHKva
 QQTI1e6wzmM6WF1hMk8+DXfdv8lDA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ttyrun: define CVE_PRODUCT
Date: Wed, 22 May 2024 23:20:53 +0200
Message-Id: <20240522212053.43924-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 21:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199771

From: Peter Marko <peter.marko@siemens.com>

Single executable ttyrun is taken ouf of s390-tools repository
containing ton of other helper tools.
CVEs are not assigned to executables, but to whole components.
Historically there also already exists one CVE for s390-tools.

Most of the CVEs will not be for ttyrun, but this is the way
how to get notified even if most we get will have to be ignored.

(From oe-core rev: df28547387c2c122aef3e5326b216ec3f4d3caa7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/ttyrun/ttyrun_2.31.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
index 122dd9d8e7..fac11d6310 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
 SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
 
+CVE_PRODUCT = "s390-tools"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "\
-- 
2.30.2


