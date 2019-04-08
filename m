Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id ABE2C7D596
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 01:22:32 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id i21so9138773oib.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 18:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5ixPpoq3AV+/jzp3iJZExiLv/j4+VgXUn74hK7zT1C0=;
	b=DT7ptMMoEIHYr9ODMITqFVy5bl5QIy5PSiWXhujTET1TKRWu2zWIq6H39pu86hnKT5
	VQT0xpcFyUnCE8gDv9ZCptLRFWgNkqADs8NnvzWoTi8lRKCXiYuI6F2w8Zyf/BYLJac4
	ZfCN4algk4RfWJMoCmKELGozoGXlZrY9GAWCfpgek+nmZVGzWQMX5D49OSgG1ZskQrHS
	ExtGpuFobJC2eqW3Jx1WTTMXZDHupq8E1m/dGD2NafE/LqOzUA9XAAvkT7TlQD1+FoE6
	NBwfPbBaAlWt37aUmRSeSVmQ0rVpXeOlhR+88Nqh7Dp1VLrzrisnKv+r/nnyyYJpwPrp
	0i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5ixPpoq3AV+/jzp3iJZExiLv/j4+VgXUn74hK7zT1C0=;
	b=uhsnrz8lJuXSQLvCpG//4ex322dxQIcwAwubeMPRQjJToB842sGo+BNHqv4bLx1KTn
	jyk6mjJdAM/RDFPN2CIzkmBECdy4wk4A6EN+LhGCeK7J55CmNyctqsk1jSs9aB8O+GS1
	IPSRUwt5MLpj008uSApk4Ux8kGdhhBCNIcDK7ae3IuNdDE0ki7Kizqoukea7j2okcPC3
	xLnByTCBJP149fjCIVLmwEC+nqkSf0YhQGMKyRWWYvvD9xgl90vMQkT8xqCGseL9JVIj
	wzIxyu+lxW9moFOWNpSCaS8LQdbHbSQOSbilDsAEfUVuZIrXdVFZuJo2v/Aph53H3fCT
	w3sg==
X-Gm-Message-State: APjAAAVvAxKom8vkd9MYvy/+osy8q6TxKYvVfPmsuEor+mUg1EZBsL47
	C3FJpnRBh6mClY3ahATAPScnEEU6
X-Google-Smtp-Source: APXvYqxF/l13RdcX7rgwOuBmaqzGWX/QHKuIrqAq3OPwWCvMZnvDD7TvsGyW/BxCwMjZuKks+Tbc5A==
X-Received: by 2002:aca:df44:: with SMTP id w65mr13734593oig.66.1554686553715; 
	Sun, 07 Apr 2019 18:22:33 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	z2sm16258206ota.56.2019.04.07.18.22.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 18:22:33 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 20:21:58 -0500
Message-Id: <9c5bed109a2280a6b4e3544b4dc7ea4e1d651b4e.1554686123.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554686123.git.just.another.mariano@gmail.com>
References: <cover.1554686123.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 4/4] busybox: Use PTEST binary directory
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
X-List-Received-Date: Mon, 08 Apr 2019 01:22:32 -0000
Content-Transfer-Encoding: 8bit

This will generate the symlinks in the ptest binary directory using the
ptest class functionality instead of generating them manually. Because
the ptest class uses update-alternatives to get the metadata for the
symlinks it will respect the use of BUSYBOX_SPLIT_SUID automatically.

[YOCTO #12597]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c9d25ff1ca..174ce5a8c0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -347,24 +347,12 @@ do_install () {
 	fi
 }
 
+PTEST_BINDIR = "1"
+
 do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
 	cp ${B}/.config      ${D}${PTEST_PATH}/
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-
-	mkdir ${D}${PTEST_PATH}/bin
-	if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
-		while read link; do
-			ln -s ${base_bindir}/busybox.suid ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links.suid
-		while read link; do
-			ln -s ${base_bindir}/busybox.nosuid ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links.nosuid
-	else
-		while read link; do
-			ln -s ${base_bindir}/busybox ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links
-	fi
 }
 
 inherit update-alternatives
-- 
2.19.2


