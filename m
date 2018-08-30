Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9D4794ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 22:13:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j25-v6so1932480wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SQOvmflIjH9TTeja8x4V7S3Krg4hvkbfl18LV0GkMNo=;
	b=CpjIqYpEol/oXsSwLNp9/Z+CEVCB7wQTN99oWQIqrXNhMO6c+P05BTV07JTrTDIn6M
	W6LrwnUn2nYOXoiTR6cBJYBref3LIFu40Xwl9cFaXQKrhsRWtSv/Z8JGsR5gntayJqFY
	3gKihmdl3uNO6mtU4r6RNf5sCyto5sdqDaQBmcy8c8kA86amDuiC4qOxqwTPYWzFrbuJ
	K6M7gIyoEvreX6rXzc46kyg4SckkALz6oMULwxR0m9br7imQLO7PGnTtsOPNCCaCTQ8F
	0m1e4mEalA2zaQRxvLHk5QI8c0CFKR/hXNts8PdZjYEDRIrlM2ie1iX2J2oPL0NFffHA
	bysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SQOvmflIjH9TTeja8x4V7S3Krg4hvkbfl18LV0GkMNo=;
	b=Ri6YLBbJO0XXWRt4Uv+EKV3ZCijWQUauliBDYFb7qdas/U+U4w1KwRHthJIx3XHnkZ
	hgmOpjWuRKdo54QQa0nBXWDjbfXnPxE8ebJUQjoHiyTKmdvLzj4dAQzAUP5P8iWdR5cr
	Lp4xR23FxvEXOvabyEJlb4GpE9c50nTkQW1jOIzIePmj4ShCUolOxrklYvyB30tiOTxo
	Lgb2dCFsgGJfpqa97tgBCrvYQmiKG+yRTaORg87CMjI9lQ3ULFxb7XKwQwifXtZFMBpx
	sZ+i0uDfEdzZEz3xAG//G4OU+ZhODELG0qPkrlO+zGSuFn8wmIxSEumQxhVaRvUm3baZ
	kFRQ==
X-Gm-Message-State: APzg51AhrgC0zUoUM2GvB184trdimUVAfJFIT1ABy5OklPmbtudLTFtu
	1Zynol4FP1hdArv6RFb5o+P6GpoR+2o=
X-Google-Smtp-Source: ANB0VdaqgCf18OZuiRv1WwBmI+fL6ue5VYF2z4loAiq0hbz56U3J2cYvR9bVqVQZZ7A87WyBYi6RSg==
X-Received: by 2002:a1c:3413:: with SMTP id
	b19-v6mr3095864wma.21.1535667216890; 
	Thu, 30 Aug 2018 15:13:36 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f17-v6sm6432368wrs.1.2018.08.30.15.13.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Aug 2018 15:13:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 23:13:33 +0100
Message-Id: <20180830221333.31366-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] no-static-libs: disable static libraries in libjpeg-turbo
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
X-List-Received-Date: Thu, 30 Aug 2018 22:13:36 -0000

Previously this was done with the generic autotools support, but CMake doesn't
have a standard option so set it explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/no-static-libs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 7fd578b3ce7..cdc53916d07 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -36,6 +36,7 @@ DISABLE_STATIC_pn-libusb1-native = ""
 EXTRA_OECONF_append = "${DISABLE_STATIC}"
 
 EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
+EXTRA_OECMAKE_append_pn-libjpeg-turbo = " -DENABLE_STATIC=False"
 
 EXCONFIG_ARGS_append_pn-ncurses = " --without-normal"
 EXCONFIG_ARGS_append_pn-ncurses-native = " --without-normal"
-- 
2.11.0


