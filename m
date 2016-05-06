Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id DF1856FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:08 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id f92so62628067qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=2PQD4kluD4EFdWLTsh59JhDW41zBO3HkrXUOJT+YLio=;
	b=CHfiZeyY77v4nTX0OMTK8Z+ou9JW1BnwnraZVVZPYDIyFJJWiIdDIn2QlMqcCItWUv
	fw020gBGIh670NhfU5+6G3ZmVdu+uOPZY/MFgzPLOSRjwx7rlVSyS/YwRCI3TDJnS0pw
	1duo7txrwKt01NAVqgsAzURMJQ/XYvZ+kN9lbfYw4PcrEi//pzeFXaQq757xHJdyqm+4
	WZ0A4WEfU0nL7DhCzd/ZxWbo7pnIyvI0JqqPdEB9EHFI3m7bYjUjznKoqWrYGYiTeTzr
	dFbdMeGsow2zyqRGWQHf8CLbVnpu+tWhTG0WV7hxzuI6rCN93X07LGJrE0LJ/sL+aEqr
	Atxg==
X-Gm-Message-State: AOPr4FXmhDrx1/J1qlaodXnTNhLAXWp/ok5FrIxQcna99aWyPqX4LRyynjt6qyrNu7VlJg==
X-Received: by 10.140.23.37 with SMTP id 34mr22288936qgo.14.1462567449265;
	Fri, 06 May 2016 13:44:09 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	x129sm5784863qhc.29.2016.05.06.13.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:08 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:32 -0300
Message-Id: <1462567419-3459-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 03/10] weston: Fix SystemD service description
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
X-List-Received-Date: Fri, 06 May 2016 20:44:09 -0000

This improves the log shawn in boot. Now it shows:

  [  OK  ] Started Weston Wayland Compositor

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 4f1f7ff..12aedb7 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -1,5 +1,5 @@
 [Unit]
-Description=Weston Wayland compositor startup
+Description=Weston Wayland Compositor
 RequiresMountsFor=/run
 
 [Service]
-- 
2.8.2


