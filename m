Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOE-00085f-5v
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115411"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:46 -0700
Message-Id: <04a16c0c244ebe1fbf3ab39a79cd0e74c1dfe038.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 07/45] fontconfig-native: Be clear about FILE search path
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
X-List-Received-Date: Fri, 25 May 2012 06:52:46 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids warnings from the new file checksum code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fontconfig/fontconfig-native_2.8.0.bb          |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
index a2fd409..cee94de 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
@@ -5,6 +5,8 @@ DEPENDS = "freetype-native expat-native zlib-native"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = "${@[' --disable-docs',' --disable-docs --with-freetype-config=%s/freetype-config' % d.getVar('STAGING_BINDIR', True)][os.path.isfile('%s/freetype-config' % d.getVar('STAGING_BINDIR', True))]}"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-${PV}:"
+
 do_install_append () {
 	install -d ${D}${bindir}/
 	install fc-lang/fc-lang ${D}${bindir}/
-- 
1.7.7.6



