Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D80886C1AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 09:57:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Nov 2018 01:57:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,483,1534834800"; d="scan'208";a="102943880"
Received: from alim-desktop.png.intel.com ([172.30.199.42])
	by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2018 01:57:25 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 17:57:58 +0800
Message-Id: <1541757478-25090-1-git-send-email-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: mohamad.noor.alim.hussin@intel.com
Subject: [PATCH] recipetool: Change srcuri mirror to yoctoproject site
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
X-List-Received-Date: Fri, 09 Nov 2018 09:57:26 -0000

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

This patch resolve bug 12979 due to checksum of navit-0.5.0
has changed from sourceforge. The srcuri mirror was change to
yoctoproject.org.

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index cd15df1..06f980e 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -433,12 +433,12 @@ class RecipetoolTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
-        srcuri = 'http://downloads.sourceforge.net/project/navit/v0.5.0/navit-0.5.0.tar.gz'
+        srcuri = 'http://downloads.yoctoproject.org/mirror/sources/navit-0.5.0.tar.gz'
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
-        checkvars['SRC_URI'] = 'http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz'
+        checkvars['SRC_URI'] = 'http://downloads.yoctoproject.org/mirror/sources/navit-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
         checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
         checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
-- 
2.7.4


