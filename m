Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12714.1795501481656827840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QBeAlIK3;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c71feeeaso34187eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 22:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501481; x=1796106281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wt+ETf8oGxs9bRxZ4Z8yiXBPjA+h6YAV7zdslXrXCqE=;
        b=QBeAlIK3GH0BXf58WWoIYuBX2+fT1Y7qCB8U9cW1u6wJ10Z/swK5+rqP5PJqUeSVOs
         tuq+LF2dlqikti/MTz6s3ZjTAAmQc2cdiCDfnxsWefPLrb04o+veZD6SQxJhlxEn7FRp
         UXLq3BvHuiilYR4jik6nt9nO3JO4ZuxTqB3iECu53KL5LYCFHDS1eMWAAFamIeBjdR97
         5oMUVjRNfCC/H8mihB/LKO02D7oCyCpr6FNVO650jkrpaJQrwEVsMh6cp04wVu0KXOmk
         h2ky85aMPC+WITPWNjAF+0KDhzGXk8iHnaouUQ7YqkG55OwAM1SeTfdITm3y2I5U3v7F
         FQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501481; x=1796106281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt+ETf8oGxs9bRxZ4Z8yiXBPjA+h6YAV7zdslXrXCqE=;
        b=OVZ+EEWvCjhrSLh1eVcJbhkYs1TTKa9Prldy5rlpS/uukOmvMrY7IZHgSyMGx+BQ2r
         M3VnKphROb1JTeIC+NDHg4UobL6iD+dD6JZdOCQ8A8NuUuk7drLvHkxmLzlmUUTkcgcb
         gDwVRUiyxWsB0tSzE9b/mqGc+Qxbj/r98ecBVw/BSy+qi6PRxtNa1bm1ia+ujz6hPMVx
         jWml83go55qLzBxNwgN0TBBmpTp1FmAOPybjwUVU4ujdXqjZnQEyFP0YFs4hSy5SR7Xi
         juH9fP3wsFJfgwyFxmJVaGOtvO24Y2US4oVmTs+9nkQ+oPJ8yQ3mNcf/UvVpSSFtNkLa
         vyfw==
X-Gm-Message-State: APuU4Z/YZfg7maZtO4gtphsz949P4MdcGlDdoAAn61YLco1w+qoHfnAH
	GABwCP70UezWLyaD1Nm8M86e/3a21dOsDB+hbMKLPS9CpwiBHnkKZF+JFlZAr31l
X-Gm-Gg: AZFdTZfVFx1XaWgxb+RgadZerTMhimxvN01AlwCdFZ7se4sol58RubSMha7WN9frpq1
	dIUPwiifRZHjcdS1xT6+xjv+E6Gs4Nhv9SmFzo3HyW/G8ORu2cHpgcWAj9iHWMST8u0N5be4gwB
	33XJxjDy7DXE7pXfNli0GD7jqvcydCNgMpNGNibfDrAY+EhgetrgBR6JIPB97zOcrI31EpHWj/R
	DjW53QIJk9yutS7iscv1HALQ1TGZ3OiI9uY4nRb6/s3MrVJdjp0D/3NuTxqM6NI5lV/ryxv5HKU
	YN+aurxDJTKkzcyLlDPPZsnCHnxiOAf9PP6txDL/lqTTrG9kR+vx2nS+9trvrglwTTv1/c0ueh8
	q8INEGrSK0V6oZTz1D6b5K/s7oi5tuR8Q9EO/UCxY83XAMQCbs1uU9gn9ePPKhdI1gPG4OekzCn
	PfPEGF184IKymkdU7Bxw0JbzD/JCHLONKAimm24aAFPWDcAVb6udB+R3GY0jjHmXALN+cGxfOK6
	m0BKqt6GNpUT4ugV3b1TX2/eP4AfCgXx6G4/jW8oeu9Y2HxceUWU+NPfXr4U3qJhWCRT6zJnP9R
	QigXZptYZAX9pIcrKys1rd9NTDKgrJcTH4s9pFzdK+s/AawbqGqKdiXmPBj0GJuReK8AdEokoF1
	YKCyRh+UWrmDj4ATUcjAuwHIcm74UPLJ/VE/uQrL5wD03YalxN4E+Nuqz7ce38Q2Dqywzt3j/Z2
	MYM2VzlC93sMFI3usAO1WIJiaqY6N24xVeiIc7D0gcU/+Ku0LUaIjR6481JaFSkTiI77hsK2MVn
	/ah1PEa4+7DFwTcywVlKhsotFIt8MHKK0y11Q52mQ+btTJZhige0iNSmOVS2xwz4eix3lay5Uo4
	zN2V
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr9758460eec.11.1795501480730;
        Mon, 23 Nov 2026 22:24:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm72700490eec.3.2026.11.23.22.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:24:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] popt: Do not export _init and _fini
Date: Mon, 23 Nov 2026 22:24:36 -0800
Message-ID: <20261124062436.4104471-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250950
Content-Type: text/plain; charset="utf-8"

The version script names _init and _fini, which riscv64 glibc does not
define, so linking with lld fails:

  ld.lld: error: version script assignment of 'LIBPOPT_0' to symbol '_fini' failed: symbol not defined

Drop them from the version script; the loader uses DT_INIT/DT_FINI and
nothing looks them up by name.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...t.vers-Do-not-export-_init-and-_fini.patch | 34 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/0001-libpopt.vers-Do-not-export-_init-and-_fini.patch

diff --git a/meta/recipes-support/popt/popt/0001-libpopt.vers-Do-not-export-_init-and-_fini.patch b/meta/recipes-support/popt/popt/0001-libpopt.vers-Do-not-export-_init-and-_fini.patch
new file mode 100644
index 0000000000..14a83d3e94
--- /dev/null
+++ b/meta/recipes-support/popt/popt/0001-libpopt.vers-Do-not-export-_init-and-_fini.patch
@@ -0,0 +1,34 @@
+From e7b50f35178d7ec011438c699234a5ee90173eaf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 11:41:05 -0800
+Subject: [PATCH] libpopt.vers: Do not export _init and _fini
+
+_init and _fini come from crti.o on some architectures and are not part of
+the popt API. The dynamic loader finds them through DT_INIT/DT_FINI, not by
+symbol lookup, so there is no reason to export them.
+
+On architectures without crti.o _init/_fini, e.g. riscv64, they are not
+defined at all, and lld, which defaults to --no-undefined-version, fails:
+
+  ld.lld: error: version script assignment of 'LIBPOPT_0' to symbol '_fini' failed: symbol not defined
+  ld.lld: error: version script assignment of 'LIBPOPT_0' to symbol '_init' failed: symbol not defined
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/aec97bc20f46464b779a40d465f716cfe6099e92]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libpopt.vers | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/libpopt.vers b/src/libpopt.vers
+index 3ac5e52..d199ac9 100644
+--- a/src/libpopt.vers
++++ b/src/libpopt.vers
+@@ -1,8 +1,6 @@
+ LIBPOPT_0
+ {
+   global:
+-    _fini;
+-    _init;
+     _poptArgMask;
+     _poptGroupMask;
+     poptAddAlias;
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index dadcfdfeac..6161d4a7c4 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://CVE-2026-18839-01.patch \
            file://CVE-2026-18839-02.patch \
            file://0001-Fix-test-output-format.patch \
+           file://0001-libpopt.vers-Do-not-export-_init-and-_fini.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
