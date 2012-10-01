Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TIpTv-0000ee-QH
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 01:32:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Oct 2012 16:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,520,1344236400"; d="scan'208";a="217862162"
Received: from unknown (HELO localhost) ([10.255.13.216])
	by orsmga002.jf.intel.com with ESMTP; 01 Oct 2012 16:20:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:19:13 -0700
Message-Id: <67b76bba8d5cc8fd17567d7b2c0465ae93fdd704.1349133467.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1349133467.git.dvhart@linux.intel.com>
References: <cover.1349133467.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, John Howard <john.howard@intel.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/1] gnutls: Update SRC_URI to use GNU_MIRROR
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
X-List-Received-Date: Mon, 01 Oct 2012 23:33:00 -0000

The current SRC_URI fails. Update it with the GNU_MIRROR SRC_URI from
upstream commit 188dff3daf048e369bcab0d1db2964490e43d734.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: John Howard <john.howard@intel.com>
CC: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 157612e..e818f07 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libextra/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/gnutls/gnutls-${PV}.tar.bz2"
 
 inherit autotools binconfig pkgconfig gettext
 
-- 
1.7.11.4



