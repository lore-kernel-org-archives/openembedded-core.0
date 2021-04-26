Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: j9nmwB96kDpVeqdUQEvlZzhThpwpx+KDrPVKcFaG772/F7U9teHtAywX55P5xUas9jBNY3Isuf
 NvJAxgzbSScA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818120"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818120"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:26 -0700
IronPort-SDR: hebeVP3vKUTPgQ54pP9UW4GOuwPfxJvkMfBwgv0uTec6voeXMzqC6Ly12JcFQon3/dAui6iu7+
 2T9Z8IMcCabA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067365"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/64] python3: Upgrade 3.9.2 -> 3.9.4
Date: Mon, 26 Apr 2021 08:52:54 +0800
Message-Id: <8c1473189f4439d2462130b3cface95dc251fe24.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>

- Rebased patch 0001-test_locale.py-correct-the-test-output-format
  Maintainer needs to sign CLA and resubmit
- configure now explicitly requires autoconf-archive to be present

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34cb8f2a2ed36ad929dca9055c96f2f843656b8f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...le.py-correct-the-test-output-format.patch | 22 +++++++++----------
 .../{python3_3.9.2.bb => python3_3.9.4.bb}    |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.9.2.bb => python3_3.9.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 35b7e0c480..c3d1e06d00 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -23,24 +23,24 @@ Before this patch:
 
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
 
+
+Rebased for 3.9.4, still not accepted upstream Signed-off-by: Alejandro Hernandez <alejandro@enedino.org>
+
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  Lib/test/test_locale.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index e2c2178..558d63c 100644
---- a/Lib/test/test_locale.py
-+++ b/Lib/test/test_locale.py
-@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+Index: Python-3.9.4/Lib/test/test_locale.py
+===================================================================
+--- Python-3.9.4.orig/Lib/test/test_locale.py
++++ Python-3.9.4/Lib/test/test_locale.py
+@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCas
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
 -            print('testing with %a' % (loc,), end=' ', flush=True)
 +            print('testing with %a...' % (loc,), end=' ', flush=True)
-         locale.setlocale(locale.LC_CTYPE, loc)
-         self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
- 
--- 
-2.7.4
-
+         try:
+             locale.setlocale(locale.LC_CTYPE, loc)
+         except locale.Error as exc:
diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.2.bb
rename to meta/recipes-devtools/python/python3_3.9.4.bb
index fd1172335a..cb371ceed7 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.4.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "3c2034c54f811448f516668dce09d24008a0716c3a794dd8639b5388cbde247d"
+SRC_URI[sha256sum] = "4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e27d3b61cdca9aa134"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -69,7 +69,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archive-native"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
-- 
2.30.2

