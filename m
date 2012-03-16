Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEH-0000rW-PG
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118171386"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:32:25 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:04 +0800
Message-Id: <35e6188283de9d2e737c83f83706e5415d1a515f.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 07/60] tremor: upgrade to 18221
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:14 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{tremor_20120122.bb => tremor_20120314.bb}     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-multimedia/tremor/{tremor_20120122.bb => tremor_20120314.bb} (88%)

diff --git a/meta/recipes-multimedia/tremor/tremor_20120122.bb b/meta/recipes-multimedia/tremor/tremor_20120314.bb
similarity index 88%
rename from meta/recipes-multimedia/tremor/tremor_20120122.bb
rename to meta/recipes-multimedia/tremor/tremor_20120314.bb
index 055add7..19d03d6 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120122.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20120314.bb
@@ -8,7 +8,7 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r0"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18163;proto=http"
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;proto=http"
 
 S = "${WORKDIR}/Tremor"
 
-- 
1.7.6



