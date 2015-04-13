Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 423906AC23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 01:48:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3D1mTXa023680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 18:48:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 18:48:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 09:48:23 +0800
Message-ID: <a3c16610064e5a780de5b0f1cb834f5704526564.1428889561.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428889561.git.Qi.Chen@windriver.com>
References: <cover.1428889561.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/6] sysstat: upgrade to 11.1.3
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
X-List-Received-Date: Mon, 13 Apr 2015 01:48:28 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.0.2.bb => sysstat_11.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.0.2.bb => sysstat_11.1.3.bb} (40%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.0.2.bb b/meta/recipes-extended/sysstat/sysstat_11.1.3.bb
similarity index 40%
rename from meta/recipes-extended/sysstat/sysstat_11.0.2.bb
rename to meta/recipes-extended/sysstat/sysstat_11.1.3.bb
index ce83f4f..061f3db 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.0.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.1.3.bb
@@ -2,5 +2,5 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI[md5sum] = "27d4ca66869dce132ace3194dd7d7539"
-SRC_URI[sha256sum] = "acd87fdfbe7c796480f14fc26119d8f785d26827d74a0f5bced6c492a91f1b96"
+SRC_URI[md5sum] = "27385bcb6c1e585de8ba7cb25ac67aef"
+SRC_URI[sha256sum] = "ddbd07dfac47bcf0a6c2ae503bd80ad84dbed80c939d3dd333eb8453c38c337b"
-- 
1.9.1


