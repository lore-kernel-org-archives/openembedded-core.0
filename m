Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 77EF577AB5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:07:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 11:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="139546290"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2017 11:07:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 11:06:52 -0700
Message-Id: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v4 0/5] Reproducible binaries
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
X-List-Received-Date: Sat, 19 Aug 2017 18:07:14 -0000


This is a reduced set of the original patchset "Reproducible binaries".

For more details, please see the cover letter in:

https://patchwork.openembedded.org/series/6504/#

The patchset is reduced as some of the patches were already merged.
Also removed from the patchset is the patch for python2.7 support of
SOURCE_DATE_EPOCH in .pyc images, this one was sent to ML separately
and should be treated as such.

This set is rebased to the current master 782cdf14e3f2d5b321efa59d8d1b93554af86516
(as of August 19 2017)

The only functional changes are in "reproducible_build.bbclass":

1. Rename "src_date_epoch.txt" to "__source_date_epoch.txt" to minimize file name clashes
2. Create the file "src_date_epoch.txt" in ${WORKDIR} instead of ${S}, to avoid an inadvertent
   inclusion of this file in a package.



Juro Bystricky (5):
  reproducible_build.bbclass: initial support for binary reproducibility
  cpio: provide cpio-replacement-native
  image_types.bbclass: improve cpio image reproducibility
  poky-reproducible.conf: Initial version
  rootfs-postcommands.bbclass: support binary reproducibility

 meta-poky/conf/distro/include/reproducible-group  |  50 ++++++++++
 meta-poky/conf/distro/include/reproducible-passwd |  25 +++++
 meta-poky/conf/distro/poky-reproducible.conf      |  38 ++++++++
 meta/classes/base.bbclass                         |   4 +
 meta/classes/image_types.bbclass                  |  14 ++-
 meta/classes/reproducible_build.bbclass           | 107 ++++++++++++++++++++++
 meta/classes/rootfs-postcommands.bbclass          |  26 +++++-
 meta/recipes-extended/cpio/cpio_v2.inc            |   2 +
 8 files changed, 262 insertions(+), 4 deletions(-)
 create mode 100644 meta-poky/conf/distro/include/reproducible-group
 create mode 100644 meta-poky/conf/distro/include/reproducible-passwd
 create mode 100644 meta-poky/conf/distro/poky-reproducible.conf
 create mode 100644 meta/classes/reproducible_build.bbclass

-- 
2.7.4


