Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UNQlv-0003Vl-Cs
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:42:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2013 09:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="280272432"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2013 09:25:29 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 19:25:28 +0300
Message-Id: <1365006329-20964-2-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
Subject: [PATCH 1/2] initramfs-live-boot: enable multilib support
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
X-List-Received-Date: Wed, 03 Apr 2013 16:43:03 -0000

Use base_libdir instead harcoded /lib
Fixes [YOCTO #4096]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 1e674a4..0c354ae 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -15,6 +15,7 @@ do_compile() {
 }
  
 do_install() {
+        sed -i 's@/lib/udev@${base_libdir}/udev@g' ${WORKDIR}/init-live.sh
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
 }
 
-- 
1.7.9.5



