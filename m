Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 04A3965DF4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 21:42:52 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so55548pde.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Qr0OXdAs7sZ/7ZBatm4DpOPX12yj4kFPDW6Uqa/lyrU=;
	b=bbHVRYCtaxfdsHhz3K/YVaVVQaIXvuHSl+anStkmzi7CUW5hrxUKzIHYb7pm3vtUJB
	qUjNV2pM5SzyVOPTRcJeMrwOMlo2+p8lBdLYvVl97RTpOrDyFJ9+Jl8/5xF4+HCjnPBc
	YomLEV0pooq2/ZsqpCTVafk0t063R7CD/VXHtra1WYmT5XqLtsv4zkEt0/qXzfchGb8g
	kd5gNHxZRmgj15LqItpKi/hzkixq7zfZ7TirPqQYkdS8XP2Woeq62/99D1ccUZ31QxVz
	b3YDVJNVkYqAsMZdp4fE03KChVtBYzweCLuXGLOlB5MOn8uxgiY9sazkvnSDCWYmeTPM
	0CDA==
X-Received: by 10.68.162.34 with SMTP id xx2mr19730692pbb.120.1398548573460;
	Sat, 26 Apr 2014 14:42:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ba5sm24644122pbc.61.2014.04.26.14.42.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 14:42:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2014 14:45:02 -0700
Message-Id: <1398548702-23182-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] uclibc: Add libgcc-initial to DEPENDS
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
X-List-Received-Date: Sat, 26 Apr 2014 21:42:53 -0000

Now Separated out libgcc-initial is there

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-initial_git.bb |    2 +-
 meta/recipes-core/uclibc/uclibc_git.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
index 3a1140e..6433229 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 require uclibc.inc
 require uclibc-git.inc
 
-DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial kern-tools-native"
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial libgcc-initial kern-tools-native"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
 PACKAGES = ""
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index b4f5d9c..38a7e45 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
            virtual/${TARGET_PREFIX}libc-initial \
            linux-libc-headers ncurses-native \
-           kern-tools-native"
+           libgcc-initial kern-tools-native"
 
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
-- 
1.7.10.4


