Return-Path: <earwigz32@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98A3B606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 01:47:47 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m18so1420843pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tENbm+jZBEFff6XTckCIR3SEvxOo2/hUTaKQvHFhO+0=;
	b=NN5IWEMJOsQAjhOFGjOaYEKwc1ryEodYmbM3KiC4YQewM9Cj5VNuHbzERonB0BORWP
	t2N7Hiov6/WF445jQ90S/446TOyrtXD9nRxxFQBIdiqLiJ0hkiThKCiXA6FKHrLhUkFn
	gXDN8f4Tm+IuwYgWuoUaVVZyM4YHGRUJgvkwPGVbXf3XexS6NL0mzSXWbk3wbWnUis0R
	DeQ3BDMmDC0zjknsUrKPTaq2LHhZMZpa7mvTQE020l+jCPBdvsoXuvD1xjZI7ld67p5q
	6sxvC484zxfI4FxX3hc9XoCDY8p99nicBJlffq2ZoxLwAcd9wFvAoouxRbue0LxiAPM1
	3NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tENbm+jZBEFff6XTckCIR3SEvxOo2/hUTaKQvHFhO+0=;
	b=nYBRDAyyxnbZUYpwYcurCCNnbNKbL0sxfXEcR6SBjEhMPCYOv0WfCHnkms/lIe9TWe
	uWN5oXoKvyHiDLXXTyskkaYd5es0ntkwAVH4wuDjaZT/8MiGWPfvPv8DCBCom0KTGJtS
	bxKYA7SgaQCKZvY65z596Uh6XWec7T7ImFVjzT3RDv52KwB5zV+KuMbOYWU46sknTGMO
	kqjiuksiwhgmisgbsOt1XNV+NIsLU3BN2mURsAHfKuejNquiB7+mPaTED0CTO3mXSJqi
	yRA60jPpfSLiqZxc+rNtHN/kPWRo5A0FiS2/VRmEu8t6SyjnCuo5BX2xnMezVMmSGbPJ
	WYsA==
X-Gm-Message-State: AMCzsaVxUyaX/gu2OCkv4DNDi5tYAaA+XRuNe92GPIsi86FDhfz7+y3n
	agV6g5KRFCX7+8REwz4QPF3xRg==
X-Google-Smtp-Source: ABhQp+RnN8GgV78CxJrcbfZGUVlkTVRdyso7XHkJpvjlPrM8XVKaBUmh4QsRbRBnC1ZoL1/FqdC24w==
X-Received: by 10.101.78.210 with SMTP id w18mr3527736pgq.337.1508982468384;
	Wed, 25 Oct 2017 18:47:48 -0700 (PDT)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id
	a19sm7069169pfh.30.2017.10.25.18.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Oct 2017 18:47:47 -0700 (PDT)
From: youngseokyoon <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 10:46:02 +0900
Message-Id: <1508982362-9443-1-git-send-email-earwigz32@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libpng: Upgrade 1.6.31 -> 1.6.32
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
X-List-Received-Date: Thu, 26 Oct 2017 01:47:47 -0000

From: youngseok <earwigz32@gmail.com>

Fixed a bug that leaked memory from the png_handle_eXIf pointer.
License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseok <earwigz32@gmail.com>
---
 .../libpng/{libpng_1.6.31.bb => libpng_1.6.32.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.31.bb => libpng_1.6.32.bb} (72%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb b/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
similarity index 72%
rename from meta/recipes-multimedia/libpng/libpng_1.6.31.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.32.bb
index c96ea14..d93e72c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
@@ -2,15 +2,15 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f21e4e1f795810b5ea491b333bc6ea1 \
-                    file://png.h;endline=144;md5=af300c419a45c53a8d2daa0b7d167a66"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=53f2df0e62ce82307cd1389a9f41e4cf \
+                    file://png.h;endline=144;md5=591cf1f8d84a757af46e43c2b9b5ddd9"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "1b34eab440263e32cfa39d19413fad54"
-SRC_URI[sha256sum] = "232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41"
+SRC_URI[md5sum] = "e01be057a9369183c959b793a685ad15"
+SRC_URI[sha256sum] = "c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.7.4


