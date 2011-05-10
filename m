Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVG-0001SF-5I
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="640479307"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:26:18 -0700
Message-Id: <a0d8db448a63f8389845ac43b6fe688a0fca32da.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 11:32:30 -0500
Date: Mon, 09 May 2011 22:26:18 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 10/30] linux-libc-headers: add microblaze ARCH definition
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
X-List-Received-Date: Tue, 10 May 2011 05:29:02 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* Add Microblaze ARCH definition
* Bump PR

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 .../linux-libc-headers_2.6.37.2.bb                 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
index 888d9e4..51c4926 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += " file://connector-msg-size-fix.patch"
 
@@ -26,6 +26,7 @@ set_arch() {
 		x86_64*)  ARCH=x86_64 ;;
 		avr32*)   ARCH=avr32 ;;
 		bfin*)    ARCH=blackfin ;;
+		microblaze*) ARCH=microblaze ;;
 	esac
 }
 
-- 
1.7.1.1



