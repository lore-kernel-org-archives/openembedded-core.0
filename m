Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B9D7B7EF07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 12:34:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so2149899wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pD3CoZaK+M76lTcPNN+yKH5iCQxHMmhDBzLMNSpmhCU=;
	b=UeSdKN2CzyYjbg5iFHQs5pIfqpd0qcd6yhdDiBOtCQd36pPXGU9KsO0bsFqFmFq8CO
	+GpHXgJO02fo6koYQxm95hVISv5HEEB+G20e1K6rIL8cMV7Ri/vVtsTEQwVEK2Sb6Vhe
	8V05v5EyTcF4JMsJxbkM3S/1Wi2lwpCv1xYXmy2dojBQNC6iqgygTo7+4QDC/qDIhQJO
	DJuBhlldai7AnWYM/8ir29CF55K8VMJnCnG9SewFiL8XOxjJhH2A8+pL3nyEjNgteL13
	6bX88ncXoZmnqpC/D9AKphJMaepmN87PQIWF2v1rSRdNl58i+C8QcGQi7v6toB4mxVTc
	CqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pD3CoZaK+M76lTcPNN+yKH5iCQxHMmhDBzLMNSpmhCU=;
	b=OQRtBtsE3h3bSzpfeYHVnNVfJ/lv0DeQnr1oF3tj44kibabsbLGIBdJAqraoODQ0vU
	b7Ak4swNqa/OtPlEK8sVRlGZozdDTVe6IyzBqsFDdHW77G/I8YJjF1+Q6cQ+OQV/hRQY
	rtK/pG1khtp/ENzNPWJ2kzJgU98Irz3lY/PrkVzW6C2hqA57nM3bSDqC3EF8e+tE2ixD
	IKNaMpfIikVpmnlQevkA6pjYJkNpMXOD+w97derVm/KakD/B0HIcpCaeT2AWsHyIe8nv
	mdqFgWivFj8fOybOMNs/eqoEncO+b4bVgpPQRa4aZ2hpEMHPfLjOQejNCOIjyqMgGo+H
	0OXg==
X-Gm-Message-State: APjAAAX36d7Smr1NQgg0PCjJ5Qk/cH3nZFWhN7zsOhFLm7vgPXINLnii
	TpF5OHEdOigwBdF3kVzGdrJQ9bsV5sk=
X-Google-Smtp-Source: APXvYqwu7k9MjYkbXhr27E5tIfnCAL6VyGz6GcPnFD+yhjPDqEu4a7bEep6iCvsj13WN5BNQHHohKg==
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr5571682wme.67.1562762045212; 
	Wed, 10 Jul 2019 05:34:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o126sm1950693wmo.1.2019.07.10.05.34.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 05:34:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 13:34:01 +0100
Message-Id: <20190710123401.16646-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/recipetool: change the CMake test to use taglib
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
X-List-Received-Date: Wed, 10 Jul 2019 12:34:05 -0000
Content-Transfer-Encoding: 8bit

The current test builds Navit, which uses GTK+ 2.  As GTK+ 2 is being removed
from oe-core, change the test to build taglib instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index e3f5c71666f..1c701a40bf0 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -406,22 +406,19 @@ class RecipetoolTests(RecipetoolBase):
         self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
     def test_recipetool_create_cmake(self):
-        bitbake('-c packagedata gtk+')
-
-        # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
-        srcuri = 'http://downloads.yoctoproject.org/mirror/sources/navit-0.5.0.tar.gz'
+        recipefile = os.path.join(temprecipe, 'taglib_1.11.1.bb')
+        srcuri = 'http://taglib.github.io/releases/taglib-1.11.1.tar.gz'
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
-        checkvars['SRC_URI'] = 'http://downloads.yoctoproject.org/mirror/sources/navit-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
-        checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
-        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
-        inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
+        checkvars['LICENSE'] = set(['LGPLv2.1', 'MPL-1.1'])
+        checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = 'cee7be0ccfc892fa433d6c837df9522a'
+        checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
+        checkvars['DEPENDS'] = set(['boost', 'zlib'])
+        inherits = ['cmake']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github(self):
-- 
2.20.1


