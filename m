Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E546977EFE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 12:39:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v57CdOGN014542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 7 Jun 2017 13:39:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dIaFA-0000mQ-OM; Wed, 07 Jun 2017 13:39:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 13:39:23 +0100
Message-Id: <1496839163-2957-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 07 Jun 2017 13:39:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] meta*: Add LAYERSERIES_COMPAT and LAYERSERIES_CORENAMES markup to layer.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jun 2017 12:39:26 -0000

This means mismatched layers are more clearly identified to the user in
cases where compatibility has not been tested. This is perhaps not as
needed for the core repository (other than CORENAMES) but lets lead by
example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 ++
 meta-skeleton/conf/layer.conf | 2 ++
 meta/conf/layer.conf          | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index a847b78..2a71895 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -8,3 +8,5 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "selftest"
 BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
 BBFILE_PRIORITY_selftest = "5"
+
+LAYERSERIES_COMPAT_selftest = "rocko"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index aca1633..a15516a 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -13,3 +13,5 @@ BBFILE_PRIORITY_skeleton = "1"
 LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
+
+LAYERSERIES_COMPAT_skeleton = "rocko"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index fc16502..6d36aa1 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -11,6 +11,8 @@ BBFILE_PRIORITY_core = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_core = "10"
 
+LAYERSERIES_CORENAMES = "rocko"
+
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
 # Set a variable to get to the top of the metadata location
-- 
2.7.4


