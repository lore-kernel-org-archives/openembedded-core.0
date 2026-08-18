Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C901FC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:10:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15181.1787076625594259554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yHfMTQSc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6995F1A1704
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 18:10:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3931560355;
	Tue, 18 Aug 2026 18:10:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98C4811C74DFD;
	Tue, 18 Aug 2026 20:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787076618; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5MkdzfgmpXh2hAGItbhokcHgx4Ix49aYJmDp8ki8/Mo=;
	b=yHfMTQScNYaV1th3dmrwIydyGYTYR4yTZbJoKfWvCTzzI5YM54wyNxsZ2xgXsgEQPDRt0x
	peBQbpUdlsUSu4a2WiNo3MaI91GgauPZNEljKqzM0Zxpz9cr14PQPP+QJCz4B4qbU9SgE8
	vhxnmEAz7VpVFjWr1QPkDKbN3EQ9GdXeFGiwFRvednwg9vaGPuomc3wOqlHpWzCEq7Qfj5
	jvQJzKxryBU2TeCdFZgVtPf/AWoSuAXdbKhBmYUcYWfvcvIPMGQ3W7T+PF2Hy7PYS0RJP2
	VmZe3MA/pw4uGES71rbdy6DJPNY2Y+jLhRWK8wXF9gsQ2jsAAHeVUIbBTyyKNQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 18 Aug 2026 20:09:54 +0200
Subject: [PATCH] libclc: remove recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-mathieu-libclc-removal-v1-1-692426d0d0ce@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPGfhGoC/x3MTQqAIBBA4avErBvQMomuEi1MpxqwH7QkiO6et
 PwW7z0QKTBF6IoHAiWOvG8ZsizALmabCdllQyUqLVrZ4mrOhelCz6P1FgOtezIeZa2Fco12Sjn
 I8RFo4vsf98P7fglNNzBoAAAA
X-Change-ID: 20260818-mathieu-libclc-removal-13604d56d44d
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787076617; l=2612;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=47KZqBAY7hSYHlZ0aeS60+D1uw6jRit1H7z0QwqOUps=;
 b=DjtUE88oottNkJWFEjtm9AwGrF0V9Ti4V4yRS5miN3wzUrVlvG/wVNS+YMsSKzCSMe0akSzX2
 DLPgC7nRObWBk6OB8kcR9+EWdgwuDWozb8jUQkVq5RhnCKbZJ0JkVyE
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 18:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243689

Mesa and mesa-tools are now depending on mesa-libclc. The libclc recipe
is not used anymore in openembedded-core.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc  |  1 -
 meta/recipes-devtools/clang/libclc_git.bb | 27 ---------------------------
 2 files changed, 28 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ecba7d0db116..0ee4e6d50989 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -327,7 +327,6 @@ RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-libclc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconfig = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
deleted file mode 100644
index 1a73c9eb2a14..000000000000
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Implementation of the library requirements of the OpenCL C programming language."
-HOMEPAGE = "https://libclc.llvm.org"
-SECTION = "devel"
-
-require common-clang.inc
-require common-source.inc
-
-LIC_FILES_CHKSUM = "file://libclc/LICENSE.TXT;md5=7cc795f6cbb2d801d84336b83c8017db"
-
-inherit cmake pkgconfig
-
-# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
-# objects from this recipe are build explicitly using clang for GPU targets.
-# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we need
-# to wrestle CMake to configure without a toolchain.
-DEPENDS += "clang-native spirv-llvm-translator-native"
-
-OECMAKE_SOURCEPATH = "${S}/libclc"
-
-# Semicolon-separated list of targets to build
-LIBCLC_TARGETS ?= "all"
-
-EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
-
-FILES:${PN} += "${datadir}/clc"
-
-BBCLASSEXTEND = "native nativesdk"

---
base-commit: 6f7a806ece411ab32e4b1c08a0299400bdf3b588
change-id: 20260818-mathieu-libclc-removal-13604d56d44d

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


