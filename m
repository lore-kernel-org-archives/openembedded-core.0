Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3759.1793405774066926844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=pios4NPw;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12490785e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405772; x=1794010572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VLzZo4Ms0wPDxZcEGzrfFwo6bLxwZDVbowDwahiW13M=;
        b=pios4NPwy7f5fadsFqz/sWJ1VStDaMXDtVO0bk2eN4fl4ueDpo/FduESnN0gCOcd/H
         BzylB0KzYPxscxq3Gggs1ZBG0BeFJLyLb7Gn0kIptP8I3Mn/wBiPjLCxjT4sEQw66Sd+
         C3OeWQ18IdcclE1Xqr/KBim23JfQRIMSl2VkeVV/bi5c11wodbpeKg4n2YAsKoRP38oY
         wrXIs2pq9g6759+ZiTHLRKz/OCzYTUsQjXRyjCLE7PjTn0qllrDxBz4ANkGJgX8RU/Ey
         WQD/IzFgs6grUewJVTJsx9xJ5bNqLiGrfkbcVbXJIdzDN0g9EPmeDaLyh8+02txq3OfK
         Vz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405772; x=1794010572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VLzZo4Ms0wPDxZcEGzrfFwo6bLxwZDVbowDwahiW13M=;
        b=eRcpwW2veT2nHx0ZVZChJV21hSl77EBM4+FfoB/2nL1wcL6HVKyOUHcfN07JEOxD6W
         VSbJHTmtu9FWl5ha37K6CrcKnk5tkljCW4klRmGBlvqjYwOnRzL51KAAHd3SC+5ASewE
         rev+t+52xcdjlJvZrb6+/1y/95mxatlGQKi7K9/SxyO5yYD2rcydEw/gHTotROblvMkz
         2Bu1RG5FLOcvV1tMbQ6MU8vgV0+fHCfZ4u1so/OeosRQm1wKBYRaJNwar6cKueT/6Z/4
         G1qti1NIZ3BFlaGme9p5RCqYMWXh/NGkc96We60+IbUqrn2OpZq7K5PTynYBQbzDzWqi
         JfbA==
X-Gm-Message-State: AFq9FYI/NfwdS8XIgBpZjO/9IIhvUnKzzpLd+hE0KXhYbBj1rYzavWeJ
	ZePWTjC+UU0nzqCdPFLpYQvs72f/9F1kPRPSCfWBSs5kEFTR6GUyJTaK8UaDz3R0hP1+3ho3GM4
	KUQsyzW0=
X-Gm-Gg: AYBFou12mujhr62Ki9M6gd6l7fyBkdI/k3L28mmp4SSzDsg51Arfjt7t7XCjH/LPAmJ
	UDDIq8X4elKzywxOGPqqsDEl8j/mU0qVzKxW/qPVP9YeNF7BfLEh8wuvTiL6knd2iWAnKlxHwwp
	j+8yVBVFlQnhOEYE0DWrxzZrwfzhc/8Em/X4FGMvysaEanTV63rorMSEFuWI1JDupPRmbR/1i0E
	64+kXfk/xKtrpK1lGbTxBm9vxbOi/KaIe5lypMCa8pUqdtGpLa/BkfgYG382vlt5l3qqbX6Izy8
	Qv58oSH2TlW/gXjn9p3GZ/i2QaVkoRS9/bmu/RuYDu25CNXMvrjIfHJv+OPrR/3HwIsLUDb004G
	P+9G95g5RZtU+AfHdzuwleKjAJUeJsc+y92hkKh0nt9OO/DJ2r5Kg9gTyjCwmVFkhbiI8yEDIpc
	lFgZAu6VfLhBZS5sNuP3uLX5Miza9Vn3t7RlsnxVAtCrHia45TJItr7F+T9vctSYJXwSFTNOtXC
	ru4tfJjzZN/YnCladb8AtxjEQM9ovAkBngMf1Kl5/6S9is9/Uy7WhqQjc7Lj+drO6IdBd0TLFfF
	wW2SVBB1Mia9YePPVBeJZCRJEWW20VlPSfcs9OSUbc7YNtTs4aI46YE4kGOXeSkFBbgVJLmZs56
	h/P1iQ9uvxzUsUWuPGqrtchAHBN/8
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ac1932a12fmr85932505e9.31.1793405772408;
        Fri, 30 Oct 2026 17:16:12 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 48/55] libarchive: fix CVE-2026-15028
Date: Sat, 31 Oct 2026 01:15:09 +0100
Message-ID: <5d629da3bc693df850387d1bd5fe3d03a09e4c31.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249122
Content-Type: text/plain; charset="utf-8"

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-15028.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-15028

The link in NVD is wrong. Based on project own pull request:
  https://github.com/libarchive/libarchive/pull/3252

Fixing commit is the below one:
  https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d55702785f82cedb7ef2

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/CVE-2026-15028.patch           | 41 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch
new file mode 100644
index 00000000000..c63fcf22f20
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch
@@ -0,0 +1,41 @@
+From 40b92de1def08e4fc319d55702785f82cedb7ef2 Mon Sep 17 00:00:00 2001
+From: datauwu <datauwu@users.noreply.github.com>
+Date: Mon, 6 Jul 2026 21:51:15 +0800
+Subject: [PATCH] tar: fix 1-byte OOB read in SUN.holesdata parsing
+
+header_pax_extension() passes PAX attribute values without the trailing
+newline to pax_attribute(). The SUN.holesdata parser read one byte past
+the supplied value when the last numeric field ended at the value
+boundary.
+
+Handle length == 0 before checking *e.
+
+CVE: CVE-2026-15028
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d55702785f82cedb7ef2]
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ libarchive/archive_read_support_format_tar.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_tar.c b/libarchive/archive_read_support_format_tar.c
+index e07cfdb63b..1c0441db6c 100644
+--- a/libarchive/archive_read_support_format_tar.c
++++ b/libarchive/archive_read_support_format_tar.c
+@@ -3448,13 +3448,10 @@ pax_attribute_SUN_holesdata(struct archive_read *a, struct tar *tar,
+ 				return (ARCHIVE_FATAL);
+ 			tar->sparse_last->hole = hole;
+ 		}
+-		if (length == 0 || *e == '\n') {
+-			if (length == 0 && *e == '\n') {
+-				return (ARCHIVE_OK);
+-			} else {
+-				return (ARCHIVE_WARN);
+-			}
+-		}
++		if (length == 0)
++			return (ARCHIVE_OK);
++		if (*e == '\n')
++			return (ARCHIVE_WARN);
+ 		p = e + 1;
+ 		length--;
+ 		hole = hole == 0;
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 2eb22e2d61a..3719965eed9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -51,6 +51,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2026-4424-2.patch \
            file://CVE-2026-5121-02.patch \
            file://CVE-2026-5745.patch \
+           file://CVE-2026-15028.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
