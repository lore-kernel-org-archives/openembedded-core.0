Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QIBt6-0006lK-GU
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 05:39:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 May 2011 20:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,324,1301900400"; d="scan'208";a="431491337"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 05 May 2011 20:36:34 -0700
Message-Id: <9f5bad63cdb9407e55243fecde212a2a79a1f96c.1304652773.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304652773.git.nitin.a.kamble@intel.com>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 3 May 2011 15:42:51 -0700
Date: Thu, 05 May 2011 20:36:34 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 02/10] libpcre: update upstream status for patches
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
X-List-Received-Date: Fri, 06 May 2011 03:39:32 -0000

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
1.7.3.4



