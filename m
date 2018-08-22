Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id ACBA879436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:10:13 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id b15-v6so3686063oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F+2ZlZS4LPBAR1AdzFP+cmfiDmn0EkXVTT/6Rfa5iFU=;
	b=s2QNnaNpJPZE9m8p54nFUALbVwLjEey1GnpKFEg5NeU0Mt/2I7312+/S65P1gxkUUT
	KjmJ+aZlzo9JReIwipnUXu/qTdfDmWdMzK9U/o4LtLKDGK6z49i5QB0kt8RMa7yq6mev
	G2cewNWQQOXi1FmOy2WHND/w7SllNIaB8P6iCFZplD7V8GUTpU/oSbibQl8rpybufUfS
	LbNul2drPSB2VKKwc0yrvC1C7e0EqLSRVZR9/qIJEB9Q/kXjjchR1eUYHsQylYnyM1Wi
	JotG9TeJ+51hFIHHPqt0RZNZPs9sJJPTF3yVSNn7nWrGmPI6w2IK/fJUVTGpl96m93ox
	+ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F+2ZlZS4LPBAR1AdzFP+cmfiDmn0EkXVTT/6Rfa5iFU=;
	b=Yvz3sac0arUGQbhOaJQfyd7D0aglTzYAQEaOcFM1+l363cqYlHQTYVMVSzwZg93VW6
	M3W0xZIvnIspmjlo9CBgaISq1M4RmlVqre8BUA2BObhP4hirpzBIswh3FBHcccG4LbpL
	DcexnLgqh+zeSN4wIhmkA5sg7HSZrSeGlIM3FIegZZwj6+BSMb5dgW/GVbYkgb0z6piR
	Mfbx/LTWD7Z6kTI1IJegcMFU+hvLaNabm3mEfE0cQ9+H1EcVZzu3MvGK1mZQ4l0W2xc1
	Ye5UWtzsnQz3nPklnvDvDguTp4mgatJrNB+NobsgrPKeixIscJEHN9JVExnZSsYWo70T
	AlQg==
X-Gm-Message-State: APzg51DDayWW392gi5oy9CjZkEHmsMjYjqgvd6WeVk5WFH5FuBCBkE7E
	d3zalzYYbiZhrxwdqE/1sr3tHQ+RfHo=
X-Google-Smtp-Source: ANB0Vdaf67yk9Iz8bsjnn1x8HpIenuUPWOutYPcv6+m4vhx98/UF+l7uYMqjoG4tMFbFfiD5RPjnAQ==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr4685116oif.338.1534950614584; 
	Wed, 22 Aug 2018 08:10:14 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.10.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:10:14 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:50 +0530
Message-Id: <1534950532-23850-32-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 32/34] openssl: CVE-2018-0732
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
X-List-Received-Date: Wed, 22 Aug 2018 15:10:13 -0000

Reject excessively large primes in DH key generation.

CVE-2018-0732

Affects openssl 1.0.2 to 1.0.2o

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../openssl/openssl-1.0.2o/CVE-2018-0732.patch     | 46 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch
new file mode 100644
index 0000000..d4d0bb4
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch
@@ -0,0 +1,46 @@
+From 3984ef0b72831da8b3ece4745cac4f8575b19098 Mon Sep 17 00:00:00 2001
+From: Guido Vranken <guidovranken@gmail.com>
+Date: Mon, 11 Jun 2018 19:38:54 +0200
+Subject: [PATCH] Reject excessively large primes in DH key generation.
+
+CVE: CVE-2018-0732
+
+Signed-off-by: Guido Vranken <guidovranken@gmail.com>
+
+(cherry picked from commit 91f7361f47b082ae61ffe1a7b17bb2adf213c7fe)
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/6457)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/ea7abeeabf92b7aca160bdd0208636d4da69f4f4]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ crypto/dh/dh_key.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/dh/dh_key.c b/crypto/dh/dh_key.c
+index 387558f146..f235e0d682 100644
+--- a/crypto/dh/dh_key.c
++++ b/crypto/dh/dh_key.c
+@@ -130,10 +130,15 @@ static int generate_key(DH *dh)
+     int ok = 0;
+     int generate_new_key = 0;
+     unsigned l;
+-    BN_CTX *ctx;
++    BN_CTX *ctx = NULL;
+     BN_MONT_CTX *mont = NULL;
+     BIGNUM *pub_key = NULL, *priv_key = NULL;
+ 
++    if (BN_num_bits(dh->p) > OPENSSL_DH_MAX_MODULUS_BITS) {
++        DHerr(DH_F_GENERATE_KEY, DH_R_MODULUS_TOO_LARGE);
++        return 0;
++    }
++
+     ctx = BN_CTX_new();
+     if (ctx == NULL)
+         goto err;
+-- 
+2.13.3
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 413ebf3..57912a1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
            file://Use-SHA256-not-MD5-as-default-digest.patch \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
+           file://CVE-2018-0732.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.7.4


