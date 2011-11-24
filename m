Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RTPlq-0004uI-NK
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:14:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAO389Sw024748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:08:09 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 19:08:08 -0800
Message-ID: <cover.1322102636.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 24 Nov 2011 10:43:56 +0800
Date: Thu, 24 Nov 2011 11:06:07 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/9] The patches to run gtk over directfb
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
X-List-Received-Date: Thu, 24 Nov 2011 03:14:43 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I fix some problems you raised on the basis of previous submitting.
1 Ignore PR bumps for some recipes
  There is no PR in gconf and I add it.
2 Add discription to directfb-examples and change its license.
  I read README of directfb-examples and its  license is MIT.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk+-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk+-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (9):
  qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
  gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
  gtk.inc: add directfb DISTRO_FEATURE
  gtk+: add demos to the configuation of gtk+
  cairo: add directfb DISTRO_FEATURE
  pango: add directfb DISTRO_FEATURE
  directfb-examples: add package directfb-examples to OE-core
  task-gtk-directfb.bb: Add task list to run gtk over directfb
  core-image-gtk-directfb.bb: add an image for gtk over directfb

 meta/recipes-bsp/qemu-config/qemu-config.bb        |    4 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    7 ++++-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   20 ++++++++++++---
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    7 ++++-
 meta/recipes-graphics/cairo/cairo.inc              |   12 +++++++--
 .../directfb/directfb-examples_1.2.0.bb            |   20 +++++++++++++++
 .../images/core-image-gtk-directfb.bb              |   21 ++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   19 +++++++++++---
 meta/recipes-graphics/tasks/task-gtk-directfb.bb   |   26 ++++++++++++++++++++
 9 files changed, 120 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
 create mode 100644 meta/recipes-graphics/tasks/task-gtk-directfb.bb



