Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QgP6M-0004n8-Nc
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 00:37:18 +0200
Received: from mizar.localdomain (87.5.26.241) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A029D5647; Tue, 12 Jul 2011 00:33:22 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 00:33:10 +0200
Message-Id: <cover.1310421821.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH V2 0/2] Embedding initramfs images during kernel build.
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
X-List-Received-Date: Mon, 11 Jul 2011 22:37:18 -0000

* Sync with org.openembedded.dev and allow the inclusion of
* lzma and xz compressed initramfs images.
*
* Provide a convenient way to include an initramfs by setting
* INITRAMFS_IMAGE = "your_initramfs_image.bb"
* and specifying the chosen output format in the initramfs image recipe, e.g.
* IMAGE_FSTYPES = "cpio.gz cpio.lzma"

Andrea Adami (2):
  kernel.bbclass: handle embedding of initramfs images
  image_types.bbclass: support xz compressed initramfs.cpio and
    tarballs

 meta/classes/image_types.bbclass |   11 +++++++++++
 meta/classes/kernel.bbclass      |   16 ++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

-- 
1.7.3.4



