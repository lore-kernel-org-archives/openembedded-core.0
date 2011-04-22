Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAm5-0001uK-3R
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2011 00:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="682382333"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2011 00:24:55 -0700
Message-Id: <cb86931dda386f0b97e8f818fe24ac15dab127ad.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 04:20:10 -0700
Date: Fri, 22 Apr 2011  0:24:55 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 25/33] mpfr: upgrade from 3.0.0 to 3.0.1
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:33 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../mpfr/{mpfr_3.0.0.bb => mpfr_3.0.1.bb}          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr_3.0.0.bb => mpfr_3.0.1.bb} (70%)

diff --git a/meta/recipes-support/mpfr/mpfr_3.0.0.bb b/meta/recipes-support/mpfr/mpfr_3.0.1.bb
similarity index 70%
rename from meta/recipes-support/mpfr/mpfr_3.0.0.bb
rename to meta/recipes-support/mpfr/mpfr_3.0.1.bb
index 846cdc0..9079e4b 100644
--- a/meta/recipes-support/mpfr/mpfr_3.0.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.0.1.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "f45bac3584922c8004a10060ab1a8f9f"
-SRC_URI[sha256sum] = "8f4e5f9c53536cb798a30455ac429b1f9fc75a0f8af32d6e0ac31ebf1024821f"
+SRC_URI[md5sum] = "bfbecb2eacb6d48432ead5cfc3f7390a"
+SRC_URI[sha256sum] = "e1977099bb494319c0f0c1f85759050c418a56884e9c6cef1c540b9b13e38e7f"
 S = "${WORKDIR}/mpfr-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1



