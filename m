Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Ra4Fn-0000wG-EB
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 12:41:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBCBYB4k018426
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 03:34:12 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 12 Dec 2011 03:34:11 -0800
Message-ID: <cover.1323688579.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 12 Dec 2011 19:16:19 +0800
Date: Mon, 12 Dec 2011 19:28:32 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/7] gtk+-directfb: The patches to run gtk over directfb
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
X-List-Received-Date: Mon, 12 Dec 2011 11:41:07 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Phil, Koen & Richard,

Thanks for your good suggestion. I have modified my patches according to your suggestion.
1 Remove patch no-demo.patch from gtk+_2.24.8(Richard's suggestion)
2 Use gtk-directfb in DISTRO_FEATURES(Koen's suggestion)
3 Remvoe PACKAGECONFIG[directfb] for pango(Phil's suggestion)

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (7):
  cairo: add directfb DISTRO_FEATURE
  pango: Disable x11 when pango doesn't run over x11
  gtk.inc: add feature based on directfb
  gtk: add demos to the configuation of gtk+
  directfb-examples: add package directfb-examples to OE-core
  task-core-gtk-directfb.bb: Add task list to run gtk over directfb
  core-image-gtk-directfb.bb: add an image for gtk over directfb

 meta/recipes-gnome/gtk+/gtk+.inc                   |   16 ++++++++++--
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    4 +-
 meta/recipes-graphics/cairo/cairo.inc              |   11 ++++++--
 .../directfb/directfb-examples_1.2.0.bb            |   20 +++++++++++++++
 .../images/core-image-gtk-directfb.bb              |   21 ++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   16 +++++++++---
 .../tasks/task-core-gtk-directfb.bb                |   26 ++++++++++++++++++++
 7 files changed, 102 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
 create mode 100644 meta/recipes-graphics/tasks/task-core-gtk-directfb.bb



