Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVOUT-0005Hz-H4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:16:57 +0100
Received: by bkbzs2 with SMTP id zs2so9399547bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 06:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5ut5luHZ1TkLpxeRKyHJi3rPKWbelHv/fn2t+0qnIHU=;
	b=wL1uVr0PsOrjs3fgOwk1P9aYW/iIDCO274ujLvPZlVxwuHDYZYsAsyhsbknhCiUlG/
	2FloKGtpNDHwwsYwbuGx55ro5jJYZ+GuTZizvc6rnG3pgXgGlJzckIEUFpK/YJhLYAJW
	0rZGRHX4Hvw+21gtAiEva0JDPEDJnlwkjId8M=
Received: by 10.204.145.89 with SMTP id c25mr50575429bkv.35.1322575818556;
	Tue, 29 Nov 2011 06:10:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm33786491bkv.9.2011.11.29.06.10.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 06:10:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:09:49 +0100
Message-Id: <2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
	<eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 10/10] gconf: add polkit to DEPENDS
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
X-List-Received-Date: Tue, 29 Nov 2011 14:16:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index aa9da78..907f0ba 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
 
 PR = "r1"
 
-- 
1.7.8.rc3



