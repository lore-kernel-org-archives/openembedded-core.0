Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1971375F1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 09:16:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6F9GoHx023387
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 02:16:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 15 Jul 2015 02:16:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jul 2015 02:16:49 -0700
Message-ID: <d1093e79e1f14f87357657d1a1e473d3325caf22.1436951753.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436951753.git.liezhi.yang@windriver.com>
References: <cover.1436951753.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] insane.bbclass: make package_qa_clean_path return a relative path
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
X-List-Received-Date: Wed, 15 Jul 2015 09:16:51 -0000
Content-Type: text/plain

Make package_qa_clean_path() return something like "work/path/to/file"
rather than "/work/path/to/file", the relative path is a little clear.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f1eb60a..5290686 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -161,7 +161,7 @@ def package_qa_get_machine_dict():
 
 def package_qa_clean_path(path,d):
     """ Remove the common prefix from the path. In this case it is the TMPDIR"""
-    return path.replace(d.getVar('TMPDIR',True),"")
+    return path.replace(d.getVar("TMPDIR", True) + "/", "")
 
 def package_qa_write_error(type, error, d):
     logfile = d.getVar('QA_LOGFILE', True)
-- 
1.7.9.5


