Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6F79B6AFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 15:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154939"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:27 -0700
Message-Id: <6fa11d1c5e03174f4a243bb5fdb6dd5565700679.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 6/8] swabber: Update to latest head
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/swabber/swabber-native_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/swabber/swabber-native_git.bb b/meta/recipes-devtools/swabber/swabber-native_git.bb
index 5bfe87f..9faae5d 100644
--- a/meta/recipes-devtools/swabber/swabber-native_git.bb
+++ b/meta/recipes-devtools/swabber/swabber-native_git.bb
@@ -3,9 +3,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/swabber"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRCREV = "a0792390c5d6d5a5bade7ab155c80eef3f30fa52"
+SRCREV = "2d1fe36fb0a4fdaae8823a9818a6785182d75e66"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.1.4


