Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D43C6067C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 21:58:21 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id r141so9726918ita.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AhyzMCLFS6qkUreF1Pv2SpVe/NI4uSlR+3QWPkv8Z18=;
	b=EXmB7FzXLvremOJkWTXGxXw5rYaqZgeCJMJZWQngCE2rickaS/GogC5NLA2PZs7fdY
	CBIEMPEmbbUsmh99jF0w1wEqoaQN1kUajS7v6p/IKuCpjsK1x7PY5W+ZGH1T5xj6idh+
	2jqavd0P3I/kWBgxcpa0dqUBlpzkBpcA5jx/5Dh+a9mY0riDySx+7WHhp8h37VWWLsDr
	acYCViu6AWraSvDCudOvjdhO648yhS+MNFUIqgOxORgprbIswNbK8f92jTtXO2o+XpBF
	8dQJ+ZdGvT3zOGdoQndfANpQpxrSE7Wm75fdkUrY536QfLBB3J8Ni/VJj3YNNW4JhipF
	7FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AhyzMCLFS6qkUreF1Pv2SpVe/NI4uSlR+3QWPkv8Z18=;
	b=joHn8b35ZFdZH7EoCR4jj02QdZgf33BuPUbVF/DOuYXgj4ePKPp9zClY3464mZtyBx
	H8RoGTZmFqX6r5sRhOEJO5hSLOmgLrytnxfYFiM4vvRIx00o7CsipQkzk3RXNW7jpAt+
	XV+8CdUReYrd8Ys0rsAHGuXcz205KSmzm/BmKP7EJSUtghqw4WFhuzANuSVKI0pAamFW
	QpN5HD3Lij4jcUFkkY8yv5ZTs9MNJRSGoFcIEmlTpsUNfHOM52yCtC3QUEKzMbiaGsfN
	YLI9dItJKMX4Pu3nWwSsBfuB11MoqiE2PlOP9IYA4kV/+MIe8wnHb/S5VSlliiOkaFrw
	IVqg==
X-Gm-Message-State: AMke39ljkw3EKNCp61MpLHoj9FfdfTtYKn+vwuUlHiOEhIcWNa0/WSlX3VGzi2wW8w4JtA==
X-Received: by 10.36.76.203 with SMTP id a194mr12146394itb.110.1488146302755; 
	Sun, 26 Feb 2017 13:58:22 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:a83:3700:9d9d:c132:3844:2cf])
	by smtp.gmail.com with ESMTPSA id
	i195sm3576574ita.17.2017.02.26.13.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Feb 2017 13:58:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 15:58:19 -0600
Message-Id: <1488146299-6448-1-git-send-email-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] base.bbclass: Fix OE_IMPORTS
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
X-List-Received-Date: Sun, 26 Feb 2017 21:58:22 -0000

Udpate OE_IMPORTS to include oe.license because it is being used.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d6116e1..edac18b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
-- 
2.7.4


