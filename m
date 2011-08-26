Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kd-0006Y4-5c
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450508"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:36 -0700
Message-Id: <46a02c30d372692282f2784870df6fd63c660b10.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/21] bitbake.conf: set includedir_nativesdk
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:47 -0000

From: Kang Kai <kai.kang@windriver.com>

Fixes [Yocto #1231]

crosssdk.bbclass uses ${includedir_nativesdk} to define target_includedir,
but includedir_nativesdk is not defined before. This makes gcc-crosssdk
can NOT search the correct standard headers and libraries search path.

Define includedir_nativesdk in bitbake.conf.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b309516..b3ff047 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -53,6 +53,7 @@ bindir_cross = "/bin"
 bindir_crossscripts = "${bindir}/crossscripts"
 prefix_nativesdk = "/usr"
 bindir_nativesdk = "${prefix_nativesdk}/bin"
+includedir_nativesdk = "${prefix_nativesdk}/include"
 libdir_nativesdk = "${prefix_nativesdk}/lib"
 base_libdir_nativesdk = "/lib"
 localstatedir_nativesdk = "/var"
-- 
1.7.6



