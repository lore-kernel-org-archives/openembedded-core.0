Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 445CD7752B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:07 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id z127so22616826lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1W2FbB6aFyM3XDiSVfC6Ucy9QPTsrJJYxVapWJQ6zJc=;
	b=W3Lo/pyHPdMEpSsPljblP3vlpZ85xUJqz8R2FOaapIfwz7LSZKRyVUyHYO6Mfw1kf9
	8e4N5hc0iDkxd+dlaMsNl21GitsQihwgHsumT9pMppWIzLOQRPrLi2X0oa7ouGJwcWyn
	xp98zU9dgSjvhyQpiAW44cYZ0sPHjwRz3ATro4Q6Y6LVlha7Yv4vCSTiTMNbjWfMsNWZ
	uXPBQDYvsfu4+VkWZ1ENrQXAg2QKXO5XkGfhopAOiP8BjIVaE7By90471B73nxuag5O5
	NJxFzFVAEE5PGU+/K7DC0tI75jpzDDV5RDbZe6AbgBLoacGuAmMqBETCAHxVKwiLEVI3
	zcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1W2FbB6aFyM3XDiSVfC6Ucy9QPTsrJJYxVapWJQ6zJc=;
	b=ufBG0KyFI7o+mS0XL4GRsqWTpJ6Xc9a+UZyBzlSCoxfzAfCTE3YbE4NhpKTx4lzuYm
	wOhFAhwL07zU7Ynf5ueSrJKbAXWVjaQp3Ixc8E49/GGpW1nyOYVhYmYYYxaCIR8LF2Wm
	Y0vvSFxKQDHJKMZgKxDQviwx/h6qvxkhAQHFluJaB64EyLNdMvSwJAcRqwoLMHcE9peU
	FgaW7n6dk0ne/LPr82J4DfjvoO5P9sxqhBeQZwJgznTz7/echg0NhARXUQMqHKqJKVrA
	tgdAFuuEIJSNzlMw8/BrCEj/ClzD7lsCUOLV5EMakLCgclIsHm8SXDmUV9TIvk4sh6dc
	wO3Q==
X-Gm-Message-State: AMke39kxixr/6i367m9+qW1Pt2dcVUq9GuGMDqjRoG430nB21jAyyCSXbbCb5+MFGslmoA==
X-Received: by 10.46.33.158 with SMTP id h30mr3291404lji.53.1488388808934;
	Wed, 01 Mar 2017 09:20:08 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id n4sm1201398lje.52.2017.03.01.09.20.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:08 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:19:57 +0100
Message-Id: <3e92c4d255bcaf8f0a11574ac1f1e7ca7d16af6f.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 3/7] lib/oe/package.py: remove @ from package name
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
X-List-Received-Date: Wed, 01 Mar 2017 17:20:08 -0000

@ isn't allowed in package names. Angular2 packages often have
@ in their names.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/lib/oe/package.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 7953895..0ca41aa 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -150,6 +150,7 @@ def npm_split_package_dirs(pkgdir):
                         continue
                     pkgitems.append(pathitem)
                 pkgname = '-'.join(pkgitems).replace('_', '-')
+                pkgname = pkgname.replace('@', '')
                 pkgfile = os.path.join(root, dn, 'package.json')
                 data = None
                 if os.path.exists(pkgfile):
-- 
2.10.2


