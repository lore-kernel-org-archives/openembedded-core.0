Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QUemr-00026X-ER
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 14:56:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 05:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,341,1304319600"; d="scan'208";a="16114983"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.6])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2011 05:53:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 13:53:12 +0100
Message-Id: <e894a1bec293052c213e828c8071d833a5631131.1307623890.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1307623890.git.paul.eggleton@linux.intel.com>
References: <cover.1307623890.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1307623890.git.paul.eggleton@linux.intel.com>
References: <cover.1307623890.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] iproute2: update to 2.6.38
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
X-List-Received-Date: Thu, 09 Jun 2011 12:56:37 -0000

Fixes "ip route get" not producing any output (a regression in 2.6.35).
See http://marc.info/?l=linux-netdev&m=129442470405398&w=2 and
http://marc.info/?l=linux-netdev&m=130038222321440&w=2 for a list of
other changes since 2.6.35.

Fixes [YOCTO #1006] (reopened)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../configure-cross.patch                          |    0
 .../{iproute2_2.6.35.bb => iproute2_2.6.38.bb}     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-2.6.35 => iproute2-2.6.38}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_2.6.35.bb => iproute2_2.6.38.bb} (50%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-2.6.38/configure-cross.patch
similarity index 100%
rename from meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-2.6.38/configure-cross.patch
diff --git a/meta/recipes-connectivity/iproute2/iproute2_2.6.35.bb b/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
similarity index 50%
rename from meta/recipes-connectivity/iproute2/iproute2_2.6.35.bb
rename to meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
index 93ae06c..e822750 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_2.6.35.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
@@ -5,5 +5,5 @@ PR = "r0"
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
 	   file://configure-cross.patch"
 
-SRC_URI[md5sum] = "b0f281b3124bf04669e18f5fe16d4934"
-SRC_URI[sha256sum] = "8ab2f47e129925fb8acb09421008d07aeafa01b2ddd1fcba4a056de079f090a3"
+SRC_URI[md5sum] = "a243bfea837e71824b7ca26c3bb45fa8"
+SRC_URI[sha256sum] = "47629a4f547f21d94d8e823a87dd8e13042cadecefea2e2dc433e4134fa9aec4"
-- 
1.7.4.1



