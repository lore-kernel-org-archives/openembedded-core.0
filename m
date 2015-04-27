Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 294E273D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 02:25:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3R2PxIP010047
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Apr 2015 19:25:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 26 Apr 2015 19:25:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 10:25:55 +0800
Message-ID: <b11598e53001aa8b7a602466e5c4f7f621187ae4.1430101500.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430101500.git.Qi.Chen@windriver.com>
References: <cover.1430101500.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysstat: upgrade to 11.1.4
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
X-List-Received-Date: Mon, 27 Apr 2015 02:25:58 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.1.3.bb => sysstat_11.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.1.3.bb => sysstat_11.1.4.bb} (40%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.1.3.bb b/meta/recipes-extended/sysstat/sysstat_11.1.4.bb
similarity index 40%
rename from meta/recipes-extended/sysstat/sysstat_11.1.3.bb
rename to meta/recipes-extended/sysstat/sysstat_11.1.4.bb
index 061f3db..8d389d9 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.1.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.1.4.bb
@@ -2,5 +2,5 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI[md5sum] = "27385bcb6c1e585de8ba7cb25ac67aef"
-SRC_URI[sha256sum] = "ddbd07dfac47bcf0a6c2ae503bd80ad84dbed80c939d3dd333eb8453c38c337b"
+SRC_URI[md5sum] = "3795dd5443efd6bc5d682d597423aa9f"
+SRC_URI[sha256sum] = "b5d160bacc57a2e89873dee2ea3382b8811f0036520bf2e5789443797c4be46f"
-- 
1.9.1


