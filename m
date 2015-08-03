Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EABF475C5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 20:39:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2015 13:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,603,1432623600"; d="scan'208";a="741410573"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2015 13:39:29 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Mon,  3 Aug 2015 13:35:26 -0700
Message-Id: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: richard.purdie@intel.com
Subject: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Mon, 03 Aug 2015 20:39:48 -0000

In order to support VirtualBox guest additions, kernel headers need to be present 
in the VM. I am aware we already have two packages/recipes that are somewhat similar
(kernel-devsrc.bb, linux-libc-headers), but none of them is suitable for this purpose.
Besides the kernel headers, some additional files (scripts, Makefiles, .config, etc)
are also required. 

The new recipe "kernel-headers.bb" can in principle be used by other images as well.
It is not limited to the Build Appliance and hence is not a part of the Build Appliance
recipe.

Juro Bystricky (2):
  kernel-headers: linux kernel headers
  build-appliance-image: support for VirtualBox guest addtions

 .../README_vbox_guest_additions.txt                | 78 ++++++++++++++++++++++
 .../images/build-appliance-image_12.0.1.bb         |  4 +-
 meta/recipes-kernel/linux/kernel-headers.bb        | 66 ++++++++++++++++++
 3 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_vbox_guest_additions.txt
 create mode 100644 meta/recipes-kernel/linux/kernel-headers.bb

-- 
1.9.1


