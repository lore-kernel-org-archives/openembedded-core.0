Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60E786E65F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 23:04:19 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id dx3so8423574pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EMFPHlBSqRMysaOthoybRo+34DxzAlM6ryvTPXiUoeA=;
	b=fLSDjbNSphOWWTFoGrsE62+/vSDCnXS+ME2XovrhmmTtOgoVminaX2AId/iQ53cQK4
	tjCIcrp+Fe8f55jJXhAPAZIqE6nOrvfSWQp2zSf/X8Zvgp01Sva1WvluuMl+URCxK63F
	aK2E4G779o+S++pgAam2H3Xvcrb90B9FPUCAzPsZarzUbatE47TaAipak1EwcRtmDVGf
	kgtN2hb9godak1NN2Y2t8IpZxx/xCGiwPiccFc924TI+1Af15xIvab+d72H88tc+Wugp
	TuHZ5YK5fqSjDuFGeTbEqaWuC3x6LUUIaAviG/v+I3t6dvgoHN/oOe3FhpCM4u9Jb5uz
	XKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EMFPHlBSqRMysaOthoybRo+34DxzAlM6ryvTPXiUoeA=;
	b=Kg0ZXGdKnHySkdxbT0Ue5AQtJTShLYinv3L7KbEiBME3E8jQyl0Wq0+puhL0WJjm1L
	FByTmz08MIKTh5Y4ylnozvM4QreBxPFTxxr6KknJ9gy4CVJtbUfM07+OdwdSZZuY6WJh
	8ssNi9tDnpZv2YI7MrUqy7/Y1kNu33dqog9qNTLpIpmdOGKQOFfExjOEcxP1d8c/xdCc
	KBseSco7aabOWcuRxm9c6JI/x0LnLdCW5UH4D9Qu1y36NTk9Bmmh7nU3OQ5eID1XeE3Y
	1JVSChGE0zf/5wdAlo1kel0PAWNPeoaAM0dJKJKB6f9WLw5YVUbVAbJ+s6sV+yX4/sbc
	2Jjg==
X-Gm-Message-State: ALyK8tLE1chr87LMrcCaBqgR4lnejH90yUkFF9ZoyvFDNsFRs+19VEOTPyi3Dfc9JyLy4Q==
X-Received: by 10.66.171.197 with SMTP id aw5mr43572938pac.36.1468710260370;
	Sat, 16 Jul 2016 16:04:20 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 84sm2346368pfp.59.2016.07.16.16.04.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 16:04:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 16 Jul 2016 16:04:12 -0700
Message-Id: <1468710255-5030-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
References: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][PATCH] 2/5] openssl: Security fix CVE-2016-2178
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
X-List-Received-Date: Sat, 16 Jul 2016 23:04:20 -0000

From: Armin Kuster <akuster@mvista.com>

affects  openssl <=  1.0.2h
CVSS v2 Base Score: 2.1 LOW

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/openssl/CVE-2016-2178.patch            | 51 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
new file mode 100644
index 0000000..27ade4e
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
@@ -0,0 +1,51 @@
+From 399944622df7bd81af62e67ea967c470534090e2 Mon Sep 17 00:00:00 2001
+From: Cesar Pereida <cesar.pereida@aalto.fi>
+Date: Mon, 23 May 2016 12:45:25 +0300
+Subject: [PATCH] Fix DSA, preserve BN_FLG_CONSTTIME
+
+Operations in the DSA signing algorithm should run in constant time in
+order to avoid side channel attacks. A flaw in the OpenSSL DSA
+implementation means that a non-constant time codepath is followed for
+certain operations. This has been demonstrated through a cache-timing
+attack to be sufficient for an attacker to recover the private DSA key.
+
+CVE-2016-2178
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+
+Upstream-Status: Backport
+CVE: CVE-2016-2178
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ crypto/dsa/dsa_ossl.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+Index: openssl-1.0.2h/crypto/dsa/dsa_ossl.c
+===================================================================
+--- openssl-1.0.2h.orig/crypto/dsa/dsa_ossl.c
++++ openssl-1.0.2h/crypto/dsa/dsa_ossl.c
+@@ -248,9 +248,6 @@ static int dsa_sign_setup(DSA *dsa, BN_C
+         if (!BN_rand_range(&k, dsa->q))
+             goto err;
+     while (BN_is_zero(&k)) ;
+-    if ((dsa->flags & DSA_FLAG_NO_EXP_CONSTTIME) == 0) {
+-        BN_set_flags(&k, BN_FLG_CONSTTIME);
+-    }
+ 
+     if (dsa->flags & DSA_FLAG_CACHE_MONT_P) {
+         if (!BN_MONT_CTX_set_locked(&dsa->method_mont_p,
+@@ -282,6 +279,11 @@ static int dsa_sign_setup(DSA *dsa, BN_C
+     } else {
+         K = &k;
+     }
++
++    if ((dsa->flags & DSA_FLAG_NO_EXP_CONSTTIME) == 0) {
++        BN_set_flags(K, BN_FLG_CONSTTIME);
++    }
++
+     DSA_BN_MOD_EXP(goto err, dsa, r, dsa->g, K, dsa->p, ctx,
+                    dsa->method_mont_p);
+     if (!BN_mod(r, r, dsa->q, ctx))
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index e7d1106..4f91e55 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://configure-musl-target.patch \
             file://parallel.patch \
             file://CVE-2016-2177.patch \
+            file://CVE-2016-2178.patch \
            "
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
 SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
-- 
2.3.5


