Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912q-0007eL-3f
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2011 13:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="677361459"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2011 13:13:26 -0700
Message-Id: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Sun, 10 Apr 2011 13:11:09 -0700
Date: Sun, 10 Apr 2011 13:13:25 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 0/6] Cumulative patches from Mailing List
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
X-List-Received-Date: Sun, 10 Apr 2011 20:15:40 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

Here is a set of patches from the Mailing list that I have pulled
together and tested, these address a varitey of issues along with 
some autobuilder failure fixes

Sau!


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Colin Walters (1):
  autotools: Pass --disable-silent-rules to configure

Darren Hart (1):
  README.hardware: automate boot process for router station pro

Gary Thomas (1):
  Allow JFFS2 image options to be overridden

Saul Wold (2):
  clutter-1.6: fix SRC_URI[md5sum]
  qt4-x11-free: add virtual/libgl for opengl dependency

Xiaofeng Yan (1):
  eglibc-package.inc: Add eglibc-binaries, eglibc-localedatas,
    eglibc-gconvs and eglibc-charmps to variable PACKAGE

 README.hardware                                    |   22 ++++++++++++++++++++
 meta/classes/autotools.bbclass                     |    1 +
 meta/classes/image_types.bbclass                   |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |   20 ++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
 6 files changed, 47 insertions(+), 4 deletions(-)



