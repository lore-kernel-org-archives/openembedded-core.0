Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1iZ-000292-Vw
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:00:40 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2012 09:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99360713"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2012 09:52:57 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:12 +0800
Message-Id: <ae2df20d57b51b8c6909ab460df512311c842f10.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 07/18] tremor: upgrade to 18163 (20120122)
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
X-List-Received-Date: Sun, 22 Jan 2012 18:00:40 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{tremor_20101121.bb => tremor_20120122.bb}     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-multimedia/tremor/{tremor_20101121.bb => tremor_20120122.bb} (88%)

diff --git a/meta/recipes-multimedia/tremor/tremor_20101121.bb b/meta/recipes-multimedia/tremor/tremor_20120122.bb
similarity index 88%
rename from meta/recipes-multimedia/tremor/tremor_20101121.bb
rename to meta/recipes-multimedia/tremor/tremor_20120122.bb
index 4a4cb28..055add7 100644
--- a/meta/recipes-multimedia/tremor/tremor_20101121.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20120122.bb
@@ -8,7 +8,7 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r0"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=17636;proto=http"
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18163;proto=http"
 
 S = "${WORKDIR}/Tremor"
 
-- 
1.7.6



