Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcXgd-0004GP-LJ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 08:58:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 23:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,456,1304319600"; d="scan'208";a="25080530"
Received: from unknown (HELO swold-MOBL.localdomain) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 23:55:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 23:54:31 -0700
Message-Id: <fa197ac369632b466822764825613cc626f9acdd.1309503004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] libmad: add SRC_URI Checksum
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
X-List-Received-Date: Fri, 01 Jul 2011 06:58:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index acc9df5..ed3efa5 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -15,6 +15,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
            file://add-pkgconfig.patch \
            file://fix_for_mips_with_gcc-4.5.0.patch"
 
+SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
+SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690" 
+
 S = "${WORKDIR}/libmad-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.3.4



