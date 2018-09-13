Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 066FE796FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 14:04:34 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id b12-v6so2650831plr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PaQ1bsshQwE3EGlZ6a5VZ6I2doqPmVlBAt+U6hJ37XM=;
	b=uy8jD26+7+/10SE+txUQOYr2oSJU7qUCobOGrreN67mXVi/vqOeXGRaYIwFuCBEgZD
	y38TeoD9JEDDZ8AgAB091LAZvaWaIrsYRQrQL6rCbpuCvab62tprUJIzYvfzUlEaIKfD
	Y5kb74rneCAr34WLv3ZY4a44OzoYz8EnMTjWzXeykWPupBDSwzbLPkM/yQ7WGMFTXJFV
	Of3WbwqqoIf1DhFt/MT+AVAc8S6tJPsqaRhX0dbhjsn6QZ63r+rJ8l66GPuhP0OfpUFF
	gg9GW0coiDHkfO6ZDZwuaLT1c5elgtfLgcNZkgG3Kec52LFACYeeeF7UzBbvRXhw9uQG
	PJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PaQ1bsshQwE3EGlZ6a5VZ6I2doqPmVlBAt+U6hJ37XM=;
	b=LqWgmgpDnveWjbvHHr4KtMbeex7Yy3wSbe2RWo1Eqw2xtZsic968v26tjNDTeLoUat
	DnuqQuo+AY3kq/M40Q6HSbPf/30OOEjRBXBLhwe0B97E7q002vhHF5qSR6Pq4uRD5H70
	UrrUmf+83lyN7zzNr4PswVqw+ZXYj/QQaeR74/hdX9GW+nk7BIr8YNAF4ZA9FiHcwzha
	DMjrUp7h3ImGVYBtqqt6PATJlsN4YQTh+Ow5cyGyggsoqFl81M5XjSFLaGsu5qtJiyrS
	muRgikNvNjd6BYRHXn3h8UfLYQHZuzd/0BkIlpeRXl5W/GezctEDqJSoWmp9ppR5cA9Z
	sKmQ==
X-Gm-Message-State: APzg51Bm/ltvW051yR3bqpolPdo3e/EibPgqTS1UuKLDhBOduteBLVxb
	Khmw7qT7DniTUf7wG0p/jOxR4AI8
X-Google-Smtp-Source: ANB0VdaTsuaAk38g03AwIbeuej5eh5pW/0qy2yfa1QOQt0JE/H/JRPuoPzDq29cVR3Tuz61voOtlNA==
X-Received: by 2002:a17:902:7845:: with SMTP id
	e5-v6mr7458681pln.197.1536847475620; 
	Thu, 13 Sep 2018 07:04:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm7820764pfg.3.2018.09.13.07.04.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 07:04:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 07:04:26 -0700
Message-Id: <20180913140426.13202-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] musl: Add MAX_HANDLE_SZ
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
X-List-Received-Date: Thu, 13 Sep 2018 14:04:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musl/musl/0001-Define-MAX_HANDLE_SZ.patch | 29 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch

diff --git a/meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch b/meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch
new file mode 100644
index 0000000000..b1217723a3
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch
@@ -0,0 +1,29 @@
+From e2e723cfe96ce6ed6558ed7e8fbb44b2283297da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Sep 2018 06:57:28 -0700
+Subject: [PATCH] Define MAX_HANDLE_SZ
+
+MAX_HANDLE_SZ is described in name_to_handle_at() to contain maximum
+expected size for a file handle
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2018/09/13/16]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fcntl.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/fcntl.h b/include/fcntl.h
+index 5c3defcb..6a8b6d49 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -166,6 +166,7 @@ struct f_owner_ex {
+ };
+ #define FALLOC_FL_KEEP_SIZE 1
+ #define FALLOC_FL_PUNCH_HOLE 2
++#define MAX_HANDLE_SZ 128
+ #define SYNC_FILE_RANGE_WAIT_BEFORE 1
+ #define SYNC_FILE_RANGE_WRITE 2
+ #define SYNC_FILE_RANGE_WAIT_AFTER 4
+-- 
+2.19.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f6edf7de61..be31718e3a 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,6 +12,7 @@ PV = "1.1.20+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch \
+           file://0001-Define-MAX_HANDLE_SZ.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.19.0


