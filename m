Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerp-00041j-UC
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203816"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:44 -0700
Message-Id: <cb3703398118227df86a147490f054886efa4243.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/32] msmtp: update tof 1.4.24
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../msmtp/{msmtp_1.4.23.bb => msmtp_1.4.24.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.4.23.bb => msmtp_1.4.24.bb} (81%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.23.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
similarity index 81%
rename from meta/recipes-extended/msmtp/msmtp_1.4.23.bb
rename to meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index d48881a..39a7eea 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.23.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.bz2 \
           "
 
-SRC_URI[md5sum] = "5fb7ae88186624cdb125d3efad3fdc16"
-SRC_URI[sha256sum] = "269cd30eeb867167c6a599e23399f4fc24196fcdef3bac5b120d806b3b421810"
+SRC_URI[md5sum] = "3ed704fbd3e7419cab5c65bb7928d9ba"
+SRC_URI[sha256sum] = "f19f3fcc67da448420b3adbd5add09f8fe110664dd64f3c2cd693ef0cb736887"
 
 inherit gettext autotools update-alternatives
 
-- 
1.7.3.4



