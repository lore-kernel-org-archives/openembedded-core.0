Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qld09-00005I-3V
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 10:28:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 01:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="34539815"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 01:24:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 01:24:07 -0700
Message-Id: <cover.1311668437.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [RFC-WIP 0/3] Live Image Type - Please Review
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
X-List-Received-Date: Tue, 26 Jul 2011 08:28:29 -0000

This patch set removes the -directdisk and -live recipes in favor
of having a "live" image part of IMAGE_FSTYPES.  This is a first 
pass and is not 100% (currently missing the correct incantion to 
create the initrd file, it creates the initramfs.ext3 but missing 
a step).

Thanks
	Sau!


The following changes since commit f10a3457cdfbb4a94978da998d178d4254632fa7:

  Move architecture specific TARGET_OS mangling into tune files (2011-07-25 14:19:54 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/live
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/live

Saul Wold (3):
  classes/image*: Revamp creation of live images
  Remove -live.bb recipes
  Remove -directdisk.bb recipes

 meta-rt/images/core-image-minimal-rt-directdisk.bb |   15 --------------
 .../{bootimg.bbclass => image-live.bbclass}        |   11 ++++++++++
 meta/classes/image.bbclass                         |    3 ++
 meta/classes/image_types.bbclass                   |   20 +++++++++++++++++-
 meta/recipes-core/images/core-image-directdisk.inc |   11 ----------
 meta/recipes-core/images/core-image-live.inc       |   21 --------------------
 .../images/core-image-minimal-directdisk.bb        |   11 ----------
 .../recipes-core/images/core-image-minimal-live.bb |   11 ----------
 .../recipes-extended/images/core-image-lsb-live.bb |   11 ----------
 .../images/core-image-lsb-sdk-live.bb              |   11 ----------
 .../images/core-image-sato-directdisk.bb           |    9 --------
 meta/recipes-sato/images/core-image-sato-live.bb   |   11 ----------
 .../images/core-image-sato-sdk-directdisk.bb       |    9 --------
 .../images/core-image-sato-sdk-live.bb             |   11 ----------
 14 files changed, 32 insertions(+), 133 deletions(-)
 delete mode 100644 meta-rt/images/core-image-minimal-rt-directdisk.bb
 create mode 100644 meta/classes/image-empty.bbclass
 rename meta/classes/{bootimg.bbclass => image-live.bbclass} (91%)
 delete mode 100644 meta/recipes-core/images/core-image-directdisk.inc
 delete mode 100644 meta/recipes-core/images/core-image-live.inc
 delete mode 100644 meta/recipes-core/images/core-image-minimal-directdisk.bb
 delete mode 100644 meta/recipes-core/images/core-image-minimal-live.bb
 delete mode 100644 meta/recipes-extended/images/core-image-lsb-live.bb
 delete mode 100644 meta/recipes-extended/images/core-image-lsb-sdk-live.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-directdisk.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-live.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-directdisk.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-live.bb

-- 
1.7.3.4



