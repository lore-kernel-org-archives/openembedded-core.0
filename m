Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF1BF77302
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:07:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 71so415008pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:in-reply-to:references:content-type:content-transfer-encoding;
	bh=VC56No81RHUJyFwWD6J75MezhDffajZf/iy5EvH7prU=;
	b=zrBBVUbIGvKF1nw0yvKcUZDBya0yOOPjGgABQmhRe+5ZBMWetSdyz+vfQeIROuPcsk
	C1w3LqGeXpjWFTwY8krpN9ow1oUUCMghZog2eyYOoyCYWR0JOg17MtiyZA7FLfDfe/hn
	Th5QijSSIbMZFIpQYkEDuAyCRu/DMJvPQL8GihmiUzFydaa7U3/9sgQ15ck0wQNU029R
	rEN7d6Nj8GLClm6d/M946D7Ws4kNYQ+6MuqP6Wz7QwK4aQRCo1jXvnqVWGNuiO9wJ1wi
	ddrEPF5IH/MWW5aZMn450N8YoDYxR/TUPA5ar4VyZ1iTwFYBFSE/CmwgKv7hgL/KhrhH
	Ju7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=VC56No81RHUJyFwWD6J75MezhDffajZf/iy5EvH7prU=;
	b=EG4hNetiR9CECZurc3Z0PHLotrR4/6roWB/I+AIeU3Jh5+5J5NSgklh1aGjc/g9/9P
	RpI0Y3qGPXhZJH6DI/JMA5MDzWVeo2tBBM05LLLIwJK6SO2RT6qFLwj7plNShQxuS4py
	h/pZdYIDKZCN4BgrwtyBA2cfd6CUP2Jzc20aCT+gRMqzvt7r2/ZiRALl/nlKmtlEDh7U
	1XiwTqIhkUcxiLM939rSFJEOacj3nmCWlST+ier2JTbW6W8otUG4TwCntyz3t2R60ROH
	V+r/SSJ+6aEamh3f7KJbbfNbS11GS+yy19NqfKEvB7L35lck18joxfX5Onte8+FPcmrU
	zQJA==
X-Gm-Message-State: AG10YOQU7zZXVXg0vmCKSWp70UK9ayUts2wZfeaThF/6veiNpaYY25tUTnnOAIy5VuDWLQ==
X-Received: by 10.98.72.202 with SMTP id q71mr21328369pfi.69.1454692055130;
	Fri, 05 Feb 2016 09:07:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tp3sm25783064pac.16.2016.02.05.09.07.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:07:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 09:07:15 -0800
Message-Id: <235de2a49375d4b39670eeaa564685809a65f336.1454691935.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
Subject: [PATCH 1/4] nettle: Security fix CVE-2015-8803 and CVE-2015-8805
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
X-List-Received-Date: Fri, 05 Feb 2016 17:07:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nettle/nettle-3.1.1/CVE-2015-8803_8805.patch   | 71 ++++++++++++++++++++++
 meta/recipes-support/nettle/nettle_3.1.1.bb        |  4 ++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch

diff --git a/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch b/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch
new file mode 100644
index 0000000..b4ff228
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch
@@ -0,0 +1,71 @@
+Upstream-Status: Backport
+https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e3872e4550137209e3ce4d
+
+CVE: CVE-2015-8803
+CVE: CVE-2015-8805
+
+Same fix for both.
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nettle-3.1.1/ecc-256.c
+===================================================================
+--- nettle-3.1.1.orig/ecc-256.c
++++ nettle-3.1.1/ecc-256.c
+@@ -113,8 +113,19 @@ ecc_256_modp (const struct ecc_modulo *p
+ 
+       assert (q2 < 2);
+ 
+-      /* We multiply by two low limbs of p, 2^96 - 1, so we could use
+-	 shifts rather than mul. */
++      /*
++	 n-1 n-2 n-3 n-4
++        +---+---+---+---+
++        | u1| u0| u low |
++        +---+---+---+---+
++          - | q1(2^96-1)|
++            +-------+---+
++            |q2(2^.)|
++            +-------+
++
++	 We multiply by two low limbs of p, 2^96 - 1, so we could use
++	 shifts rather than mul.
++      */
+       t = mpn_submul_1 (rp + n - 4, p->m, 2, q1);
+       t += cnd_sub_n (q2, rp + n - 3, p->m, 1);
+       t += (-q2) & 0xffffffff;
+@@ -124,7 +135,10 @@ ecc_256_modp (const struct ecc_modulo *p
+       u0 -= t;
+       t = (u1 < cy);
+       u1 -= cy;
+-      u1 += cnd_add_n (t, rp + n - 4, p->m, 3);
++
++      cy = cnd_add_n (t, rp + n - 4, p->m, 2);
++      u0 += cy;
++      u1 += (u0 < cy);
+       u1 -= (-t) & 0xffffffff;
+     }
+   rp[2] = u0;
+@@ -211,7 +225,7 @@ ecc_256_modq (const struct ecc_modulo *q
+ 
+       /* Conditional add of p */
+       u1 += t;
+-      u2 += (t<<32) + (u0 < t);
++      u2 += (t<<32) + (u1 < t);
+ 
+       t = cnd_add_n (t, rp + n - 4, q->m, 2);
+       u1 += t;
+Index: nettle-3.1.1/ChangeLog
+===================================================================
+--- nettle-3.1.1.orig/ChangeLog
++++ nettle-3.1.1/ChangeLog
+@@ -1,3 +1,9 @@
++2015-12-10  Niels Möller  <nisse@lysator.liu.se>
++
++   * ecc-256.c (ecc_256_modp): Fixed carry propagation bug. Problem
++   reported by Hanno Böck.
++   (ecc_256_modq): Fixed another carry propagation bug.
++
+ 2015-04-24  Niels Möller  <nisse@lysator.liu.se>
+ 
+ 	* Released nettle-3.1.1.
diff --git a/meta/recipes-support/nettle/nettle_3.1.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
index 7d7134f..1fe3461 100644
--- a/meta/recipes-support/nettle/nettle_3.1.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -7,5 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6
                     file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
                     file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
 
+SRC_URI += "\
+            file://CVE-2015-8803_8805.patch \
+            "
+
 SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
 SRC_URI[sha256sum] = "5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c"
-- 
2.3.5


