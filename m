Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C1ED278416
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:30:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i14so5911576qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=28/GBOne2mySPA8QW0Pev9GTpsruG2nspyyW20zwBkI=;
	b=L/9Tz0shI1OLHFWZHCktJPNVKJA7LBynWmWvSctVRoQW0F6sLcU7i10XtwkM5762Sy
	F5AVlq8/SnEr8uJAyhWTdC/0U511Qy+F9LJUJIOxgJYiXhVSICT5kQkAS+sK3ngVJ/c7
	q/qMVpoeskTbUrBNS8rgt3fk/3zs8IkfjH7eucMedyOd1X34CUmrB34TGg8kBv+5fxt1
	gAPqNoorkwjFTWJrMc4Souq5RPdKof1yN5fmd1EyvA/GPPVWVN5tDkE3jdeOChZE1lED
	DVKBIkkwTf67yqLmjWTBqJ3RhYuv7ukyxyJB2Xye8DXfekPquo2dVCRAsXTxPRPhn+DV
	MCtw==
X-Gm-Message-State: AHPjjUhsgEMe25vGnn8bOB4FmHaL14IZufD/OshVxHEzYufHg8ESBuZL
	m/AsOIrAGOL99CNl
X-Google-Smtp-Source: ADKCNb74DPbK9gioKl1zGD8gd/EYbTgQR6ABgA5HPseTpHiQ6aNq9UFjncox08H2lkEL4sNBMfbRDA==
X-Received: by 10.55.5.21 with SMTP id 21mr15522645qkf.184.1505154601544;
	Mon, 11 Sep 2017 11:30:01 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id x49sm6663027qth.7.2017.09.11.11.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:30:00 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:29:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:48 -0300
Message-Id: <20170911182853.11076-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 07/12] go: rename go.inc -> go-target.inc
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
X-List-Received-Date: Mon, 11 Sep 2017 18:30:01 -0000

From: Matt Madison <matt@madison.systems>

to make it clearer that it is only used for building
the toolchain for the target.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/{go.inc => go-target.inc} | 0
 meta/recipes-devtools/go/go_1.8.bb                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go.inc => go-target.inc} (100%)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go-target.inc
similarity index 100%
rename from meta/recipes-devtools/go/go.inc
rename to meta/recipes-devtools/go/go-target.inc
diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
index ef8bc14383..08ab793f86 100644
--- a/meta/recipes-devtools/go/go_1.8.bb
+++ b/meta/recipes-devtools/go/go_1.8.bb
@@ -1,4 +1,4 @@
 require go-${PV}.inc
-require go.inc
+require go-target.inc
 TUNE_CCARGS_remove = "-march=mips32r2"
 SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-- 
2.14.1


