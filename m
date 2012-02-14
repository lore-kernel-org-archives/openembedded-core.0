Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxISw-0004HK-Kv
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:30:42 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Feb 2012 05:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117403930"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:22:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:22:25 +0000
Message-Id: <535327acc26107ae4b22affbaeecb109e2a2bf1e.1329225663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] conf/bitbake.conf: remove Opie definitions
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
X-List-Received-Date: Tue, 14 Feb 2012 13:30:42 -0000

These values are now set via palmtop-defs.bbclass in meta-opie (and are
not needed for anything else.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2cc4b8f..90e5f7a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -520,16 +520,6 @@ BOOTSTRAP_EXTRA_RDEPENDS = ""
 BOOTSTRAP_EXTRA_RRECOMMENDS = ""
 
 ##################################################################
-# Palmtop stuff.
-##################################################################
-
-export QTDIR = "${STAGING_DIR_HOST}/qt2"
-export QPEDIR = "${STAGING_DIR_HOST}"
-export OPIEDIR = "${STAGING_DIR_HOST}"
-export palmtopdir = "${libdir}/opie"
-export palmqtdir = "${palmtopdir}"
-
-##################################################################
 # Download locations and utilities.
 ##################################################################
 
-- 
1.7.5.4



