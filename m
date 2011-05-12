Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKZbF-0000Sf-86
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 19:22:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 10:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,359,1301900400"; 
   d="scan'208";a="894417"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 10:20:08 -0700
Message-Id: <d391e28d3cb9c89249431ce943392493b25978df.1305220736.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305220736.git.sgw@linux.intel.com>
References: <cover.1305220736.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 10:15:40 -0700
Date: Thu, 12 May 2011 10:20:08 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/1] distcc: Update SRC_URI
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
X-List-Received-Date: Thu, 12 May 2011 17:22:57 -0000

From: Saul Wold <sgw@linux.intel.com>

The distcc source location moved from samba.org to googlecode.com

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index b6b7b78..1f5c2af 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -11,8 +11,8 @@ RRECOMMENDS_${PN} = "avahi-daemon"
 
 # Upstream change this patch periodically so store locally
 # http://0pointer.de/public/distcc-avahi.patch
-SRC_URI = "http://distcc.samba.org/ftp/distcc/distcc-${PV}.tar.bz2 \
-           file://distcc-avahi.patch;patch=1 \	  
+SRC_URI = "http://distcc.googlecode.com/files/${PN}-${PV}.tar.bz2 \
+           file://distcc-avahi.patch \	  
 	   file://default \
 	   file://distccmon-gnome.desktop \
 	   file://distcc"
-- 
1.7.1.1



