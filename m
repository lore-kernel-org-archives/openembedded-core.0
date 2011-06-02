Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSDZV-0000Od-Rw
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:28:45 +0200
Received: by yxi11 with SMTP id 11so172635yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=HMJPF6Aw7mUgUay6bU6SgWMyRHhHDo71wDgOVD+wJcQ=;
	b=HIJgFkJOyANaSKc/zLp9wsB5wBhEUhB7Ywx+qMW58Hm9TwMYr5W1Tfgxn0o/AC9N5m
	VkR2PMupNT15SVizoemvFafjVGC0BRPPJn/iXVzu0y2m8/wemTeQfvDVgBJM+x9/OuEG
	ozVCb3enKm0iJVeKPXdTlkwdcrMe0QGHAv7iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=QYmc1Pn2emhfeeeAOYlwGgyL57PQNdU3AXucnwI+iVIyTQ9GvwclFIupGJ7Nw7bP/m
	LYN3pao1F5GyIGgQmFZQXDUhEnjtlwDOZutCFhu3Fmq7jUkuIng58ltUww4zeEkYeeWE
	3JSefGbfVHLcGDSrXYaQKNRUZO1RAC6Nna2a8=
Received: by 10.236.185.36 with SMTP id t24mr1493593yhm.172.1307042732980;
	Thu, 02 Jun 2011 12:25:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o45sm689081yhk.63.2011.06.02.12.25.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:25:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 19:25:14 +0000
Message-Id: <21881aba9031cefb72fcc33cca9d146169f344e9.1307042670.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
Subject: [PATCH 1/4] xf86-driver-common.inc: remove .la files to avoid unpackaged warning
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
X-List-Received-Date: Thu, 02 Jun 2011 19:28:46 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-driver/xf86-driver-common.inc             |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc b/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
index 550423b..6ff1391 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "virtual/xserver-xf86 xproto randrproto util-macros"
 
@@ -27,3 +27,7 @@ do_configure_prepend () {
     mv configure.ac.new configure.ac
 }
 
+do_install_append () {
+    # driver's la files are not packaged
+    rm -f ${D}${libdir}/xorg/modules/drivers/*.la
+}
-- 
1.7.2.5



