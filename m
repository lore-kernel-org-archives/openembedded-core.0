Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E473CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 04:58:18 +0000 (UTC)
Received: from bgl-iport-1.cisco.com (bgl-iport-1.cisco.com [72.163.197.25])
 by mx.groups.io with SMTP id smtpd.web10.54629.1695617893853235933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 21:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=JrYDAwRz;
 spf=pass (domain: cisco.com, ip: 72.163.197.25, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1146; q=dns/txt; s=iport;
  t=1695617894; x=1696827494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2XwrlKGC329WniRlLbBjCoEU51h5roYtBETmrK547Vk=;
  b=JrYDAwRz5o50/0LGil3cRHHUHbHdljS6HNBauZXRbNEpPpy25VgT2iax
   y5GKOmnJZuvVR0+0QONrmioPX6IStWLUWorJJcAcExVdxRstzA3fNE0ma
   7Gdzofh0bVPguvq2OuxuHZL9G6Uqnx54bI0L8ySwfvhPKxo36KPPuzdE1
   U=;
X-CSE-ConnectionGUID: HGa+xSP2QsSy0yHJvSQ38A==
X-CSE-MsgGUID: PislsdATQgCUxhzEvJBClw==
X-IronPort-AV: E=Sophos;i="6.03,174,1694736000"; 
   d="scan'208";a="18201346"
Received: from vla196-nat.cisco.com (HELO bgl-core-1.cisco.com) ([72.163.197.24])
  by bgl-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:58:10 +0000
Received: from bgl-ads-3120.cisco.com (bgl-ads-3120.cisco.com [173.39.57.7])
	by bgl-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 38P4w9x8005684
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 25 Sep 2023 04:58:10 GMT
Received: by bgl-ads-3120.cisco.com (Postfix, from userid 1784405)
	id 320A2CC1280; Mon, 25 Sep 2023 10:28:09 +0530 (IST)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Shinu Chandran <shinucha@cisco.com>
Subject: [meta-oe][kirkstone][PATCH
Date: Mon, 25 Sep 2023 10:28:06 +0530
Message-Id: <20230925045806.773145-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 173.39.57.7, bgl-ads-3120.cisco.com
X-Outbound-Node: bgl-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 04:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188169

- The c-ares commit https://github.com/c-ares/c-ares/commit/9903253c347f
  (Add str len check in config_sortlist to avoid stack overflow),
  fixes the CVE-2022-4904 instead of CVE-2022-4415
  https://security-tracker.debian.org/tracker/CVE-2022-4904
- CVE-ID inside the CVE-2022-4904.patch is wrong
  in the OE commit[092e125f44f6]
- Hence corrected the CVE-ID in CVE-2022-4904.patch

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
index 0a0e8f0b6..328075ca6 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
@@ -20,7 +20,7 @@ fixes #496
 
 Fix By: @hopper-vul
 
-CVE: CVE-2022-4415
+CVE: CVE-2022-4904
 Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d]
 
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
-- 
2.28.0


