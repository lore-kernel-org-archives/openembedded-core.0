Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5C80D606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 10:09:19 +0000 (UTC)
Received: by wichy4 with SMTP id hy4so41972696wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=O5nKvoURgPv+HqSjRV8+TK/iE0hl7e3FvGGCLhVc02w=;
	b=GMq0VOLkqOb+urBEtH8594iCfU39ykLwLxYJrWZB6PB1RlNuCVbHLns+WNgQmiUzNS
	HjVg4OSpXQ+2f+sb8N/1Tz8b5R1fN1E4QnkEds0lnSh/hQCXrS990qgSuwyHoQdRydXH
	IKvCbuxpAf/cLQkT3rPRwMEbHhfE3dgxGmI0anXvpQ6CQqSV/epvsz1QLs9sGxeX3Gnh
	joRu+YKbZ/JFp+kExAIQnmNRSb9sJhx6n/07cee1yIoU12bMufGyE34d60esrcAAPiql
	QnuWkA1xsXdhrzxYZ4uIirwP3MB7NgG46U++tu5xPaCl9b6QnNrnxrinV8tEGkqfQvMr
	LB1A==
X-Received: by 10.180.102.74 with SMTP id fm10mr6038118wib.25.1432289360934;
	Fri, 22 May 2015 03:09:20 -0700 (PDT)
Received: from X220.tupi.fr ([37.164.121.82]) by mx.google.com with ESMTPSA id
	ef10sm2384815wjd.49.2015.05.22.03.09.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 03:09:20 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:09:08 +0200
Message-Id: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
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
X-List-Received-Date: Fri, 22 May 2015 10:09:20 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 1c34d5c..06cb1b4 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 
 PR = "r5"
 
-SERIAL_CONSOLE ?= "115200 ttyS0"
-
 SRC_URI = "file://serial-getty@.service"
 
 do_install() {
-- 
1.7.10.4


