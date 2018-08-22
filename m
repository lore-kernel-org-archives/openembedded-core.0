Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8FEC3793CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:21:01 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 8-v6so3108390oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F+2ZlZS4LPBAR1AdzFP+cmfiDmn0EkXVTT/6Rfa5iFU=;
	b=WbEKqej8+vf5wFkSjDWGbgZEG5sOeBqUrQucgSIG7RSVl/P5B2kb48GbFt833o0KZ8
	BT1JFaQ3UNnANO2WM14gOnBA7Zhf/N/DOwEcWB6e0/bc+nEo+EnBQmIz0KkKw6CRIRco
	VYrKv61+ruFOc1hieA7t0JkEuB3MUSr1TSwfaWl6PK7vOi4Nd2xXDZBe452DW6w4/asT
	7G3aFdKXc4RSfvKezW3pogo/V0RMChMI+4xDuFo12Pj+uB9hVNNSNp3henMHOthZ0vYO
	yY555krkSXSXVeyEaWRXvBRfmW47OJWecGIO64JVwlDxCAYazskDTA3zq+ZNakh+pzkK
	6sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F+2ZlZS4LPBAR1AdzFP+cmfiDmn0EkXVTT/6Rfa5iFU=;
	b=kaicCKaEIuG34hVxy7HOqGmGBNm0aJdSTBzrOEC4pi+FAYw0HSPjFG0ETLN86jcyme
	Xbg5Yfw0aa9DK5juTc7VXjvbtylJeZ6QPxmUUiDMXkMXdwtG2quVSD+PRbUE3pBsIE3u
	kK3CXvceh6SgpQWY8nfIHcn9/Td57QxTQJ0t198wSgq386LHChWrpibpdbrPt7hu47xg
	6+XhMVYSMJRM3hV8NHi1YYieX3NXPqaverhEDH5A4YUgrRGALgACOoebCiWPnxuczggi
	P7amXd6w5ThkmpX5JhIMUiG0h4ezxhyoP6qcMY/tuEK5uQM5c9X24scMGv8PsSaE/mwP
	60LA==
X-Gm-Message-State: APzg51DITdctlvhytWahqiKn123/WF6Ta39s/X+4xOO/xB7bAmAd3Gb/
	ytSPtTrPgagydsy/TcXrm0v817ZMmYE=
X-Google-Smtp-Source: ANB0VdZp80wCIiVz9+njUvdrhRYEJUeMxLk8qFNSavu2gsvrw6JgbhgSvLbgqtGP/0Nnaa/sMxtpuw==
X-Received: by 2002:aca:c5:: with SMTP id 188-v6mr3713641oia.128.1534944062492;
	Wed, 22 Aug 2018 06:21:02 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.21.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:21:02 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:07 +0530
Message-Id: <1534944009-21362-17-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:21:01 -0000

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


