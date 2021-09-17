Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.372.1631923089920352107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 16:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LPihJAB0;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id q23so8537697pfs.9
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zh98ZRoDqibLZ63/T68QemTkdEo2vjqOrmsk2EoWh6Q=;
        b=LPihJAB0lOya3kq2Svdv71hOheZqeeu0fSpQ/5D2JEJv7hI/CZGnQB5WtJZCTckfB8
         mQfLHS06jggpJjKAvyOvuUFvQpRXHWGZUlfHVLIkBx7o5vOK+K95ywr7QId3wiZJEby2
         qIeIaxS4oq5UcAB3V4JK9KK0zZrjgDn8vu+EUYv1U+lo0h8YvrJ1keVjvsVpDwwDmWwh
         E6q4lS/OQUXSbA4FzseazUtU7mgVqousDcNzlQ5VANDVoZ0xhy/QCljxJkdo7DdYxL3b
         N2ZQlxBejFtrHR2AmCyEVK2q1yZ4G6V7hcpY0CG9vD8jVjPqc4W8nCOA1TzmvL6efenI
         jqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zh98ZRoDqibLZ63/T68QemTkdEo2vjqOrmsk2EoWh6Q=;
        b=faxlOrtiiw4SYsiBhpA9qdM7vzC34Wz+vIAcw46rGREO5zcphzvWP/W4UaGPx0J4bx
         zwhdGaPSh42ZTzYM/rCh3NMGxvtFaG29NyQUQWsZJbxSfFrFznGtuvMGqt5F9hwLM3oG
         obcG5WJiVkQaV+29sQz56VIc3m8BU4S9XARy7j87iXJ2ezfIb/yyF6AgBNf08R/88Oqb
         DMSwyIgCA2FG93KrYaRVEhVTJU8cGbGbbN2EzaTQ3o2q7UO72uhbC0vYdgTHglxbhn9G
         aAxgPLeiPU6JI2QBAkBvWvOT5GUtvZXC66Cn4snpop3DNjQoPEmt/hlPbcPmNiSsnRK/
         vhiA==
X-Gm-Message-State: AOAM532iI+vjEejB79TXQzeMyCZ2n0CMis/LEjyYPKPGxi4nMnfwpaQj
	jQHsvsBKglZdvjFNuR3+PSTyIM57YtQ=
X-Google-Smtp-Source: ABdhPJySdwXwPPHuQ8RGRSkL3ZB3KAJC5/fPRNer+xdtqXfHWZEnyjnOxQVibzDLTUlr92OApDrPmw==
X-Received: by 2002:a62:ce0d:0:b0:438:71f1:4442 with SMTP id y13-20020a62ce0d000000b0043871f14442mr13755917pfg.21.1631923088839;
        Fri, 17 Sep 2021 16:58:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:2b6e:6174:9286:e61b])
        by smtp.gmail.com with ESMTPSA id 126sm8383465pgi.86.2021.09.17.16.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:58:08 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH 1/2] nettle: Security fix for CVE-2021-20305
Date: Fri, 17 Sep 2021 16:58:05 -0700
Message-Id: <20210917235806.3712457-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Debian.org
MR: 110174
Type: Security Fix
Disposition: Backport from https://sources.debian.org/patches/nettle/3.4.1-1+deb10u1/
ChangeID: 47746f3e58c03a62fef572797d0ae6e0cd865092
Description:

Affects: Nettle < 3.7.2

Minor fixup for nettle_secp_224r1 to _nettle_secp_224r1 to match 3.5.1
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nettle-3.5.1/CVE-2021-20305-1.patch       | 215 ++++++++++++++++++
 .../nettle-3.5.1/CVE-2021-20305-2.patch       |  53 +++++
 .../nettle-3.5.1/CVE-2021-20305-3.patch       | 122 ++++++++++
 .../nettle-3.5.1/CVE-2021-20305-4.patch       |  48 ++++
 .../nettle-3.5.1/CVE-2021-20305-5.patch       |  53 +++++
 meta/recipes-support/nettle/nettle_3.5.1.bb   |   5 +
 6 files changed, 496 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-1.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-2.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-3.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-4.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-5.patch

diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-1.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-1.patch
new file mode 100644
index 0000000000..cfc0f382fa
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-1.patch
@@ -0,0 +1,215 @@
+Backport of:
+
+From a63893791280d441c713293491da97c79c0950fe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Thu, 11 Mar 2021 19:37:41 +0100
+Subject: [PATCH] New functions ecc_mod_mul_canonical and
+ ecc_mod_sqr_canonical.
+
+* ecc-mod-arith.c (ecc_mod_mul_canonical, ecc_mod_sqr_canonical):
+New functions.
+* ecc-internal.h: Declare and document new functions.
+* curve448-eh-to-x.c (curve448_eh_to_x): Use ecc_mod_sqr_canonical.
+* curve25519-eh-to-x.c (curve25519_eh_to_x): Use ecc_mod_mul_canonical.
+* ecc-eh-to-a.c (ecc_eh_to_a): Likewise.
+* ecc-j-to-a.c (ecc_j_to_a): Likewise.
+* ecc-mul-m.c (ecc_mul_m): Likewise.
+
+(cherry picked from commit 2bf497ba4d6acc6f352bca015837fad33008565c)
+
+Upstream-Status: Backport
+https://sources.debian.org/data/main/n/nettle/3.4.1-1%2Bdeb10u1/debian/patches/CVE-2021-20305-1.patch
+CVE: CVE-2021-20305 dep1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog            | 11 +++++++++++
+ curve25519-eh-to-x.c |  6 +-----
+ curve448-eh-to-x.c   |  5 +----
+ ecc-eh-to-a.c        | 12 ++----------
+ ecc-internal.h       | 15 +++++++++++++++
+ ecc-j-to-a.c         | 15 +++------------
+ ecc-mod-arith.c      | 24 ++++++++++++++++++++++++
+ ecc-mul-m.c          |  6 ++----
+ 8 files changed, 59 insertions(+), 35 deletions(-)
+
+#diff --git a/ChangeLog b/ChangeLog
+#index fd138d82..5cc5c188 100644
+#--- a/ChangeLog
+#+++ b/ChangeLog
+#@@ -1,3 +1,14 @@
+#+2021-03-11  Niels MÃ¶ller  <nisse@lysator.liu.se>
+#+
+#+	* ecc-mod-arith.c (ecc_mod_mul_canonical, ecc_mod_sqr_canonical):
+#+	New functions.
+#+	* ecc-internal.h: Declare and document new functions.
+#+	* curve448-eh-to-x.c (curve448_eh_to_x): Use ecc_mod_sqr_canonical.
+#+	* curve25519-eh-to-x.c (curve25519_eh_to_x): Use ecc_mod_mul_canonical.
+#+	* ecc-eh-to-a.c (ecc_eh_to_a): Likewise.
+#+	* ecc-j-to-a.c (ecc_j_to_a): Likewise.
+#+	* ecc-mul-m.c (ecc_mul_m): Likewise.
+#+
+# 2021-02-17  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+# 	* Released Nettle-3.7.1.
+Index: nettle-3.5.1/curve25519-eh-to-x.c
+===================================================================
+--- nettle-3.5.1.orig/curve25519-eh-to-x.c
++++ nettle-3.5.1/curve25519-eh-to-x.c
+@@ -53,7 +53,6 @@ curve25519_eh_to_x (mp_limb_t *xp, const
+ #define t2 (scratch + 2*ecc->p.size)
+ 
+   const struct ecc_curve *ecc = &_nettle_curve25519;
+-  mp_limb_t cy;
+ 
+   /* If u = U/W and v = V/W are the coordiantes of the point on the
+      Edwards curve we get the curve25519 x coordinate as
+@@ -69,10 +68,7 @@ curve25519_eh_to_x (mp_limb_t *xp, const
+   ecc->p.invert (&ecc->p, t1, t0, t2 + ecc->p.size);
+   
+   ecc_modp_add (ecc, t0, wp, vp);
+-  ecc_modp_mul (ecc, t2, t0, t1);
+-
+-  cy = mpn_sub_n (xp, t2, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, xp, t2, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, xp, t0, t1, t2);
+ #undef vp
+ #undef wp
+ #undef t0
+Index: nettle-3.5.1/ecc-eh-to-a.c
+===================================================================
+--- nettle-3.5.1.orig/ecc-eh-to-a.c
++++ nettle-3.5.1/ecc-eh-to-a.c
+@@ -59,9 +59,7 @@ ecc_eh_to_a (const struct ecc_curve *ecc
+   /* Needs 2*size + scratch for the invert call. */
+   ecc->p.invert (&ecc->p, izp, zp, tp + ecc->p.size);
+ 
+-  ecc_modp_mul (ecc, tp, xp, izp);
+-  cy = mpn_sub_n (r, tp, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r, tp, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, r, xp, izp, tp);
+ 
+   if (op)
+     {
+@@ -81,7 +79,5 @@ ecc_eh_to_a (const struct ecc_curve *ecc
+ 	}
+       return;
+     }
+-  ecc_modp_mul (ecc, tp, yp, izp);
+-  cy = mpn_sub_n (r + ecc->p.size, tp, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r + ecc->p.size, tp, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, r + ecc->p.size, yp, izp, tp);
+ }
+Index: nettle-3.5.1/ecc-internal.h
+===================================================================
+--- nettle-3.5.1.orig/ecc-internal.h
++++ nettle-3.5.1/ecc-internal.h
+@@ -49,6 +49,8 @@
+ #define ecc_mod_submul_1 _nettle_ecc_mod_submul_1
+ #define ecc_mod_mul _nettle_ecc_mod_mul
+ #define ecc_mod_sqr _nettle_ecc_mod_sqr
++#define ecc_mod_mul_canonical _nettle_ecc_mod_mul_canonical
++#define ecc_mod_sqr_canonical _nettle_ecc_mod_sqr_canonical
+ #define ecc_mod_random _nettle_ecc_mod_random
+ #define ecc_mod _nettle_ecc_mod
+ #define ecc_mod_inv _nettle_ecc_mod_inv
+@@ -263,6 +265,19 @@ ecc_mod_sqr (const struct ecc_modulo *m,
+ #define ecc_modq_mul(ecc, r, a, b) \
+   ecc_mod_mul (&(ecc)->q, (r), (a), (b))
+ 
++/* These mul and sqr functions produce a canonical result, 0 <= R < M.
++   Requirements on input and output areas are similar to the above
++   functions, except that it is *not* allowed to pass rp = rp +
++   m->size.
++ */
++void
++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, const mp_limb_t *bp, mp_limb_t *tp);
++
++void
++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, mp_limb_t *tp);
++
+ /* mod q operations. */
+ void
+ ecc_mod_random (const struct ecc_modulo *m, mp_limb_t *xp,
+Index: nettle-3.5.1/ecc-j-to-a.c
+===================================================================
+--- nettle-3.5.1.orig/ecc-j-to-a.c
++++ nettle-3.5.1/ecc-j-to-a.c
+@@ -51,8 +51,6 @@ ecc_j_to_a (const struct ecc_curve *ecc,
+ #define izBp (scratch + 3*ecc->p.size)
+ #define tp    scratch
+ 
+-  mp_limb_t cy;
+-
+   if (ecc->use_redc)
+     {
+       /* Set v = (r_z / B^2)^-1,
+@@ -86,17 +84,14 @@ ecc_j_to_a (const struct ecc_curve *ecc,
+       ecc_modp_sqr (ecc, iz2p, izp);
+     }
+ 
+-  ecc_modp_mul (ecc, iz3p, iz2p, p);
+-  /* ecc_modp (and ecc_modp_mul) may return a value up to 2p - 1, so
+-     do a conditional subtraction. */
+-  cy = mpn_sub_n (r, iz3p, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r, iz3p, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, r, iz2p, p, iz3p);
+ 
+   if (op)
+     {
+       /* Skip y coordinate */
+       if (op > 1)
+ 	{
++	  mp_limb_t cy;
+ 	  /* Also reduce the x coordinate mod ecc->q. It should
+ 	     already be < 2*ecc->q, so one subtraction should
+ 	     suffice. */
+@@ -106,10 +101,7 @@ ecc_j_to_a (const struct ecc_curve *ecc,
+       return;
+     }
+   ecc_modp_mul (ecc, iz3p, iz2p, izp);
+-  ecc_modp_mul (ecc, tp, iz3p, p + ecc->p.size);
+-  /* And a similar subtraction. */
+-  cy = mpn_sub_n (r + ecc->p.size, tp, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r + ecc->p.size, tp, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, r + ecc->p.size, iz3p, p + ecc->p.size, iz3p);
+ 
+ #undef izp
+ #undef up
+Index: nettle-3.5.1/ecc-mod-arith.c
+===================================================================
+--- nettle-3.5.1.orig/ecc-mod-arith.c
++++ nettle-3.5.1/ecc-mod-arith.c
+@@ -119,6 +119,30 @@ ecc_mod_mul (const struct ecc_modulo *m,
+ }
+ 
+ void
++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, const mp_limb_t *bp, mp_limb_t *tp)
++{
++  mp_limb_t cy;
++  mpn_mul_n (tp + m->size, ap, bp, m->size);
++  m->reduce (m, tp + m->size);
++
++  cy = mpn_sub_n (rp, tp + m->size, m->m, m->size);
++  cnd_copy (cy, rp, tp + m->size, m->size);
++}
++
++void
++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, mp_limb_t *tp)
++{
++  mp_limb_t cy;
++  mpn_sqr (tp + m->size, ap, m->size);
++  m->reduce (m, tp + m->size);
++
++  cy = mpn_sub_n (rp, tp + m->size, m->m, m->size);
++  cnd_copy (cy, rp, tp + m->size, m->size);
++}
++
++void
+ ecc_mod_sqr (const struct ecc_modulo *m, mp_limb_t *rp,
+ 	     const mp_limb_t *ap)
+ {
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-2.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-2.patch
new file mode 100644
index 0000000000..bb56b14c8c
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-2.patch
@@ -0,0 +1,53 @@
+Backport of:
+
+From 971bed6ab4b27014eb23085e8176917e1a096fd5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Sat, 13 Mar 2021 17:26:37 +0100
+Subject: [PATCH] Use ecc_mod_mul_canonical for point comparison.
+
+* eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
+
+(cherry picked from commit 5b7608fde3a6d2ab82bffb35db1e4e330927c906)
+
+Upstream-Status: Backport
+https://sources.debian.org/data/main/n/nettle/3.4.1-1%2Bdeb10u1/debian/patches/CVE-2021-20305-2.patch
+CVE: CVE-2021-20305 dep2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog      | 4 ++++
+ eddsa-verify.c | 9 ++-------
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+#diff --git a/ChangeLog b/ChangeLog
+#index 5cc5c188..2a9217a6 100644
+#--- a/ChangeLog
+#+++ b/ChangeLog
+#@@ -1,3 +1,7 @@
+#+2021-03-13  Niels MÃ¶ller  <nisse@lysator.liu.se>
+#+
+#+	* eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
+#+
+# 2021-03-11  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+# 	* ecc-mod-arith.c (ecc_mod_mul_canonical, ecc_mod_sqr_canonical):
+Index: nettle-3.5.1/eddsa-verify.c
+===================================================================
+--- nettle-3.5.1.orig/eddsa-verify.c
++++ nettle-3.5.1/eddsa-verify.c
+@@ -53,13 +53,8 @@ equal_h (const struct ecc_modulo *p,
+ #define t0 scratch
+ #define t1 (scratch + p->size)
+ 
+-  ecc_mod_mul (p, t0, x1, z2);
+-  if (mpn_cmp (t0, p->m, p->size) >= 0)
+-    mpn_sub_n (t0, t0, p->m, p->size);
+-
+-  ecc_mod_mul (p, t1, x2, z1);
+-  if (mpn_cmp (t1, p->m, p->size) >= 0)
+-    mpn_sub_n (t1, t1, p->m, p->size);
++  ecc_mod_mul_canonical (p, t0, x1, z2, t0);
++  ecc_mod_mul_canonical (p, t1, x2, z1, t1);
+ 
+   return mpn_cmp (t0, t1, p->size) == 0;
+ 
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-3.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-3.patch
new file mode 100644
index 0000000000..15a892ecdf
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-3.patch
@@ -0,0 +1,122 @@
+Backport of:
+
+From 74ee0e82b6891e090f20723750faeb19064e31b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Sat, 13 Mar 2021 15:19:19 +0100
+Subject: [PATCH] Fix bug in ecc_ecdsa_verify.
+
+* ecc-ecdsa-verify.c (ecc_ecdsa_verify): Use ecc_mod_mul_canonical
+to compute the scalars used for ecc multiplication.
+* testsuite/ecdsa-verify-test.c (test_main): Add test case that
+triggers an assert on 64-bit platforms, without above fix.
+* testsuite/ecdsa-sign-test.c (test_main): Test case generating
+the same signature.
+
+(cherry picked from commit 2397757b3f95fcae1e2d3011bf99ca5b5438378f)
+
+Upstream-Status: Backport
+https://sources.debian.org/data/main/n/nettle/3.4.1-1%2Bdeb10u1/debian/patches/CVE-2021-20305-3.patch
+CVE: CVE-2021-20305 dep3
+[Minor fixup on _nettle_secp_224r1]
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog                     | 10 +++++++++-
+ ecc-ecdsa-verify.c            |  4 ++--
+ testsuite/ecdsa-sign-test.c   | 13 +++++++++++++
+ testsuite/ecdsa-verify-test.c | 20 ++++++++++++++++++++
+ 4 files changed, 44 insertions(+), 3 deletions(-)
+
+#diff --git a/ChangeLog b/ChangeLog
+#index 2a9217a6..63848f53 100644
+#--- a/ChangeLog
+#+++ b/ChangeLog
+#@@ -1,7 +1,15 @@
+# 2021-03-13  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+#-	* eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
+#+	* ecc-ecdsa-verify.c (ecc_ecdsa_verify): Use ecc_mod_mul_canonical
+#+	to compute the scalars used for ecc multiplication.
+#+	* testsuite/ecdsa-verify-test.c (test_main): Add test case that
+#+	triggers an assert on 64-bit platforms, without above fix.
+#+	* testsuite/ecdsa-sign-test.c (test_main): Test case generating
+#+	the same signature.
+#+
+#+2021-03-13  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+#+	* eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
+# 2021-03-11  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+# 	* ecc-mod-arith.c (ecc_mod_mul_canonical, ecc_mod_sqr_canonical):
+Index: nettle-3.5.1/ecc-ecdsa-verify.c
+===================================================================
+--- nettle-3.5.1.orig/ecc-ecdsa-verify.c
++++ nettle-3.5.1/ecc-ecdsa-verify.c
+@@ -112,10 +112,10 @@ ecc_ecdsa_verify (const struct ecc_curve
+ 
+   /* u1 = h / s, P1 = u1 * G */
+   ecc_hash (&ecc->q, hp, length, digest);
+-  ecc_modq_mul (ecc, u1, hp, sinv);
++  ecc_mod_mul_canonical (&ecc->q, u1, hp, sinv, u1);
+ 
+   /* u2 = r / s, P2 = u2 * Y */
+-  ecc_modq_mul (ecc, u2, rp, sinv);
++  ecc_mod_mul_canonical (&ecc->q, u2, rp, sinv, u2);
+ 
+    /* Total storage: 5*ecc->p.size + ecc->mul_itch */
+   ecc->mul (ecc, P2, u2, pp, u2 + ecc->p.size);
+Index: nettle-3.5.1/testsuite/ecdsa-sign-test.c
+===================================================================
+--- nettle-3.5.1.orig/testsuite/ecdsa-sign-test.c
++++ nettle-3.5.1/testsuite/ecdsa-sign-test.c
+@@ -58,6 +58,19 @@ test_ecdsa (const struct ecc_curve *ecc,
+ void
+ test_main (void)
+ {
++  /* Producing the signature for corresponding test in
++     ecdsa-verify-test.c, with special u1 and u2. */
++  test_ecdsa (&_nettle_secp_224r1,
++	      "99b5b787484def12894ca507058b3bf5"
++	      "43d72d82fa7721d2e805e5e6",
++	      "2",
++	      SHEX("cdb887ac805a3b42e22d224c85482053"
++		   "16c755d4a736bb2032c92553"),
++	      "706a46dc76dcb76798e60e6d89474788"
++	      "d16dc18032d268fd1a704fa6", /* r */
++	      "3a41e1423b1853e8aa89747b1f987364"
++	      "44705d6d6d8371ea1f578f2e"); /* s */
++
+   /* Test cases for the smaller groups, verified with a
+      proof-of-concept implementation done for Yubico AB. */
+   test_ecdsa (&_nettle_secp_192r1,
+Index: nettle-3.5.1/testsuite/ecdsa-verify-test.c
+===================================================================
+--- nettle-3.5.1.orig/testsuite/ecdsa-verify-test.c
++++ nettle-3.5.1/testsuite/ecdsa-verify-test.c
+@@ -81,6 +81,26 @@ test_ecdsa (const struct ecc_curve *ecc,
+ void
+ test_main (void)
+ {
++  /* Corresponds to nonce k = 2 and private key z =
++     0x99b5b787484def12894ca507058b3bf543d72d82fa7721d2e805e5e6. z and
++     hash are chosen so that intermediate scalars in the verify
++     equations are u1 = 0x6b245680e700, u2 =
++     259da6542d4ba7d21ad916c3bd57f811. These values require canonical
++     reduction of the scalars. Bug caused by missing canonical
++     reduction reported by Guido Vranken. */
++  test_ecdsa (&_nettle_secp_224r1,
++	      "9e7e6cc6b1bdfa8ee039b66ad85e5490"
++	      "7be706a900a3cba1c8fdd014", /* x */
++	      "74855db3f7c1b4097ae095745fc915e3"
++	      "8a79d2a1de28f282eafb22ba", /* y */
++
++	      SHEX("cdb887ac805a3b42e22d224c85482053"
++		   "16c755d4a736bb2032c92553"),
++	      "706a46dc76dcb76798e60e6d89474788"
++	      "d16dc18032d268fd1a704fa6", /* r */
++	      "3a41e1423b1853e8aa89747b1f987364"
++	      "44705d6d6d8371ea1f578f2e"); /* s */
++
+   /* From RFC 4754 */
+   test_ecdsa (&_nettle_secp_256r1,
+ 	      "2442A5CC 0ECD015F A3CA31DC 8E2BBC70"
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-4.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-4.patch
new file mode 100644
index 0000000000..54b4fa584c
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-4.patch
@@ -0,0 +1,48 @@
+Backport of:
+
+From 51f643eee00e2caa65c8a2f5857f49acdf3ef1ce Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Sat, 13 Mar 2021 16:27:50 +0100
+Subject: [PATCH] Ensure ecdsa_sign output is canonically reduced.
+
+* ecc-ecdsa-sign.c (ecc_ecdsa_sign): Ensure s output is reduced to
+canonical range.
+
+(cherry picked from commit c24b36160dc5303f7541dd9da1429c4046f27398)
+
+Upstream-Status: Backport
+https://sources.debian.org/data/main/n/nettle/3.4.1-1%2Bdeb10u1/debian/patches/CVE-2021-20305-4.patch
+CVE: CVE-2021-20305 dep4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog        | 3 +++
+ ecc-ecdsa-sign.c | 3 +--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+#diff --git a/ChangeLog b/ChangeLog
+#index 63848f53..fb2d7f66 100644
+#--- a/ChangeLog
+#+++ b/ChangeLog
+#@@ -1,5 +1,8 @@
+# 2021-03-13  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+#+	* ecc-ecdsa-sign.c (ecc_ecdsa_sign): Ensure s output is reduced to
+#+	canonical range.
+#+
+# 	* ecc-ecdsa-verify.c (ecc_ecdsa_verify): Use ecc_mod_mul_canonical
+# 	to compute the scalars used for ecc multiplication.
+# 	* testsuite/ecdsa-verify-test.c (test_main): Add test case that
+--- a/ecc-ecdsa-sign.c
++++ b/ecc-ecdsa-sign.c
+@@ -90,9 +90,8 @@ ecc_ecdsa_sign (const struct ecc_curve *
+ 
+   ecc_modq_mul (ecc, tp, zp, rp);
+   ecc_modq_add (ecc, hp, hp, tp);
+-  ecc_modq_mul (ecc, tp, hp, kinv);
++  ecc_mod_mul_canonical (&ecc->q, sp, hp, kinv, tp);
+ 
+-  mpn_copyi (sp, tp, ecc->p.size);
+ #undef P
+ #undef hp
+ #undef kinv
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-5.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-5.patch
new file mode 100644
index 0000000000..468ff66266
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-5.patch
@@ -0,0 +1,53 @@
+Backport of:
+
+From ae3801a0e5cce276c270973214385c86048d5f7b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Sat, 13 Mar 2021 16:42:21 +0100
+Subject: [PATCH] Similar fix for eddsa.
+
+* eddsa-hash.c (_eddsa_hash): Ensure result is canonically
+reduced. Two of the three call sites need that.
+
+(cherry picked from commit d9b564e4b3b3a5691afb9328c7342b3f7ca64288)
+
+
+Upstream-Status: Backport
+https://sources.debian.org/data/main/n/nettle/3.4.1-1%2Bdeb10u1/debian/patches/CVE-2021-20305-6.patch
+CVE: CVE-2021-20305 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog    |  3 +++
+ eddsa-hash.c | 10 +++++++---
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+#diff --git a/ChangeLog b/ChangeLog
+#index 5f8a22c2..ce330831 100644
+#--- a/ChangeLog
+#+++ b/ChangeLog
+#@@ -1,5 +1,8 @@
+# 2021-03-13  Niels MÃ¶ller  <nisse@lysator.liu.se>
+# 
+#+	* eddsa-hash.c (_eddsa_hash): Ensure result is canonically
+#+	reduced. Two of the three call sites need that.
+#+
+# 	* ecc-gostdsa-verify.c (ecc_gostdsa_verify): Use ecc_mod_mul_canonical
+# 	to compute the scalars used for ecc multiplication.
+# 
+Index: nettle-3.5.1/eddsa-hash.c
+===================================================================
+--- nettle-3.5.1.orig/eddsa-hash.c
++++ nettle-3.5.1/eddsa-hash.c
+@@ -46,7 +46,12 @@ void
+ _eddsa_hash (const struct ecc_modulo *m,
+ 	     mp_limb_t *rp, const uint8_t *digest)
+ {
++  mp_limb_t cy;
+   size_t nbytes = 1 + m->bit_size / 8;
+   mpn_set_base256_le (rp, 2*m->size, digest, 2*nbytes);
+   m->mod (m, rp);
++  mpn_copyi (rp + m->size, rp, m->size);
++  /* Ensure canonical reduction. */
++  cy = mpn_sub_n (rp, rp + m->size, m->m, m->size);
++  cnd_copy (cy, rp, rp + m->size, m->size);
+ }
diff --git a/meta/recipes-support/nettle/nettle_3.5.1.bb b/meta/recipes-support/nettle/nettle_3.5.1.bb
index 9212d9deb5..192fd295e9 100644
--- a/meta/recipes-support/nettle/nettle_3.5.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.5.1.bb
@@ -20,6 +20,11 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            file://CVE-2021-3580_1.patch \
            file://CVE-2021-3580_2.patch \
+           file://CVE-2021-20305-1.patch \
+           file://CVE-2021-20305-2.patch \
+           file://CVE-2021-20305-3.patch \
+           file://CVE-2021-20305-4.patch \
+           file://CVE-2021-20305-5.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.25.1

