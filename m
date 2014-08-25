Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 99C6970FD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 23:41:20 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so21966843pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tvQQgWFF8l3fvS2DEOgNnh7ItI75ib5h1xu0mjffVB0=;
	b=0hzmLa2Yi8tlTGbiV8JepVbaq8MgBHziLThXIea9Va5mf4ro1fXjfePZ7b0KF58Ryn
	YCF4DWXcJMROI7xoUyc+lyjTx95mt20jnbJkKXQE3J6n/iE0ljFQl7y1Qv0Mf+IjpOld
	ag4wEWBXiwgchDr2Dk4Bg2jKf3BJFWMjoP2MPdPZhostwq2FmFLdLpHg2egLOpJ/Fp81
	xKWXsEhtKs3UBNAKqAHVjibGT7C8bXjeqqMOiQ9/uSVCrCgefI/AeHWObY0W/io6rKnc
	HF6rmuRSeCO6mQ/vW8rtuXxfodcxbmZv52CQyh4OcYfrHxnKLAHKHg8SxTy4VJnu2fMo
	ZYkQ==
X-Received: by 10.68.112.225 with SMTP id it1mr32893460pbb.23.1409010082078;
	Mon, 25 Aug 2014 16:41:22 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id r2sm1615785pdj.29.2014.08.25.16.41.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 16:41:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 16:45:01 -0700
Message-Id: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1409010172.git.raj.khem@gmail.com>
References: <cover.1409010172.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] openssl: Re-add linux-uclibc tuple
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
X-List-Received-Date: Mon, 25 Aug 2014 23:41:21 -0000

With last restructuring for musl, some of uclibc targets got ignored
fsl/ppc and ARM worked ok since they use special target triplets which
were already considered but other like mips, x86 and so on failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b63d164..9ec884f 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -62,6 +62,7 @@ do_configure () {
 
 	os=${HOST_OS}
 	case $os in
+	linux-uclibc |\
 	linux-uclibceabi |\
 	linux-gnueabi |\
 	linux-uclibcspe |\
-- 
1.7.10.4


