Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421C0FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:32:04 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12789.1777473117529562474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 29 Apr 2026 23:31:56 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 29 Apr 2026 23:31:55 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH 1/3] libpam: Add missing MLPREFIX to FILES:pam-plugin-env
Date: Wed, 29 Apr 2026 23:31:02 +0900
Message-ID: <20260429143104.684760-2-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429143104.684760-1-jaeyoon.jung@lge.com>
References: <20260429143104.684760-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 14:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236106

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

pam-plugin-env is treated as a multilib package, but
FILES:pam-plugin-env did not include MLPREFIX which is inconsistent to
PACKAGES_DYNAMIC and pam_plugin_hook().

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/recipes-extended/pam/libpam_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.7.2.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
index 6955a5f2f6..6e1c5899db 100644
--- a/meta/recipes-extended/pam/libpam_1.7.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -53,7 +53,7 @@ FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 # libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
 # packaged with the pam-plugin-env package to avoid breaking installations which
 # install that file via other packages
-FILES:pam-plugin-env = "${sysconfdir}/environment"
+FILES:${MLPREFIX}pam-plugin-env = "${sysconfdir}/environment"
 
 PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
 

