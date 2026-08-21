Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361C2C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:27:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6250.1787315233781818533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FkrEeuLn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D6A14E41319
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0DE6604AA
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6E4711C77088;
	Fri, 21 Aug 2026 14:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787315227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3RQ8tYtG2aGuZhZ48dL6ssBhM+SqDueLNf4FjVy98YI=;
	b=FkrEeuLnAYrE95q3Er6p1MM7w2Ybw8a7KGJK1Qw/b24prmgs7nAzZvaO+bsdwb3VpKnF6O
	573xj3WxxiaN15mfJorJEL5Qq/0RMGRBX2GoCqL/AM81Xh+t+qrdNH6peYPkZLdCZhitlf
	yCZwN5Dl5+k00won2XdrL3e2NggpsJaXAS8yXtPxS8J+FDeOwXukNvSFCKmhUGInlnvc6N
	pEeUNf8xoaotgxsrLQNTc1MoPtWSNcZT5AWP19c4jUUjI7ZWF4uxkyr3yuQ6BaYyJ3WK5L
	CFTO+xDHXQ3dWI/NuhWdTRJCKzRmFvPdFe+VBgihdoHwAaAyRNDc7Nx7Yi++TQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 21 Aug 2026 14:26:33 +0200
Subject: [PATCH 3/3] meta/conf/fragments/yocto/monitor-disk-space.conf: add
 fragment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-sbom-cve-check-fragment-desc-v1-3-e06feb747b07@bootlin.com>
References: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
In-Reply-To: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VgaLB7XmU8AVkBbjNZHwprcg4hFxzDIR5wSexE0W7PE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqiEQLzi3e8nZxeMsqSEaPvRraAbCGAD9b/wHzH
 RZr/W4rG7aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaohECwAKCRDRgEFAKaOo
 NsPnD/sHI/Xakfnu+Xphu0tM3Xxi30hZHpYoiUMerqLVA8PWV/V5wSqz8x7crrpMCvOk8QdQp5D
 xi+ExcvQOU8ZZabP1E7avriG8oEWRoSSJtXp83IPw75ev09ImTHpykE+0ppfHMNt/w1HL5z59/v
 BWbQnMQCfurkn+KhMLpDNLsfI53Lg+tO+qpNT5KoqAIjzbdwS8wWyYF9SmI1BH37DHntiAl8BPO
 4F8dCssVyJFKfvuL9zaQxFM1UMaPk2co8WyOX/jbdqabyuBnQOpQatnXooBOXxkYM3oGeKK2bpF
 Ya8UHO9wsJpiVkYT/EoCNIwxhskkCdAVCDIbrz2C2SXOQXDVNlXFJvUGzWciRlZyvW9JbM1mG3I
 ZqtL9357xOjffvNGg0sxRZgKNydBIJpKAdoidytVjt9YPNuKS//l/9fWrZMKgCswCsYGMUBsuhg
 wbgUcdBiR99h/GnlCiiwZr8qmPC5tmNiLo9NiDBTR0jnstjCYQvbBxbg0PFzh+YBa4tz6e3xoij
 r8yLng8ASnb+EiHc+WUsFYwi+beO4UHMjAXEthkFn/BqYnqdbFRqRamFWMxFYig1VrMZp93rI81
 LVIIA/OEt4p9Uwz+fYx5UKl0foxIV36/NQwOrDLMjMwjfVfper9YQAVNepQ/8CBkPDKhQvJaNFX
 nfHXVmiRBLxgyew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243937

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
index 0000000000..95ff54465f
--- /dev/null
+++ b/meta/conf/fragments/yocto/monitor-disk-space.conf
@@ -0,0 +1,18 @@
+BB_CONF_FRAGMENT_SUMMARY = "Monitor disk space during the build"
+BB_CONF_FRAGMENT_DESCRIPTION = "Monitor the disk space during the build. If \
+there is less that 1GB of space or less than 100K inodes in any key build \
+location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully shutdown the build. If there \
+is less than 100MB or 1K inodes, perform a hard halt of the build. The reason \
+for this is that running completely out of space can corrupt files and damages \
+the build in ways which may not be easily recoverable. It's necessary to monitor \
+/tmp, if there is no space left the build will fail with very exotic errors."
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


