Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD6A75A38
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 13:17:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t98DH1F2016100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 06:17:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 06:17:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 06:16:56 -0700
Message-ID: <e7cb89598db33b53478804a0b08b1c6686e0a964.1444310101.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444310101.git.liezhi.yang@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] insane.bbclass: fix for ignoring debug files
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
X-List-Received-Date: Thu, 08 Oct 2015 13:17:01 -0000
Content-Type: text/plain

Some recipes put debug files in "usr/src/debug/" rather than ".debug".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d6f7388..947d7ac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -575,7 +575,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     # Ignore:
     # - .debug files
     # - which sets INHIBIT_PACKAGE_STRIP
-    if path.find(".debug") != -1 or \
+    if path.find(".debug") != -1 or path.find("/src/debug/") != -1 or \
         d.getVar('INHIBIT_PACKAGE_STRIP', True) == "1":
         return
 
-- 
1.7.9.5


