Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbO-0005lt-9d
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609034"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:22 -0700
Message-Id: <858cc9925a8d99fbaa2236f1ad68917a63228b1c.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 18/20] bitbake.conf: set PSEUDO_PASSWD within FAKEROOTENV
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:56 -0000

From: Scott Garman <scott.a.garman@intel.com>

PSEUDO_PASSWD needs to point to the directory where passwd and group
files are kept. This will allow pseudo to use those users and groups
to change file ownership.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 520b808..f03f732 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -555,7 +555,7 @@ SRC_URI = "file://${FILE}"
 
 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
-FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${STAGING_DIR_TARGET}/etc PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
-- 
1.7.3.4



