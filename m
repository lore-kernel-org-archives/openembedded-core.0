Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rk2pd-0005d2-4f
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 01:11:21 +0100
Received: by qabg14 with SMTP id g14so2071522qab.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jan 2012 16:03:53 -0800 (PST)
Received: by 10.224.180.131 with SMTP id bu3mr16677314qab.5.1326067433763;
	Sun, 08 Jan 2012 16:03:53 -0800 (PST)
Received: from localhost.localdomain ([79.115.118.211])
	by mx.google.com with ESMTPS id o8sm124978467qaj.0.2012.01.08.16.03.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jan 2012 16:03:52 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 02:03:42 +0200
Message-Id: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Mon, 09 Jan 2012 00:11:21 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Enable 64-bit math support in the expr applet. This will make
the applet slightly larger, but will allow computation with very
large numbers.

[YOCTO #1767]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index 1990f28..ebd751d 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -214,7 +214,7 @@ CONFIG_FEATURE_ENV_LONG_OPTIONS=y
 # CONFIG_EXPAND is not set
 # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
 CONFIG_EXPR=y
-# CONFIG_EXPR_MATH_SUPPORT_64 is not set
+CONFIG_EXPR_MATH_SUPPORT_64=y
 CONFIG_FALSE=y
 # CONFIG_FOLD is not set
 # CONFIG_FSYNC is not set
-- 
1.7.5.4



