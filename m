Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE344C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:21:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.25403.1646652110365591801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: theobroma-systems.com, ip: 217.70.183.196,
 mailfrom: quentin.schulz@theobroma-systems.com)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 6928BE0002;
	Mon,  7 Mar 2022 11:21:47 +0000 (UTC)
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
Cc: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [honister][PATCH 2/2] util-linux: upgrade 2.37.3 -> 2.37.4
Date: Mon,  7 Mar 2022 12:21:27 +0100
Message-Id: <20220307112127.21538-2-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307112127.21538-1-quentin.schulz@theobroma-systems.com>
References: <20220307112127.21538-1-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 11:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162807

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a3289c4786c4d278e2bf0ec1a5e04363772d8bc)
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 ...til-linux-libuuid_2.37.3.bb => util-linux-libuuid_2.37.4.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.3.bb => util-linux_2.37.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.3.bb => util-linux-libuuid_2.37.4.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.3.bb => util-linux_2.37.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0309332722..c48f9572f5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776"
+SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.3.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.4.bb
-- 
2.35.1


