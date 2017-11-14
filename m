Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C03CC60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 21:20:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 13:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,396,1505804400"; 
   d="scan'208";a="2290776"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 14 Nov 2017 13:20:56 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 13:20:47 -0800
Message-Id: <20171114212050.15881-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Cc: henry.bruce@intel.com, saul.wold@intel.com
Subject: [PATCH 0/3] initramfs-framework installation improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 21:20:55 -0000

initramfs-framework was improved last release to support live booting
and installation. Meta-intel adopted the initramfs-framework scripts
early, but unfortunately we missed that there was not yet a non-EFI
installation script, resulting in bug [YOCTO #12346].

The third patch address that issue, whereas the first two are just minor
improvements to the install-efi module.

California Sullivan (3):
  initramfs-module-install-efi: point to original copy and delete new
    file
  initramfs-module-install-efi: update summary
  initramfs-framework: add install module

 .../initramfs-framework/install-efi.sh             | 276 ---------------------
 .../initramfs-module-install-efi_1.0.bb            |   8 +-
 .../initrdscripts/initramfs-module-install_1.0.bb  |  20 ++
 3 files changed, 24 insertions(+), 280 deletions(-)
 delete mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb

-- 
2.9.5


