Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3813D71BA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 22:30:59 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id v186so12925164itc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4ImSPFixO1/ZsNNoB4xWKncb9X9ZW5TNG3Hpu+2DzPU=;
	b=u83bLWlPzDVnZGN8BlkUH7iYWs+/swqIkI8Qad+nKhmthKWSLSKzjGKRkzTdFGfmfX
	Pc5mNXH1bRnmpmAFqeucGEFdD4K0VWrrJYolaTNYu/RtgUAse5FlJ6uUAvINifKer6v1
	X1gujt5CgsYj8d2M/+HJPH31Cd6x8j+GcqXHUwG9LfVO36CHidedCTvFnb5tQdbAAXbN
	hZLZbs+SRvVJ4w0j28nzhcDzdswX9eMfGgHakimwp9khSbUPaCJRP6BR9S52JEM1s+BO
	tR7vNGjS2fFhyk66a6ULrsZvuC4HPGydGSfOC0SM72AAf4woDIPYoCMVML6jW35epybZ
	+oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4ImSPFixO1/ZsNNoB4xWKncb9X9ZW5TNG3Hpu+2DzPU=;
	b=KpHqoddjHKcP2oB06Lso3awbyJg6LncG/xFBhErCbVGPQfBZx/4ua83C8Fnmf+5wzb
	FjVsq/6GOJNULqDeQW1EH1dAsoSAFDU8vxTQIoOnMJWbHI5f7m3f4oPgW0Dah0RqD1yU
	R9yKVWz8At/YmOyXB/JZ1WtF533u312AEfjBmVVrc0eSdG7zNaSNooDMaUNuiTrCGHB4
	1yX3b6+lftvecaAWbUuAQIpbZSEqEhYxsPPeUppOM0OE+iGzp6s2IwdYO8IWr2oChzWK
	cEPVnujzutp4wsKP+NjtxoQ78rgy0lYTphPDYrh3VW/wFwUYPk81ATjPvPPOF0Wqulum
	7Svg==
X-Gm-Message-State: APf1xPAlgUFMUUJiiXQRURAW2iRjiX4L/rS+eHsIc8EBZTt472GUHQFL
	Vwg2lHfkBZ6MXOsFSXucKYRHJcB8
X-Google-Smtp-Source: AG47ELuYimdnvtKotiI6yEatGfnPpc8D4udBzK2z2IUZ3f54qEN2nKjyXCtffSqAXgoyUm9/LSAH5w==
X-Received: by 10.36.225.72 with SMTP id n69mr10273273ith.82.1519684261154;
	Mon, 26 Feb 2018 14:31:01 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g186sm7609093itg.2.2018.02.26.14.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Feb 2018 14:31:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 16:30:53 -0600
Message-Id: <20180226223054.5687-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 1/2] icecc.bbclass: Ignore more icecream vars in hashes
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
X-List-Received-Date: Mon, 26 Feb 2018 22:31:00 -0000

Changing ICECC_ENV_VERSION or ICECC_SCHEDULER_HOST should not cause
recipes to rebuild

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 36dcfbe6048..6e35e3be486 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -30,7 +30,7 @@
 
 BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL \
     ICECC_USER_CLASS_BL ICECC_USER_PACKAGE_WL ICECC_PATH ICECC_ENV_EXEC \
-    ICECC_CARET_WORKAROUND ICECC_CFLAGS"
+    ICECC_CARET_WORKAROUND ICECC_CFLAGS ICECC_ENV_VERSION ICECC_SCHEDULER_HOST"
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
-- 
2.14.3


