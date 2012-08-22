Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4ILS-00058H-Em
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 23:20:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2012 14:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,296,1344236400"; d="scan'208";a="208828071"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2012 14:08:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 14:07:55 -0700
Message-Id: <f8b5bec5e5eaeabf68a4f71513a5d8d48d69c680.1345669569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1345669569.git.sgw@linux.intel.com>
References: <cover.1345669569.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] cups: disable pdftops
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
X-List-Received-Date: Wed, 22 Aug 2012 21:20:10 -0000

This ensure a reliable built without host contamination, this
will also disable the usage of ghostscript.

[YOCTO #2966]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/cups14.inc    |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index 0517007..9fae880 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -21,6 +21,7 @@ EXTRA_OECONF = " \
                --without-perl \
                --without-python \
                --without-java \
+               --with-pdftops=none \
                "
 
 
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 8485180..aadaa07 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
 
-PR = "r5"
+PR = "r6"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-- 
1.7.7.6



