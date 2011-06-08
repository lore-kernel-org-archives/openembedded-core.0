Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QUJ7P-0006Oe-4C
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 15:48:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2011 06:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,338,1304319600"; d="scan'208";a="10696497"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.239])
	by orsmga002.jf.intel.com with ESMTP; 08 Jun 2011 06:45:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2011 14:44:54 +0100
Message-Id: <6e9c0e76c6b42e916fff2f8cc192c56ad6f4f3ed.1307540102.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1307540102.git.paul.eggleton@linux.intel.com>
References: <cover.1307540102.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1307540102.git.paul.eggleton@linux.intel.com>
References: <cover.1307540102.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] iproute2: update to 2.6.37
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
X-List-Received-Date: Wed, 08 Jun 2011 13:48:23 -0000

Fixes "ip route get" not producing any output (a regression in 2.6.35).
See http://marc.info/?l=linux-netdev&m=129442470405398&w=2 for a list of
other changes in this new release.

Fixes [YOCTO #1006] (reopened)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../configure-cross.patch                          |    0
 .../{iproute2_2.6.35.bb => iproute2_2.6.37.bb}     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-2.6.35 => iproute2-2.6.37}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_2.6.35.bb => iproute2_2.6.37.bb} (50%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-2.6.37/configure-cross.patch
similarity index 100%
rename from meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-2.6.37/configure-cross.patch
diff --git a/meta/recipes-connectivity/iproute2/iproute2_2.6.35.bb b/meta/recipes-connectivity/iproute2/iproute2_2.6.37.bb
similarity index 50%
rename from meta/recipes-connectivity/iproute2/iproute2_2.6.35.bb
rename to meta/recipes-connectivity/iproute2/iproute2_2.6.37.bb
index 93ae06c..337f93f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_2.6.35.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_2.6.37.bb
@@ -5,5 +5,5 @@ PR = "r0"
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
 	   file://configure-cross.patch"
 
-SRC_URI[md5sum] = "b0f281b3124bf04669e18f5fe16d4934"
-SRC_URI[sha256sum] = "8ab2f47e129925fb8acb09421008d07aeafa01b2ddd1fcba4a056de079f090a3"
+SRC_URI[md5sum] = "9774ff9d74ebd301bf56bd8d74473786"
+SRC_URI[sha256sum] = "71754f8ad68facdb97d0cb9d7a298dc7f1ba069370bce902b661e06959f264e3"
-- 
1.7.4.1



