Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgd-0008V4-41
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495915"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:45 -0700
Message-Id: <a4d138ec046c3ee5329e3193574b20b7c65605ea.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 06/21] eds-tools: Convert from BZR to GIT Repo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2011 16:20:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../eds/{eds-tools_bzr.bb => eds-tools_git.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/eds/{eds-tools_bzr.bb => eds-tools_git.bb} (72%)

diff --git a/meta/recipes-sato/eds/eds-tools_bzr.bb b/meta/recipes-sato/eds/eds-tools_git.bb
similarity index 72%
rename from meta/recipes-sato/eds/eds-tools_bzr.bb
rename to meta/recipes-sato/eds/eds-tools_git.bb
index afa8000..fedfaf5 100644
--- a/meta/recipes-sato/eds/eds-tools_bzr.bb
+++ b/meta/recipes-sato/eds/eds-tools_git.bb
@@ -4,10 +4,10 @@ DEPENDS = "dbus-glib eds-dbus"
 RDEPENDS_${PN} = "libedata-book"
 DESCRIPTION = "Test applications for EDS"
 
-SRCREV = "2008-02-04"
-PR = "r1"
+SRCREV = "882df681014cf42f75882995e507c75254b6b62f"
+PR = "r0"
 
-SRC_URI = "bzr://burtonini.com/bzr/eds-tools;proto=http"
+SRC_URI = "git://github.com/rossburton/eds-tools.git;protocol=git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
1.7.6.2



