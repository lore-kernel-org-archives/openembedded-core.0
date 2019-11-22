Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BC68A7FCD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:40:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:41:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="201485449"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.245])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 19:39:11 +0800
Message-Id: <7c604347d4c7ae8b2aac1190829588ace09ae3cf.1574422359.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1574422359.git.anuj.mittal@intel.com>
References: <cover.1574422359.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 12/15] Revert "devtool/standard.py: Not filtering devtool workspace for devtool finish"
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
X-List-Received-Date: Fri, 22 Nov 2019 11:40:59 -0000
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This reverts commit 41d225f4a37d02e9f79bdbfb79caac8cd3d291ce.

Unfortunately this change broke 'devtool upgrade' functionality,
causing 'devtool finish' to write out an upgraded recipe that no
longer includes the original upstream source in SRC_URI.

(From OE-Core rev: 2d6e55192dba0bf7f6e23e5ab5b3dbc68835bb28)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1646971a91..60c9a046f9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2011,7 +2011,7 @@ def finish(args, config, basepath, workspace):
     no_clean = args.no_clean
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
-        rd = parse_recipe(config, tinfoil, args.recipename, True, False)
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
             return 1
 
-- 
2.21.0


