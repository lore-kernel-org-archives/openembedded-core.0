Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 34371786EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:34:42 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id m13-v6so1349227qth.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=YPSy09FZLJMBu0sHCe5/pcGCRMvz99hk+3hIJLUr4qU=;
	b=Lm8f21vkknXan8unRJejXFac0zDB1irKuvHPYDEf4ST1YLNwRy5jcJGZohgd5IluIR
	uS+DZEjMHYGu5m4vaVqHKAtEDX97PalhmuRZAKRUwLx2byntfglfKfsUGQL2GcuufooJ
	VmZn/cbmQv0Ws2ggtfPQyWkcVSwv9gw4hLvigW2Y/67pFMyLnWNxAlBT/M+nYD18m0Ph
	mwBSk3sjvY/jsrl8br/qykYBMxFbF/mOE2dB7bGZKP3MhIg2+g0FWFUPCvLsNXTILwsh
	tZZG58hiBbtAC/CCU1vt9WPMTcNp/u6+wINovAjbMr6/WK4cJGY7sF6XUeL8l5sf1Me9
	srYw==
X-Gm-Message-State: APt69E207MkFnoY2fOEJksnV/DPoq/4eDk6hKBklP7mqJh0TQckCP4Ec
	NCRpkRMbMIfbv56NRSxt7E5NmA==
X-Google-Smtp-Source: AAOMgpdZeNA+tXAVUg3VUD0tkCqel2LMSndJFBPteKgvQCdQoGg3Aat7No8w95+ADo2wJsavnIv3Mw==
X-Received: by 2002:aed:24f0:: with SMTP id
	u45-v6mr19572983qtc.340.1530621282729; 
	Tue, 03 Jul 2018 05:34:42 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	w79-v6sm153832qkw.35.2018.07.03.05.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Jul 2018 05:34:41 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 03 Jul 2018 09:34:35 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 Jul 2018 09:34:33 -0300
Message-Id: <20180703123434.29588-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] go: Update 1.9.6 -> 1.9.7
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
X-List-Received-Date: Tue, 03 Jul 2018 12:34:42 -0000

go1.9.7 (released 2018/06/05) includes fixes to the go command, and
the crypto/x509, and strings packages. In particular, it adds minimal
support to the go command for the vgo transition.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.9.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index a942f6d8ab..329cee061c 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.9"
-GO_MINOR = ".6"
+GO_MINOR = ".7"
 PV .= "${GO_MINOR}"
 
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
@@ -22,5 +22,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://set-external-linker.patch"
 
-SRC_URI[main.md5sum] = "52c1a3063291036597552d3fed0b2917"
-SRC_URI[main.sha256sum] = "36f4059be658f7f07091e27fe04bb9e97a0c4836eb446e4c5bac3c90ff9e5828"
+SRC_URI[main.md5sum] = "3c2cf876ed6612a022574a565206c6ea"
+SRC_URI[main.sha256sum] = "582814fa45e8ecb0859a208e517b48aa0ad951e3b36c7fff203d834e0ef27722"
-- 
2.18.0


