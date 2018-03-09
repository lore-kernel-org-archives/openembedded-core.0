Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD92C7896E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 20:29:16 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 93-v6so5831948plc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 12:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3DtZXFHTvCT9tjPx0a588M+sxaSdJAB4e5E4lseEazk=;
	b=LoF90eyBvw/R6EKZwxyYAIK44yLrGWrp16oalwDVPLCCFRcUwgqa4Y8GTC3jXsjH5i
	MIJQ2ygjp+fGF0BDTcOeEC82otPXF+IRFjcnKffpPKS06sYKleJCMPjgT0MJEC9A6s8m
	q5Tiq7g2swTCLSLYN+XNXQjMwfYMV0WjGzEl6JPDVnmMQGUsRAcuW3eYLJGcnBw89Ak9
	gv++gdJ2hRsegIoon0IeYd0YgDffsate05GdC0M0kDVIpVt4FliB5lPrex9upoUePOog
	ZQ1Rl8HNqm6SA94M/x7v1hxunVG2uQkjaokRjSt/jjTmaAk2OroLrMPbLhIMe7ln711P
	HCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3DtZXFHTvCT9tjPx0a588M+sxaSdJAB4e5E4lseEazk=;
	b=TlUobU8Xd8UWFmPxQqc3yo7wF9IhG1CDZQHvdKpoC6qQ8kjgD0oQBwPcT92vkGMsrf
	GC4pzknNBfzDhw7HnYhoggRp1QdyoohGxtsSXLtCiUZkXfGow/+mNZF4MS0DahMZQLwJ
	tPU6+P3S/0+nIx+Exf7tgQsfIxUhl/hCyYwTRc5vSkQA2d48KCEfQvoFV1cwviIEN265
	Fldsg7OEo2naT5HVXdKq8N5WkI4EpEjIcCjmx6qhB8WBLSMRbkwSFFK36E1zfMghYYz6
	NYXOJD2jKjiW5thfkiTqsyWzyrj5vqptnaE+RV0/6EIEGgyI29fAvyxoc+SLOM18zgBW
	Ic7Q==
X-Gm-Message-State: AElRT7FJGu6LoajPQr0Ur1G7gH3pe4Oqc+ngERmW3zmfsjK7sB1zbCEG
	yN7hXIrqe61DIFINy2eiGfkLzA==
X-Google-Smtp-Source: AG47ELuej2cI+VDj3EQ1WT+SvAO+A9oqTfKCE40SuDuAmV+CTi7wLnxcaE6F/rtp7HXfj5NfG4Cuyw==
X-Received: by 2002:a17:902:718c:: with SMTP id
	b12-v6mr3719103pll.121.1520627358254; 
	Fri, 09 Mar 2018 12:29:18 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	v12sm3628643pgs.21.2018.03.09.12.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 12:29:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 12:29:07 -0800
Message-Id: <73880b8f8bd1a292e6ee37239a982a47c194c2d0.1520627244.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520627244.git.raj.khem@gmail.com>
References: <cover.1520627244.git.raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 09 Mar 2018 20:29:17 -0000

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


