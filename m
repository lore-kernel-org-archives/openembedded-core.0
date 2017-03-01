Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 412487755D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:15 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id z127so22618453lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eZbNIZYkGO/aVG+B0mNpNV0sepIKpBO/z4w4On4rqA0=;
	b=F4V+NJ3ce5m0e/NGfYakqSL5pVDxdRFgqZbNlrDCHTnBrezSL41R0riynRAmECWjxk
	2/RHG27jnlIq17/otoupkqp/xso/2sUA374LWCqq8g87zepTmqF/cnfEamiSgm2sLVkC
	Qb88Fw3G3MpgUQX+7pn89rIMZOXbU3ezIEpFNhajtxIxQGuwJMURQMi+fI+3DZLdPRww
	Vk9QIQomPn+6yPoIGmWAButxr7yjJcW6Xey3r7tyy1cZcD4uYo9veZ8kbCz0HrLHvXoe
	OqPg8HCGJBXgX9Xjlkgf+KuBNP2iXrBuZG+LtjtjTPK28+AlUo6+xSlU13vKJET+kn+W
	VHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eZbNIZYkGO/aVG+B0mNpNV0sepIKpBO/z4w4On4rqA0=;
	b=CInd/h0kqoEvcl6VdETJUHxVvr30Ybu31bn8TnqT6AAjjXWTqAur/gzuEcJuyy7K5C
	Xze5C5lbotTb50eMiW8XdQONCrtm9SVdPEDCeUjKDAkUpjJ/YzM2eKshJ6lmm8Ea6nRJ
	ZnYYE9uma1zjzBnLD7P4HvRY82RGuTgMIIGmLik40v/NmV4+vmhSGMzVO2U/GvMlXbfl
	5RgxEUtZSBm8kGBunrfcFTtfogD8dbMdRewww4+iaFD3TkANrybjeazQ6NSg1U3/QaXM
	ZR4+ShxfwfHovxwH0gGZUUePcwHGjhJj0BPGWfj3GLSUHkf3BCl4N31UHVeNqc7/8vxe
	8ejQ==
X-Gm-Message-State: AMke39mo9l7xiGYf5/Ks3jwvxhXQx59yWdmhjhxEgf3KImAioq3yxmnZ/BG2tpnNSo8CuQ==
X-Received: by 10.46.9.133 with SMTP id 127mr3364968ljj.130.1488388816080;
	Wed, 01 Mar 2017 09:20:16 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	k202sm540013lfg.63.2017.03.01.09.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:15 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:20:01 +0100
Message-Id: <b728fcba51d407d88531f03b49dbee3d6c5b25dd.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 7/7] scripts/lib/create_npm: handle Public Domain licenses
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
X-List-Received-Date: Wed, 01 Mar 2017 17:20:16 -0000

Rewrite Public Domain as PD, as that's what the place holder in
meta/files/common_licenses is called.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/lib/recipetool/create_npm.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 89973d9..95e9732 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -60,6 +60,7 @@ class NpmRecipeHandler(RecipeHandler):
                     if license[-1] == ')':
                         license = license[:-1]
                 license = license.replace('MIT/X11', 'MIT')
+                license = license.replace('Public Domain', 'PD')
                 license = license.replace('SEE LICENSE IN EULA',
                                           'SEE-LICENSE-IN-EULA')
         return license
-- 
2.10.2


