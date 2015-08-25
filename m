Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F85A76BEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGwPRe015129 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:58:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6TfXIFDSeYKw
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:58:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGwCvY015124
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:58:24 +0100
Message-ID: <1440521892.12105.437.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:58:12 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Add several allarch dependency exclusions
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
X-List-Received-Date: Tue, 25 Aug 2015 16:58:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These are dependencies that our allarch packages have in OE-Core that cause
those allarch packages to rebuild every time MACHINE changes.

With these changes, OE-Core allarch packages all have a common sstate
signatures and no longer rebuild.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 56fc7ce..196a66c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -45,5 +45,15 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   gcc-cross-${TARGET_ARCH}->musl \
   gcc-cross-${TARGET_ARCH}->uclibc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
+  ppp-dialin->ppp \
+  resolvconf->bash \
+  docbook-xsl-stylesheets->perl \
+  initramfs-framework->busybox \
+  initramfs-framework->systemd \
+  liberation-fonts->fontconfig \
+  gnome-icon-theme->librsvg \
+  font-alias->font-util \
+  weston-init->weston \
+  weston-init->kbd \
 "
 



