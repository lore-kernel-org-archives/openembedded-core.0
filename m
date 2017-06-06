Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA057780A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 11:00:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v568XLWd019362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 01:34:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Jun 2017 01:33:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jun 2017 16:36:16 +0800
Message-ID: <7f8b6d5924c3a006a04222dc9325cecc71fe142f.1496738086.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1496738086.git.Qi.Chen@windriver.com>
References: <cover.1496738086.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] sysstat: upgrade to 11.5.5
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
X-List-Received-Date: Tue, 06 Jun 2017 11:00:04 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.5.4.bb => sysstat_11.5.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.4.bb => sysstat_11.5.5.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.5.4.bb b/meta/recipes-extended/sysstat/sysstat_11.5.5.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.5.4.bb
rename to meta/recipes-extended/sysstat/sysstat_11.5.5.bb
index 7ff363b..65c81e9 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.5.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.5.5.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "f16ae8edd462f5199ee033f7c0e2c197"
-SRC_URI[sha256sum] = "1e1008656575e70486b456e79775e98d3b8732d7e2cb408559209bd0318e0807"
+SRC_URI[md5sum] = "f6072bcfd5d2b02f033722f863171d0f"
+SRC_URI[sha256sum] = "f4c5b333827cb588df1842d7a8f46947f486c95b305edbbce7565925e88e86c3"
-- 
1.9.1


