Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYaXr-0001B2-4C
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:45:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB89cmZN024998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 01:38:48 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 8 Dec 2011 01:38:48 -0800
Message-ID: <cover.1323327959.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 8 Dec 2011 15:05:59 +0800
Date: Thu, 8 Dec 2011 17:33:57 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 00/10] gtk+-directfb: The patches to run gtk over directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 09:45:39 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I add "/etc/pango" to FILE_${PN} in pango.inc because this directory is used by other program. 
Thank Phil


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (10):
  qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
  gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
  gtk.inc: ship gtk-demo to independent package
  gtk.inc: add feature based on directfb
  gtk: add demos to the configuation of gtk+
  cairo: add directfb DISTRO_FEATURE
  pango: add directfb DISTRO_FEATURE
  directfb-examples: add package directfb-examples to OE-core
  task-core-gtk-directfb.bb: Add task list to run gtk over directfb
  core-image-gtk-directfb.bb: add an image for gtk over directfb

 meta/recipes-bsp/qemu-config/qemu-config.bb        |    4 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    6 +++-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   20 ++++++++++++---
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    6 +++-
 meta/recipes-graphics/cairo/cairo.inc              |    9 +++++-
 .../directfb/directfb-examples_1.2.0.bb            |   20 +++++++++++++++
 .../images/core-image-gtk-directfb.bb              |   21 ++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   19 ++++++++++----
 .../tasks/task-core-gtk-directfb.bb                |   26 ++++++++++++++++++++
 9 files changed, 114 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
 create mode 100644 meta/recipes-graphics/tasks/task-core-gtk-directfb.bb



