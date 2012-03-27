Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SCPKA-0006em-7r
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 07:52:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Mar 2012 22:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146024232"
Received: from unknown (HELO swold-mobl.domain.invalid) ([10.255.12.107])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2012 22:43:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 22:42:54 -0700
Message-Id: <cover.1332826876.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/6] Setup for VMDK to use Direct Disk
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
X-List-Received-Date: Tue, 27 Mar 2012 05:52:06 -0000

Updated comments per Darren's request, added cleanup to
image-types to only use one -i (inode-count) parameter.

Sau!
The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:

  guile: Deal with hardcoded path issues (2012-03-27 00:28:41 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/self
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/self

Dexuan Cui (1):
  self-hosted-image: pre-populate the builder user with poky source

Saul Wold (5):
  image-vmdk: Add symbolic link for a short named vmdk image
  boot-directdisk: Fix Block Calcuation
  vmdk: Update for direstdisk
  builder: Enable auto starting of Hob
  image_types: remove duplicate setting of -i for inode count

 meta/classes/boot-directdisk.bbclass               |   19 ++++++---
 meta/classes/image-vmdk.bbclass                    |   17 +++++++-
 meta/classes/image_types.bbclass                   |    5 +-
 meta/recipes-core/images/self-hosted-image.bb      |   41 +++++++++++++++++++-
 meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
 .../builder/files/builder_hob_start.sh             |   10 +++-
 6 files changed, 77 insertions(+), 17 deletions(-)

-- 
1.7.7.6



