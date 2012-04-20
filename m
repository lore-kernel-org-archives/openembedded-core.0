Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH74-0005g2-S9
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167902"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:18 -0700
Message-Id: <8f5a6133a6bdf8043240955ae0762a96bd907db9.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/43] gthumb: Disable parallel make for gthumb install
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:15 -0000

From: Darren Hart <dvhart@linux.intel.com>

With PARALLEL_MAKE set to 14, I frequently see the gthumb do_install
task hang. Make is spinning at 100% CPU and the build makes no
more progress.

The following work-around proposed by Richard Purdie allows progress
to be made.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Joshua Lock <josh@linux.intel.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 5c87dc1..5821dc4 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -8,6 +8,8 @@ PR = "r2"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
+PARALLEL_MAKEINST=""
+
 inherit gnome pkgconfig
 
 FILES_${PN} += "${datadir}/icons"
-- 
1.7.7.6



