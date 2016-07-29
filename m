Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E5E4F6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 14:21:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2016 07:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,440,1464678000"; d="scan'208";a="1016224690"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2016 07:21:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 72E366A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:20:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 16:44:36 +0300
Message-Id: <cover.1469799731.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v5 0/2] mage creation improvements
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
X-List-Received-Date: Fri, 29 Jul 2016 14:21:48 -0000

Hi,

This patchset contains various improvements for the image creation functionality
made by Patchick Ohly during his work on bug #9076:
 - renamed COMPRESSION variables to CONVERSION as the term "compression" is no longer accurate
 - support converting masked types

Changes in v2: rebased on top of master-next
               returned image_getdepends back to image_types.bbclass
Changes in v3: rebased on top of recent master
Changes in v4: rebased on top of recent master
Changes in v5: removed 2 problematic patches

The following changes since commit 5b61fa04a335a4fdefd435dc25d4bac41ee21e39:

  bitbake: toaster-tests: fix URL given for Chromedriver download (2016-07-29 09:53:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/image-type-9076.v5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/image-type-9076.v5

Patrick Ohly (2):
  image creation: support converting masked types
  image.bbclass: rename COMPRESS(ION) to CONVERSION

 meta/classes/image-live.bbclass                    |  2 +-
 meta/classes/image-vm.bbclass                      | 33 ++-------
 meta/classes/image.bbclass                         | 82 +++++++++++++++-------
 meta/classes/image_types.bbclass                   | 66 +++++++++--------
 meta/classes/image_types_uboot.bbclass             | 18 ++---
 meta/conf/documentation.conf                       |  1 -
 .../images/build-appliance-image_15.0.0.bb         |  6 +-
 7 files changed, 112 insertions(+), 96 deletions(-)

--
Regards,
Ed


