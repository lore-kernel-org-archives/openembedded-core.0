Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DC49576420
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:30 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so3831818ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iNyDJKVnmGlEPjrRMGvbqLSyGwxFZ3Mnc0842MIUgHE=;
	b=Uin18uK6oghRl2WE4jaSzR/OfpDAnnY7nMY0e0oSdJD2frCb9pWJdKdzvbEW8QQYgt
	bN4jwa+d+NtYC8KlRAr3AHJgdEF8OkDtOk0I/jQFcBR4ITuN/QaZjV9ZQNKmZ9xfpnUq
	OFuWjYaowX1D17UQS1mH+PYHdVWHkMwSmTEfD3vin9gOSBWyNtTrPRZyswCkUXlsCcpJ
	fxhuMCydNAVrjS8Befn2gxmN9wiYbpoErT/PZA9aDhSVOB6T7hxGAdrjd4PDFtSU99Ol
	84xlfPUusaVXqZwHhuUDAShJczgnLmxN4F2PuapuG0zEEg9i5ExOyOOSvgsfmOLHqY40
	wZLw==
X-Received: by 10.107.15.226 with SMTP id 95mr54937963iop.44.1438125690781;
	Tue, 28 Jul 2015 16:21:30 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:21:00 -0700
Message-Id: <1438125665-14966-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/8] busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:31 -0000

CONFIG_FEATURE_VI_OPTIMIZE_CURSOR is obsolete and removed
from busybox v1.21.0 onwards:

  http://git.busybox.net/busybox/commit/?id=04b52892ed5d9d8a4cf5d887c221a8b50c71274e

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 6535755..4b8a51b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -384,7 +384,6 @@ CONFIG_FEATURE_VI_USE_SIGNALS=y
 # CONFIG_FEATURE_VI_SET is not set
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 # CONFIG_FEATURE_VI_ASK_TERMINAL is not set
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
-- 
1.9.1


