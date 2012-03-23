Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SB8XM-00015p-Ip
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:44:28 +0100
Received: by ghbz2 with SMTP id z2so2963289ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=N7eAyPU2whI+nXrMsyBGgbUo+1gH+JHp+A1KNQhcteY=;
	b=uwBPccGZ1yHsQcaXmRk/tpkTMLo2ZuRztS9fDpl896NKgzOq08Bm61efQwnGfn4et0
	wNHo8F3tLKK8hu8j65Li2jbH9w3qVzLdgGjkHnbB5QOvVT8E7w6+rE+BgPs8kUZVk7V8
	gSU9dEWkw3L0fwnofiLmn/GJD2m/TSqe5pBTs1e/xERqolBdUefSLYm7tkoqcI0sGPXA
	4jC599Oy7H6TiGAONsK2GyJEWg4U3/qvXm7hURVjxOA/6ZUCIaA/3Dpln0BN6wGinM8U
	7+dOuJ7ffiUVYRN4lH+Y24CeqmP183QMQgtrHNxyQX+R6xNiGvE6O3C80Rj+SmXcwRg3
	8s+w==
Received: by 10.60.22.10 with SMTP id z10mr16469323oee.16.1332524131927;
	Fri, 23 Mar 2012 10:35:31 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id 8sm8305190obv.19.2012.03.23.10.35.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:35:31 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 10:35:32 -0700
Message-Id: <1332524132-24689-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 17:44:28 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
a machine conf file should use '=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 10ab76e..b613287 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
-IMAGE_FSTYPES ?= "tar.bz2 ext3"
+IMAGE_FSTYPES = "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
 
-- 
1.7.0.4



