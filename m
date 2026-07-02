Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3383BC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 07:01:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64066.1782975699374593494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 00:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SaJ+CWRq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E2FDB4E40C20
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 07:01:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B71C25FF03
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 07:01:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D78A3104C962E;
	Thu,  2 Jul 2026 09:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782975696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SNGFyqrq2QW4JL6VVlkF8dTKD6JrIkfVnJd96yoyVBQ=;
	b=SaJ+CWRqoRbHmX5DNd26WkEnjbdDH6z68EDMoUeSCrQet+2aOlD2npao5ktpUuSQFSNiDK
	jDZY5sESI/cqvo3jMqx4OonXV/jblpusD2f8A2KhbdzBI1RGX3VQyRI47Ux6pm4JwBY14Z
	aefDAbSSMTLVx0DXYk+4WUtNrcq48+AAvGBpLWcid/0NvZwUr3QeEn9qQh8Z10qZJPJerO
	SpYA3Vx7HDmEgXYFjAAOKVIJVjPj0LRwl6CLHHdItwwyZSzc4GBOALwiE+r2mtzGBTvFR9
	0T8gKmLDajUuvPPSeRBZ/wA7xQU5rkN9yg6f3Uq4t0eECv1lyrKuG2X6mAJfEg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Jul 2026 09:00:49 +0200
Subject: [PATCH] python3-sphinx-argparse: update 0.5.2 -> 0.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-sphinx-argparse-0-6-0-v1-1-8ea69a870ea3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAyF4asgz1hKUgkKV6kYDDXgDiGyS4WEu
 DuhDG/4hvfvYKzCBm2xg/JPTJaY4csChpnixCjvbAguVK52AS3NEjcknRKpMTqs8h5N458+jEz
 UQ/4m5VG2f/fV3ba1//DwvWJwHCcWw/7YeQAAAA==
X-Change-ID: 20260702-sphinx-argparse-0-6-0-3991812feaab
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qFNSav83F71r6wquLdaHikmc0StiCwhxCOwk9Cw+RlE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqRgzPJ97vnPRVpvI+GlkQVG4yKhu2OKedz6oJ8
 Qo2/lQMbYuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakYMzwAKCRDRgEFAKaOo
 NnkPEACXEUm0dv1/YIW4dDgmKn86FUA8sK9FdR15NxwfKctPhizevvrd52xJWtoHCIIxXoi4WHh
 E/KqWgchJYngnssXfLQl61g3Ng1Qc+ODnOyu55RdF+q16mbUM63QoWoAXkKCTYL7kzjJ5pJTpGm
 FtwU9u7bdi0mMppIfNRr6jutJct3T9QnrLVkt8itoxoJe9rs8JZwMGG8W478Ga6mZ+YwFtuvpbr
 WaQCFZCKd4Dyp8xBs+mrosnP55JzhkexMd+O7I1jxbyCfZaHKXBDG514f5mcUh5dIIQKH3bu+eT
 ZW3mAakkA/8/Flkrb2wDvMhZ1+YFgSvrJrny+mCEf2IG+D4tTbGkhJwlebHgI6UV1Yy8TeiEfRF
 SBpYq2/SKJ2fSn6rQAJL3cxj9Y85mgC/8J/YBc+R/Ici0JrWDhjg1/eC2r3byVIbyBkrBcf90Gf
 3JBxzrtJ9iGSR8jLvuzGqn1/TTyT3EFz5LI/6/QFptunSqdFqb8pz9TK9nEuvVKuDbz9pDX70Uh
 5EO0ZIpV4a1fb6tlKAtngHwLKPhOnZl0gZZSo2yJmEuK2ax2LBc6IXRVXcjph3Z0HaE1nKe4E/J
 dDoXBSb383uBSfcwN/86q7fGASq8LPwR4kLSUzJhp9eUQmYakIdbDskPQJ32JPIWrq6oIKWlm/W
 30JVSd4YoR4e1Dw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 07:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240020

Changelog:

- Added default feature to disable ArgumentParser coloring
- Trying to fix RTD refusing to build
- Moved color-disabling into parse_parser to fix subparsers
- Unpinned ruff for CI + Cleaned up workflow files a little
- Updated license metadata
- Changed filename field to be explicit
- Fixed MyPy
- Added try-catch for autodoc mock-import

License file was renamed but its content unchanged.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 ...hon3-sphinx-argparse_0.5.2.bb => python3-sphinx-argparse_0.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
similarity index 64%
rename from meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
rename to meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
index 9299a862f7..3e672148c0 100644
--- a/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A sphinx extension that automatically documents argparse commands and options"
 HOMEPAGE = "https://sphinx-argparse.readthedocs.io/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=5c1cd8f13774629fee215681e66a1056"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5c1cd8f13774629fee215681e66a1056"
 
-SRC_URI[sha256sum] = "e5352f8fa894b6fb6fda0498ba28a9f8d435971ef4bbc1a6c9c6414e7644f032"
+SRC_URI[sha256sum] = "d072bb67dd52b294375f0eedc203cb8e50d0329910dbceb6764e9386bff94e9d"
 
 PYPI_PACKAGE = "sphinx_argparse"
 

---
base-commit: 9780e392300549f69e11e2f3bcb9bff77b21d572
change-id: 20260702-sphinx-argparse-0-6-0-3991812feaab


