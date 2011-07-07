Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QextV-0002D3-Oo
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:22:05 +0200
Received: from mizar.localdomain (87.5.248.98) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A02472BF6; Fri, 8 Jul 2011 01:12:35 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 01:11:54 +0200
Message-Id: <cover.1310079506.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] Add support for initramfs
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
X-List-Received-Date: Thu, 07 Jul 2011 23:22:05 -0000

* Sync with org.openembedded.dev and allow the inclusion of
* lzma and xz compressed images.

Andrea Adami (2):
  kernel.bbclass: handle embedding of initramfs images
  image_types.bbclass: support xz compressed initramfs.cpio and
    tarballs

 meta/classes/image_types.bbclass |   13 +++++++++++++
 meta/classes/kernel.bbclass      |   22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

-- 
1.7.3.4



