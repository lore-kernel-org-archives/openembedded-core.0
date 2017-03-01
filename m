Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id D5CA377553
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:06 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id k202so22554332lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NE6QKGx/c3EwiXO16PmhnyBndvXHCaaNuyRklMLC/E0=;
	b=DKL1YSrEGyN3mCEjM71thBBkXKU1EjwRvGFk3EoHRbD1tUqGkJo8Jzm9y3R2JchpvQ
	BBR9EDB21hiFM8hGQz7Gnh9UJzo+uAGCWeVhNbPsjjm2C8NW87URCKvczpsPdhs5uVZV
	zHOJSSvay7fWCN9EAKrhRhlJPgZM+DeSxG8FcnAK3/5bT8KHlBXMMgBhR5a1ZuA1Spav
	CMacaEjnL9gd3HB7s6hgfT1asIQgnEaA+avwP5uycX++Tku+DI6gaKS0efcMLQ8NPyiL
	eeBUeU6SzcMK8CUibtU5AwsaVubRLn9XaX48j852NtRsHlaQrbxdWG3rOUtdduF32+EQ
	Q1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NE6QKGx/c3EwiXO16PmhnyBndvXHCaaNuyRklMLC/E0=;
	b=K2HymBzwq7W7JKRHtm4bZadeS5SeiusbIGxhFf075LMHHH5mE6L8nYtjUiIFV5u643
	ulTsM6Qq8YOrkla7fuEUtqWKESxtp4PJH8lNYK3otJsrb3YLeIB5VP0PR1sj9ZxLxqOa
	uX+ZrbD9Gc/SlO7dZ/dRTrWDx37+Cuae3lf+pB1khEchBZbsa96pWnaYf2MmMmAEUyKd
	Rwd8BdqSRvGDQDJnCogVuE5zoNFd61Z0kSFFh0alMbpH55Bh/MhFq/a8btD+Ig592Uvd
	jZ4tVXdsKu0FEw1Ie5pvGJFBgSzqPB70+rwXIhjsTwR4QSPV4hPPGR951UXkwvnkKgrP
	ULhQ==
X-Gm-Message-State: AMke39nhIMptpGnKZHImhAMfKfycD6cesAqkPhJElSQBwdZ3J1DVrc39fW5f1PwWCvmdMg==
X-Received: by 10.46.33.158 with SMTP id h30mr3291345lji.53.1488388807239;
	Wed, 01 Mar 2017 09:20:07 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id m16sm1216283lfj.3.2017.03.01.09.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:06 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:19:56 +0100
Message-Id: <12830a63c0c221f1a3a227173a69d55111359b8a.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 2/7] create_npm.py: convert MIT/X11 to MIT
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
X-List-Received-Date: Wed, 01 Mar 2017 17:20:07 -0000

Quite a few npm packages declare MIT/X11 as their license. This is equal to
a pure MIT license.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/lib/recipetool/create_npm.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 11b2950..2816861 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -45,6 +45,8 @@ class NpmRecipeHandler(RecipeHandler):
             license = data['license']
             if isinstance(license, dict):
                 license = license.get('type', None)
+            if 'MIT/X11' in license:
+                license = 'MIT'
         return license
 
     def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
-- 
2.10.2


