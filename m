Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4C77724B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:17:16 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so27405587qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=qdyYz/NYaHGNNvWNXJ6D54chN5CbuZBIWHsPnXltZE0=;
	b=07QyVrm/fOEt9958fXb/W+um30NPuijnu7P7GkP6DEvxTf478oRUDa/bzVv0Ivy6jW
	hNwQamErcrN679yFNwfpSM7z21kk9WLIBG3Bg30XaLkC0euY63T1dMFH+krlzL35/Tjd
	zN/lE9YN2QxHzTcCEA24kT5BxEW6AZSTQYM/ecPbMSIuH9RKZiJfQ0eAHtaAJ1gnOmAi
	xrsisc/BTIcwhJ5FFitKSK5bgIs9o8TVn4fS9QLdMlgSF3odX7GTi0b9jut3Nb0kI18w
	7cfdSGFmaC8E5Cy9KTt/mWvOIrY4M/ttKifB//OuGDBtvEV7B/ifH1SmOEJlSSZ5cXYz
	6NBQ==
X-Received: by 10.55.49.197 with SMTP id x188mr18622794qkx.45.1447359437165;
	Thu, 12 Nov 2015 12:17:17 -0800 (PST)
Received: from mario.lab.ossystems.com.br ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id m8sm4491564qki.3.2015.11.12.12.17.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 12:17:16 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 18:16:55 -0200
Message-Id: <1447359415-7526-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] linux-yocto-custom: reference the kernel-yocto class (not linux-yocto)
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
X-List-Received-Date: Thu, 12 Nov 2015 20:17:17 -0000

The comment that describes the recipe references the linux-yocto
class, which doesn't exist.  The kernel-yocto class is actually used
by linux-yocto.inc, which the recipe requires.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 6194d4f..6eee42c 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -1,6 +1,6 @@
 # linux-yocto-custom.bb:
 #
-#   An example kernel recipe that uses the linux-yocto and oe-core
+#   An example kernel recipe that uses the kernel-yocto and oe-core
 #   kernel classes to apply a subset of yocto kernel management to git
 #   managed kernel repositories.
 #
-- 
2.1.4


