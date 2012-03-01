Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30qm-0008UE-Ba
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:54:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Feb 2012 23:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="72182129"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Feb 2012 23:46:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:46:18 -0800
Message-Id: <cover.1330587785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/4] Create vmdk image creation class
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
X-List-Received-Date: Thu, 01 Mar 2012 07:54:56 -0000

Richard,

Here is the re-work of the vmdk image creation class, this 
integrates in as a class since it needs to happen after the
hddimg (live) is created.

Sau!

The following changes since commit 8054497b393d40a2ed8c802c74a02e92a3001297:

  image_types_uboot: Update to work after recent image_types changes (2012-02-29 18:23:04 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/self
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/self

Saul Wold (3):
  image-live: Allow LABELS to be modified
  image-vmdk: Create image_vmdk class and setup image and image_types
    to use it
  self-hosted-image:  Create a VMDK image with correct SYSLINUX_*
    settings

Zhai Edwin (1):
  self-hosted: Fix multiple libx11 error

 meta/classes/image-live.bbclass               |    5 +++--
 meta/classes/image-vmdk.bbclass               |   22 ++++++++++++++++++++++
 meta/classes/image.bbclass                    |    6 ++++--
 meta/classes/image_types.bbclass              |   15 +++++++++------
 meta/recipes-core/images/self-hosted-image.bb |   16 ++++++++++++++--
 meta/recipes-core/tasks/task-self-hosted.bb   |    4 ++--
 6 files changed, 54 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes/image-vmdk.bbclass

-- 
1.7.7.6



