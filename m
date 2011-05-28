Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ9ZS-00047J-Pe
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 04:48:10 +0200
Received: by pxj25 with SMTP id 25so407936pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 19:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=36N8dKJ03/N/e/rv5xz4uMLejxjji5NHgNvH5VxHxaE=;
	b=b3jXh9rtJm3sPOcctat1U8L9r7H8K2k7hqhcnju1gSg1nOUpK2K3tPR3nATjj4Xidn
	D2CTc2dGVkTm4p7vfMqa6iVj03+n/IW9prj5Xha9I9UeWVj2aNYUS95fnxT15Zs59DsF
	8/FBKZYHHvG9D+JhhknQjqgYaJhZ0itip6sK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ghEpF9MCsECZACnPLlRrmiYQ4jfwbf6KYZ5iaUjbqOGitBYeaoPorM6aMLVUxCHUjU
	YHcliqOl+Icgvl4zdnRoR+/C7FIZtDJBM77jzvGezA6N6TA94mZJGZC/bc0r8h8Rzm2H
	6F5Mmf1DuEx/8GGn2bjpU8m289cHVm6UZauH0=
Received: by 10.68.51.196 with SMTP id m4mr1118412pbo.465.1306550703690;
	Fri, 27 May 2011 19:45:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g1sm378591pbj.19.2011.05.27.19.45.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 19:45:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 19:44:56 -0700
Message-Id: <59c5261bea00cac9498a176d40e1aaa05da15a55.1306550616.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1306550616.git.raj.khem@gmail.com>
References: <cover.1306550616.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all ARM configurations
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
X-List-Received-Date: Sat, 28 May 2011 02:48:11 -0000

This entry need to exist so that it can be manipulated later
to decide if uclibc is to be compiled in thumb mode or arm mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/arm/uClibc.machine           |    1 +
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |    1 +
 .../uclibc/uclibc-git/nslu2be/uClibc.machine       |    1 +
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
index 293f384..92ee868 100644
--- a/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
@@ -33,6 +33,7 @@ TARGET_ARCH="arm"
 FORCE_OPTIONS_FOR_ARCH=y
 # CONFIG_ARM_OABI is not set
 CONFIG_ARM_EABI=y
+# COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
 CONFIG_GENERIC_ARM=y
 # CONFIG_ARM610 is not set
diff --git a/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
index eb76f34..b012a38 100644
--- a/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
@@ -36,6 +36,7 @@ TARGET_ARCH="arm"
 FORCE_OPTIONS_FOR_ARCH=y
 # CONFIG_ARM_OABI is not set
 CONFIG_ARM_EABI=y
+# COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
 CONFIG_GENERIC_ARM=y
 # CONFIG_ARM610 is not set
diff --git a/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
index f5aa134..6b07dd5 100644
--- a/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
@@ -33,6 +33,7 @@ TARGET_ARCH="arm"
 FORCE_OPTIONS_FOR_ARCH=y
 # CONFIG_ARM_OABI is not set
 CONFIG_ARM_EABI=y
+# COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
 # CONFIG_GENERIC_ARM is not set
 # CONFIG_ARM610 is not set
diff --git a/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
index 7154278..2242dc9 100644
--- a/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
@@ -36,6 +36,7 @@ TARGET_ARCH="arm"
 FORCE_OPTIONS_FOR_ARCH=y
 # CONFIG_ARM_OABI is not set
 CONFIG_ARM_EABI=y
+# COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
 # CONFIG_GENERIC_ARM is not set
 # CONFIG_ARM610 is not set
-- 
1.7.4.1



