Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id ED9D360268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 01:21:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18713543"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2017 09:21:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 35F1647E64CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 09:21:18 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 11 May 2017 09:21:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 May 2017 09:21:09 +0800
Message-ID: <1494465669-61736-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 35F1647E64CD.A825A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libsndfile1: 1.0.27 -> 1.0.28
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
X-List-Received-Date: Thu, 11 May 2017 01:21:23 -0000
Content-Type: text/plain

Upgrade libsndfile1 from 1.0.27 to 1.0.28.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libsndfile/{libsndfile1_1.0.27.bb => libsndfile1_1.0.28.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.27.bb => libsndfile1_1.0.28.bb} (82%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
similarity index 82%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 7a095b6..248b292 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -7,8 +7,8 @@ LICENSE = "LGPLv2.1"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fd1d97c6077f03b5d984d7956ffedb7a"
-SRC_URI[sha256sum] = "a391952f27f4a92ceb2b4c06493ac107896ed6c76be9a613a4731f076d30fac0"
+SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
+SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.7.4




