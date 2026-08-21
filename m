Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D413C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:23:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2956.1787300600808938289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xEJSNVog;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E7044E4130C
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:23:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A760604AA
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:23:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F2C411C76D2F;
	Fri, 21 Aug 2026 10:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787300594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=c/ArvUnIvzW3Sgr7PMjGzdO0eQoAm1MNPmuc3oh5w78=;
	b=xEJSNVogHQcgz4qDocEJeIgHyXUdAVwVq4GqKgDaGJAgp+lxqYmhlUXZ6hlL9jIVM3hkpq
	RThrqOfa3S2PdQrKcl/aA7IWtMstQ1RRNgRUVUuCHJzBgxJaQDSFe8k0axIAaErv9Bo9oU
	HrCc1ksJ74t5V/X+8759TrIz2iU3TdQNGlVwTi1LPsssnVFTOd6tF1XdnXarIUqOmys3Tn
	irbCyJF+UqrRhbg6W9RO5Trd4+0j64oKZEq9ip9NQRCgWL7uPYdbsohfHWx2LmS8vaKrfF
	9gLDz4kN3xnK9B3ExKJ5hZCowiWPpMNg8x4lSqLt63VDiIJUSyefKqaJ5tti6w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 21 Aug 2026 10:22:56 +0200
Subject: [PATCH] python3-sphinx-argparse: update 0.6.0 -> 0.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-update-sphinx-argparse-v1-1-d92cd79b947c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz1giGWjUqyAGQwy4QxrZgJAQd
 28K4xv+P8FYhQ3e1QnKu5h8U4GrKxgXSjOjxGLwjW+b4B1uOdLKaHmRdCDpnEmNMQ4+TqF1RK8
 AJc7Kkxz3uOsf2zZ8eFz/N7iuH9endT16AAAA
X-Change-ID: 20260821-update-sphinx-argparse-db2df861aa78
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JHAn29e1xF7ZVWfq6DD8G0vswbiS+Nbr1VGubU0SVpI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqiArwqPYhm0dzQICMV5/jhCzdIR+0gp0pTPpqx
 xcU9YMP58uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaogK8AAKCRDRgEFAKaOo
 NrO9EACD+OTD13MEW0DLrIRo/oeNRYnJPcTrsSM20EIP28o5fpYMgxLM7CqFmIYXBuV7FrTuuY1
 ACbUCVz3mX0LsishPJkanaHD/TLmyeM1kMI6EJFOKSZCtR85RV9URkwA0Gk3nzkdOopqeUBNFRY
 yk1NzxqKTESsUmJdoaB/wqtc2t8vVjFaClrqsHNe3nHuPe3a5bVOHnswB+P2dkT2pF37YuynfYg
 nA6FbmVM1y+ONhxbRNZFu3EKYodlZ9vynAjvV9Mz6wRlHK7fQ3QHcLkuNzvcIG5Lp+ijn0gdsUF
 ZIcMGoHSv5/fXgXZ4gfG9jPD+X4FOyiU0DhTsqqT+22z82LProvmB0Rd3uI79l0gApa+mJLMe7u
 8orIB8s721yLjIMUCG6MPxxJ73nXYQm45WeE3C9xwYmbdmP9zuesiuibYRnwWgLwNW46/f7GDC1
 mmgl2JJRrt9U1/+q/CVq3iQfc1qGZ6si3uL+ry/c455L++SBOL+JHGakS4n0MWO7QcII5ANaZGJ
 cyXuYWx/3OzT7dnKz5KheQusrUo2miaAyJNRQauFw/MRjvY17Dr+46VY1QXwI8YimgFkdYP6Op2
 RVPvMauTAR8pL/vfhzpMm1Ay9O6wPTnsGhuKYeZZR7aM0OHofbN6HRy7ML5UWpiLOe55Dae5+H1
 4kyiSLSf6jeShsQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243899

Changelog:
- Add missing domain methods by BrennanGit in #99

See https://github.com/sphinx-doc/sphinx-argparse/releases/tag/v0.6.1.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 ...ython3-sphinx-argparse_0.6.0.bb => python3-sphinx-argparse_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
index 3e672148c0..a60efa0fcc 100644
--- a/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sphinx-argparse.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5c1cd8f13774629fee215681e66a1056"
 
-SRC_URI[sha256sum] = "d072bb67dd52b294375f0eedc203cb8e50d0329910dbceb6764e9386bff94e9d"
+SRC_URI[sha256sum] = "f8be167aedf5670bd7c812ef515968ff4717c63cfc9cb4df5f34b54fd5649c37"
 
 PYPI_PACKAGE = "sphinx_argparse"
 

---
base-commit: 7944665886cb0bf881807a5d849ebdf42a33d1bf
change-id: 20260821-update-sphinx-argparse-db2df861aa78


