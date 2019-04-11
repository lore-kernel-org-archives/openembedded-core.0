Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B98AD7D44F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 21:27:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h18so8415911wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HLxUdvjWoypRZOlxHn//kH6RpoLW4q9bo0GrNr0s3NQ=;
	b=N8kl5uKFiM0vEQ84hlDcB+YYV0aSg8pYdqRC7RBOH5DUH4eQtq1oCXEWTEaJMGvbVq
	Br/0q4IhuLHwif9GHgTzac7Xa46UTGxfKapql0gLMYKGpu+maDfZTjOpMzTy/H957D7i
	GQusHI5QceMyDlFDpv5IOXBcbnNMjk3DdB7arVNSmVXqBk/qFi9HYFXcdPY8/me20VMN
	Edd8EGyLpM57fVoSZq3BIpuH/Ndx+W1Ilym+UGBDokstgA0pw3hIUPDwhkQWBSKwEdJa
	cdCy7QJmkr8JHZkii7jyWnij1zN70qoyniwWNpTrDYL42Gwz31MHEhCMb7HyE+8qfKKB
	OF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HLxUdvjWoypRZOlxHn//kH6RpoLW4q9bo0GrNr0s3NQ=;
	b=QIil0UPctMDJZjbZfcG0RTvvWsN21Z0OcuOIDuK46t5eJdMgSK+dSy9d3iSdgbX0tS
	8DsHfjC1MqPbFzIuxVFY+7vXx2c6anRNKgZFddzjQM9qiRK6QK/T2tn1hOhVd9S8cO+F
	/6tc+0bhOIgrnuF7QGKWZc5FcH036OdW4e1Qm4TLLeNXxboWfQf1Kt98bLBi++MWtO/O
	pnvPqPiLGkftK3g6bQevnU7FcPyRfjiKN9RvTQdOs7SKRRg1P44RbY3SZcaFeik2EEgh
	UYF/hkHei8/u385uaKXItmU+Pw2te2QAwSBl+Mm29toDR6fncI9gamXF/KkXq647Xztm
	di1w==
X-Gm-Message-State: APjAAAV5gOUNRdSuKiL2VBmEwrOUuGA01QUEy/QASyghplHSTGzFWzma
	2tVYH85wKn5Mkf1CGWxPsK5aalU9
X-Google-Smtp-Source: APXvYqzwus+3zbQQBVWfUG88uaD08U6ByC8UbsfdMVp/8F6RXPwtpGeYZdohytqwiHe9flIcq4WQzg==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr8547622wmb.110.1555018060397; 
	Thu, 11 Apr 2019 14:27:40 -0700 (PDT)
Received: from 81c5895b9d0e.corpintra.net
	(dslb-178-008-197-077.178.008.pools.vodafone-ip.de. [178.8.197.77])
	by smtp.gmail.com with ESMTPSA id
	c10sm46330516wrt.65.2019.04.11.14.27.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Apr 2019 14:27:39 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 21:26:32 +0000
Message-Id: <1555017992-64163-3-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555017992-64163-1-git-send-email-changhyeok.bae@gmail.com>
References: <1555017992-64163-1-git-send-email-changhyeok.bae@gmail.com>
Subject: [PATCH 3/3] iproute2: upgrade 4.19.0 -> 5.0.0
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
X-List-Received-Date: Thu, 11 Apr 2019 21:27:41 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/iproute2/configure-cross.patch        | 39 ++++++++++++----------
 .../{iproute2_4.19.0.bb => iproute2_5.0.0.bb}      |  4 +--
 2 files changed, 24 insertions(+), 19 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.19.0.bb => iproute2_5.0.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
index 8b75a2a..102fdd6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -1,6 +1,6 @@
-From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
+From 1313a4045a552942e90cf02f5cd5f648a583a6ab Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 3 Nov 2011 10:46:16 +0100
+Date: Thu, 11 Apr 2019 23:14:00 +0200
 Subject: [PATCH] make configure cross compile safe
 
 According to Kevin Tian:
@@ -8,25 +8,30 @@ Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Shane Wang <shane.wang@intel.com>
+---
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: iproute2-4.14.1/configure
-===================================================================
---- iproute2-4.14.1.orig/configure
-+++ iproute2-4.14.1/configure
-@@ -2,6 +2,7 @@
+diff --git a/configure b/configure
+index 45fcffb6..0c5c9146 100755
+--- a/configure
++++ b/configure
+@@ -3,6 +3,7 @@
  # This is not an autoconf generated configure
  #
  INCLUDE=${1:-"$PWD/include"}
 +SYSROOT=$1
- 
+
  # Output file which is input to Makefile
  CONFIG=config.mk
-@@ -195,7 +196,7 @@ check_ipt_lib_dir()
- 		return
- 	fi
- 
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
- 			if [ -f $file ]; then
+@@ -162,7 +163,7 @@ check_ipt_lib_dir()
+		return
+	fi
+
+-	for dir in /lib /usr/lib /usr/local/lib; do
++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib; do
+		for file in "xtables" "iptables"; do
+			file="$dir/$file/lib*t_*so"
+			if [ -f $file ]; then
+--
+2.20.1 (Apple Git-117)
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
index 6db4062..c5ac987 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "67eeebacaac4515cab73dfd2fc796af3"
-SRC_URI[sha256sum] = "d9ec5ca1f47d8a85416fa26e7dc1cbf5d067640eb60e90bdc1c7e5bdc6a29984"
+SRC_URI[md5sum] = "d22107b4d7cfb999eeb8ad8a0aec1124"
+SRC_URI[sha256sum] = "df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


