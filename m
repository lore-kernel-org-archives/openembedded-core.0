Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UNQlu-0003Vk-EU
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:42:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2013 09:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="280272428"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2013 09:25:28 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 19:25:27 +0300
Message-Id: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2 v2] Udev multilib fixes
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
X-List-Received-Date: Wed, 03 Apr 2013 16:43:03 -0000

Changed /lib with ${base_libdir}
Fixes [YOCTO #4096]

Radu Moisan (2):
  initramfs-live-boot: enable multilib support
  udev: enable multilib support

 .../initrdscripts/initramfs-live-boot_1.0.bb       |    1 +
 meta/recipes-core/udev/udev.inc                    |    1 +
 2 files changed, 2 insertions(+)

-- 
1.7.9.5



