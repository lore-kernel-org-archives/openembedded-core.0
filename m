Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD56A6C17F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:42:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p6so146083pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VhgEfQf9Mox4hJO9asKfZljxPdtyywDUFG1n3vhbuxg=;
	b=nf7GFlcSbZF2wAW1oF6w9f5s7EW1XBPBeA0ZnWIOmGaedzqBZuurCCJtzXYzMrNbF5
	e8i3QTCKMPHIZmDM+pUM69GxHQeG8LuhzaRgyc9bisGUdfqCRIwTSWrKZ0yjmaYtqOoU
	LoHeL6jfAH9fmbQ5p1a9Iz+L7/5yB7alphdnrij5ol7Ql8sDigcgtpawVRvBJLz+wdnG
	dqO0HFFNh/Sop4DO39vaLkEjAU5N+wsapt2uiD0cVxkyuU8sfMD5HxHvQLDs0offUCAQ
	wCFq9eA7Y0G9486hIN+pfghsLQZY9QsJQ2vfdL21YCJChdJZSjXbtBE9KdBp96Ifv1pK
	mhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VhgEfQf9Mox4hJO9asKfZljxPdtyywDUFG1n3vhbuxg=;
	b=ElhwMOs6X7jcRmTvvxIs930h5EUvAHxdyakNGDNCpa7iB3kZVsLX1ENtjEhnDLm/5K
	7fn0EOHXHg0URxzj3E3vAkbaAQHpwRylkow+7EMdxoF0ilKQSW92IOS13Ser9rNpheUc
	3Y+dTOMvg4nmV4brH6KfrXf5M4yDhDUvu8XED99x+xxKLSjbteUxEHePUywBZj/njLMP
	Ni0WDjuVFQq6SBsOepG6qTZx0HAX8XYOrfXJfFrXTs9d/DZLu/ec/7vxHMghuOAGp18R
	GxtFtC2oTdCobSWGYxmaKUCZd5KR0niMmkwcc8dd6AweKqgrhpv9hhMF3lIsKnvDwBvx
	O+2g==
X-Gm-Message-State: APjAAAW9JbWXFCudXrunpEE0q0e2/IoIEnYicdY5lVwOzV2AZ15u8AaH
	8p3vgCdvMcORb3E5ZbY543w9hr8J
X-Google-Smtp-Source: APXvYqzmh30m8DRqFL8prUyAu0gTjrLXmCwupQJHi/2BEVRHIh2hsq7js1HIN4/jwYoJcT1ekftO1Q==
X-Received: by 2002:a17:902:2989:: with SMTP id
	h9mr23721664plb.26.1552970526042; 
	Mon, 18 Mar 2019 21:42:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	m67sm19131742pfj.70.2019.03.18.21.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 21:42:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 21:41:57 -0700
Message-Id: <20190319044159.27902-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2 1/3] lttng: Enable tools and modules on riscv
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
X-List-Received-Date: Tue, 19 Mar 2019 04:42:05 -0000
Content-Transfer-Encoding: 8bit

Latest version compiles on risv64 now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
---
v2: Keep it disabled on musl for now

 meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
index 086254d3d3..15e75e51c9 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
 
 inherit module
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 
 #https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 151e35e3c3..86418f14c0 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -28,7 +28,6 @@ PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 PACKAGECONFIG_remove_arc = "lttng-ust"
-PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
-- 
2.21.0


