Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9D7D776C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:57:44 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b5so19347219pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 12:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sAFmPYpuSOA8Bm8+5wUjIIGsEDDrbEB7yKw8VydKpas=;
	b=ilgDy2yv3FP1+vJFRHuyMy83vwYtKIXich6hgJFe7RMVEv5DogC5ULtEO8F8/MvMt4
	rlzKgfncNBmFQvh9eHGq2NTSZMehVpOGfNa3jo7hLBayix3vqhM5WL2YRaqMs/cbdH06
	F0yAz7JUVLnfRT9FP0Ofq/m9qdaDQqm3fUjd3RTPxrhQmKwBxzz0kwYf3isnkKN1o8MJ
	boWw7fMBGysrID35rIYlf7/T9OXRHLBhb2mqYnpgg+tKOJrs8vIVdjui3MdAb3x2q8wJ
	VbZ/Ifig14rHjf1qUpDVcgI+PFSMSP5mkKsmn8p0yQehcbb/HLb2IpV427fGcQb3sSva
	qBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sAFmPYpuSOA8Bm8+5wUjIIGsEDDrbEB7yKw8VydKpas=;
	b=lzVd4DkIBparOhdGkcsY+/n4VGJKWkHSgpkYUBoK9GfMvLx5LgdYYhV8OyQG2k8TcZ
	oVwnvsZRMh6v1nvCKtDP7VimSTlyqDJafbkyBky6d3HFrc4AcswwX+iZmBR4xiSk0VxC
	fUvXzkID60/j6WcFkSEv071mEOgeRsX4+nAUrmHd7zhF2mRyD4qv7RTx4p7oY/QWqezk
	XJXCZ+sCJJHXdtr5hsWXV6/t83yUFFt/4XUYxFtZMSls5S0yRhVVhtI2Lvfk2rCY1LHH
	MmbD1s5sPyoA0xvma9VMV/1AqvSaejgpnUSE6IXP893dfjxUZCDt2W20C3Csa9nCFdk/
	IryQ==
X-Gm-Message-State: AMke39neLTqnpMWByk1ryNruAWUbHDAI+wYVUKkLks+awe00ECLwVz9zH04dKVWCLjVUpg==
X-Received: by 10.99.136.74 with SMTP id l71mr38837531pgd.143.1489435066064;
	Mon, 13 Mar 2017 12:57:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	g21sm34235291pfb.41.2017.03.13.12.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:57:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 12:57:36 -0700
Message-Id: <22dbe12ac600499821bdf0d3d932dc0b67e149f7.1489434627.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489434627.git.raj.khem@gmail.com>
References: <cover.1489434627.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] go: Enable on musl
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
X-List-Received-Date: Mon, 13 Mar 2017 19:57:45 -0000

Working fine for musl targets now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass               | 2 --
 meta/recipes-devtools/go/go-cross.inc | 2 --
 meta/recipes-devtools/go/go.inc       | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index f1984604b0..42bbd73cf8 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,7 +1,5 @@
 inherit goarch
 
-# Incompatible with musl, at least for now
-COMPATIBLE_HOST_libc-musl_class-target = "null"
 # x32 ABI is not supported on go compiler so far
 COMPATIBLE_HOST_linux-gnux32 = "null"
 # ppc32 is not supported in go compilers
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 054ce501bd..68f5efd6c0 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -9,8 +9,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
 GOROOT_FINAL = "${libdir}/go"
 export GOROOT_FINAL
 
-# Incompatible with musl, at least for now
-COMPATIBLE_HOST_libc-musl_class-target = "null"
 # x32 ABI is not supported on go compiler so far
 COMPATIBLE_HOST_linux-gnux32 = "null"
 # ppc32 is not supported in go compilers
diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 0c315afe06..1c94fc9c34 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -5,8 +5,6 @@ DEPENDS += " go-native libgcc"
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 
-# Incompatible with musl, at least for now
-COMPATIBLE_HOST_libc-musl_class-target = "null"
 # x32 ABI is not supported on go compiler so far
 COMPATIBLE_HOST_linux-gnux32 = "null"
 # ppc32 is not supported in go compilers
-- 
2.12.0


