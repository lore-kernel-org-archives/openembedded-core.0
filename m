Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZV6U-0004r4-RQ
	for openembedded-core@openembedded.org; Sat, 10 Dec 2011 23:09:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2011 14:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100849594"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2011 14:02:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Sat, 10 Dec 2011 14:02:01 -0800
Message-Id: <c4558110e4cbe9d3b6ac31dc30b8af78d644f2a9.1323554268.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
Subject: [PATCH 5/5] bitbake.conf: remove texinfo-native from ASSUME_PROVIDED
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
X-List-Received-Date: Sat, 10 Dec 2011 22:09:11 -0000

We need to build texinfo-native to get and install the makedoc tool

[YOCTO #1664]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eeb1fc4..f79e3f7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -156,7 +156,6 @@ ASSUME_PROVIDED = "\
     python-native-runtime \
     subversion-native \
     tar-native \
-    texinfo-native \
     virtual/libintl-native \
     "
 
-- 
1.7.6.4



