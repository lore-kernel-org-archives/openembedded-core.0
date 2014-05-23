Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B15786ABDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:13:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 11:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="536721488"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2014 11:13:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 19:12:59 +0100
Message-Id: <dcefb21fc324c7f0e3e146df7200e43156fd2468.1400868743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] oe-pkgdata-util: fix help text
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
X-List-Received-Date: Fri, 23 May 2014 18:13:09 -0000

This was copy/pasted from another script and not corrected.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index a373116..bf87547 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -303,7 +303,7 @@ Available commands:
         packages''')
 
     parser.add_option("-d", "--debug",
-            help = "Report all SRCREV values, not just ones where AUTOREV has been used",
+            help = "Enable debug output",
             action="store_true", dest="debug", default=False)
 
     options, args = parser.parse_args(sys.argv)
-- 
1.9.0


