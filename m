Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFCD731D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:27:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2016 10:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,521,1444719600"; d="scan'208";a="874414320"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2016 10:27:45 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 12:29:17 -0600
Message-Id: <1451932157-3190-4-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
References: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com,
	poky@yoctoproject.org, benjamin.esquivel@intel.com
Subject: [PATCH v3 3/3] conf/distro/poky-tiny.conf: Add default install of ptest-runner 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 18:27:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ptest-runner 2.0 depends on python that is too big for poky tiny distro,
so install the ptest-runner 1.0 that only depends on shell.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index b0227de..6bc4e15 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -39,6 +39,10 @@ DISTRO = "poky-tiny"
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
 PREFERRED_VERSION_linux-yocto-tiny ?= "3.19%"
 
+# ptest-runner 2.0 depends on python that is too big for poky tiny distro, so install
+# the ptest-runner 1.0 that only depends on shell
+PREFERRED_VERSION_ptest-runner ?= "1.0"
+
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
 # Drop kernel-module-af-packet from RRECOMMENDS
-- 
2.1.4


