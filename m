Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 43FEA7CE6C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id i19so1988714pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lJrMJSVeRUq+V+vx43RfND5u+Q5yyUS1KE8WM2NmNG0=;
	b=QbVbRjMgxMDLqgWTsVvMc1KAlo2UQE1wojCOPIuSzcv+FFJglDFkAu3WGBz0pid9WG
	Dy0qmM2KgK59dsifPMJYXTMUVud0KWOFf7fpSVOAfF2ukOSJ++rrkwY1tj3ZHGzsnNme
	DU8p+4raXetMJ02WwmymXhrDNqtTiA2ZdIaGr/QOf7l2EuRJtulwTEryqw2CuoHl8B0s
	L84Hx39algYZYlKnWUMwsi1KcJdA3e6/mhv5L8d3tR/TmWzvIJgBYNRGEX5e/MikhYc3
	SM6U7kHWHxLMM55MwQRv6APU5Mhgq4lxmy8x2kjmdJIQGMkzxiwnZFCVs0rRV1QjXhMm
	vaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lJrMJSVeRUq+V+vx43RfND5u+Q5yyUS1KE8WM2NmNG0=;
	b=Twkaqol5+f7y2pMte1VZNuDgpVzE8OQceZgw2/k/wp9b0IRelG3XJyCAnuJ3WkArsv
	2/52Jzj19dIPtU4PBX0P/NV91CHxGKgpm6Q8t8glHoZ1hCEVZMMTb9TeWihMyI/rgimY
	bc22JYgpDsshrjyD824IebxkEavf9uyhd5hP+sua2j5Tks801boSGi7M/OZT96o91MBm
	7z5bv7gauvQ+X0RDpyAs16N9wigkrkJ29ZBrFRUwNd5JFdgbYUvhmRvEJXAVIAK1r+lH
	c6Z5w97Xlzi5QOykM4oVA3hYHg0lFPaUHaliFdFjXIItkl4PFYOOU9E9aKmpwCk3eb50
	crSg==
X-Gm-Message-State: APjAAAVCUCsXrdVFT8wo2hSyNjITNjr5RZURyv8MIdyXT1sZxa4589SX
	CDXD3MhaauqiUoxuKZi8X2H17C6e
X-Google-Smtp-Source: APXvYqxQGAnuX6n2Fa5Rzi5QSqZ+lnmr+PCNVCT0C0mUjJQ5Mknov0meoTryv+CRhH05wraeyrZDLw==
X-Received: by 2002:a17:902:9a4a:: with SMTP id
	x10mr28832303plv.93.1552241267204; 
	Sun, 10 Mar 2019 11:07:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:34 -0700
Message-Id: <1552241263-26116-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 03/12] libfontenc: update to 1.1.4
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:46 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libfontenc_1.1.3.bb => libfontenc_1.1.4.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.3.bb => libfontenc_1.1.4.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb
index 34d5fc4..1fc74b1 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
-BBCLASSEXTEND = "native"
+SRC_URI[md5sum] = "6447db6a689fb530c218f0f8328c3abc"
+SRC_URI[sha256sum] = "2cfcce810ddd48f2e5dc658d28c1808e86dcf303eaff16728b9aa3dbc0092079"
 
-SRC_URI[md5sum] = "0920924c3a9ebc1265517bdd2f9fde50"
-SRC_URI[sha256sum] = "70588930e6fc9542ff38e0884778fbc6e6febf21adbab92fd8f524fe60aefd21"
+BBCLASSEXTEND = "native"
-- 
2.7.4


