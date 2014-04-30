Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 13:07:10 UTC
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0B265D97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 13:07:10 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Apr 2014 05:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="425892250"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2014 05:57:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:56:33 +0100
Message-Id: <12ce44b4e15d59d7f7457f3a4e85dfb03f75a07b.1398862499.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398862499.git.paul.eggleton@linux.intel.com>
References: <cover.1398862499.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398862499.git.paul.eggleton@linux.intel.com>
References: <cover.1398862499.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] sqlite3: restore upstream version numbering
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
X-List-Received-Date: Wed, 30 Apr 2014 13:07:17 -0000

Regardless of the numbering used in source archive filenames, the
upstream version number is in dotted form in documentation, release
notes and the website, so we need to be using that here since that is
what people will expect to see.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/sqlite/{sqlite3_3080403.bb => sqlite3_3.8.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3080403.bb => sqlite3_3.8.4.3.bb} (88%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3080403.bb b/meta/recipes-support/sqlite/sqlite3_3.8.4.3.bb
similarity index 88%
rename from meta/recipes-support/sqlite/sqlite3_3080403.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.4.3.bb
index 7793a75..9388297 100644
--- a/meta/recipes-support/sqlite/sqlite3_3080403.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.4.3.bb
@@ -6,9 +6,9 @@ def sqlite_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
     return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
 
-PE = "2"
+PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
-SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-- 
1.9.0


