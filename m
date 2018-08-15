Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 81C8B744E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 21:51:57 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id j26-v6so1041366pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oxt2scjcJWmP8nKKDANpFs672u6G6ZAPVknpGSYFkM0=;
	b=F9z/4yp3fzEabHeYCv74nYEJwTXqgF1jKU65WCzwy5YK3OuQ/EmriatI0e69SETB0d
	9iJ3KxjT0LWIoydXiAZbp3x/vvds4O5nO6d2VCGgHTA3DJb9XeeP+L7SRaEnVD1sWzoU
	/J1hdkArmTyVz1OZE/wYhkoVzCv4fClg7q5z2E8af6DlJL081Lc7QKNU+ZeI4+VWRCqL
	gpNEqiER15Xn1i6dE/i93W+5u7Ho/r2DcIXlSVaKOQVbOBBxUb52QEr6bfyMevnOC6rm
	zoTwPg2WyBVH3g5wgazhcjhvR+tGPMMf8rrjIwty4pclFia7oQbBW2RULoZbhrqroFaY
	pTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oxt2scjcJWmP8nKKDANpFs672u6G6ZAPVknpGSYFkM0=;
	b=R7rjWeE3/szoVL7cPZMe9UMaajUxug0WwyrfLz4M8Pm5yVOjIERAbuMt1XP56mf1BB
	EPQivv06S5fdgabj0Rm55KD5Y+wMCAaFWRAY05j3SdUS3YB+pH6DmwVvWu7pHeGqM84K
	s0jtcLHCWFaZ6ySrr1gQhpGzX2vVrdZJPLfx9aac5Fp5nhpUG/USJWIULnTOcico0bDN
	GXn2TIDpqI1uTGJPnp2S9PQNYVdnuOv5FP9LczHCZISy6ENM0RgCJCDmvtv0iUlmcVva
	Ivhs0rN2KQpCKYIB/bJLcSYflRtR3pYgyRrZ/GuMoir4OVYmRxgUE/y2ef6Y6wwZWul6
	VbuA==
X-Gm-Message-State: AOUpUlG1S6pcEuj1tSxu+UCV8Yt8F7eboAsefwcAhK+1Wf2kWztdjsgE
	Lk2eO42jCyUAbscj5oKiX3+OTg8r
X-Google-Smtp-Source: AA+uWPxtXxHT1iBgABrTQQvTL9kt1+Zia4NrjUg1K3gShkntpXmPPGBInu5JSuoAnCabw38wj9onAQ==
X-Received: by 2002:aa7:84c2:: with SMTP id
	x2-v6mr21909475pfn.220.1534369918104; 
	Wed, 15 Aug 2018 14:51:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	m26-v6sm60076032pfi.102.2018.08.15.14.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 14:51:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 14:51:48 -0700
Message-Id: <20180815215150.13271-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/3] llvm: Update to 6.0.1
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
X-List-Received-Date: Wed, 15 Aug 2018 21:51:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cb3bba6fab..aab681dd54 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,10 +19,10 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "089d4c0c490687db6c75f1d074e99c4d42936a50"
+SRCREV = "5136df4d089a086b70d452160ad5451861269498"
 PV = "6.0"
 BRANCH = "release_60"
-PATCH_VERSION = "0"
+PATCH_VERSION = "1"
 SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};protocol=http \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
-- 
2.18.0


