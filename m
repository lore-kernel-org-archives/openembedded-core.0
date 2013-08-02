Return-Path: <ionutx.radu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 633BE6B4F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:37:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2013 08:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="380251810"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2013 08:37:47 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:40:27 +0300
Message-Id: <cover.1375457879.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Package upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 15:37:49 -0000

freetype: tested on core-image-sato on all architectures (x86, x86-64, arm, ppc, mips)
gdk-pixbuf: tested on core-image-sato on all architectures (x86, x86-64, arm, ppc, mips)

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (2):
  freetype: upgrade to 2.5.0.1
  gdk-pixbuf: upgrade to 2.28.2

 .../gdk-pixbuf/{gdk-pixbuf_2.28.1.bb => gdk-pixbuf_2.28.2.bb}    |    4 ++--
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb}         |    6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.28.1.bb => gdk-pixbuf_2.28.2.bb} (94%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb} (90%)

-- 
1.7.10.4


