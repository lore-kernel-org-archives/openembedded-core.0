Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 818597867B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:56:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 16:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; 
   d="scan'208";a="4472560"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 20 Dec 2017 16:56:40 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:56:31 -0800
Message-Id: <20171221005637.34163-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Cc: akuster@mvista.com
Subject: [rocko][PATCH 0/6] backport installer fixes for rocko
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
X-List-Received-Date: Thu, 21 Dec 2017 00:56:39 -0000

Hi Armin,

I know you're aware of these, but I don't see them in
contrib/stable/rocko-next anymore, so I just wanted to make sure they're
still going in.

These fix bugs [YOCTO #12111] and [YOCTO #12346].

If you already have them queued somewhere else, sorry for the noise!

Thanks,
Cal

California Sullivan (5):
  initramfs-module-install-efi: point to original copy and delete new
    file
  initramfs-module-install-efi: update summary
  initramfs-framework: add install module
  init-install: fix grub-install command
  install*.sh: add short sleep after parted commands

Martin Jansa (1):
  initramfs-module-install: Remove allarch and FILESEXTRAPATHS

 meta/conf/layer.conf                               |   4 +
 .../initrdscripts/files/init-install-efi.sh        |   7 +
 .../initrdscripts/files/init-install.sh            |   9 +-
 .../initramfs-framework/install-efi.sh             | 276 ---------------------
 .../initramfs-module-install-efi_1.0.bb            |   9 +-
 .../initrdscripts/initramfs-module-install_1.0.bb  |  22 ++
 6 files changed, 44 insertions(+), 283 deletions(-)
 delete mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb

-- 
2.14.3


