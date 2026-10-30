Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5151.1793336760283864103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 22:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fhO4bh4n;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-369f3e9e431so258178eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 22:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336759; x=1793941559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrSuhwqZhnkNK2wKB1CdezBjGVN0X9taGSv+yqEE4HQ=;
        b=fhO4bh4nbOQoD4qqD/CY43d4jmnjS4PuZFaKJlGUDmBeUULv5IDafhZSOCGXG0n9Ii
         vOtrupGtz2NTelQylP7aRGQTD0okIKgnklQz6Xhu89OQYkcmIjDoWFUSh1ZWKAG0bFfI
         AlOvax+BooFZusU7tj75lEpcJ1vWYGOX0CgFi95/L3ZO+GjlAmly0haQvmpb8ivGxmz3
         LN5SOSI0qnInGcaTAYTb9OBjtgiuWuLvHBjd1HbU1MU5i4lHJJ+J/kIa2TEtXLxBxvld
         xumVtQhEdgOCSki8yA7/Q2VFQYZ8YVXWs7SBPOWdE1IoirLDnuPainiUmsI3tNfQevib
         3IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336759; x=1793941559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrSuhwqZhnkNK2wKB1CdezBjGVN0X9taGSv+yqEE4HQ=;
        b=NmHvWuMcZ+/wX+surGjVnt6v8L9dCj+RpqkCd0Bor8o17JmxFtLFrue2aHZ2BDvoF3
         FIsptbuzEJXZWB7d8Q4gneUrKTOmaDgYpkGHUMj4bdJrKmVXFnNFqHTP7S/OeGX8yHwi
         uqTGQOnYuoY3IDZ8x6R5h6cMj1V7ASPCu457HZYuJ7gg1l8mXq44kzuUaF3BNqKIlOsi
         +ELbVWNziQXd0h0/T8AqeE1xOha0wVbD8UaJknm0ts5C1eP6HPT+XIPDsa6hYjXTUUpm
         FpBVdp9uC7djn62cp80C9/vwqNlRIreIzTByjRdeTU6bXNmHD18JSmGDbdct60gvl16M
         AhUw==
X-Gm-Message-State: AFq9FYI2kx8y8YIWhIwL8ecZVVic8b/s9VnrRu6/uFb0w6HyTCPOPWPT
	ki3QfgXfxC5MkYuFdhtx7eOaBh9TBYBKmOCaDmSy+0WJQWhpKxc0F085SJuQduNS
X-Gm-Gg: AYBFou1HSd98jpBGi0c5Dex2uDjNekjgcoezg2dldmyfjlodIsTJrWFPx36bhLXCGFH
	+OpE5fEZGi3VjbQAsqok3MMCaBxEMOCCOLyXjffus/067OrevF9aCAW7Uk0RSnf9VG7lxH8M7Je
	bG9kwHalaiMBsPnWERhTDyU+LbB2VvCPW03NhCEF/bojZtdGzW/Mql+twuzsoKd8xJptgCPwO6x
	9YEmeNXkV2v4F7NdhLoM1DyMwQQwh8ogv5P7HnqIrBvoI8cpAMa/c5378nFGur3qo/KC1KDMkT+
	QV9bHRA5mBn9tsFinzbxehSV+L8HvPL4VMKbUBpvWFscVRUfPXzFh3dGJlhhE5UEV+NL3911q73
	NVu0YRZUiS58sWQEVHuETKlZccQZROrAWPjImYeQi8lUWbpSHF+VUk2K8R+Pyz4rU2lI9yOnnn5
	MEUyVzQbFwfuwuea0exG02XmM90a6z8cvwkWlIsiECqdoVKGDdJjpnQc8QkPOL3TAZ+ILy7w1Tz
	lnR8/DAxTetX/IHnsSlegZ25c43wY5MBX/z0eyJZ3WnEKdSiAQXqYZZSCWTYR0ZvXd2LUNXvQw2
	Ws2cPC3VTtMgsnPeh4FArbJQYq1ZUB/3x6wrkNMi3eheLfDnLp534Zfb3xmR1ejC
X-Received: by 2002:a05:7301:5408:b0:36a:1446:4852 with SMTP id 5a478bee46e88-36a30008540mr6005766eec.5.1793336759284;
        Thu, 29 Oct 2026 22:05:59 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm4690065eec.16.2026.10.29.22.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:05:58 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH] zlib: patch CVE-2026-85091 and CVE-2026-76844
Date: Fri, 30 Oct 2026 14:05:31 +0900
Message-Id: <20261030050531.720920-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248986
Content-Type: text/plain; charset="utf-8"

From: Prasanth R <ragaprasanth@gmail.com>

Backport the upstream fix. It covers both CVEs.
CVE-2026-85091 & CVE-2026-76844

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 .../zlib/zlib/CVE-2026-85091.patch            | 31 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.2.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-85091.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch b/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch
new file mode 100644
index 0000000000..005d986be0
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch
@@ -0,0 +1,31 @@
+From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Wed, 16 Sep 2026 16:26:14 -0700
+Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
+
+This addresses CVE-2026-85091.
+
+CVE: CVE-2026-85091 CVE-2026-76844
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148]
+Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
+---
+ gzwrite.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gzwrite.c b/gzwrite.c
+index b217b85..5123292 100644
+--- a/gzwrite.c
++++ b/gzwrite.c
+@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
+             n -= state->strm.avail_in;
+             state->x.pos += n;
+             len -= n;
+-            if (ret == -1)
++            if (ret == -1) {
++                state->strm.avail_in = 0;
++                state->strm.next_in = state->in;
+                 return state->again ? put - len : 0;
++            }
+         } while (len);
+     }
+ 
diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
index 8a23d98cd3..c6619f81cc 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-85091.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.34.1

