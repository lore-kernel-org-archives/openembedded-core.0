Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC42F7707A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91DLZJK010403 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Oct 2015 14:22:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CSxBFrc7Pxx4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:22:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91DLnDt010426
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Oct 2015 14:22:00 +0100
Message-ID: <1443705709.14733.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Oct 2015 14:21:49 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] qemu: Drop BROKEN usage
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
X-List-Received-Date: Thu, 01 Oct 2015 13:22:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

BROKEN support was removed from bitbake back in 2013. These lines just
increase parsing time, remove them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 738bf2b..bbfdf78 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -129,9 +129,4 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 
 EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
 
-# Qemu target will not build in world build for ARM or Mips
-BROKEN_qemuarm = "1"
-BROKEN_qemumips64 = "1"
-BROKEN_qemumips = "1"
-
 INSANE_SKIP_${PN} = "arch"



