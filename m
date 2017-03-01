Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC1B77571
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:11 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id y193so22526283lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F+fmoqju282zGL/Kn9EoYMB+wZMnzL1tlKJs1RLKTGQ=;
	b=nEXytAcqOCndd4D3/HDZdLN21+0JMoKOCqgBX3ffumEz42Ox/4Ee22qcKIdmljCGt6
	xbHFV9BY8Q8fnxo3VvfbI4zGF8sKAg8t4lLhjgMGK2A45rHMmJYfLiqKusyXRBs//Tmf
	mIOzjSN6/R8xb5evj0IRrkwmqkZxuFolAtJ8hOSEan6P/7d21j1ePlAJ19eM7qgDw/I1
	C60EjsHGdZQLzv5d7mJnOqwDugsRlo+JsdWVw1R3dktqcxzWnQugV+pGVBer2cAytHLD
	wOFpjLUAagZMFKvYj27XydpTTFkwD/VKsOFlL6ULohe9RHONV/bJXGD2NwHIFwDg2w5N
	oqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F+fmoqju282zGL/Kn9EoYMB+wZMnzL1tlKJs1RLKTGQ=;
	b=UAROhabmJ+QBCtsIxtg07lF+1rStULRjRpWNdSWuuNFN9H2po32dX3XSg48MYKmZND
	3YW8TCH0hQNQ/gXCe4LnDPFJuWgzejZATBf6jUwWCgdtrabWcTbQQIRHy/eteRYtQ1PP
	ptnxDlzZh5gXSJee0hppYiYYFlw540BIcbuTn1aCk3DCy/MIiPTuEA/MXwNMSqjgx/+U
	TuNlX8/aCrpLOPTJGfSHTzCDHmM1urSIaU/lwzVpwsdHtI4nVn6GHI5+PF/QhAPAK81u
	T7WoTjSU9H4NnrRoHiQZ4IOL0KlF6Ii7p6P5e2uAXsgunVjmFzIJMaoQnTnYxfgbEv31
	z7yA==
X-Gm-Message-State: AMke39l0AlHC1WclhF5nNLd7enjXDG9xVs0txv8Q7URu/sFkNvBcx/IhZGnLyLLy55p1xQ==
X-Received: by 10.25.125.11 with SMTP id y11mr3168315lfc.101.1488388812462;
	Wed, 01 Mar 2017 09:20:12 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	a16sm1204986lfk.64.2017.03.01.09.20.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:11 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:19:59 +0100
Message-Id: <38ca4fe9a7e56c0ae0326da7b5b85805804649cd.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 5/7] scripts/lib/create_npm: rewrite see license in eula
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
X-List-Received-Date: Wed, 01 Mar 2017 17:20:11 -0000

Rewrite the 'SEE LICENSE IN EULA' to a single string (without
spaces), to avoid splitting the string later on.

(Otherwise, each word gets split, and assumed to be a license
on it's own.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/lib/recipetool/create_npm.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 2816861..6a0f3c2 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -45,8 +45,10 @@ class NpmRecipeHandler(RecipeHandler):
             license = data['license']
             if isinstance(license, dict):
                 license = license.get('type', None)
-            if 'MIT/X11' in license:
-                license = 'MIT'
+            if license:
+                license = license.replace('MIT/X11', 'MIT')
+                license = license.replace('SEE LICENSE IN EULA',
+                                          'SEE-LICENSE-IN-EULA')
         return license
 
     def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
-- 
2.10.2


