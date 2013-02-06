Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U38Ek-00050g-CP
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 17:52:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Feb 2013 08:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,616,1355126400"; d="scan'208";a="253404679"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 06 Feb 2013 08:36:43 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 18:36:29 +0200
Message-Id: <963dda7fb1722619fff678997f97983bab6a5314.1360166922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360166922.git.laurentiu.palcu@intel.com>
References: <cover.1360166922.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360166922.git.laurentiu.palcu@intel.com>
References: <cover.1360166922.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/6] gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
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
X-List-Received-Date: Wed, 06 Feb 2013 16:53:03 -0000

This is needed if the GTKIMMODULES_PACKAGES is changed later, in
do_populate_packages for example. This way, we don't have to add another
dumb asignment in the recipe inheriting this.

[YOCTO #3853]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-immodules-cache.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index a8855af..6a5bc19 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -6,6 +6,8 @@ DEPENDS =+ "qemu-native"
 
 inherit qemu
 
+GTKIMMODULES_PACKAGES ?= "${PN}"
+
 gtk_immodule_cache_postinst() {
 if [ "x$D" != "x" ]; then
     for maj_ver in 2 3; do
-- 
1.7.9.5



