Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QtTfX-0007gT-D8
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 02:07:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2011 17:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,236,1312182000"; 
   d="scan'208";a="7928890"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.244])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2011 17:02:59 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 17:02:49 -0700
Message-Id: <43bd6d395732a99058b427739aefdc5dfa0c0e95.1313539219.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313539219.git.josh@linux.intel.com>
References: <cover.1313539219.git.josh@linux.intel.com>
In-Reply-To: <cover.1313539219.git.josh@linux.intel.com>
References: <cover.1313539219.git.josh@linux.intel.com>
Subject: [PATCH 1/1] shadow: switch to a fetchable SRC_URI
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
X-List-Received-Date: Wed, 17 Aug 2011 00:07:41 -0000

Swith the SRC_URI to the one referenced on the sources section of the
utilities download page (http://pkg-shadow.alioth.debian.org/download.php).

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../shadow/shadow-native_4.1.4.3.bb                |    2 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index c4db7ea..485495e 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 PR = "r0"
 
-SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
+SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 70d4cbb..728b8e5 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
 PR = "r3"
 
-SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
+SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://securetty \
-- 
1.7.6



