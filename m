Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id C7C61792DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:57 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id m11-v6so2511786oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E6o/+xHVkJnEzrLZ0235vUgCxNJq3eIV/CCxvFnVhg4=;
	b=i1SWd3AiM5Wc1khunoGm/VDg7+/xkVYkuRnOp+6MvoAM2Kjk70bMBwX1tqVIJKlEk4
	oOkWMnUVQmoiHp0NwXXtsiYsdA5t5m6ZekQvd+rfkGjtyRBCTna3fczcdef0/2cy9chz
	SsU8PbGUAMQ1IBsAbyXFV6gYDcbfLUGYUWLGtdCtUzTGrDwU5nDI+tG9ob9MoUWWS2W1
	XQhvNrxNRKYnFItq9cWEfTdnhUbY90O8DRioP2Ko11GTF7UsBnrFYjVlk8Hn0cubqi0d
	aknd0piMT6isHUDlLCgjog8gAnIM/zvd8/cuNPxKoD/6FbZr7YseGpEvxEl1Gar+l3F9
	7AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E6o/+xHVkJnEzrLZ0235vUgCxNJq3eIV/CCxvFnVhg4=;
	b=HWtGLv3IeOyy+uC6B5jnVa8DkRcuQLfaLm9I9Ckrg67jA4w2gstYW3Si0ma4446nS0
	CVdTj6gPnLVe1Jt3rQK6cldVyorfMRq4GWoKEttptHmEgBCl24ttgywA97u8ZZSoe9Ps
	SXyCMynw8m+sBMyVyan4WZK1mKCazf25kitcuFDWYQQQp/gxsQZ7ld2SQXqzjKQ8w22W
	WCxgOo1tLPa914J0NB90siHpPaJJDlbDZMBCKx7eapmwZIO9L7HPWADlcbIg0TAADEt/
	F/z9hQYaQaLZOAlvaAieLvc+xTxQrt1hbwf0WtRDGzqdkvX1JuYgQ+HRcJpzrJi8OKPN
	OC9Q==
X-Gm-Message-State: APzg51DsD2h5qy367jqDIJt2PlQr3S+SbTjyPAy88bdrBZe+O/EoDteg
	t1+9Z86a0y75XH6VeZI0P5FMBqUJ8HI=
X-Google-Smtp-Source: ANB0VdabkdxPcyzsWMcNaHR2rKQCuwLmZx0sQvwLHi5wXYUHKdynsJqcM3wcM7xJ29+XrD+sGxTF5Q==
X-Received: by 2002:aca:6541:: with SMTP id
	j1-v6mr3209471oiw.157.1534936678696; 
	Wed, 22 Aug 2018 04:17:58 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:58 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:53 +0530
Message-Id: <1534936615-11658-17-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 17/19] openssl: CVE-2018-0732
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:58 -0000

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


