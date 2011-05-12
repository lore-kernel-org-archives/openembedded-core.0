Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThA-0000nB-Nq
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860829"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:45 -0700
Message-Id: <bf54469f8e6c9ce6138e40bbc45f56f58a2b5c95.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:37:08 +0800
Date: Thu, 12 May 2011 19:01:42 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 44/54] libglade: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../libglade/libglade-2.6.4/glade-cruft.patch      |    2 ++
 .../libglade/libglade-2.6.4/no-deprecation.patch   |    2 ++
 .../libglade/libglade-2.6.4/no-xml2.patch          |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
index 0fceccf..c5d5864 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -ur libglade-2.4.0~/configure.in libglade-2.4.0/configure.in
 --- libglade-2.4.0~/configure.in	2004-05-17 12:38:31.000000000 +0100
 +++ libglade-2.4.0/configure.in	2004-07-28 16:53:09.000000000 +0100
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch
index 514c761..fdea2b0 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- libglade-2.5.1/glade/Makefile.am.old	2006-04-25 21:03:25.000000000 +0100
 +++ libglade-2.5.1/glade/Makefile.am	2006-04-25 21:03:45.000000000 +0100
 @@ -30,10 +30,6 @@
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
index 1c2e215..dc4c092 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -urN libglade-2.4.2.orig/configure.in libglade-2.4.2/configure.in
 --- libglade-2.4.2.orig/configure.in	2005-02-11 12:42:58.000000000 +0100
 +++ libglade-2.4.2/configure.in	2005-03-22 01:22:00.000000000 +0100
-- 
1.7.1



