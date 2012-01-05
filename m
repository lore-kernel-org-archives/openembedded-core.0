Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rix9C-0007SD-P3
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 00:55:02 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp209.alice.it
	(8.6.023.02) id 4EF08A630189DD45; Fri, 6 Jan 2012 00:47:39 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri,  6 Jan 2012 00:42:07 +0100
Message-Id: <cover.1325806595.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] xserver minor cleanings and commit of fbdev driver
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
X-List-Received-Date: Thu, 05 Jan 2012 23:55:02 -0000

Andrea Adami (2):
  x11-common: remove extraneous BSP customizations
  xorg-driver: add xf86-video-fbdev from meta-openembedded

 .../x11-common/x11-common/etc/X11/Xserver          |   24 --------------------
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 ++++++
 2 files changed, 8 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb

-- 
1.7.3.4



