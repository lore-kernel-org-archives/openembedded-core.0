Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2945065CF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Apr 2015 21:46:01 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so187611395pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Apr 2015 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Vx12ME4rYKwoWszPhfdSEilA36onZrnvwVUbkLOTP50=;
	b=G/C0EsUxNS/2JmS3N1LxhIcpUOVt3YS/tQYF2RRrKH2A9okHKFU0B83mJryD2AwnGu
	i5BTJxySmGh6ABTZ679Lf+b3gN4xHWAJ5ALbKqbxae9i6U/dVr1l/T8wxrxYCL9bJZy8
	dJERsbNgzh7Ex2bBJy4+4QltpmRvt39iTGdZKrTmds+8Yclj4VcNgpx7YXCFxPON4iWn
	ywbQJw8abaE39HM+bxGXnLG1f66Bf5QFwK6/4nn6xKQKopjSom6vuT1AT4Xq/fCfTL8d
	oGvoYV9XbWChNN9Gc95zuzb/8ZCqDrR5ZAyDP9GMlmi8Y3DcZI6sJi5B7GNGmRbJoA/5
	mdhg==
X-Received: by 10.70.125.162 with SMTP id mr2mr22522750pdb.21.1429479962076;
	Sun, 19 Apr 2015 14:46:02 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	c15sm16020839pbu.81.2015.04.19.14.46.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Apr 2015 14:46:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Apr 2015 14:45:56 -0700
Message-Id: <1429479956-27143-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] lz4: fix QA issue
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
X-List-Received-Date: Sun, 19 Apr 2015 21:46:03 -0000

WARNING: Could not copy license file

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/lz4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index ee5de0a..0b0c632 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
 SRCREV = "5780864c0ce08622238a267c46fb489d7066cad4"
 
-- 
2.3.5


