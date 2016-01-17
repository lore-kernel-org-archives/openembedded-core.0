Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8B17391A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:45 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id q63so146458169pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=2l/VgMM3ksjLdRVM1rq8lzecPQm1oY42fyheseL+E2A=;
	b=wlOwiLXU1Ro9ejBFOIBQn0ml04b5z2mDKOQGm7JwG0fH1Sq0W2+0ksiCczUbC92cyz
	rHW+KVq03z8ihf/hgXVF5NpnczijkgxTBy7o0CCNLz8dSi0SUVFziwmNA+5TTF34Wx5h
	UDBm8qSaygYsSELPU2zig5+DDg0N9wVOnW7/h2cOt5JTWv65CStnemoAADLLH/2z/QCH
	+w+s0KYsgqnCQhbYOIDBWzxt3Uo1IQlQpOJcoPGjQHyR3jCBoZZp78hD56H2KrMkIOjC
	p/BFr25kT41r2UspIgBmfMDRNqhvo+wnB7pJ2GM64AYpa8kmLM88E+nvQuVANsUP5d2I
	qebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=2l/VgMM3ksjLdRVM1rq8lzecPQm1oY42fyheseL+E2A=;
	b=T4crmfGjOAk0daNyiw0tMXOqBZ1W+04TUULC72s+9k0tx9do+a6DcuOFcYwsECj7no
	VLUqKi9o1GEhcuoYLXlgc9lwMIeznGrf08ftAEtCaWTqPlj2hZf/Dp6drKkKH6UMBYQe
	KXNcZ9gHL+HowketSkzYYCyCoJXSmMHTFwo/c1dN7mkUS61bDvRplgd296VluPPPV1GU
	AmstBibgbTVPx9yhVQfHbo5rR1wtCSSWgV1mey9DJiw5Vh6ACoc/woIiUtvexEj4Rr9H
	316XrqXOLBSkJmovPAQD3xK7HwucC0R4WDE2oqL40BUUzxxm5AOXUBm7QQnNTW/xPqsM
	EGRw==
X-Gm-Message-State: AG10YOTe3CpU2VZMu6rgHq5eQFFmWOH44xFi6tbgWlVvxg61P8e8XYY28/TmiePEaOPjAQ==
X-Received: by 10.98.42.83 with SMTP id q80mr22291669pfq.19.1453030666971;
	Sun, 17 Jan 2016 03:37:46 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:25 -0800
Message-Id: <d4cb9a620846749770244605e19b0f92304d85be.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 52/73] kexec-tools: Define _GNU_SOURCE for getting loff_t definition
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:46 -0000

Fixes errors e.g.

vmcore-dmesg/vmcore-dmesg.c:370:32: error: unknown type name 'loff_t'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     | 31 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..90c2f6e
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
@@ -0,0 +1,31 @@
+From d811875a41b4628040abaada3da29b7b9592e757 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Jan 2016 17:16:16 -0800
+Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE
+
+loff_t is guarded with _GNU_SOURCE on some C library implementations
+e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to
+include this define, it should help compiling on musl while nothing
+changes for glibc based systems since there _GNU_SOURCE is already
+defined
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ vmcore-dmesg/vmcore-dmesg.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
+index 0364636..a8f56df 100644
+--- a/vmcore-dmesg/vmcore-dmesg.c
++++ b/vmcore-dmesg/vmcore-dmesg.c
+@@ -1,4 +1,5 @@
+ #define _XOPEN_SOURCE 600
++#define _GNU_SOURCE
+ #define _LARGEFILE_SOURCE 1
+ #define _FILE_OFFSET_BITS 64
+ #include <endian.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
index 7173767..5ea6516 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-x32.patch \
             file://0002-powerpc-change-the-memory-size-limit.patch \
             file://0001-purgatory-Pass-r-directly-to-linker.patch \
+            file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
          "
 
 SRC_URI[md5sum] = "86de066859f289048f1b286af6f03f78"
-- 
2.7.0


