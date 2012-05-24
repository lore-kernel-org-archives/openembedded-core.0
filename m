Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SXaVZ-0002Jl-RG
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 18:03:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 08:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144256722"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2012 08:53:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 16:53:09 +0100
Message-Id: <1337874789-6080-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] opkg-nogpg: add file path
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
X-List-Received-Date: Thu, 24 May 2012 16:03:26 -0000

There was no explicit path in FILESPATH for this recipe to allow it to
find files referred to in SRC_URI (files shared with the standard opkg
recipe). This problem may have been masked by the fetcher behaviour of
looking for files last in DL_DIR, thus if opkg has been fetched
beforehand there would have been no error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
index 259a60e..64a34f8 100644
--- a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
@@ -3,6 +3,8 @@ require opkg_${PV}.bb
 DEPENDS = "curl"
 PROVIDES += "opkg"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/opkg-0.1.8:"
+
 EXTRA_OECONF += "--disable-gpg"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.9.5



