Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 89C3760958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:02:36 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id j17so2212166wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 02:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=/JrgB3AdjKqi01FLVrLbw7Whr2euQuuA+tNIIte7zR8=;
	b=OFS8xrZfTls64Vu46GZzBKockBJStN97fOEei1gcn65LaQ4gtPoG2VDq8IM2iz8OsH
	t7JFSAa8Z+ycvd1oohgQC4NBY1PkZea08JuMHmUO6adUq0eZoXO9LsnZOmA5la8YdKw9
	7GQm8ipJrvQnSUYiIMI4R/qFdQi6rAB46B2HVyEQlZgeGK6P8n1p5yHcQWWGwgVkyWxA
	NcSca1P7b3cM64vNLGzrSD1oMd3xmW3axpV9SgnVxmeqkkPEQigaIVokCzQKtYNUwZ/0
	rUZSs084OIONh6Q5GqU6iA5qiIxnLxsD521ILVJxbGvh/whxPmuBgdIGiJrL8mf8Hbaj
	Lw3A==
X-Received: by 10.180.89.101 with SMTP id bn5mr6341724wib.45.1375088556788;
	Mon, 29 Jul 2013 02:02:36 -0700 (PDT)
Received: from localhost.localdomain
	(AMarseille-251-1-121-68.w92-150.abo.wanadoo.fr. [92.150.227.68])
	by mx.google.com with ESMTPSA id e7sm1115181wiy.4.2013.07.29.02.02.34
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 02:02:35 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 10:59:44 +0200
Message-Id: <1375088384-17473-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQm74RlHb/tnZQmU1Oa0500KpPktCBsF9CCehPwVYt+dsdb+X3WxYcRHrxP69+xUHsZO5qfr
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Andre McCurdy <andre.mccurdy@entropic.com>, patches@linaro.org
Subject: [master&dylan][PATCH] lib/oe/terminal.py: add support for MATE desktop terminals
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
X-List-Received-Date: Mon, 29 Jul 2013 09:02:37 -0000

From: Andre McCurdy <andre.mccurdy@entropic.com>

A simple clone of the corresponding Gnome class. Without this, devshell
fails completely on a default installation of MATE desktop Linux Mint 15.

Signed-off-by: Andre McCurdy <andre.mccurdy@entropic.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/lib/oe/terminal.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 4502f34..be2a26b 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -55,6 +55,10 @@ class Gnome(XTerminal):
     command = 'gnome-terminal --disable-factory -t "{title}" -x {command}'
     priority = 2
 
+class Mate(XTerminal):
+    command = 'mate-terminal --disable-factory -t "{title}" -x {command}'
+    priority = 2
+
 class Xfce(XTerminal):
     command = 'Terminal -T "{title}" -e "{command}"'
     priority = 2
-- 
1.8.1.2


