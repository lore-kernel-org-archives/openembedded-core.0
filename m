Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREP-0007b4-5z
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPE9k026675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:14 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:04 -0500
Message-ID: <cda77897deac99139deac0993b4b0220a0627389.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 10/40] sysfsutils: Fall back to default -dbg package
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:49 -0000
Content-Type: text/plain

The overriden -dbg package wasn't including all of the associated sources,
fall back to the default -dbg package instead.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index 5343f64..0b3f04a 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
                     file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
                     file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
 	  file://sysfsutils-2.0.0-class-dup.patch \
@@ -20,8 +20,6 @@ S = "${WORKDIR}/sysfsutils-${PV}"
 
 inherit autotools
 
-PACKAGES_prepend = "libsysfs libsysfs-dbg libsysfs-dev "
+PACKAGES_prepend = "libsysfs libsysfs-dev "
 FILES_libsysfs = "${libdir}/*.so.*"
 FILES_libsysfs-dev = "${libdir}/* ${includedir}"
-FILES_libsysfs-dbg = "${libdir}/.debug"
-FILES_${PN}-dbg = "${bindir}/.debug"
-- 
1.7.3.4



