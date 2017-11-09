Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 725917850E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:53:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b85so3226840pfj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 18:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6ApS+dZSQYjmxrAmHWoFcHpa/MkG1uKGPA4T9qtqUCk=;
	b=Jiolk6s1wv2ST6U8iGKQf4nnlVoERNlSbxLxBCkO9h+0NWI/5PjPXBFseUGpWsWP1A
	D/Kdsm8HCS2gy8fSZIh6h1jhYEdoYiIB9OKGfmn9X1oeXD2oG4p/9HvuVNwD5q1rvBKb
	BweJmYao3nU+quYm30w/y1Ei4osStM7zxoPSMaTUfsmaDfkZUGnToqHTmcbfM3Y0T6ee
	fuvmU8M7IyKHqHeBUgyBd42PL+2DrQBGPD2qD3lH2vhJWwmnU7LgQAiy583F/PHT1ZLQ
	NOeZZjOrsi8tLQXiwFY2BU/353ZCpkA7QxUWsFZXWiv4RCwyO4mxB5C0GnkfYEOyk0Fr
	L0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6ApS+dZSQYjmxrAmHWoFcHpa/MkG1uKGPA4T9qtqUCk=;
	b=qdCrhPKeB5sRGilWAxASLpYqVbTewjqlymySNLiiy6a0mVcRfw4HfTE6pPyn8swJYX
	ZJqnzpAGy5vKvf57VTOxOXxuvYCY6sNmTbkkWF34eLakZh0AnvPmQcarePymgYDSqax9
	67mL/E7O9PIkuzXFZlxUzsHkPjHqEkZeBSeS22kW+mYVyTu9THXRHyJGJpcxsF4iwwq7
	JlDGb+uxKS6WSTd6Pj3OX07UbUDh0kQWNryMp1Caof10TGy9STMCHXD5pZBIfvAZ7a9O
	7IIMU8SHqfzjNUjdDiI+CFB/ZqDwZM5qqLi4LIDj9MyUHOa30PJaRLmysQFWhRt5oO5b
	zu3A==
X-Gm-Message-State: AJaThX4Qb7CwlFl9+SZSDuZPU8s0LzCRhtBQR06zLtDV5B940hCLw88N
	Eh2sTjHc7xfpGwqJE5A5zJaDUQ==
X-Google-Smtp-Source: ABhQp+RNqhkZ2DQNMGmvfBg8wgcSjX+7FAxzg/OCuLjLuirPGuFGU4V4AmkIxCmkc37ckpwYBWL67Q==
X-Received: by 10.99.117.29 with SMTP id q29mr2442652pgc.61.1510196021182;
	Wed, 08 Nov 2017 18:53:41 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g24sm10649698pfk.0.2017.11.08.18.53.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Nov 2017 18:53:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 18:53:34 -0800
Message-Id: <1510196014-9727-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] base.bbclass: increase indent in get_layers_branch_rev() and buildcfg_vars()
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
X-List-Received-Date: Thu, 09 Nov 2017 02:53:40 -0000

Although it may not appeal so much to users to prefer 80x24 consoles,
the general trend is for screens to get bigger and the current output
has started to look a little cramped on a modern HD display.

Increasing from 17 to 20 is obviously arbitrary, but does give enough
space to cleanly display layers such as "meta-nodejs-contrib" and
"meta-virtualization" while still keeping the output fairly compact.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f6b63fa..cc3d93a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -178,7 +178,7 @@ def pkgarch_mapping(d):
 
 def get_layers_branch_rev(d):
     layers = (d.getVar("BBLAYERS") or "").split()
-    layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
+    layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None)) \
             for i in layers]
@@ -206,7 +206,7 @@ def buildcfg_vars(d):
     for var in statusvars:
         value = d.getVar(var)
         if value is not None:
-            yield '%-17s = "%s"' % (var, value)
+            yield '%-20s = "%s"' % (var, value)
 
 def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
-- 
1.9.1


