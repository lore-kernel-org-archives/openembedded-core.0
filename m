Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id A429D7FF3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:57 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m4so2209109pjv.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kRGxrOLOVMeeUc4HADICSlYWwXYXN2R4N7rzbJIAwQ4=;
	b=glPzlnDdLszDiW/OKMb+jfzD930Abh/HWlSqj6RWWO631BtLa/3gxRRTEsxGVsp5ud
	aaIxqsCzJZtkY3Yz83xEabr1XgTd0iSsmwhg0n3tMvRefhJqV0wivyoSIXNK30MFTNei
	1Zv3pI/zoAysNpxDxuON5BH0z4uB45uLu6fol8Swo6qqnMKt+nSpcKxsuvoXNJmSCgdo
	S8WA7y+10xf7AbqPWjd4F02gTVH2MGzMfdemAPJ2pnoj4yc45EuOIoeD7eHO+0DGCLJm
	c0EnZ5znt7/9QHbuv71QRJ+A8i3XmQrIMW6WaLqRzno1ogIOZKCIYgIo6dagy7TBwHAH
	avMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kRGxrOLOVMeeUc4HADICSlYWwXYXN2R4N7rzbJIAwQ4=;
	b=PqTAy2OWmVTz2oN8a82BR9fsJXKbWm6gXJ1YHG8tcainPuGHmbFjj1Nz+0vvQCF1kw
	D6bs+P79prOWNUV9/lpxXWxBosfyLiz/zNP2FchxXyfxpWRT/1Ioi/RguXGutBFdtKgY
	bPWpnxdrISf9K0n5SQeYRz8hATrHugQWtnZ4JOE+9WWask/HYHWTG/HQ1yNlC1c5Hjqx
	qcmrHaszImKpnN2jRzdn9GYWx3NAbKecSvWZ5KVkVVEsZfBB4LbtV08NGE2D391uqFpl
	zbDa8XcFqvJuhqAv5wwrLIXeCqHfjiecNO+CYlj3HvMr0MM2RWlusQ+mwVR3hLqM1Ky2
	njqA==
X-Gm-Message-State: APjAAAX8A142imy7/a+sezXNpNtZSkCSO79GuqhhmEssacMXsxeVCZSL
	iSDLTIZWtedDgwDapxIFydLkpnU96jY=
X-Google-Smtp-Source: APXvYqwiFB1aE1G6DZTOsWaUDDU5ZhCTWRDpG5OQsa0iJLUlqpNEq/lJjdGNvt59pdANWsq0zAzIlA==
X-Received: by 2002:a17:90a:30e8:: with SMTP id
	h95mr10944919pjb.30.1580066878254; 
	Sun, 26 Jan 2020 11:27:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:48 -0800
Message-Id: <d434528be4acdb4af1ae4bd128ac3ef759908beb.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] go-dep: Fix bolt for riscv64
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bolt_riscv64-Add-support-for-riscv64.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/go/go-dep_0.5.4.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch

diff --git a/meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch b/meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
new file mode 100644
index 0000000000..4d97d48243
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
@@ -0,0 +1,33 @@
+From 5e051669d117d7cd9b24cea3494959eec396ec1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 25 Jan 2020 22:37:25 -0800
+Subject: [PATCH] /bolt_riscv64: Add support for riscv64
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vendor/github.com/boltdb/bolt/bolt_riscv64.go | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+ create mode 100644 vendor/github.com/boltdb/bolt/bolt_riscv64.go
+
+diff --git a/vendor/github.com/boltdb/bolt/bolt_riscv64.go b/vendor/github.com/boltdb/bolt/bolt_riscv64.go
+new file mode 100644
+index 00000000..3d6b88d4
+--- /dev/null
++++ b/vendor/github.com/boltdb/bolt/bolt_riscv64.go
+@@ -0,0 +1,12 @@
++// +build riscv64
++
++package bolt
++
++// maxMapSize represents the largest mmap size supported by Bolt.
++const maxMapSize = 0xFFFFFFFFFFFF // 256TB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize = 0x7FFFFFFF
++
++// Are unaligned load/stores broken on this arch?
++var brokenUnaligned = false
+-- 
+2.25.0
+
diff --git a/meta/recipes-devtools/go/go-dep_0.5.4.bb b/meta/recipes-devtools/go/go-dep_0.5.4.bb
index ead87870e2..615cb289e5 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.4.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f
 GO_IMPORT = "github.com/golang/dep"
 SRC_URI = "git://${GO_IMPORT} \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
+           file://0001-bolt_riscv64-Add-support-for-riscv64.patch;patchdir=src/github.com/golang/dep \
           "
 
 SRCREV = "1f7c19e5f52f49ffb9f956f64c010be14683468b"
-- 
2.25.0


