Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 842CD732A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:56:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C1uafK008596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 17:56:36 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Feb 2015 17:56:35 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Thu, 12 Feb 2015 09:50:22 +0800
Message-ID: <a92f9c829660fe320b45a3ae632bc4208a7dc4b1.1423705692.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423705692.git.Chong.Lu@windriver.com>
References: <cover.1423705692.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 1/2] bitbake.conf: Add two variables for layer index
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
X-List-Received-Date: Thu, 12 Feb 2015 01:56:42 -0000
Content-Type: text/plain

Add BBLAYERS_LAYERINDEX_URL variable that bitbake-layers can use to find layer index.
Add BBLAYERS_FETCH_DIR variable that bitbake-layers can use to specify fetch directory.

[YOCTO #5348]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/conf/bitbake.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d22e9e8..a1c6b70 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -549,6 +549,12 @@ SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"
 
 ##################################################################
+# Settings used by bitbake-layers.
+##################################################################
+BBLAYERS_LAYERINDEX_URL ??= "http://layers.openembedded.org/layerindex/"
+BBLAYERS_FETCH_DIR ??= "${COREBASE}"
+
+##################################################################
 # Download locations and utilities.
 ##################################################################
 
-- 
1.9.1


