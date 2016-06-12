Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6C2F6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C2Krmg024198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:53 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:21:07 +0800
Message-ID: <37ba5c1a27383da6153c7442d04762b2c28222d7.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] resolvconf: upgrade to 1.79
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:53 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../resolvconf/{resolvconf_1.78.bb => resolvconf_1.79.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.78.bb => resolvconf_1.79.bb} (90%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.78.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
similarity index 90%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.78.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
index f4c5851..8550177 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.78.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
@@ -11,13 +11,13 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20150828T220730Z/pool/main/r/${BPN}/${BPN}_1.78.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160520T044340Z/pool/main/r/${BPN}/${BPN}_1.79.tar.xz \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
 
-SRC_URI[md5sum] = "373a9f9544c84aa477a7425ae773b8b5"
-SRC_URI[sha256sum] = "961b22e8fcf0c7de7e90a050323e6fa221bc8b25a5348c160be3506f7e73a7a3"
+SRC_URI[md5sum] = "aab2382020fc518f06a06e924c56d300"
+SRC_URI[sha256sum] = "8e2843cd4162b706f0481b3c281657728cbc2822e50a64fff79b79bd8aa870a0"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
1.9.1


