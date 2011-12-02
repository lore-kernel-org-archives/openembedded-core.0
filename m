Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RWLoZ-0007Xm-EK
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 06:37:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB25UtYc009518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 21:30:55 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 1 Dec 2011 21:30:54 -0800
Message-ID: <cover.1322803309.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 2 Dec 2011 13:21:49 +0800
Date: Fri, 2 Dec 2011 13:27:17 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] xserver-kdrive: update to 1.11.2
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
X-List-Received-Date: Fri, 02 Dec 2011 05:37:39 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Some changes during updating this package.

1 Change keyboard drive mode of start X from keyboard to evdev. 
2 Comment some obsolete patches

I didn't remove patches commented by "#". If this new vesion is stable after using or testing.
I will remove them.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  x11-common: Change drive mode of Xfbdev when xserver using
    framebuffer
  xserver-kdrive: update to 1.11.2

 .../x11-common/x11-common/etc/X11/Xserver          |    4 +-
 .../xserver-kdrive-1.11.2/disable-apm.patch        |   22 +
 .../enable-builtin-fonts.patch                     |   16 +
 .../xserver-kdrive-1.11.2/extra-kmodes.patch       |   82 +++
 .../xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch |   57 +++
 .../fix-newer-xorg-headers.patch                   |   13 +
 .../hide-cursor-and-ppm-root.patch                 |  298 +++++++++++
 .../xserver-kdrive-1.11.2/kdrive-evdev.patch       |  520 ++++++++++++++++++++
 .../xserver-kdrive-1.11.2/kdrive-use-evdev.patch   |   58 +++
 .../keyboard-resume-workaround.patch               |   26 +
 .../xserver-kdrive-1.11.2/no-serial-probing.patch  |   16 +
 .../xserver-kdrive-1.11.2/optional-xkb.patch       |   62 +++
 .../xorg-xserver/xserver-kdrive_1.11.2.bb          |   35 ++
 13 files changed, 1208 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/enable-builtin-fonts.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-evdev.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-use-evdev.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/optional-xkb.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb



