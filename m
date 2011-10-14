Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUO-0002Sz-Ci
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540451"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:06 -0700
Message-Id: <ac76c7449e58de7ef5dbc80d07b2b9b56e28477a.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/28] glib-2.0: Extend to provide nativesdk recipe
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:24 -0000

From: Khem Raj <raj.khem@gmail.com>

qemu-nativesdk 0.15 needs it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
index 7430d88..df7190c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
@@ -18,6 +18,6 @@ SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 SRC_URI[md5sum] = "789e7520f71c6a4bf08bc683ec764d24"
 SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF_append = " --enable-dtrace=no"
-- 
1.7.6.2



