Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SDJ9E-0005O8-QJ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 19:28:33 +0200
Received: by obbwc20 with SMTP id wc20so1744749obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=xHYkqRuQ6mnjK71HqCARXvU7AhQNCJYDYub8ytnCvpk=;
	b=chxLFbFtCCdQ4Xmlu+FAvRlVk6QZZO693eK3/oJVSDdrh4EKz+FKMP5ANJeJf+GxOa
	W6/Gtf+OfSstWA1Lcr20YQopKa6ze9W++SO6sL4dYAQF1dkfEmV5mND+1KX2ha/QzwFq
	Ol8h5pRRofLsyCo/SGiOS1nduUpd8N0R/hb/eD0Wo3Whs1jXYgoV2xK/d96RADivhapj
	MfHd1DieuEdS0dJYC+Hq35CWlSFGw3ymUQKGnR3TEal0iLfOQgdN5BFJqoyxnNwzySM/
	mCXhTgIp/21oGNO8LSDY5+QKX32VD7Wzk1poclTsZ6S6rYVF4R3nQZQKaVF/yIZZveiq
	b0ag==
Received: by 10.182.141.10 with SMTP id rk10mr44129397obb.48.1333041568911;
	Thu, 29 Mar 2012 10:19:28 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id o9sm6646035obd.21.2012.03.29.10.19.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 10:19:28 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 10:19:28 -0700
Message-Id: <1333041568-29343-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332958352-12828-1-git-send-email-trini@ti.com>
References: <1332958352-12828-1-git-send-email-trini@ti.com>
Subject: [PATCH v3] qemu.inc: Use '+=' for IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 29 Mar 2012 17:28:33 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 10ab76e..66b0caa 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
-IMAGE_FSTYPES ?= "tar.bz2 ext3"
+IMAGE_FSTYPES += "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
 
-- 
1.7.0.4



