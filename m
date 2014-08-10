Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id B33D660C19
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 13:14:51 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so7322451wes.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Du1eBExloMye8RFClgvQLeEH2fXPS87vABj8Y5Pb52o=;
	b=0m8IPWiR7M6n6niymw2KbhOQG7gqPcBWN9+PzDMSTy8bE2syE05CFGtRm9aKvPd2N8
	3ntpfNkmFv0RxQHzsp5CA7mUxnNd/FKzMV3uZ1hj5WssoL55XbQyADLhTafi8r01VBwG
	FlSSqOMn30HhzQgGUJ6s+nlmG1iTcgsaFnUvbIqxqIbodoI75h70kqHZIQo2y0OE7z7J
	5XoECShPf8059ArnJ1G7gFOaquQ2hwQsQV2fq123EAga/p9buU7ys2K0aHOirnbVy+65
	XPG16+BC75qayqZs+NYKElyreRhV+AXLrfli9JcZgkklR53RnFJWDeI77p0ZAZN0Bo1Q
	34Cg==
X-Received: by 10.194.216.163 with SMTP id or3mr44608682wjc.31.1407676492419; 
	Sun, 10 Aug 2014 06:14:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge8sm31073888wib.4.2014.08.10.06.14.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 06:14:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 15:15:24 +0200
Message-Id: <1407676524-26216-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] kernelshark: add dependency on libxml2
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
X-List-Received-Date: Sun, 10 Aug 2014 13:14:54 -0000

* fixes floating dependency:
  kernelshark-1.2+gitAUTOINC+7055ffd37b: kernelshark rdepends on libxml2, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index 9af91c9..37be813 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -6,7 +6,7 @@ require trace-cmd.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
-DEPENDS = "gtk+"
+DEPENDS = "gtk+ libxml2"
 RDEPENDS_${PN} = "trace-cmd"
 
 SRC_URI_append = "file://kernelshark-fix-syntax-error-of-shell.patch"
-- 
2.0.4


