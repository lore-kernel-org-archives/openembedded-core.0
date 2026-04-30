Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D3DCD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 19:51:39 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7240.1777578689606542050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 12:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lFycusER;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: danismostlikely@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-41708f6c3feso855505fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777578688; x=1778183488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUOBpS1j6DXHYSsFLow2BsQXb8mtdMNoLa7t0gAi0O4=;
        b=lFycusERLnmqRt4h3T6ENUx8bASzwoRRbKmMqBlE4gFcS0GXB5AJq+Yv92i/hkl6XV
         jNa4FRx+q6EAbDeeXbECnW+3/tr+ZUPcKvpnHQsaF9RD8yf8OehNeM988pN7a9P9znvH
         I7hynHQHDCPrXJtKfLQGtmbVaKWMGg3dEYci8RJlMJU4pniqpMGue5SXLELACXwCLFdo
         R6MyXwdQVXBqinE6gv6bbPe4TKfo1ObnpT5bh5OxsKajodwn10uwl9mHqNMRbcran1aK
         B92KYQfGgH+MWd9XPLgb/v5YZkrZvxfElDYL0SQNXjnDxyUe0hzHSMojq+Df9Sq2XPUl
         HYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777578688; x=1778183488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUOBpS1j6DXHYSsFLow2BsQXb8mtdMNoLa7t0gAi0O4=;
        b=XVaN6wvYddCsihYjsmnlvUCaqXwF1b9r8M6ok9EIe59+nnYn6hYYUIQU1W6bqBipWZ
         1NsWPX6BZySnS3jDP8W4xN1a1+/yK1kCzXHilILGNzNIgrnuhM95K13vmF3Q+mWnOu3v
         glW0Aw4/W9NPAxgVJ3sUANDUzGJHVHEfLhaXWpNGlyOk5Y1hZt9EEeyVkZwtDW/1DnOW
         28JBWGXIx0h4IDpSLN3SwSyPqiDQNPK5O09uXmOkgS+mYK4eqlSzSkP4KJ7MfqWXTQ4o
         x2bMkdI5+skljMhfqyiQ9bvESZ0cklXW4jZxaNF3/tdYT62H8/51S2hMvt/1HOBX1Wsa
         s3BA==
X-Gm-Message-State: AOJu0Yz+FSt2wPB/dGuM5w0iZ9v+XD5KOdZjjOp1dQweRnT9rkiei72i
	b/sbnIBzTwdHwyVpOvN0eNblzEMxNxUQrOACyVnMeq7QcsUIA8nj+wIZQX0/KA==
X-Gm-Gg: AeBDieuY6PBSkSYnYJVcYymjGtnbeyofYRUq9hfYJ4vxAK9c3LlIXLtn4BdpZ0yQ1bx
	keF9ZX69z8t/c6KaxZV8nYDOW9QEHeASqmxDpbHs8zFJbbwbbXzG46/PgDkql9EPn1KnfrorCkg
	/x5L52RoylKcMOsWApuglaqebiwrsRHKxll49wgduANY4VtPve6oeFYK1+ul0hxmiixCPpbekpa
	aHXAOnIX+TGzGRFP3I6ZafR+SsWiQQuYDyrp9suV0TdG80pmqC+w3UKqG9usZN5L9JY+caqjErx
	XH3Wbx+ZYJevVZVspmRPHHOnDBf0Nd6nB2jUttP2eRV1kfdqJoovw/oVB4v448UwiPnnbJaK2HI
	KRE7l2Ck7RLE6BzbN8Qe4lOuc2IIV5oIvcQsgDQGp7v9c/vYAfN6o77g5YlN6B1CiCXWpZxU/rY
	ya3Y4ZTaXacqK9iMPumxM0W3TvFbIXnqNlf2UjmXb7OqVTQHg9aC9WDqqZSI42zh51jg==
X-Received: by 2002:a05:6870:3922:b0:42b:f401:4fc2 with SMTP id 586e51a60fabf-43433731d89mr2794420fac.6.1777578688420;
        Thu, 30 Apr 2026 12:51:28 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454cbbbd7sm508718fac.10.2026.04.30.12.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:51:27 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] python3-requests: update to 2.33.1
Date: Thu, 30 Apr 2026 13:51:20 -0600
Message-ID: <20260430195120.99622-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 19:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236183

From: Daniel McGregor <daniel.mcgregor@vecima.com>

OE Core includes chardet 6.0, while requests warns for any version
greater than or equal to 6.0. requests > 2.33 support chardet up
to version 8, so import the new release.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 .../python3-requests/CVE-2026-25645.patch     | 46 -------------------
 ...s_2.32.5.bb => python3-requests_2.33.1.bb} |  4 +-
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
 rename meta/recipes-devtools/python/{python3-requests_2.32.5.bb => python3-requests_2.33.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
deleted file mode 100644
index 3bebba65726..00000000000
--- a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 66d21cb07bd6255b1280291c4fafb71803cdb3b7 Mon Sep 17 00:00:00 2001
-From: Nate Prewitt <nate.prewitt@gmail.com>
-Date: Wed, 25 Mar 2026 08:57:56 -0600
-Subject: [PATCH] Merge commit from fork
-
-Prior to version 2.33.0, the `requests.utils.extract_zipped_paths()` utility function
-uses a predictable filename when extracting files from zip archives into the system
-temporary directory. If the target file already exists, it is reused without validation.
-A local attacker with write access to the temp directory could pre-create a malicious
-file that would be loaded in place of the legitimate one. Standard usage of the Requests
-library is not affected by this vulnerability. Only applications that call
-`extract_zipped_paths()` directly are impacted. Starting in version 2.33.0, the library
-extracts files to a non-deterministic location. If developers are unable to upgrade,
-they can set `TMPDIR` in their environment to a directory with restricted write access.
-
-CVE: CVE-2026-25645
-Upstream-Status: Backport [https://github.com/psf/requests/commit/66d21cb07bd6255b1280291c4fafb71803cdb3b7]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/requests/utils.py | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/requests/utils.py b/src/requests/utils.py
-index d8803e6e91..54959bb8ab 100644
---- a/src/requests/utils.py
-+++ b/src/requests/utils.py
-@@ -282,12 +282,13 @@ def extract_zipped_paths(path):
-         return path
- 
-     # we have a valid zip archive and a valid member of that archive
--    tmp = tempfile.gettempdir()
--    extracted_path = os.path.join(tmp, member.split("/")[-1])
--    if not os.path.exists(extracted_path):
--        # use read + write to avoid the creating nested folders, we only want the file, avoids mkdir racing condition
--        with atomic_open(extracted_path) as file_handler:
--            file_handler.write(zip_file.read(member))
-+    suffix = os.path.splitext(member.split("/")[-1])[-1]
-+    fd, extracted_path = tempfile.mkstemp(suffix=suffix)
-+    try:
-+        os.write(fd, zip_file.read(member))
-+    finally:
-+        os.close(fd)
-+
-     return extracted_path
- 
- 
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-requests_2.32.5.bb
rename to meta/recipes-devtools/python/python3-requests_2.33.1.bb
index 3477a5d83e9..e9c6fe4e970 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
+SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
 
-SRC_URI += "file://CVE-2026-25645.patch"
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {
@@ -35,3 +34,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-35195] = "fixed-version: fixed since 2.32.0"
 CVE_STATUS[CVE-2024-47081] = "fixed-version: fixed since 2.32.4"
+CVE_STATUS[CVE-2026-25645] = "fixed-version: fixed since 2.33.0"

