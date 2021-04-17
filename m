Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.2733.1618689433829585133
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 12:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NQISCC4y;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id f41so26564412lfv.8
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Apr 2021 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mSb7KPLQrCq9qkU1kdGNIvUJjyS62mGvrtreLUmH0c=;
        b=NQISCC4yza6Ot4g4Uw/u84vGfYIyWE6qYBzTchUPmwXmAOQFh01VWObZlyE3ubP+XR
         8It3okFxbc6Ok+aYuxXt4T7q9N5XDGrhaNs8e1nAn5ILG7ElHiVJWSk6CObqI1eTMIGo
         cz9/Qu/z5aVB2QiydcrzH4EprKHkjSm5yXrwkdgy+a6jhQH0snEQH1lrn7V+daB2zdrH
         cS0QBfceahdjdy+pjcUW335xM5F6p83JUX2jg9GQ82pQ4HFZ/2kNRmD6Zj3daGDF7yWm
         QS8o93bRBLhu02GtUMZA+pwFwLrmpk3xDTSipdEP7PVorjSGlZtT+ODn6b/EDbRK+cYs
         Cn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mSb7KPLQrCq9qkU1kdGNIvUJjyS62mGvrtreLUmH0c=;
        b=tvuGUyvpSobxxeKTDIR36c6jlMfzrq62hyg3hMjh4P0sdJw+WW0+o8DQ4UlcrGlny4
         2juqG6ZA5YdJxpslho+XTFAqVAWayxkUjLt7H4S9I7BoatvaOn4WN4nz3cu/uuH/IhqA
         8GiaiFcsqJQYl6ssq525EaIec2lyRZVCct1oeRGepJRVzw5mNnKuZsjP0zg1lGN4Soil
         0+H41N0cLNdgRzr4Vjyqfoq7RIhfPc7V1+TiUQaIbtk/QjPrsduFXTc9MYDWkyi6lrWW
         aXnrgYPofykY+oRNNE1686UePQ6uIF1J5sSsJhdlkF/FxbOd5w+yDvyF53D1Gv17tJuX
         6cKg==
X-Gm-Message-State: AOAM531odSWzD3Y4eTzGTq9MaiclbSplTvTN8zMs+4AmotiJELL0KRZG
	yNRZ/rTtVDfzZpbsKPGJbGfIQ1ZZtyfgG01g
X-Google-Smtp-Source: ABdhPJxfDTCYfGppIPFxVnq11XkDMHGVwAELIwW2wmkW1N2s1NQj/O7u4L2mx53Pp1nwIckc/K3cXw==
X-Received: by 2002:a19:6a11:: with SMTP id u17mr1397449lfu.104.1618689431657;
        Sat, 17 Apr 2021 12:57:11 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id y2sm1362767lfj.161.2021.04.17.12.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 12:57:10 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3: update to 3.9.4
Date: Sat, 17 Apr 2021 21:56:02 +0200
Message-Id: <20210417195602.65093-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ..._locale.py-correct-the-test-output-format.patch | 14 +++++++-------
 .../python/{python3_3.9.2.bb => python3_3.9.4.bb}  |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.9.2.bb => python3_3.9.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 35b7e0c480..c1c4c9da44 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
+From dc36295279d5da391c0c55afe43ce62cd6d92f00 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -29,18 +29,18 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index e2c2178..558d63c 100644
+index 2c788f2dfa..a9c2511516 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -564,7 +564,7 @@ def test_getsetlocale_issue1813(self):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
 -            print('testing with %a' % (loc,), end=' ', flush=True)
 +            print('testing with %a...' % (loc,), end=' ', flush=True)
-         locale.setlocale(locale.LC_CTYPE, loc)
-         self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
- 
+         try:
+             locale.setlocale(locale.LC_CTYPE, loc)
+         except locale.Error as exc:
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.2.bb
rename to meta/recipes-devtools/python/python3_3.9.4.bb
index fd1172335a..3b4cc286bd 100644
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
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archive"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
-- 
2.25.1

