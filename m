Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UEy0T-0002Qz-K7
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 09:22:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2B86FZf022029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 01:06:15 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 01:06:15 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 16:06:02 +0800
Message-ID: <1362989162-9619-2-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362989162-9619-1-git-send-email-wenzong.fan@windriver.com>
References: <1362989162-9619-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] layer.conf: Add LAYERVERSION and LAYERDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 08:22:57 -0000
Content-Type: text/plain

Add LAYERVERSION and LAYERDEPENDS to following oe-core layers:

    meta-hob, meta-skeleton

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-hob/conf/layer.conf      |    6 ++++++
 meta-skeleton/conf/layer.conf |    5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta-hob/conf/layer.conf b/meta-hob/conf/layer.conf
index 5f5eb82..ea977e2 100644
--- a/meta-hob/conf/layer.conf
+++ b/meta-hob/conf/layer.conf
@@ -7,3 +7,9 @@ BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
 BBFILE_COLLECTIONS += "hob"
 BBFILE_PATTERN_hob := "^${LAYERDIR}/"
 BBFILE_PRIORITY_hob = "1"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_hob = "1"
+
+LAYERDEPENDS_hob = "core"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index edb31dd..4cf4767 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -8,3 +8,8 @@ BBFILE_COLLECTIONS += "skeleton"
 BBFILE_PATTERN_skeleton := "^${LAYERDIR}/"
 BBFILE_PRIORITY_skeleton = "1"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_skeleton = "1"
+
+LAYERDEPENDS_skeleton = "core"
-- 
1.7.10.4



