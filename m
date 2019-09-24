Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3547DD6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 10:59:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v8so1430858wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RB5Chx2jmnDjRM+wyaBbyvyLf/HcvLxTGVOdOHyTEdI=;
	b=kgTCHgw2r7UuYbdu/8YmyrKhbOc8QrHyR7mqJA4HaSPjvOr97XPc7sR4sGfHT854yD
	gW0+OfgIRZybmKyT2AQ8X2StamzjvZhB1NxOGXnjG4AK/aEpwtT0QI98W3BxHfpRAgLB
	Uad1NMiNJRTlKtM13InSZOQnAshELVnZ3jm22uOg1lKUg/AyiRrDWRinQjc+gCMKHbq3
	ct256rM2VGJS7Zy3nLFrgj+fI5mL6mIW6ubQpuQRIH5kt+GshD7RlXAV6lHdlv6jrF3U
	QOyf5hyZT+NvAiuEU9OHphySk2MtX5Z6+pn9p3DvYMzmBN4ret2kSs4XXOqGnM4MYQOJ
	pOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RB5Chx2jmnDjRM+wyaBbyvyLf/HcvLxTGVOdOHyTEdI=;
	b=CAKr05yi6jYIBoTANToYf23tqgJXBgyPtHy6+fwIUkooUL11sG7z1e88NZcfT8ENOp
	hR35JMfoqCql4S89G2Q0zk0UMG+pSVYiB/GgUhO5oZxa/J/8WmMhg6dK16+bT71XQi1J
	FLOvBBaY4fAFzSSlMv2kJQGvJCT917kRPhM4sXTZt9P++O1G2vuTvO5/0nnYjw8Gs/t/
	kuMrLKL5hFiUhuUeUvPtH1pze1EZiugNBImZCv6Ik/aRrM2VsRCiV6W9N/o92Su5rYvm
	r3buIpJ1LzmI9xG+rRoiWW3YLKKzd0Tj9TkqtFRc9q0/hHTgCY+XOke2IGYAxsDXVf9c
	Gtxg==
X-Gm-Message-State: APjAAAUbZV45qaUVpJY+NyP5ql0Q87trMYq7MO7iGNoc0MPOY/z77qHT
	q0DsqK9PuD3XXpnzM0m0E3QwO31M
X-Google-Smtp-Source: APXvYqyXAUUzEWsqyUiUzj8AIRffeLJbV5ZVicR8C280/e+PKxH49jLVYUKGB3aMDMunHUnIvA/PlA==
X-Received: by 2002:a5d:4f11:: with SMTP id c17mr1909130wru.227.1569322781034; 
	Tue, 24 Sep 2019 03:59:41 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id n7sm1943753wrt.59.2019.09.24.03.59.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 03:59:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 12:59:22 +0200
Message-Id: <20190924105925.2287-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924105925.2287-1-schnitzeltony@gmail.com>
References: <20190924105925.2287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [sumo][PATCH 1/4] elfutils(-native): Add backported patch to fix build with host gcc9
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
X-List-Received-Date: Tue, 24 Sep 2019 10:59:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../elfutils/elfutils_0.170.bb                |  1 +
 ...-fsize-and-msize-with-const-attribut.patch | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.170.bb b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
index 14ac22ee643..48f14286203 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.170.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
            file://0001-Use-fallthrough-attribute.patch \
            file://0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch \
+           file://0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 SRC_URI[md5sum] = "03599aee98c9b726c7a732a2dd0245d5"
diff --git a/meta/recipes-devtools/elfutils/files/0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch b/meta/recipes-devtools/elfutils/files/0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch
new file mode 100644
index 00000000000..b5f8fd417aa
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch
@@ -0,0 +1,42 @@
+From a01938d584b91e747167bb4b3f30ec300c4d6e43 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Fri, 16 Nov 2018 09:27:00 +0100
+Subject: [PATCH] libelf: Mark both fsize and msize with const attribute.
+
+GCC9 -Wmissing-attributes pointed out that although we alias the fsize
+and msize functions only fsize was marked as const. Fix by also marking
+the msize definition as const.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23884
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [1]
+
+[1] https://sourceware.org/git/?p=elfutils.git;a=commit;h=a01938d584b91e747167bb4b3f30ec300c4d6e43
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ libelf/ChangeLog | 5 +++++
+ libelf/libelfP.h | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libelf/libelfP.h b/libelf/libelfP.h
+index fa6d55d8..9f3e8e9d 100644
+--- a/libelf/libelfP.h
++++ b/libelf/libelfP.h
+@@ -461,9 +461,9 @@ extern Elf_Type __libelf_data_type (Elf *elf, int sh_type, GElf_Xword align)
+    These functions cannot be marked internal since they are aliases
+    of the export elfXX_fsize functions.*/
+ extern size_t __elf32_msize (Elf_Type __type, size_t __count,
+-			     unsigned int __version);
++			     unsigned int __version) __const_attribute__;
+ extern size_t __elf64_msize (Elf_Type __type, size_t __count,
+-			     unsigned int __version);
++			     unsigned int __version) __const_attribute__;
+ 
+ 
+ /* Create Elf descriptor from memory image.  */
+-- 
+2.21.0
+
-- 
2.21.0


