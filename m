Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1iZ-000292-8g
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:00:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2012 09:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101465511"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2012 09:52:54 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:10 +0800
Message-Id: <87f0c9b26d06d983e5364ae5f4f1749a111d1c9c.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 05/18] polkit: upgrade to 0.104
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
X-List-Received-Date: Sun, 22 Jan 2012 18:00:39 -0000

Upgrade polkit to 0.104.
And fix the typo for "endline" and the checksum.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../introspection.patch                            |    0
 .../polkit-1_pam.patch                             |    0
 .../polkit/{polkit_0.103.bb => polkit_0.104.bb}    |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/polkit/{polkit-0.103 => polkit-0.104}/introspection.patch (100%)
 rename meta/recipes-extended/polkit/{polkit-0.103 => polkit-0.104}/polkit-1_pam.patch (100%)
 rename meta/recipes-extended/polkit/{polkit_0.103.bb => polkit_0.104.bb} (83%)

diff --git a/meta/recipes-extended/polkit/polkit-0.103/introspection.patch b/meta/recipes-extended/polkit/polkit-0.104/introspection.patch
similarity index 100%
rename from meta/recipes-extended/polkit/polkit-0.103/introspection.patch
rename to meta/recipes-extended/polkit/polkit-0.104/introspection.patch
diff --git a/meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch b/meta/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
similarity index 100%
rename from meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch
rename to meta/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
diff --git a/meta/recipes-extended/polkit/polkit_0.103.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
similarity index 83%
rename from meta/recipes-extended/polkit/polkit_0.103.bb
rename to meta/recipes-extended/polkit/polkit_0.104.bb
index 7f56242..e51e017 100644
--- a/meta/recipes-extended/polkit/polkit_0.103.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "The polkit package is an application-level toolkit for defining a
 HOMEPAGE = "http://code.google.com/p/polkit/"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
-                    file://src/polkit/polkit.h;beginline=1;endilne=20;md5=9f797b8912dac8a806be820c14e783f8 \
+                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4 \
                     file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
-SRC_URI[md5sum] = "aaacf2ef18774ea8a825a426a7cfe763"
-SRC_URI[sha256sum] = "36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5"
+SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
+SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 PR = "r0"
-- 
1.7.6



