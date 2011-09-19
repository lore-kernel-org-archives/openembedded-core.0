Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5bdm-0007gt-F6
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 13:03:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 03:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50049732"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.110])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 03:58:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 11:58:35 +0100
Message-Id: <8adf4e17114024ff1c1bea2f65df864c0bf04a8f.1316429640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] libgnome-keyring: add libgcrypt to DEPENDS
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
X-List-Received-Date: Mon, 19 Sep 2011 11:03:58 -0000

libgcrypt is a required dependency according to the configure script, so
add it to DEPENDS. (This fixes a race condition when libgcrypt happens
to be building at the same time as libgnome-keyring.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
index 09b6d9c..53e583e 100644
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
                     file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
 
 SECTION = "x11/gnome/libs"
-PR = "r0"
+PR = "r1"
 
 inherit gnome
 
-DEPENDS = "dbus eggdbus"
+DEPENDS = "dbus eggdbus libgcrypt"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
1.7.4.1



