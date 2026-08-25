Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07155C61DB4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:56:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16287.1787640973958220533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aNnj/6tY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 585DD1A1811
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26777604C4
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 743BD11C79F17;
	Tue, 25 Aug 2026 08:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787640971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gMwYZzW+M0zrdkcPJsu7VgNPSjumJrYQMyDXpED7fuQ=;
	b=aNnj/6tYUGVv2NuEXeJBkyMQcrAYuQjnWgQwI9cNyPvAiXBFJ2iBnoSmp4idVXanF/lR3+
	sDWppEc962nF9rjdzMW1qryGmH3lQtjXak6pr4cOq8frigUEvLeAvT7+OPtSXzPK1p7Y+q
	xrosntUJ2gCWpksvgshDo/Ws2MI200eKQxBxiXcjOFN9R1Q9G8/BvrMiqVw5fVNyhV/nDW
	folR4aRiTlb+UxgdL1mX0HKwS1m51ywK3lJRPZ3wetUAChaFGjo3U+UWKLHY/eskyyD39+
	eNCRFvj7bVenijfm0rdBfsQqUXKNtRngdKmueWMBHZsCz7cJgen40La/Sbq0Ag==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Aug 2026 08:55:51 +0200
Subject: [PATCH v2 3/3] meta/conf/fragments/yocto/monitor-disk-space.conf:
 add fragment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-sbom-cve-check-fragment-desc-v2-3-01c3823eb780@bootlin.com>
References: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
In-Reply-To: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2u1my/dQhgC5EAfnrl68GybxZjX+aMPajuKhgrtyJdE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqjTx8W5XQoYvxGPqNALFOS6QxFTK8RRQUCCUwA
 maNyxL1qAeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao08fAAKCRDRgEFAKaOo
 NouSD/0Tqdt9HEfw7j3blkugDa3jlro3NeFG8xYs19ue1ehsGGWP8wh/SiO6uK/jHdzrSD/ZD/z
 TGR9NI4+96o6YGEwWqC9hY/ywmjTQ7EFVcOFV7+FcVxuQ9GZG5xJKmKxSDjv3KzRw3cVH9F1LSq
 aEC1kYf3U1nTk1lkoKnfqK7P8/OxBcsU57L8TJdqftjcE8ej+QqOK4z8MHXV0m9ilpfse4/V205
 IUwVJ3KBpsb2LTFAfZ0ck47c7OlFVH39d2HQey2SptLe0CTMe1zaUefhvQ0Nf0gT8wSt/wzzVkw
 GFehFhpBjcS9vuPAjIC7ngaJx402yQMwmASavLv9qasXLqoAMN4cmhdnOfaaHuNCZuz9OnTC80F
 aBaymDYbTLSOSurYBcdtMzQgkBpaKoOHx+cGcNIRkw4z2Lh/1dXExpa2IZgnPV3QJ1dyvWTxnwe
 hdaid1TVq+MXmfMKSWwPVJdvf2V5VyY/a2p9WSwCb93I2XBji6mXfZ3nusEH7LgacR34qOxwOSQ
 mZ3ItDDawkizXlXI/uSQUoeUBd9o2GQnkt4bluKkwaH+18jdR1Le+oLmZoY9J5WA2jeNKUaCvPZ
 ZRYdPsun3WXDLcu6QOPIpLP6pirhww7U0YIXzW8NL21wMdLtfL0uV3zMtYn5KQWrB212mLy57Sg
 jDbA+bxtQIgLmSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244208

Add a "core/yocto/monitor-disk-space" fragment to enable the
functionality previously provided by the default definition of
BB_DISKMON_DIRS in local.conf.sample. As the definition might not be
obvious to set, having a simple way of enabling the feature through a
fragment makes it more approachable.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/fragments/yocto/monitor-disk-space.conf | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/conf/fragments/yocto/monitor-disk-space.conf b/meta/conf/fragments/yocto/monitor-disk-space.conf
new file mode 100644
index 0000000000..1118e6e221
--- /dev/null
+++ b/meta/conf/fragments/yocto/monitor-disk-space.conf
@@ -0,0 +1,18 @@
+BB_CONF_FRAGMENT_SUMMARY = "Monitor disk space during the build"
+BB_CONF_FRAGMENT_DESCRIPTION = "Monitor the disk space during the build. If \
+there is less that 1GB of space or less than 100K inodes in any key build \
+location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully shutdown the build. If there \
+is less than 100MB or 1K inodes, perform a hard halt of the build: running \
+completely out of space can corrupt files and can make unrecoverable damages to \
+the build. It's also necessary to monitor /tmp as otherwise build will fail with \
+exotic errors."
+
+BB_DISKMON_DIRS = "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    STOPTASKS,/tmp,100M,100K \
+    HALT,${TMPDIR},100M,1K \
+    HALT,${DL_DIR},100M,1K \
+    HALT,${SSTATE_DIR},100M,1K \
+    HALT,/tmp,10M,1K"

-- 
2.55.0


