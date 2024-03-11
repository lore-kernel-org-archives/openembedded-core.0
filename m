Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75235C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 06:16:07 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web10.55855.1710137765611247664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 23:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=XeuO2KUX;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1247; q=dns/txt; s=iport;
  t=1710137766; x=1711347366;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lkB2h9/rfAnNBSPwKFi0BdoDWNlTYM56vw7xpmwsZlw=;
  b=XeuO2KUXJkjKnPp8vFNMnkLvY/1S+URgqDF7Iik0k//BVLUoiB2qjNZO
   9s/CNw5WJZ9EJe/tHW6bbgJSqSRRDQ4nAFPmb2JGx/o38p3KavhF+iVsd
   dPGiWaEJbQsXUvlqsNc6sUZGB/597jTVuq3+KjYSbadf1kav2w1bOv4uQ
   8=;
X-CSE-ConnectionGUID: DpJEKZzLQxujOCvBa2SZ9g==
X-CSE-MsgGUID: AGZYFJKNQmedXZHdiqTRCA==
X-IronPort-AV: E=Sophos;i="6.07,115,1708387200"; 
   d="scan'208";a="193413647"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 06:16:06 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 42B6G4ZH027816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 06:16:04 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 5A15ACC1251; Sun, 10 Mar 2024 23:16:04 -0700 (PDT)
From: dnagodra@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [nanbield] [PATCH] xwayland: upgrade 23.2.3 -> 23.2.4
Date: Sun, 10 Mar 2024 23:15:59 -0700
Message-Id: <20240311061559.2595498-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196912

From: Dhairya Nagodra <dnagodra@cisco.com>

Includes fixes for CVE-2023-6816, CVE-2024-0408, CVE-2024-0409

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 .../xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
index 9aa7b4dfcd..092359172a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302"
+SRC_URI[sha256sum] = "a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.35.6


