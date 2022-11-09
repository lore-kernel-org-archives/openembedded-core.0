Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B193FC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1440.1668022304009107542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A02261FB;
	Wed,  9 Nov 2022 11:31:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07B6F3F703;
	Wed,  9 Nov 2022 11:31:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 01/15] oeqa/qemurunner: update exception class for QMP API changes
Date: Wed,  9 Nov 2022 19:31:21 +0000
Message-Id: <20221109193135.291048-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173034

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
index 6a85f57e498..e602399232b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -354,7 +354,7 @@ class QemuRunner:
             except OSError as msg:
                 self.logger.warning("Failed to connect qemu monitor sock=
et: %s File: %s" % (msg, msg.filename))
                 return False
-            except qmp.QMPConnectError as msg:
+            except qmp.legacy.QMPError as msg:
                 self.logger.warning("Failed to communicate with qemu mon=
itor: %s" % (msg))
                 return False
         finally:
--=20
2.34.1


