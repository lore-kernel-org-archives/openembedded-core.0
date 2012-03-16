Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHq-0001XL-7H
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129565559"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:36:05 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:26 +0800
Message-Id: <1142fa0273677277a8503157fb1f7b6841bf064c.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 29/60] tzdata: upgrade to 2012b
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:54 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../tzdata/{tzdata_2011n.bb => tzdata_2012b.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011n.bb => tzdata_2012b.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb b/meta/recipes-extended/tzdata/tzdata_2012b.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2011n.bb
rename to meta/recipes-extended/tzdata/tzdata_2012b.bb
index 9a41131..7cb1c23 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012b.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r1"
+PR = "r0"
 
 RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
@@ -14,8 +14,8 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "20dbfb28efa008ddbf6dd34601ea40fa"
-SRC_URI[tzdata.sha256sum] = "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bdea1d2385e38cd"
+SRC_URI[tzdata.md5sum] = "0615fd29def380a917e528433c820368"
+SRC_URI[tzdata.sha256sum] = "2f9f8e2d1ae087be5917f60c3946e8dc3fe1068d7738c3395f2125135309e745"
 
 S = "${WORKDIR}"
 
-- 
1.7.6



