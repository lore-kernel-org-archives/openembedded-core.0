Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E30F78966
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 11:01:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q13so1143015pff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 03:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3DtZXFHTvCT9tjPx0a588M+sxaSdJAB4e5E4lseEazk=;
	b=Izxs9C2FP0f55Jk/N/cmeF/+S9rv0Qp6/RSlWP/NPLyiaz92X4Jh+wh3Hj4xX63qkq
	MBJ2osyyF+y7HDQqLda7zD4hj+7q3FpZa4Wh1dzTIJPpPXSW3W1jA5zclhehakjjZLDK
	AWgAxqJs6xBSFd+czXcwO9pT1ykvZKQb8zSxb6HdCPCdtYIu2YM++w6UDCLX0mmLxV9F
	rvEqW3zOIxAMdaHtaW4ibU2sUuvBWvmNTY/FCXi9gUCqwYPrUq522NO+4sSsFk5pkFvK
	SL5vskYW3gja8yveWCV976gu05wb4jvNLgKAj713b3CtBWnRJTApKbVKdhWiFbDXyAeJ
	aRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3DtZXFHTvCT9tjPx0a588M+sxaSdJAB4e5E4lseEazk=;
	b=Hxjd0jYO0QTAw7S8Yl9H0TbCVj42BofcCXn14A+YnbPQQ8s48/9Rh2tPjdD3A8g9/H
	aNk8+cQGtYICe8h2vZCax4YrH7U6Hh+r/DgRoVJ5pLX8bye9NKAxXacyPtuwYKkv7w+v
	2pdHTHkW807NZES/99muBziMM0+9afazuMrUr0Jti05Kozy28iKTzcN7IatBa3fy4QB2
	B13kDIRfds6u+iuaErpQl/ONPLJrM5lFQiKqUUwGyxNvxXPrmNCphY3c3cxK1AFZupD1
	AOzn5JGNBi9p/UqewGOSmmrLR25GHbT3fu4zFDVF+GleEQTgrlptqrIpMWJsUB2XAmsb
	EFjw==
X-Gm-Message-State: APf1xPAlLR9GpJCvjHSIRW7pCct/Vl3gje88EQ74mbN7yBqeIhomfA8P
	HfxveSAxh2vFjjYS41Q7Fwe3uw==
X-Google-Smtp-Source: AG47ELu++SfH6ld+fqEJUmb1oLpK51jsDTUIsZ2aI9jfyuEup1BZYtOraFB+/OJlQfY9a5dD4JxN2Q==
X-Received: by 10.98.249.76 with SMTP id g12mr29754524pfm.76.1520593260891;
	Fri, 09 Mar 2018 03:01:00 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	205sm2447295pfy.117.2018.03.09.03.00.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 03:00:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 03:00:49 -0800
Message-Id: <20180309110049.10725-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180309110049.10725-1-raj.khem@gmail.com>
References: <20180309110049.10725-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] recipes: Disable lttng for riscv
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
X-List-Received-Date: Fri, 09 Mar 2018 11:01:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 2 ++
 meta/recipes-devtools/gdb/gdb-common.inc                           | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb                    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index e3814a44bc..554f529889 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -40,9 +40,11 @@ SYSTEMTAP_aarch64 = ""
 # lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-musl = ""
+LTTNGUST_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_libc-musl = ""
+LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
 
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 9164a2bba4..039577b8e2 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -5,6 +5,7 @@ DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
+LTTNGUST_riscv64 = ""
 LTTNGUST_mipsarch = ""
 LTTNGUST_sh4 = ""
 LTTNGUST_libc-musl = ""
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb
index e8d041d1c6..fd5abbb113 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
+PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
-- 
2.16.2


