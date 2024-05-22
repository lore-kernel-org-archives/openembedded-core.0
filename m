Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E554C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 11:42:33 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.web11.7870.1716378144948364225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 04:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VkqCy6L6Fzdb8;
	Wed, 22 May 2024 13:42:22 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VkqCy10HgzJSn;
	Wed, 22 May 2024 13:42:22 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 22 May 2024 13:42:10 +0200
Subject: [PATCH] mmc-utils: fix URL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-mmc-utils-new-repo-v1-1-ed3e9832b8a4@cherry.de>
X-B4-Tracking: v=1; b=H4sIABLaTWYC/x3MSwqAMAwA0auUrA1oaCt6FXEhGjWgtbT+QLy7x
 eVbzDwQOQhHqNUDgU+JsrmEIlPQz52bGGVIBspJ54YI17XHY5clouMLA/sNdaerwhpTkrWQQh9
 4lPufNu37fnc0T49kAAAA
To: openembedded-core@lists.openembedded.org, 
 Quentin Schulz <foss+yocto@0leil.net>, Anuj Mittal <anuj.mittal@intel.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 11:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199747

From: Quentin Schulz <quentin.schulz@cherry.de>

The current mmc-utils git URL still (for now?) redirects to the URL in
this patch, but the homepage doesn't, so let's just migrate both to the
new URL.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 7c6be93a9c..0bfd5c1cc8 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Userspace tools for MMC/SD devices"
-HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
+HOMEPAGE = "https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
@@ -9,7 +9,7 @@ SRCREV = "f757f413dea4a143ad7c3b48b8264176f0499a82"
 
 PV = "0.1+git"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"

---
base-commit: 094273bd7d1768e14fbdcd2f239bee14c630a625
change-id: 20240522-mmc-utils-new-repo-4a4916557266

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


