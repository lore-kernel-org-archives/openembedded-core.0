Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TBTIw-0002Ln-7q
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:27:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 09:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="220783469"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 09:14:44 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 18:19:49 +0300
Message-Id: <6ca0792f5e4eeaff5517d1a4fa4476ea90698ce4.1347376068.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
Subject: [PATCH 4/5] sysstat: upgrade to 10.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:27:14 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/sysstat/sysstat_10.0.5.bb |    8 --------
 meta/recipes-extended/sysstat/sysstat_10.1.1.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.5.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.1.bb

diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
deleted file mode 100644
index 1c8595a..0000000
--- a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "208dd236d726d20591d53d3a20124dd4"
-SRC_URI[sha256sum] = "1f474d6ca742af73d0f9d09a374bda64c72bccb126aef327fa74383ff438feff"
diff --git a/meta/recipes-extended/sysstat/sysstat_10.1.1.bb b/meta/recipes-extended/sysstat/sysstat_10.1.1.bb
new file mode 100644
index 0000000..54b0226
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_10.1.1.bb
@@ -0,0 +1,8 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "8250cdcbc4a959c8a05e4186fbd13d84"
+SRC_URI[sha256sum] = "119c7a23c5597d6d0df0b229c54984a35f357ecbd1c96da8cef4d105e8dfdacf"
-- 
1.7.9.5



