Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A42A77F453
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:06:35 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s21so15129318ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=32MtKpyC2n2HDZwsvci4tGc3hsynupKeaSTljvKHUuM=;
	b=oPcdhztTjeATNm9LXKWS9qD/jdWx1r6SaQqqk4WeyvrHrYYUpkNXCXV+h4pO2u/lIl
	LPZgloyHsmRGmfwMkl3LK5lwP2Qxfp/68MCEGNvNGbYF7cEBO/gH4uvCsjxCaqjFskuf
	s38KHpB/SMPgBwKl3F7QLGRv2+eaktrfM4ahQnofWfiHypWO+B0vENqll8NNoicgKeRa
	NmMAOSVyRU6H9cCpbSJBnHp5JFjT4Ms5EQC6N3FJlE0XJJJpWzWOsM12Mk2Bi90SViYz
	xsJhgCvSGR9eS8hHQJOnarJ3WhzQPjHWfXKdpTdRTbOz50RcHAshK0mw8ZqxHPRrMoyQ
	ogdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=32MtKpyC2n2HDZwsvci4tGc3hsynupKeaSTljvKHUuM=;
	b=SJx0ovNgg+fStDttBQhJtxix1Vu7scZ9zCjw2WGv2mHOX+Bhs0edwWJLwDdbliih3x
	2Am40timKX1dz/+TEPY8U7WSfsrrMUibirfXJUr80oRQ5lRSsE5TnmtC4evPEoUnosQm
	fBVaA6LlVZAeZyQpz9c69a3J5mMiEooQVDOurdjbidIZphGngV+wsdPRmln7DqU/jp8V
	BogCw8t8LKbyjKVqElWTPfZeKjUfA6sA22v8rbJhADeVawXtlaf+y+PK+uTr2zyf+fvB
	zjEscn12VoyD2zZJv+q7GbfWxrafh02F2YiJmQsMZvrwRpoFAqV1RI+6FR2RAFxmQ37T
	XCaA==
X-Gm-Message-State: APjAAAWH8bXIJ9cOZn1pERFcjHHN7KvEqYjHI7/YBp3IUG+PkyYm+ATP
	pge/9rQzV29ABkZJEHIkgjSgJz7s6TU=
X-Google-Smtp-Source: APXvYqzEPF+J2Ldiocx/jPorHYiE/aARjG7r+oWqg9nNzlPnfG2mBZIy+vDmQ9wU+k777Qp9gK7tVQ==
X-Received: by 2002:a5e:8716:: with SMTP id y22mr8560997ioj.2.1567181196438;
	Fri, 30 Aug 2019 09:06:36 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id p3sm4514672iom.7.2019.08.30.09.06.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:06:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 30 Aug 2019 12:06:30 -0400
Message-Id: <991be07d3ffdc04e918c6b3f7e85de6a94a6f67b.1567181039.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567181039.git.bruce.ashfield@gmail.com>
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-libc-headers: update to v5.2 headers
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
X-List-Received-Date: Fri, 30 Aug 2019 16:06:35 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We drop the patch 0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
since it was a backport and is already part of the 5.2 headers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 -------------------
 ...aders_5.0.bb => linux-libc-headers_5.2.bb} |  5 +-
 3 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.0.bb => linux-libc-headers_5.2.bb} (75%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c89b8e012d..5c28386c4f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.32%"
 GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
-LINUXLIBCVERSION ?= "5.0%"
+LINUXLIBCVERSION ?= "5.2%"
 QEMUVERSION ?= "4.1%"
 GOVERSION ?= "1.12%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
deleted file mode 100644
index 5ea46e9590..0000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 35341ca0614ab13e1ef34ad4f29a39e15ef31fa8 Mon Sep 17 00:00:00 2001
-From: Anisse Astier <aastier@freebox.fr>
-Date: Mon, 17 Jun 2019 15:22:22 +0200
-Subject: [PATCH] arm64/sve: <uapi/asm/ptrace.h> should not depend on
- <uapi/linux/prctl.h>
-
-Pulling linux/prctl.h into asm/ptrace.h in the arm64 UAPI headers causes
-userspace build issues for any program (e.g. strace and qemu) that
-includes both <sys/prctl.h> and <linux/ptrace.h> when using musl libc:
-
-  | error: redefinition of 'struct prctl_mm_map'
-  |  struct prctl_mm_map {
-
-See https://github.com/foundriesio/meta-lmp/commit/6d4a106e191b5d79c41b9ac78fd321316d3013c0
-for a public example of people working around this issue.
-
-Although it's a bit grotty, fix this breakage by duplicating the prctl
-constant definitions. Since these are part of the kernel ABI, they
-cannot be changed in future and so it's not the end of the world to have
-them open-coded.
-
-Fixes: 43d4da2c45b2 ("arm64/sve: ptrace and ELF coredump support")
-
-Upstream-Status: Backport [https://github.com/torvalds/linux/commit/35341ca0614ab13e1ef34ad4f29a39e15ef31fa8]
-Cc: stable@vger.kernel.org
-Acked-by: Dave Martin <Dave.Martin@arm.com>
-Signed-off-by: Anisse Astier <aastier@freebox.fr>
-Signed-off-by: Will Deacon <will.deacon@arm.com>
----
- arch/arm64/include/uapi/asm/ptrace.h | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
-index 97c53203150b..e932284993d4 100644
---- a/arch/arm64/include/uapi/asm/ptrace.h
-+++ b/arch/arm64/include/uapi/asm/ptrace.h
-@@ -65,8 +65,6 @@
- 
- #ifndef __ASSEMBLY__
- 
--#include <linux/prctl.h>
--
- /*
-  * User structures for general purpose, floating point and debug registers.
-  */
-@@ -113,10 +111,10 @@ struct user_sve_header {
- 
- /*
-  * Common SVE_PT_* flags:
-- * These must be kept in sync with prctl interface in <linux/ptrace.h>
-+ * These must be kept in sync with prctl interface in <linux/prctl.h>
-  */
--#define SVE_PT_VL_INHERIT		(PR_SVE_VL_INHERIT >> 16)
--#define SVE_PT_VL_ONEXEC		(PR_SVE_SET_VL_ONEXEC >> 16)
-+#define SVE_PT_VL_INHERIT		((1 << 17) /* PR_SVE_VL_INHERIT */ >> 16)
-+#define SVE_PT_VL_ONEXEC		((1 << 18) /* PR_SVE_SET_VL_ONEXEC */ >> 16)
- 
- 
- /*
--- 
-2.22.0
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.2.bb
similarity index 75%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.2.bb
index 473688d95f..9d18df76c6 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.2.bb
@@ -12,8 +12,7 @@ SRC_URI_append_libc-musl = "\
 SRC_URI_append = "\
     file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
-    file://0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch \
 "
 
-SRC_URI[md5sum] = "7381ce8aac80a01448e065ce795c19c0"
-SRC_URI[sha256sum] = "437b141a6499159f5a7282d5eb4b2be055f8e862ccce44d7464e8759c31a2e43"
+SRC_URI[md5sum] = "ddf994de00d7b18395886dd9b30b9262"
+SRC_URI[sha256sum] = "54ad66f672e1a831b574f5e704e8a05f1e6180a8245d4bdd811208a6cb0ac1e7"
-- 
2.19.1


