Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SC3qm-0003s4-Sa
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:56:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Mar 2012 23:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133089923"
Received: from unknown (HELO localhost.localdomain) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2012 23:47:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 23:47:03 -0700
Message-Id: <cover.1332744104.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Build App RFC 0/5] Review Request for Build Appliance
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
X-List-Received-Date: Mon, 26 Mar 2012 06:56:21 -0000

Richard,

This is an updated set of changes for the Build Appliance to use
directdisk.  I am submitting this even as I am finding out that
there is an issue with genext2fs building Large FS Size (5GB and
greater).

The other option is to add a newer version of dosfstools, which is
not fully vetted yet, but may allow us to use bootimg instead of 
driectdisk.

Please review and comment the builder, image-vmdk and boot-directdisk
patches ready to go, the VMDK, update for directdisk is questionable
until we can solve the large image issues.

Sau!

The following changes since commit 647595821870693186c9ecad1bdfa12fe4ea334d:

  core-image-minimal-mtdutils.bb: Simple DESCRIPTION grammar fix. (2012-03-25 12:27:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/self
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/oe-self

Dexuan Cui (1):
  self-hosted-image: pre-populate the builder user with poky source

Saul Wold (4):
  image-vmdk: Add symbolic link
  boot-directdisk: Fix Block Calcuation
  vmdk: Update for direstdisk
  builder: Enable auto starting of Hob

 meta/classes/boot-directdisk.bbclass               |   19 ++++++---
 meta/classes/image-vmdk.bbclass                    |   17 +++++++-
 meta/recipes-core/images/self-hosted-image.bb      |   41 +++++++++++++++++++-
 meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
 .../builder/files/builder_hob_start.sh             |   10 +++-
 5 files changed, 74 insertions(+), 15 deletions(-)

-- 
1.7.7.6



