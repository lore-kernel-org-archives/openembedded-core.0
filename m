Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 83A5B6BA93
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 20:18:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xxyH0g4xz5l
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 22:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557087495;
	bh=1ly5pPxJzq2cDnPe2y86cjRz+71gRm0v0LTjxcinq48=;
	h=From:To:Subject:Date:From;
	b=K127G7pKCslOMSgWpzmLBCT3jMHPnuIvtrtW3St5Cct1cmYtr69zD1gnvKJmWy16N
	OdaTUYBPhRQzJUOb9UlOqac1FCw4HPwX5xa+Sm6hWQR5I//f4dUoFd5LEQ8YBqnivk
	ciKLlxljkevQ4z6KQPTHaHoMdh/Hu5F9gE9HTxWPD4ItUVwwHGnlpxI4oX/Dfes2C/
	NAnkewM4L10PC6dHRyJZvoJSQVR/G5h7LTfirU8KE9r6hAdS6aVYdAaqbWeMpCtZhL
	JEH7vzQmP0jK8e/WrWRCmp2enWvE6CiwBxHenQayBx1J3UDvDNY1gKtBiGW9v1vuym
	dgP4w0qLMF2LWKM446ujrhfkmZ7ivzAcwjDnAoQWFDOfUOwBGwIGAvhalRkcrhNvp3
	8Of2hj3o0bdqqKoroir6oX4CYmTN/B2p0oIfGCdUshylBZy5H1YFlbU3hkLBo9yOFU
	58mWc1a174Z17kvf736RYWejHq960D4KR56kpwUU/rFQMmC1Ivrmned1jx6glXUYqI
	8EbAPGKqCesobNsmcSvJPSvh9jhXp+iiIwUrpJvVsiWzuZxFKvtvJzbN7rLhQcoVao
	kavBSPvHaBbM42o6mMavUWmzUKYGP2KMUU7iom8DFmjc+7ugrIrDYYFQgyC7uLBDV0
	JD2GULyFU3XqCSlT3TtGBmps=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 23:18:13 +0300
Message-Id: <20190505201813.28881-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] file: Stop adding -std=c99 to CFLAGS
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
X-List-Received-Date: Sun, 05 May 2019 20:18:14 -0000

Upstream now adds this automatically when required.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/file/file_5.36.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.36.bb b/meta/recipes-devtools/file/file_5.36.bb
index 1a81fde259..9a0e5bd220 100644
--- a/meta/recipes-devtools/file/file_5.36.bb
+++ b/meta/recipes-devtools/file/file_5.36.bb
@@ -27,8 +27,6 @@ ALTERNATIVE_LINK_NAME[file] = "${bindir}/file"
 EXTRA_OEMAKE_append_class-target = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
 EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
 
-CFLAGS_append = " -std=c99"
-
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
 do_install_append_class-native() {
-- 
2.17.1


