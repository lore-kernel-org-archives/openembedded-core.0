Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RbU6L-0008Ts-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 10:29:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBG9MDNM021610
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 01:22:13 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 16 Dec 2011 01:22:13 -0800
Message-ID: <cover.1324025415.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 16 Dec 2011 16:50:15 +0800
Date: Fri, 16 Dec 2011 17:15:47 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/3] xserver-kdrive: update to 1.11.2
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
X-List-Received-Date: Fri, 16 Dec 2011 09:29:14 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Some changes are as follow:
1 Adopt evdev mode to get keyboard 
  - modify Xserver in meta/recipes-graphics/x11-common/x11-common/etc/X11/
2 Create a symlink to any keyboard input device
  - modify local.rules in recipes-core/udev/udev-164
  The goal of this is for xserver can get keyboard device automatically without appointing an input event manually. 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (3):
  udev: add a link between /dev/input/event* with keyboard
  x11-common: Change drive mode of Xfbdev when xserver using
    framebuffer
  xserver-kdrive: update to 1.11.2

 meta/recipes-core/udev/udev-164/local.rules        |    3 +-
 .../x11-common/x11-common/etc/X11/Xserver          |    4 +-
 .../xserver-kdrive-1.11.2/disable-apm.patch        |   22 ++
 .../xserver-kdrive-1.11.2/extra-kmodes.patch       |   82 ++++++
 .../xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch |   57 ++++
 .../fix-newer-xorg-headers.patch                   |   13 +
 .../hide-cursor-and-ppm-root.patch                 |  298 ++++++++++++++++++++
 .../keyboard-resume-workaround.patch               |   26 ++
 .../xserver-kdrive-1.11.2/no-serial-probing.patch  |   16 +
 .../xorg-xserver/xserver-kdrive_1.11.2.bb          |   26 ++
 10 files changed, 545 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb



