Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCA2C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 15:09:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.202961.1698332984314756909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 08:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eLWatGkJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A2521BF211;
	Thu, 26 Oct 2023 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698332982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oVkjXOQtPamMKmv0kbK4eV1MvQUanDxRVMZexeH1QMg=;
	b=eLWatGkJCfFpqfamoBk/JvjekjpyjhPFUXnOwGV8GJnpELMRNaExe6harAe/O5QoWC7Ovn
	5GPNzaw7SX1Jo6121t5O/ClNZlAXaezxq51/3Hyh4e+ZsJVgpO9ZsGoIz0u2JfrFbFvXdW
	Bg9BIjpasttw0hC86hv4Wj2QCS3vDmmAQl0xqz6NOZi254qulZNrby4oXIn6ZYBvAhXK83
	illlpGZBoByiuh/cBfs4wpXYfS452DhPQjPVUaT+jIBi2g8gPXeuO9uzxOwTmFXr4HMU1X
	cNH/z/BZtC0AUSTxMcuxIzgqg4w9ix27NTA4YCJ0ojfjQRhGX8dSA8Mzvdtbfg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] oeqa/runtime/cases/parselogs: remove "edgerouter" case
Date: Thu, 26 Oct 2023 17:09:35 +0200
Message-Id: <20231026150935.1947758-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 15:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189732

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The "edgerouter" machine has been removed since
https://git.yoctoproject.org/poky/commit/?id=0c64d0e4317e3749f7f7ed9ecd5d08bbb0cedc9e

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index a805edd79d..cddb846bdf 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -180,12 +180,6 @@ ignore_errors = {
         'Failed to load DMC firmware',
         'The driver is built-in, so to load the firmware you need to',
         ] + x86_common,
-    'edgerouter' : [
-        'not creating \'/sys/firmware/fdt\'',
-        'Failed to find cpu0 device node',
-        'Fatal server error:',
-        'Server terminated with error',
-        ] + common_errors,
     'beaglebone-yocto' : [
         'Direct firmware load for regulatory.db',
         'failed to load regulatory.db',
-- 
2.34.1


