Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGSwQ-0007ie-Ik
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 13:04:38 +0200
Received: by wibhn17 with SMTP id hn17so5117111wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eOuH5l734Dr+YgAywOVZKDn2OPdPicwjJ/IBdMOcyaU=;
	b=twK8adtpUTBGe2+2JM1AC7NZrnDxU7/vzufrAIIeUg2PUZu9Q+rtzj5XGWWcMjxu+Y
	2YmFzl9jInUcfq6ojmePAVwqs5xb0GoWlqvLNbO12Aq943DKuIsJpnktx9cHSGEnVFuA
	NJXyVj3fYFwv8tqs3RSj6cu15qUMkwrvV9waW/CrxKBJjWOohDxYtb7mq9Im9Z/4I+Qq
	AEtx/fDQOj4NJEuGgQyrmfGQmgQD7aGetv2j6ddYirlMsD4YBEDCoky0hr8WW5tC2bOl
	Z0TT/gf9KlGahKQcw+wuzY6Gy3E7h8uTLa+M3NOcm9gqr++qyJ5gqNHFu2ECkFY1E1et
	LrGQ==
Received: by 10.216.241.198 with SMTP id g48mr9587924wer.156.1348570309661;
	Tue, 25 Sep 2012 03:51:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm22241277wib.0.2012.09.25.03.51.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 03:51:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 12:51:53 +0200
Message-Id: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [RFC][PATCH] linux-yocto: drop machine from SRCREV_FORMAT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 11:04:38 -0000

* otherwise LOCALCOUNT is incremented after each MACHINE switch when 
  machine usually has different SRCREV (e.g. because of different KBRANCH)
* see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029392.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 973970d..6efb578 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE ?= "standard"
 # KMETA ?= ""
 KBRANCH ?= "master"
 KMACHINE ?= "${MACHINE}"
-SRCREV_FORMAT ?= "meta_machine" 
+SRCREV_FORMAT ?= "meta" 
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-- 
1.7.12



