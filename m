Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7B57705E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 13:49:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Oct 2015 06:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,673,1437462000"; d="scan'208";a="824745435"
Received: from skhizaka-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.208])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2015 06:49:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 14:49:11 +0100
Message-Id: <5aa3bf6db0f2a96399e1e864d3a4409cb7bc4857.1444657696.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444657696.git.paul.eggleton@linux.intel.com>
References: <cover.1444657696.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444657696.git.paul.eggleton@linux.intel.com>
References: <cover.1444657696.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] tzdata: reinstate changes reverted in 2014c upgrade
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
X-List-Received-Date: Mon, 12 Oct 2015 13:49:30 -0000

OE-Core commit 57af3fb9662106f0a65a1b4edf83e2398be0a8f1 upgraded tzdata
but also reverted a couple of changes to SUMMARY and LIC_FILES_CHKSUM.
Reinstate these (with an update to the README md5 value since that has
changed slightly, without any change to the licensing statements
within).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/tzdata/tzdata_2015g.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2015g.bb
index 039a7c1..5b2afa6 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015g.bb
@@ -1,8 +1,9 @@
-DESCRIPTION = "Timezone data"
+SUMMARY = "Timezone data"
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1 \
+                    file://README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
 DEPENDS = "tzcode-native"
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-- 
2.1.0


