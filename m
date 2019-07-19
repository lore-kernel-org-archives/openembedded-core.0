Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0317F188
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:47:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J9lgGn012088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:47:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 19 Jul 2019 02:47:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 18:00:09 +0800
Message-ID: <9937fa85aae217bbe5be0a63143207b0728564a1.1563530365.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1563530365.git.Qi.Chen@windriver.com>
References: <cover.1563530365.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] devtool: remove temp dir in upgrade
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
X-List-Received-Date: Fri, 19 Jul 2019 09:47:41 -0000
Content-Type: text/plain

For now, the temp dir is left in system, although the temporary
source directory has been cleaned up. So we clean it up too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/upgrade.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 706f91c..18c5b66 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -281,6 +281,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             logger.info('Preserving temporary directory %s' % tmpsrctree)
         else:
             shutil.rmtree(tmpsrctree)
+            shutil.rmtree(tmpdir)
 
     return (rev, md5, sha256, srcbranch, srcsubdir_rel)
 
-- 
1.9.1


