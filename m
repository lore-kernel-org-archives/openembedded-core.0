Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id D46FC606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 16:58:15 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l69so710947lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1KtJA48bs3R5AKtRcpgNINzPPjk9kWwJlM18S3OeoQo=;
	b=h5XXJk5G8FCqDUig/h91F+Txif390ADc6rCMnkhsI10d6gG7OedaMgjFM9ZKIeQZ3j
	9fpVEyLuBmqoGzb/t3zP1aLFyPxmlw2Idh1v2qS3f96VkoRPqeuKdhOaDu4s2TMzTcNz
	HWB6BFBk+TT4B0NJ2FCCORkhdsOZ5YoqveD/sTsXNJI4iW0WgSft7xJuZrTDORbXI+2e
	to5l7Wk6kTa+P4YR26z1JOz+oBGJutaHz7ypU7gWz2yDs7bylp0dhAttKgtgxnbHkMjb
	FSLlQP1tAVoB1UcP9CTdSqgMkaZDSrvHxOydeKKn84lXyb83t2zCpu4cuze9S0KYm08f
	5g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1KtJA48bs3R5AKtRcpgNINzPPjk9kWwJlM18S3OeoQo=;
	b=JN4JPJ4icNCqdnztdkdDaL+a+X/IxWxdsLAGBvUn/fnNir23fePv5hetUF5DxgRWwU
	wojo/AEqNWDGJHu7Jvj3qyKE7FVcq9/UiZWqFdwssKKNmbK4Tb0Eo0OMH1fGxM++g42a
	nl2dxb3HnY++sLXjBBirNHgkWqIyPKpNi91qYpady3I4ISHHJu0wjMMFgDd9pTnaTH1q
	oSjKBmqOJHGsw2iCXcpF6zJqoEMzgYcmaR0Hr77wi/pCF2M5Z21SycYggwtywtjWmBvJ
	wa0aX8qoztQ/e+BGs7bMQbkd+jMP8JcGkip9NkPaaQARbpSKV4SnRSpLyA0xkG749CE9
	/bcg==
X-Gm-Message-State: AEkoousyHRivN5CgbeFOPI3MXTyQBUyTF2+1TjqgKphDjcYdEN97Mzxq2+5tWiV9T4X2IQ==
X-Received: by 10.25.91.149 with SMTP id p143mr8619751lfb.39.1469552296007;
	Tue, 26 Jul 2016 09:58:16 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by smtp.gmail.com with ESMTPSA id e73sm263374lji.31.2016.07.26.09.58.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jul 2016 09:58:15 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 18:56:11 +0200
Message-Id: <1469552171-8500-1-git-send-email-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-devsrc: Don't package kernel meta-data
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
X-List-Received-Date: Tue, 26 Jul 2016 16:58:18 -0000

 * The kernel meta-data doesn't need to be distributed in the kernel source
   package, so drop it
 * Fix a typo
 * Split long lines

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 0fdd0ad..2dcf01e 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -41,13 +41,17 @@ do_install() {
 
         #
         # Copy the staging dir source (and module build support) into the devsrc structure.
-        # We can keep this copy simple and take everything, since a we'll clean up any build
+        # We can keep this copy simple and take everything, since we'll clean up any build
         # artifacts afterwards, and the extra i/o is not significant
         #
         cd ${B}
-        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
+        find . -type d -name '.git*' -prune -o \
+               -path '.debug' -prune -o \
+               -type f -print0 | cpio --null -pdlu $kerneldir
         cd ${S}
-        find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
+        find . -type d -name '.git*' -prune -o \
+               -type d -name '.kernel-meta' -prune -o \
+               -type f -print0 | cpio --null -pdlu $kerneldir
 
         # Explicitly set KBUILD_OUTPUT to ensure that the image directory is cleaned and not
         # The main build artifacts. We clean the directory to avoid QA errors on mismatched
-- 
2.7.4


