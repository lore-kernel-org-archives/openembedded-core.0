Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOB-00085Q-M8
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115404"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:41 -0700
Message-Id: <07a3cd1d04b1b92e38f089217c9d188d38f7bb0c.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 02/45] opkg-nogpg: add file path
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
X-List-Received-Date: Fri, 25 May 2012 06:52:44 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

There was no explicit path in FILESPATH for this recipe to allow it to
find files referred to in SRC_URI (files shared with the standard opkg
recipe). This problem may have been masked by the fetcher behaviour of
looking for files last in DL_DIR, thus if opkg has been fetched
beforehand there would have been no error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
index 259a60e..da2a39c 100644
--- a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
@@ -3,6 +3,8 @@ require opkg_${PV}.bb
 DEPENDS = "curl"
 PROVIDES += "opkg"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/opkg-${PV}:"
+
 EXTRA_OECONF += "--disable-gpg"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.7.6



