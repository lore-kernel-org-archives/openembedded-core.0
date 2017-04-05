Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCCB77A44
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491394262; x=1522930262;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GmByzsDiwI6B5niPBf6zszy4Ngxno9uJ6CqUxtXFJOQ=;
	b=SQ8Els2nQi1Mg86HdSWv+TYzpzeoR0I/k68HWkhd1gt1BouRyN8CHwZp
	5ECaT77tKYmsAnMrNVNz2iswlyP6Bw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 05:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,278,1486454400"; d="scan'208";a="1115788482"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.153])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2017 05:11:01 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 13:10:55 +0100
Message-Id: <20170405121055.27230-3-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170405121055.27230-1-joshua.g.lock@intel.com>
References: <20170405121055.27230-1-joshua.g.lock@intel.com>
Subject: [PATCH 3/3] oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir
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
X-List-Received-Date: Wed, 05 Apr 2017 12:11:00 -0000

Rather than hard-coding the tmpdir for TargetBuildProject to /tmp allow the
parent's default handling to define an appropriate tmpdir.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/runtime/utils/targetbuildproject.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index 551b0b6..5af55d7 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -8,8 +8,7 @@ class TargetBuildProject(BuildProject):
     def __init__(self, target, uri, foldername=None, dl_dir=None):
         self.target = target
         self.targetdir = "~/"
-        BuildProject.__init__(self, uri, foldername, tmpdir="/tmp",
-                dl_dir=dl_dir)
+        BuildProject.__init__(self, uri, foldername, dl_dir=dl_dir)
 
     def download_archive(self):
         self._download_archive()
-- 
2.9.3


