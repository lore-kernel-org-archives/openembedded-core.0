Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RVhdB-0005EK-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 11:43:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUAaWgB028031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 02:36:32 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Nov 2011 02:36:32 -0800
Message-ID: <cover.1322648566.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 30 Nov 2011 18:22:46 +0800
Date: Wed, 30 Nov 2011 18:33:15 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] xserver-kdrive: update to 1.11.1.902
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
X-List-Received-Date: Wed, 30 Nov 2011 10:43:14 -0000
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
  xserver-kdrive: update to 1.11.1.902

 .../x11-common/x11-common/etc/X11/Xserver          |    4 ++-
 .../xorg-xserver/xserver-kdrive_1.11.1.902.bb      |   37 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb



