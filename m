Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5432773F92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2015 06:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708359999"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:02 +0300
Message-Id: <1431350231-29495-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 02/11] devtool: standard plugins: remove unused import
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
X-List-Received-Date: Mon, 11 May 2015 13:17:19 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 55580ee..614bcdb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -20,7 +20,6 @@ import os
 import sys
 import re
 import shutil
-import glob
 import tempfile
 import logging
 import argparse
-- 
2.1.4


