Return-Path: <sarah.marsh.engineer@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 128037198A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 00:11:27 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id t1-v6so7502016oth.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JIbW049kRhbqUtnseJmLrqJXoODCfaUG+NFbNAb6FFA=;
	b=HCJpOEh692PVUZ8AW2TCGLcx1D3mhExITOSVz4JdJ7+LRDkhzisVR3StXq9e6eKrPP
	2/7n28U38oSkkLsK9ZDv7RKr6QqAyoBRKrN7bxT3XoPDI6AjvZ6t60WaZj3IY7ZoQ+NT
	3vfSH5HyG3KJZVuljiV8yGerSLiqgkLfe+kgfjExu4yXpFbKHtwnSeUsahq6mcMClORJ
	uT94paeVjRPT2dDriv/8nV3HKBCwdGMyEjPNblZgw/XK+Zrirx1FkXZTIMD3TXUa6GPT
	+yi/G43uzqTdJEAsidwBJjzr/MCAl5jgRjikO0T7LlBmz2ioiMoBs/VEu+wHiek0PXKX
	qzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JIbW049kRhbqUtnseJmLrqJXoODCfaUG+NFbNAb6FFA=;
	b=WoNqNQF8YsHlo4qveuDFq6bpuwdcph9NUaN0R77pTAWLVlbjocNxisekYTP2xVpAQz
	B4qOZcn/ksifQVzEaOm6127/mawNTlrHpDsZAi/eZBxTUwqx4Q/FjVnbxD/bRAun4Z9w
	GDYdx3W2cRw4Na0w55fDtfX/GWLOxN4l2d18/vGnZYyEQuRFeq+BSXQ7pxgJfoKvSP+0
	LkDSbTzcXM1CWNZdBvnb5TIk9QB5pyYxTEq27YXeVPIWAq906Zq56CvchU8edpfPkgO0
	O7uPvZZqPxdgqcogakppOYzwJsnpbp8bBUBe0L/Yk9h4T3guperSwP/AvfQuF03Ahg0d
	e8ig==
X-Gm-Message-State: ALQs6tAt3GxosAhDCjK4v6Zw3vzkqJU+bgwla01X9KhmZJigZTRAvxrm
	z8iFINzTxDYvh0xlKNydEBEPoA==
X-Google-Smtp-Source: AIpwx4+BQT1DZAjwmcMiQwIeLy7qQxemQB5Muq2Gv9AeCm3X9UbaYODlFSBnJlTyC1sC9UZyOGtJZA==
X-Received: by 2002:a9d:2fc8:: with SMTP id
	b8-v6mr18650991otd.177.1524701488615; 
	Wed, 25 Apr 2018 17:11:28 -0700 (PDT)
Received: from localhost.localdomain ([136.62.82.41])
	by smtp.gmail.com with ESMTPSA id
	u32-v6sm10847257otb.9.2018.04.25.17.11.27
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 17:11:27 -0700 (PDT)
From: sarah.marsh.engineer@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 19:11:25 -0500
Message-Id: <20180426001125.28610-1-sarah.marsh.engineer@gmail.com>
X-Mailer: git-send-email 2.14.3 (Apple Git-98)
Cc: Sarah Marsh <sarah.marsh.engineer@gmail.com>
Subject: [PATCH] `NameError` is currently thrown in create_npm.py
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
X-List-Received-Date: Thu, 26 Apr 2018 00:11:28 -0000

From: Sarah Marsh <sarah.marsh.engineer@gmail.com>

This happens if an optional npm dependency does not support Linux.

Signed-off-by: Sarah Marsh <sarah.marsh.engineer@gmail.com>
---
 scripts/lib/recipetool/create_npm.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index fb57e705f2..bb42a5ca5c 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -320,6 +320,7 @@ class NpmRecipeHandler(RecipeHandler):
                     blacklist = True
                     break
             if (not blacklist and 'linux' not in pkg_os) or '!linux' in pkg_os:
+                pkg = pdata.get('name', 'Unnamed package')
                 logger.debug(2, "Skipping %s since it's incompatible with Linux" % pkg)
                 return False
         return True
-- 
2.14.3 (Apple Git-98)


