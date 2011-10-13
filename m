Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REKsq-0006T7-DX
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 14:59:36 +0200
Received: by bkat8 with SMTP id t8so529288bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Lss031CYNKWd6o2uDoMu4azRQ1bHVmk49ylq3zCSTK8=;
	b=hmjdMNdU5rZ/NCikIWnaJYD22sZUnXqdLtZglutxznOoI7rj9wKN2s6jV6a7GzBVIT
	A7Aun5gI2j7/Cf271R/zJ93I5uBRGE51i11BEa27UUwFMqvhbuyCx+q3IhysuOKU2Icj
	ZoaDAyyl/ouF9UrBIenMEVGXD/nbEb9sWKxdE=
Received: by 10.204.140.78 with SMTP id h14mr2733559bku.29.1318510430837;
	Thu, 13 Oct 2011 05:53:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm3582635bka.0.2011.10.13.05.53.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 05:53:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 14:53:41 +0200
Message-Id: <1318510421-9351-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] xf86-video-intel_2.16.0: fix buildfix.patch to apply
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
X-List-Received-Date: Thu, 13 Oct 2011 12:59:36 -0000

---
 .../xorg-driver/xf86-video-intel/buildfix.patch    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
index 3f961c8..ea5ce79 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
@@ -6,10 +6,10 @@ RP 2011/10/12
 
 Upstream Status: Superceeded
 
-Index: src/intel.h
+Index: xf86-video-intel-2.16.0/src/intel.h
 ===================================================================
---- src.orig/intel.h	2011-10-12 20:36:18.587187994 +0100
-+++ src/intel.h	2011-10-12 20:36:30.717188011 +0100
+--- xf86-video-intel-2.16.0.orig/src/intel.h	2011-10-12 20:36:18.587187994 +0100
++++ xf86-video-intel-2.16.0/src/intel.h	2011-10-12 20:36:30.717188011 +0100
 @@ -65,9 +65,7 @@
  #include <pciaccess.h>
  
-- 
1.7.7



