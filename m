Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id F184260ADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:49:54 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so1569397pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=CCYaPRpuIbEBdXnMXHMFuq/K+LaQYKOhXbcIWMW292E=;
	b=ylm7A3G0Ep2UVxO+h+rcgBxRg4Uw63H6gsev31sHEfyEyGr2oaX0q8x84IJAcGbeBZ
	+3uK5PLBBsds3alK8dHjiEH+zNJTTB3Jraa4y6WL1qDWvk++hfegSUHyQHRTAfxNk5XP
	bkFshsiB/7q6qB4mj1i6w8VNGFYcyIAaLzZ8noiKlgj16gnxSUGmjKBqAHa7PQ9updRl
	e3tPVTknGfTETx3tZgU7JQSbUZxC7ThyNyi6KRibcT6c0HykE105gq6xI3nFhM4YNM3b
	tevuYe8KbwIS64hgX32Ayy5OJh7S/1AUly4/ihPihZ3N2WEyMbb1YRvkxy5oA54ASQ9W
	ULGA==
X-Received: by 10.70.16.229 with SMTP id j5mr41382612pdd.66.1432000195983;
	Mon, 18 May 2015 18:49:55 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	cy5sm11269242pdb.85.2015.05.18.18.49.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 18:49:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 18:49:50 -0700
Message-Id: <1432000190-5601-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] pinentry: package update to 9.2
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
X-List-Received-Date: Tue, 19 May 2015 01:49:55 -0000

added a few more PACKAGECONIG options.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pinentry/{pinentry_0.9.1.bb => pinentry_0.9.2.bb}             | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry_0.9.1.bb => pinentry_0.9.2.bb} (72%)

diff --git a/meta/recipes-support/pinentry/pinentry_0.9.1.bb b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
similarity index 72%
rename from meta/recipes-support/pinentry/pinentry_0.9.1.bb
rename to meta/recipes-support/pinentry/pinentry_0.9.2.bb
index 08588dd..c836ca4 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
@@ -12,8 +12,8 @@ inherit autotools
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "d224d031130aedb44b05164cb04ed88b"
-SRC_URI[sha256sum] = "9cd08e856b395df3adc7124170b53f77c6d5c8bf88e899e818648ec70d3e9695"
+SRC_URI[md5sum] = "f51d454f921111b5156a2291cbf70278"
+SRC_URI[sha256sum] = "fd8bc1592ceb22bb492b07cb29b1b140bb882c859e6503b974254c0a4b4134d1"
 
 EXTRA_OECONF = "--disable-rpath \
 		        --disable-dependency-tracking \
@@ -24,4 +24,8 @@ PACKAGECONFIG ??= "ncurses libcap"
 PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses"
 PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
 PACKAGECONFIG[qt4] = "--enable-pinentry-qt4, --disable-pinentry-qt4, qt4-x11"
+PACKAGECONFIG[qt4_clipboard] = "--enable-pinentry-qt4-clipboard --enable-pinentry-qt4, --disable-pinentry-qt4-clipboard, qt4-x11"
 PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
+
+#To use libsecret, add meta-gnome
+PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
-- 
2.3.5


