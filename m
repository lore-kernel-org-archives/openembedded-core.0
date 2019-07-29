Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 72FF06C37E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 05:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xp8f004Pz3l
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564378018;
	bh=IweZgC2Z2uK4cXebFBgX3t9v1TUG2SL+kcJ8Wm7cqZ4=;
	h=From:To:Subject:Date:From;
	b=pVpFWs3ywNuWKynS7KP8O8VtIAVELFDLWjngiDviOh4oNBwium3pmUi6h+i0l32my
	6r6UbG4cRr/xfp/jdVuoB+F7eVBe7anogZSjskRjCUzbDDx90CnL95U/YdDi85+TBP
	WsKEkdR1X9uSeJl7t6VuELYBfzOll4eWCYhPsu8SNpfFEgwZC8tdM3Y1AOPeJn6A1n
	KlZABbZVVolDdZOpe6U+0bg0489J0FPCbVD50Lp9jeIQEIMAZAutuzUWJbyY652Et1
	kYmdr46smGcdYZ9vANqt8j3DJERSawfHJw67pN/3UeuYDf43rC9o95NYoceLxShVwJ
	u5zmjRFRaEbb/flYT9juMg7vet8H2SdcGX3eXvw2wA3BwgngGX714gUEyil8aohsUX
	ZDeuS1EyEfqWsTS0ESO4axF+0IjX2R8bWtkJ9luVS0sdz/wzZ+1o/BQfiogih14v+E
	elj5580bjiKohUYLn+khERuqzuCzd++StkOEq4hGKWglvrL3jY5bFlhCDaIDCJ59ag
	NCdBTJlPu4LxfGssw1GG1YjYZAM+Sh24j0NlNYh59dmpfVdUQpnPsgzbeVkKNepnkl
	nJH9d58LU/rpfwpy9TkL6p3A0iAmUyCT6OA4f5URBL8KzT0Grl9kBf4qFrq3NNTfbH
	DTZIU+wcQW029ayP9A2SGX2Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 08:26:57 +0300
Message-Id: <20190729052657.15206-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove the gnome class
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
X-List-Received-Date: Mon, 29 Jul 2019 05:26:57 -0000

All that was left was
  inherit gnomebase gtk-icon-cache gconf mime
and especially inheriting the obsolete gconf is usually unwanted.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Documentation changes will be sent separately.
Users in meta-openembedded have already been fixed.
---
 meta/classes/gnome.bbclass | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta/classes/gnome.bbclass

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
deleted file mode 100644
index c6202bbb75..0000000000
--- a/meta/classes/gnome.bbclass
+++ /dev/null
@@ -1 +0,0 @@
-inherit gnomebase gtk-icon-cache gconf mime
-- 
2.17.1


