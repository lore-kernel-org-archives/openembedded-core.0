Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUG-0003hQ-Pi
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2011 23:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="639948955"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2011 23:59:48 -0700
Message-Id: <570b63ecff202949d1de1b71d2c60a111e71d9dc.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 15:42:51 -0700
Date: Sun, 08 May 2011 23:59:47 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 04/20] libpcre: update upstream status for patches
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
X-List-Received-Date: Mon, 09 May 2011 07:02:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libpcre/files/fix-pcre-name-collision.patch    |    1 +
 .../recipes-support/libpcre/files/pcre-cross.patch |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch b/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch
index 6548353..4b21ffa 100644
--- a/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch
+++ b/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch
@@ -1,3 +1,4 @@
+Upstream-Status="Inappropriate [debian patch]"
 
 This patch address a namespace collision with libc.
 
diff --git a/meta/recipes-support/libpcre/files/pcre-cross.patch b/meta/recipes-support/libpcre/files/pcre-cross.patch
index 0626fb3..1867395 100644
--- a/meta/recipes-support/libpcre/files/pcre-cross.patch
+++ b/meta/recipes-support/libpcre/files/pcre-cross.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [configuration]"
+
 To be upstreamable, this patch requires check for *_FOR_BUILD, otherwise
 it needs to pass special variables.
 
-- 
1.7.1.1



