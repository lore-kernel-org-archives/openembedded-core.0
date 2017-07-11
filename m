Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6851E780B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279853"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:57 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:43 -0500
Message-Id: <18c26d81808842d3ab4272a5f6d0090fa99aa0f0.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 28/30] argparse_oe: Add int_positive type
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sometimes only expect positive values from cmdline so it's better
to filter at parsing cmdline step instead of validate later.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/argparse_oe.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index bf6eb17197b..9bdfc1ceca2 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -167,3 +167,10 @@ class OeHelpFormatter(argparse.HelpFormatter):
             return '\n'.join(lines)
         else:
             return super(OeHelpFormatter, self)._format_action(action)
+
+def int_positive(value):
+    ivalue = int(value)
+    if ivalue <= 0:
+        raise argparse.ArgumentTypeError(
+                "%s is not a positive int value" % value)
+    return ivalue
-- 
2.11.0


