Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 11A4674FB9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 15:53:25 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b11-v6so6417455pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eCFfWS0Wr0flIeyEDcte3pbY1BPmOuPasJ2CRP2FEIM=;
	b=aXf8vMSu+QecXrfam8STvihe/OMWFg/Bqf2nCK6S8OdQRjOMnZJxw9dUzgLkfz02tS
	tml35HxgWIHE3PkLBS3H3zA1PUJ7Ryjny9ptYaIzgeoWJFAGJgax/PMa2FRner4fzo2J
	yhxFPm0TlOkmrHPJFZsO7Zc01wK9LCs1jvb9dvRQKH4/ukBlOEwkAGzS6Yz8ziNu1yfq
	Z41Pj1q2NUNdQHKcZnz0kH7mTFu1QrtT9qivfyp3bid+vm0tayqdZAvSwQPbAjjRdh53
	QcsuWdAT0ZPkUnr4uIhgWjE9s8sbie+4r+vvleXukmS2+9amiI3QFsO4Gv6BzPoesJoL
	CvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eCFfWS0Wr0flIeyEDcte3pbY1BPmOuPasJ2CRP2FEIM=;
	b=IZ7yQDPwYFkuQX9GyKNqvVfYBcpuLrMVIgXJVV7ikOMX2hNq/jNhw7l2lECkCtj+NJ
	JKtMRqxV4p5ME0fEWssgArFgc7dHjv8mzf8Mx4UzT1NdOsZXMsm+sB253skRLkohXs8R
	I4KHExeMh37YExb5DR/mPG/b2Ec6vG7d5wsgvrSZl1fmswl9dPrMBz8sNQVgseCyy+7E
	fzzWH8Io0I0sRjGXBfnyZea2uGP/6aIttf3/hjsQBm/l6Ed8jZXddd8yLSgChLzW1HPA
	soHMkj1qDMSa+NToyJ+ueShQQ3fdOGLECecKXdji+Qm1aFHpK9qz4T9svSdRTqUdwYuo
	1hlg==
X-Gm-Message-State: APzg51CU3Nz9OlWa8jLQG1i69iSNQji7f9yV2L58UwI5DrS5t5xsX0sJ
	mpMfTdUWG0WrPKKSMCN5k84mprhK
X-Google-Smtp-Source: ANB0VdbJv+fOZDtUlF+9dxXqXkLRKPkUvRJmlXdh4NlYhk3g6IoC+KfIwegrr/6fZmJcuusPPBNZlw==
X-Received: by 2002:a62:205d:: with SMTP id
	g90-v6mr22449727pfg.253.1537113206731; 
	Sun, 16 Sep 2018 08:53:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm22048115pfb.167.2018.09.16.08.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Sep 2018 08:53:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Sep 2018 08:53:13 -0700
Message-Id: <20180916155313.18535-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] musl: Add aliases for glibc provided libraries
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
X-List-Received-Date: Sun, 16 Sep 2018 15:53:26 -0000
Content-Transfer-Encoding: 8bit

This is a step towards running pebuilt applications for glibc  on musl
There are many realworld applications which are not always built from
source, especially provided by third party

Signee-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index be31718e3a..a830c36eeb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -26,6 +26,14 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            bsd-headers \
            libssp-nonshared \
           "
+GLIBC_LDSO ?= "ld.so.1"
+GLIBC_LDSO_arm = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ld-linux-armhf.so.3', 'ld-linux.so.3', d)}"
+GLIBC_LDSO_aarch64 = "ld-linux-aarch64.so.1"
+GLIBC_LDSO_x86 = "ld-linux.so.2"
+GLIBC_LDSO_x86_64 = "ld-linux-x86-64.so.2"
+GLIBC_LDSO_x32 = "ld-linux-x32.so.2"
+GLIBC_LDSO_powerpc64 = "ld64.so.1"
+GLIBC_LDSO_mips64 = "ld64.so.1"
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
 
@@ -62,10 +70,14 @@ do_install() {
 	install -d ${D}${bindir}
 	rm -f ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	lnr ${D}${libdir}/libc.so ${D}${base_libdir}/${GLIBC_LDSO}
 	for l in crypt dl m pthread resolv rt util xnet
 	do
 		ln -sf libc.so ${D}${libdir}/lib$l.so
 	done
+	for i in libc.so.6 libcrypt.so.1 libdl.so.2 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
+		ln -sf libc.so ${D}${libdir}/$i
+	done
 }
 
 RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
-- 
2.19.0


