Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE77746DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 10:24:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36AOIXa000574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 11:24:19 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f4OXa-0001Qw-5E; Fri, 06 Apr 2018 11:24:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 11:24:17 +0100
Message-Id: <1523010257-5470-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH] layer.conf: Update LAYERSERIES rocko -> sumo
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
X-List-Received-Date: Fri, 06 Apr 2018 10:24:19 -0000

Also set LAYERSERIES_COMPAT for core (we're compatible with ourself).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index 2a71895..f574a50 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_COLLECTIONS += "selftest"
 BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
 BBFILE_PRIORITY_selftest = "5"
 
-LAYERSERIES_COMPAT_selftest = "rocko"
+LAYERSERIES_COMPAT_selftest = "sumo"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index a15516a..4e8692e 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "rocko"
+LAYERSERIES_COMPAT_skeleton = "sumo"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 85a9287..315fb93 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,11 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
+LAYERSERIES_CORENAMES = "sumo"
+
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "11"
-
-LAYERSERIES_CORENAMES = "rocko"
+LAYERSERIES_COMPAT_core = "sumo"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.7.4


