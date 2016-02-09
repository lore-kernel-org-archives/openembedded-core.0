Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABAC0608B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 02:46:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u192kwK6006961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Feb 2016 18:46:58 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.9) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Feb 2016 18:46:57 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Feb 2016 21:46:51 -0500
Message-ID: <1454986011-17895-2-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <1454986011-17895-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1454986011-17895-1-git-send-email-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] buildstats.bbclass: remove dead URL from comment
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
X-List-Received-Date: Tue, 09 Feb 2016 02:46:58 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/classes/buildstats.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index daf0b86..e58d37b 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -4,8 +4,7 @@ BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 # Build statistics gathering.
 #
 # The CPU and Time gathering/tracking functions and bbevent inspiration
-# were written by Christopher Larson and can be seen here:
-# http://kergoth.pastey.net/142813
+# were written by Christopher Larson.
 #
 ################################################################################
 
-- 
2.4.2


