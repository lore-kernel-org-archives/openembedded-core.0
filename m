Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE7-0005Jz-23
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:31:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 00:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203167"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:26 -0700
Message-Id: <3f15b5917bf974d22273eaad08fcc7379fa4e455.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Mon, 25 Apr 2011 15:22:37 -0700
Date: Wed, 27 Apr 2011  0:29:25 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:49 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 06/52] web: update svn to 131 to fix build issue
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
X-List-Received-Date: Wed, 27 Apr 2011 07:31:59 -0000

From: Saul Wold <sgw@linux.intel.com>

Fixes [YOCTO #974]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 5e7ab66..73494b5 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -182,7 +182,7 @@ SRCREV_pn-u-boot ??= "v2010.12"
 SRCREV_pn-ubootchart ??= "10"
 SRCREV_pn-webkit-gtk ??= "72836"
 SRCREV_pn-web-webkit ??= "130"
-SRCREV_pn-web ??= "129"
+SRCREV_pn-web ??= "131"
 SRCREV_pn-xcb-proto ??= "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 SRCREV_pn-xcb-proto-native ??= "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 SRCREV_pn-xf86-video-intel ??= "87ea531c5dc5b39809395b277c330854aaaaf019"
-- 
1.7.1.1



