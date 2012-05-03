Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzm3-0002kJ-L3
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:25:03 +0200
Received: by wibhj13 with SMTP id hj13so457848wib.12
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5AGVIlp9NZIs6zC5cPOhZZ8r+hh7MuKF5oddOs00FTY=;
	b=CktHIyZQPRe6q9sJJ5kI5iRzZv/Risqh01VsEBjqjhjqOluafkMHyZSFGvVqbQNqzI
	1BllE+TVQPZvSbWAru/68859pmkFt9b1e/yEWDyQaQyZy6ESY4Y8qRNlL/+Gs8yP2uJx
	McK8BZU37OXna5F0pPsuOHqxS0ylx8yf+RBz9dVDNSzrge2wajfQo+Gjo+SByYO01CHu
	11+vaoe9wl4M2maEBHP5IVTv3DEsxuD+/v+VLLROUQ5xINI+MxlRu2vSu+LLb2c0bpVF
	wjw0nf+UfwI5tdTjUXdPfoYbjsElRaMcNdCLnH/x+hwj9F+C2MiZJ4UwAj1NjYUKy5Dv
	x90Q==
Received: by 10.180.104.230 with SMTP id gh6mr5100431wib.22.1336065318162;
	Thu, 03 May 2012 10:15:18 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id gd4sm5064906wib.6.2012.05.03.10.15.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:15:17 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzca-0002F4-RG; Thu, 03 May 2012 19:15:16 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Thu,  3 May 2012 19:15:13 +0200
Message-Id: <1336065314-8588-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Cc: openembedded-core@openembedded.org
Subject: [meta-micro][PATCH 1/2] busybox: mdev was removed
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
X-List-Received-Date: Thu, 03 May 2012 17:25:03 -0000

bea936913fcf684c23d36f740050dea118d5caad removed mdev, so rm now unused
file, too.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/files/mdev |    9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 recipes/busybox/files/mdev

diff --git a/recipes/busybox/files/mdev b/recipes/busybox/files/mdev
deleted file mode 100644
index 14ba837..0000000
--- a/recipes/busybox/files/mdev
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-mount proc /proc -t proc
-mount sys /sys -t sysfs
-mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
-mkdir /dev/pts /dev/shm
-mount -t devpts devpts /dev/pts
-echo "/sbin/mdev" > /proc/sys/kernel/hotplug
-mdev -s
-- 
1.7.10



