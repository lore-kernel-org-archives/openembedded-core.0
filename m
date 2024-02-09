Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C683C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:19:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.14335.1707491936654168187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=T1h2NgJy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3E8A60004;
	Fri,  9 Feb 2024 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707491934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ff4CuSGSUXXDf4xWTiwxs2dJ8nK3cwvRi4BE5LJ7tDM=;
	b=T1h2NgJynFYJOfvoBvEvlan0c6AoGTMX8ZFT7tLF9nZZQkpBx3BDGf69d2HLe+2z53UaW3
	Yd+zMvQlwe4VmmSXJNOk2a6kC21fOgOnLQbyJ6JWIn6gs0J84QGAqtPCRUxadXT1pTzG0d
	FtRU+XqA8Y9AN17iFshgOcQU/WfIUmgCmEbCM2+f3vmSKsHpZEWg0syefbsA2G7JZmO8UL
	65FSbhcT2A2Ve1qHcBX+mLaY4iziNsts1/T0tjh8A15NDUdZDx97P+PQtFtZvlj9zFfFdJ
	v/tDxlGIPRQOVptcsWyxjW1q6Zf73riK2VqubzDox8icHaTI0SI0JsohyZL9XQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] oeqa/runtime/cases: fix typo in information message
Date: Fri,  9 Feb 2024 16:18:47 +0100
Message-Id: <20240209151847.25446-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195227

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py    | 2 +-
 meta/lib/oeqa/runtime/cases/skeletoninit.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index cad0c88d26..adb876160d 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -116,7 +116,7 @@ class SyslogTestConfig(OERuntimeTestCase):
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
     @OEHasPackage(["busybox-syslog"])
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
-                   'Not appropiate for systemd image')
+                   'Not appropriate for systemd image')
     def test_syslog_startup_config(self):
         cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
         self.target.run(cmd)
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index 75951beda9..d0fdcbded9 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -17,7 +17,7 @@ class SkeletonBasicTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['service'])
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
-                   'Not appropiate for systemd image')
+                   'Not appropriate for systemd image')
     def test_skeleton_availability(self):
         status, output = self.target.run('ls /etc/init.d/skeleton')
         msg = 'skeleton init script not found. Output:\n%s' % output
-- 
2.34.1


