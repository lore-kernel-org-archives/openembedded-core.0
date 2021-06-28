Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.12355.1624892801001771010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Kkn/B9Ij;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id v5-20020a0568301bc5b029045c06b14f83so19047529ota.13
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XNkDgtO6+gBQOMMJ0TtINRbP5Tp7Cg97/iVRGKg8698=;
        b=Kkn/B9IjFafLpX28kKo3Ewg6pKDlfzQm3eA7fmT7D5qhWUoCs6rPGnxCw5zGHi0jIG
         sr9z287Rd5URoqScm0n3xKX9R5REjogcqnEKbkV7Jlz7meqF3n5AbGwfXyBH9vXaFIuP
         Mw2hhKGrzP2HvfKz/VXYgAAzi9CV4hXTUeYqBFNWEpQrW0Vu4UOxswM2TT+SSIMrA+ZM
         d4N7tfk05vhNb5yHWLggdQinZGuSWInJokDbs085LYXcHNviXX7BKAT0W+miXfTRqQrR
         NcSolRYSPthfgkAaoxy5UzGcXW8dD83icKZue56+jk3QXfQzhXUO1hqItSMHcrtnGYwk
         C/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNkDgtO6+gBQOMMJ0TtINRbP5Tp7Cg97/iVRGKg8698=;
        b=smrmTb6/z01Zq8fXq3Cx80HzgqT1LBPU5ndBAG7sETlVLMt04BZHvWsC5fc4AE69aQ
         S81HhZScIczcZR7uLMN3p9EICwTLEZzqKIZ5Lnep+PzKrknRHGGzmzvyVaAqnKowYnJP
         1hBNHDVyoGyyq3xhI8eykH2MOuBPzA1itG0peQU6/R8o08KC6tWo9DTPSu0Mxw3xEeSJ
         u1Ysf9Z/+XjR4kGyOw1WDxfgyfn8ahPcBww+AY0mGOXO48MZNOCeNtBVdH7DV4oyAEY3
         Hp2by92vCaZTkM5tweWZ2tdPRntWdY2nXN4ZVez8RKx3+hpqPY8Rc3yTzn0MMk5DRH63
         PxuQ==
X-Gm-Message-State: AOAM533+dt40/kqmIS9EhNv0FMzUfZ1Ll8lkiKebJSkLiScsqcOLxMQA
	toh/IjngyHuI0ngdZKn4QicMSfldkP1OY9YD6N8=
X-Google-Smtp-Source: ABdhPJz/OD/mDA82nwBFqBlofB0lyXsnFEaWO8HaP7KCJW5tKWsgl9jY0B2nljxZlEyOW4royJf/Cg==
X-Received: by 2002:a9d:518c:: with SMTP id y12mr51692otg.186.1624892799897;
        Mon, 28 Jun 2021 08:06:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] python3: upgrade 3.8.6 -> 3.8.7
Date: Mon, 28 Jun 2021 05:05:26 -1000
Message-Id: <a90dde9b1800acf364fa272177945e0a4cbf6560.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Release Date: Dec. 21, 2020

Note: The release you're looking at is Python 3.8.7, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

* Drop patch for CVE-2020-27619 fixed in 3.8.7

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-27619
https://www.python.org/downloads/release/python-387/
https://docs.python.org/release/3.8.7/whatsnew/changelog.html

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2020-27619.patch       | 70 -------------------
 .../{python3_3.8.6.bb => python3_3.8.7.bb}    |  5 +-
 2 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 rename meta/recipes-devtools/python/{python3_3.8.6.bb => python3_3.8.7.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
deleted file mode 100644
index bafa1cb999..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6c6c256df3636ff6f6136820afaefa5a10a3ac33 Mon Sep 17 00:00:00 2001
-From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 6 Oct 2020 05:38:54 -0700
-Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
- in the CJK codec tests (GH-22566) (GH-22577)
-
-(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/6c6c256df3636ff6f6136820afaefa5a10a3ac33]
-CVE: CVE-2020-27619
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- Lib/test/multibytecodec_support.py            | 22 +++++++------------
- .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
- 2 files changed, 9 insertions(+), 14 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
-
-diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
-index cca8af67d6d1d..f76c0153f5ecf 100644
---- a/Lib/test/multibytecodec_support.py
-+++ b/Lib/test/multibytecodec_support.py
-@@ -305,29 +305,23 @@ def test_mapping_file(self):
-             self._test_mapping_file_plain()
- 
-     def _test_mapping_file_plain(self):
--        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
-+        def unichrs(s):
-+            return ''.join(chr(int(x, 16)) for x in s.split('+'))
-+
-         urt_wa = {}
- 
-         with self.open_mapping_file() as f:
-             for line in f:
-                 if not line:
-                     break
--                data = line.split('#')[0].strip().split()
-+                data = line.split('#')[0].split()
-                 if len(data) != 2:
-                     continue
- 
--                csetval = eval(data[0])
--                if csetval <= 0x7F:
--                    csetch = bytes([csetval & 0xff])
--                elif csetval >= 0x1000000:
--                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
--                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
--                elif csetval >= 0x10000:
--                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
--                                    (csetval & 0xff)])
--                elif csetval >= 0x100:
--                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
--                else:
-+                if data[0][:2] != '0x':
-+                    self.fail(f"Invalid line: {line!r}")
-+                csetch = bytes.fromhex(data[0][2:])
-+                if len(csetch) == 1 and 0x80 <= csetch[0]:
-                     continue
- 
-                 unich = unichrs(data[1])
-diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
-new file mode 100644
-index 0000000000000..4f9782f1c85af
---- /dev/null
-+++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
-@@ -0,0 +1 @@
-+Tests for CJK codecs no longer call ``eval()`` on content received via HTTP.
diff --git a/meta/recipes-devtools/python/python3_3.8.6.bb b/meta/recipes-devtools/python/python3_3.8.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.6.bb
rename to meta/recipes-devtools/python/python3_3.8.7.bb
index bf33fce891..11a69ea808 100644
--- a/meta/recipes-devtools/python/python3_3.8.6.bb
+++ b/meta/recipes-devtools/python/python3_3.8.7.bb
@@ -33,7 +33,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://CVE-2020-27619.patch \
            file://CVE-2021-3177.patch \
            "
 
@@ -43,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "69e73c49eeb1a853cefd26d18c9d069d"
-SRC_URI[sha256sum] = "a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a"
+SRC_URI[md5sum] = "60fe018fffc7f33818e6c340d29e2db9"
+SRC_URI[sha256sum] = "ddcc1df16bb5b87aa42ec5d20a5b902f2d088caa269b28e01590f97a798ec50a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

