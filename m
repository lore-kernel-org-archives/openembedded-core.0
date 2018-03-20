Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E61146FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:12:59 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i9so162636pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=43Qor2lD9UOgsmT0+S10cSrRCLXz8q1fBaJP0pOe8F0=;
	b=J/J5lz0J/4DU66VB0Dd3oXRwYeNOjMMGmsVnPWjNYD7GzIkp4DxKPhcdrPrJcSJpey
	4DTvDtyf+/sFUFR/DAZ1n1VCMyv2eImJqOCnZ+Zx6AoaMe2Ey3toDk/F3ltBazMywpJg
	8BHcuK2lwnAVy59t5SqzZoVS4wjqgnJA9X/n00rFMauDCnKECQBbuuGYR1hi6Bms4e6e
	cyvMM2/aNYsylmc+QQAH0JXJMPzJ8GYFldF9ysaIUjOVFAWBe6+OajtefHq3NfsULInn
	8M+r28l4oma4EX4Y7cyJLt5OiDbJd30fjlVwKCR3OAqvTiEtqDCgEYvuc82N4LdRO0cy
	DrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=43Qor2lD9UOgsmT0+S10cSrRCLXz8q1fBaJP0pOe8F0=;
	b=WaVwlgG89ojkjXet8Xrr0gx8H0GfTMPIiXFa93pb54UgNCZf8eZ3nArX3Tr/zVShXu
	i/0IhiyIDFI3vkngGFdOYacz45eyTxgkFZsqmgvJPHUOCUcf98RHTXIP9D9pnIUb5vAy
	bQBhWZU6yn/S3xJeogzbdh7YCQR/E0kb1L+uzXNCJrtCpQOLQsuJdP4c+4+qMueMrgY5
	+3zm93U4vvNKYc0wAOE6isHjOFf5//oHrGlcONpzTJIKRScxpSdOEK2YGurguIAwXDo9
	puOyLRFwVf5SvfN2NxUiz2ioMLZIUCV26ORjVBn09+UcOzFGQ58TmkCvrycBUSg7P8Vp
	mQ6Q==
X-Gm-Message-State: AElRT7F3Vtm0XO0U0eR6oCxI9BbExxYn0KRAu9HBQoY7Lb223Y0JXlVV
	s6WIbDJrbrJtNwv+RdyoQkhhuw==
X-Google-Smtp-Source: AG47ELuZe7WN5bXpG0Z10dAIR9b/cQttyCBkPpw1ASPB5vXELTVn4N7TtNDOh/CLjT3s2ijpzI2kYQ==
X-Received: by 10.99.94.197 with SMTP id s188mr10795893pgb.363.1521519180906; 
	Mon, 19 Mar 2018 21:13:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	i125sm963231pfe.176.2018.03.19.21.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:13:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:12:53 -0700
Message-Id: <20180320041253.24537-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH V2] site/risc-v: Cache common variables to build libIDL
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
X-List-Received-Date: Tue, 20 Mar 2018 04:13:00 -0000

These variables force runtime tests during configure
they are already cached for other architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes from v1 -> v2:
- Drop libIDL specific setting since they need to be in meta-gnome

 meta/site/riscv32-linux | 10 ++++++++++
 meta/site/riscv64-linux |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index 138aeb0a11..fc5b99d147 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -1,6 +1,16 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
+
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
+glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index 138aeb0a11..38bc5f044d 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -1,3 +1,8 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
-- 
2.16.2


