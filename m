Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0477F7B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 03:47:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id c13so5449892pls.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 19:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l7O96n81c6iSeD0bQqEoYYI1zIdsEFIfhg9P7hyvLd0=;
	b=XVbYN0YwM94OtlGOiwAQSuy6OrwyoaYxMxVm+H+f4BNKG8eKdnyfrWVnJ4T30BcZxF
	pp0n/+rT+eq+gAdUYFcwEoD0FHXLxQRo0ewMGpoUfuXGpR32XOAxRUYlgIwvYYcNvtSg
	G6BYCwTaqnysRWI3AeQAJSV0vC3GU+HYRHHzVmftb4URX7IcXjsef6wcGs81CAW/Pmfr
	HON+jeL0JlYinF8zEj3qNDomhCmoh2tGfJ4YCVhPei0ak2T9w2DE4H4yByAMJmeLix3q
	FlrZ+SRVyLaH9a7z6a0l/hZUtaGgYzLVq4LNehXTN0GYTi4lNVA+9osb6CEvWc3+H6n+
	OxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l7O96n81c6iSeD0bQqEoYYI1zIdsEFIfhg9P7hyvLd0=;
	b=r8tHTVYlXa+lciFA/5YNYOO76/gP0uTWq3nPMBXWawy5DIPJgaNpFgOBmBnTirdCA4
	ishwql3mp+o8DXvICihvLxKDVqKW58G4vLMRh35GmgmSH4nyeQUMZ/8ec4VM/VJNa/dZ
	YqM2QHpG8ozJm2BJCVvVJSgzRL217Uh/WGtIzZ+4RkWC857PrMZdXbJgH1kn1g1u+n/y
	rmx+ysTm7n1FPTBaq19h0Ge8dk4cgPB+p2wbK10scLwLrtPp/VRdsWcjdZw5/jWk9aCi
	RX9EF1VdQ3o8HTHBuEeMx0wN916+VvgFe0HeQcx2ylyIkOlnqgYjTKxph5thmKa7/fjw
	g/2w==
X-Gm-Message-State: APjAAAWDXnqvKWvgSZfYTsSi9aRiiS3CbnpWevWJATSktJjEtpHKizqe
	L2ZIeZ4rw9EpsbzdNLYE2A91qcWKnFM=
X-Google-Smtp-Source: APXvYqwsURDHmxx4QtJnRzNaaPQfGa6SyKFECa4Qr9hGUUIDJb5HqmQovxbwTJr0gC8K9A+yGXacGg==
X-Received: by 2002:a17:90a:d353:: with SMTP id
	i19mr3568805pjx.43.1576554436018; 
	Mon, 16 Dec 2019 19:47:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id
	g19sm23881860pfh.134.2019.12.16.19.47.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 19:47:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 19:47:07 -0800
Message-Id: <20191217034707.3234733-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] systemd-bootchart: Add mips64 tuples
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
X-List-Received-Date: Tue, 17 Dec 2019 03:47:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd-bootchart/mips64.patch            | 35 +++++++++++++++++++
 .../systemd-bootchart_233.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/mips64.patch

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/mips64.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/mips64.patch
new file mode 100644
index 0000000000..6206bc4b44
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/mips64.patch
@@ -0,0 +1,35 @@
+Recognise mips64 n32/n64
+
+These are supported in systemd now a days
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/caf49b95b3a6efe9455078098c729d83b08e5206]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/architecture.h
++++ b/src/architecture.h
+@@ -127,13 +127,22 @@ int uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_SPARC
+ #  define LIB_ARCH_TUPLE "sparc-linux-gnu"
+ #  define PROC_CPUINFO_MODEL "cpu"
+-#elif defined(__mips64__)
++#elif defined(__mips64) && defined(__LP64__)
+ #  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_MIPS64
+-#    error "Missing LIB_ARCH_TUPLE for MIPS64"
++#    define LIB_ARCH_TUPLE "mips64-linux-gnuabi64"
+ #  else
+ #    define native_architecture() ARCHITECTURE_MIPS64_LE
+-#    error "Missing LIB_ARCH_TUPLE for MIPS64_LE"
++#    define LIB_ARCH_TUPLE "mips64el-linux-gnuabi64"
++#  endif
++#  define PROC_CPUINFO_MODEL "cpu model"
++#elif defined(__mips64)
++#  if __BYTE_ORDER == __BIG_ENDIAN
++#    define native_architecture() ARCHITECTURE_MIPS64
++#    define LIB_ARCH_TUPLE "mips64-linux-gnuabin32"
++#  else
++#    define native_architecture() ARCHITECTURE_MIPS64_LE
++#    define LIB_ARCH_TUPLE "mips64el-linux-gnuabin32"
+ #  endif
+ #  define PROC_CPUINFO_MODEL "cpu model"
+ #elif defined(__mips__)
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
index 960edc75e6..a7a1f0ff1a 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
 
 SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
+           file://mips64.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.24.1


