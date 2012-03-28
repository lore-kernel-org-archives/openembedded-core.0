Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCxV4-00081J-5r
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 20:21:38 +0200
Received: by obbwc20 with SMTP id wc20so117086obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=t/MlyJbqvhxdEassBsC9IjRvxyQc/XKw8n8onMznoDc=;
	b=q0c7SXS8Y8kWXS0m9CbrSJq9AalpNzZA5MHc9P1Rm6HqO8xpHF48BC+2jptButvkcS
	mjzp4iJ2jDlRkL9xdLGQ9lOwXkBeHSfGpkMsn21YvGgOKp/Y5ikCFPX6idkyOEGMZRzd
	PDSEe2Vk48oD2QXw3gBqvUqjbd8JSIvMuTRz5IA4DL1NBi9UxkP3NwbeI3I4h6NGc0wt
	UoTSW2qojHN2Sfxj6tW1P1aX+y9kxVEhGPscrtJARmuCBjwBpUITbBmEhPZLMupzyFoz
	5MnM4CHhIs3f3knw/Ss1YrAwDKE5K2lAwRfiLOQhOp1YKUZLCVhp4IrvsSi9REcq27Ts
	DtzA==
Received: by 10.182.119.71 with SMTP id ks7mr40166719obb.9.1332958355142;
	Wed, 28 Mar 2012 11:12:35 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id vp14sm2946630oeb.5.2012.03.28.11.12.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:12:34 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 11:12:32 -0700
Message-Id: <1332958352-12828-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] qemu.inc: Use '=+' for IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:21:38 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 10ab76e..a34477c 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
-IMAGE_FSTYPES ?= "tar.bz2 ext3"
+IMAGE_FSTYPES =+ "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
 
-- 
1.7.0.4



