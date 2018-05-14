Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9A9770A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 05:58:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4E5vda2011043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 22:57:54 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 13 May 2018 22:57:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 13:59:22 +0800
Message-ID: <625a5ff0f8a90ccfd7c5c3026f0db039c31ab22f.1526277424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526277424.git.Qi.Chen@windriver.com>
References: <cover.1526277424.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] sysstat: upgrade to 11.7.3
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
X-List-Received-Date: Mon, 14 May 2018 05:58:05 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb b/meta/recipes-extended/sysstat/sysstat_11.7.3.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.7.1.bb
rename to meta/recipes-extended/sysstat/sysstat_11.7.3.bb
index 86738e7..8c89748 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.7.3.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "bdcda7c9048c7c22fb1f30f75285d13d"
-SRC_URI[sha256sum] = "303a595b1af0330b183a0f1febfccf89f183b9575ae0562b91fdb876f3ef1feb"
+SRC_URI[md5sum] = "c40cefdc7649c7554ecf1d56bf485d09"
+SRC_URI[sha256sum] = "8ea4ffcce8dae68a1cbb6acaa131ae7e3e6c5765134e670aa9baa38c1bcc66ea"
-- 
1.9.1


