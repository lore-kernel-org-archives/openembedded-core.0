Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4D10E793B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:39 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id c190-v6so2490928oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E6o/+xHVkJnEzrLZ0235vUgCxNJq3eIV/CCxvFnVhg4=;
	b=tF5SkH33mEoWFrWlRJmSWob0lRsiYJagE4shSwCaG7aTTR8tCQxy5wEJ/hBWl5SWwa
	eb7QxaPX6O7I2hXIDs99KrXl3FTJtRkkBx6nUPu5AxCDbRivfu3l3/XOCUTwUeHDq7yj
	FC4vZw38tURpQmX/p3/3ZhNcaxztlKOU7xK/V/JdIGMPUrjv0i4MF2DgejMpqgLwz7R7
	jSncv9DPnusivSME2PK7JTf4HRYsch7aL2lvknCFNNDhBL2UdA7Rs8zSKY0qbKzC8HDi
	/Ql0Fjt0H46xLFIA3+R/sd2fExB4Pf9iaK3uOGAUqLdE1Jph5XKwS2IKyYdamXKjy82Y
	DZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E6o/+xHVkJnEzrLZ0235vUgCxNJq3eIV/CCxvFnVhg4=;
	b=X/yJP7Z6V+DL3yuyX6mvAz2O2kNT634pUYRGkUDSMPt3epIHnkKSu4GOmrGKUJwNii
	SPxJo8KMR424hA/+E6R9v2Gi3mzTkYnZKHI41m/U4RqqQvYp+z0jgsrT+L0cxA+VDZDz
	6zivfvbhY6LicAndyGUJ6yLLMutwSr04FaqR1jLftgcolnTHvnbCCFMbd7fg90hrKB6g
	UR+ozpuVqs3PboZ6DSItxOW371x1aRN8oZNotSGyV0iWpzODuAIOPr+RKufUY0gIbLvr
	4dzDGlhfvjuJEUt0bs9h9rUxatIgmPb3LsvPV1FmM6Nr/NlvA8HYCxXzOaONDfZNgeCx
	3nJg==
X-Gm-Message-State: APzg51ASyYw4ta/nvKAAoJXtB2FhiaBxdatG7aMXJTFFxujcXxIgCL9P
	XRNDM8QBcHymBt5qK3gT2GnKDDa8Q5I=
X-Google-Smtp-Source: ANB0VdbvE+TRNUzW6WPCpj5cDL8MAn+2zEkhqli/LTZIztffmqYlX5QGTZRmUU97bWZaSf3u5WRAGA==
X-Received: by 2002:aca:4aca:: with SMTP id
	x193-v6mr1420643oia.211.1534936780279; 
	Wed, 22 Aug 2018 04:19:40 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:39 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:10 +0530
Message-Id: <1534936692-11736-32-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 32/34] openssl: CVE-2018-0732
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:39 -0000

Reject excessively large primes in DH key generation.

CVE-2018-0732

Affects openssl 1.0.2 to 1.0.2o

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../openssl/openssl-1.0.2o/CVE-2018-0732.patch     | 47 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch
new file mode 100644
index 0000000..2796b05
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2o/CVE-2018-0732.patch
@@ -0,0 +1,47 @@
+From 3984ef0b72831da8b3ece4745cac4f8575b19098 Mon Sep 17 00:00:00 2001
+From: Guido Vranken <guidovranken@gmail.com>
+Date: Mon, 11 Jun 2018 19:38:54 +0200
+Subject: [PATCH] Reject excessively large primes in DH key generation.
+
+CVE-2018-0732
+
+Signed-off-by: Guido Vranken <guidovranken@gmail.com>
+
+(cherry picked from commit 91f7361f47b082ae61ffe1a7b17bb2adf213c7fe)
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/6457)
+
+CVE: CVE-2018-0732
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


