Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RijlC-0002Ob-Vw
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 10:37:23 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 01:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108992549"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 01:29:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:29:47 +0000
Message-Id: <5ebaabe8ed518b92515ab74963a4849410be44aa.1325755613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] README: add short description of OE-Core
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
X-List-Received-Date: Thu, 05 Jan 2012 09:37:23 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 README |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/README b/README
index 963b42b..b6d5b59 100644
--- a/README
+++ b/README
@@ -1,7 +1,11 @@
 OpenEmbedded-Core
 =================
 
-For information about OpenEmbedded see their website:
+OpenEmbedded-Core is a layer containing the core metadata for current versions
+of OpenEmbedded. It is distro-less (can build a functional image with
+DISTRO = "") and contains only emulated machine support.
+
+For information about OpenEmbedded, see the OpenEmbedded website:
     http://www.openembedded.org/
 
 The Yocto Project has extensive documentation about OE including a reference manual
-- 
1.7.5.4



