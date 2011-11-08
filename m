Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNjcr-0007c9-LJ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:13:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA8B7gCe014908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 03:07:42 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 8 Nov 2011 03:07:42 -0800
Message-ID: <cover.1320750179.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 8 Nov 2011 19:02:59 +0800
Date: Tue, 8 Nov 2011 19:15:43 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/7] gtk+ over directfb: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 11:13:58 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Image "gtk+ over directfb" without x11 depends on gtk+ and directfb. Someone can develop software based on directfb or gtk+ without x11 in their project. 
So I added and modified some recipes for getting this image.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk+-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk+-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (7):
  qemu-config.bb: Fix bug 1674
  gtk+: Fix bug 1674
  cairo: Fix bug 1674
  directfb-examples: Fix bug 1674
  core-image-gtk-directfb-sdk: Fix bug 1674
  core-image-gtk-directfb: Fix bug 1674
  pango: Fix bug 1674

 meta/recipes-bsp/qemu-config/qemu-config.bb        |    4 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   18 ++++++++++---
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |   17 ++++++++---
 meta/recipes-graphics/cairo/cairo.inc              |    9 +++++-
 .../directfb/directfb-examples_1.2.0.bb            |   18 ++++++++++++
 .../images/core-image-gtk-directfb-sdk.bb          |   23 ++++++++++++++++
 .../images/core-image-gtk-directfb.bb              |   21 +++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   16 ++++++++---
 meta/recipes-graphics/tasks/task-gtk-directfb.bb   |   28 ++++++++++++++++++++
 9 files changed, 136 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb-sdk.bb
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
 create mode 100644 meta/recipes-graphics/tasks/task-gtk-directfb.bb



