Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVO-0003em-NR
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:51:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940383"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:44:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:44:00 +0000
Message-Id: <fe9a17a80fdd6cac94cfe91b23f0a05645a9ec79.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] xrestop: fix SRC_URI and LICENSE
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
X-List-Received-Date: Mon, 19 Dec 2011 15:51:59 -0000

* projects.o-hand.com downloads have moved to downloads.yoctoproject.org
* LICENSE syntax was invalid (should use & instead of + to signify mixed
  license). I have set it to GPLv2+ since there is only one source file
  and that's the license it states. (Note - even if it was a mix of
  GPLv2+ and GPLv2 code the result would be GPLv2 only.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/xrestop/xrestop_0.4.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index bd4c25c..13a5e61 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -5,16 +5,16 @@ DESCRIPTION = "top-like statistics of X11 server resource usage by clients"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xrestop"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
-LICENSE = "GPLv2 + GPLv2+"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://xrestop.c;endline=18;md5=730876c30f0d8a928676bcd1242a3b35"
 
 SECTION = "x11/utils"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "libxres libxext virtual/libx11"
 
-SRC_URI = "http://projects.o-hand.com/sources/xrestop/xrestop-${PV}.tar.gz"
+SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
-- 
1.7.5.4



