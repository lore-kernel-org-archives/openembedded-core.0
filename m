Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B689772C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 18:54:41 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id fy10so114561398pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZZQeRrdyeYRTNDMZ83EhWu5ozCYTdu2tYFyfan+dGb0=;
	b=Epb9LhToL1/EIMr18gBjQmBqFCjPqYJiOyQCtJ7NWTCKR1Uwg181tim4YUsD0B6Bgs
	fKpQbLWue0/fOizbHVBat+7AUWEQvbwQyRghnu90K0L6uC8EgJqT4+ZSZ7FZRKOwutzD
	/dfzSg6TlZgnKSqdp2v2cMJ0TG95+Eus480YrXcbWbkAod4Rs7h5c2ECEMG3in5GUpVk
	7ABPJGQvDMyfrtJH/YdcM59uUh9Xh50tb2I5oytKV3eqXjpU4/KsxGOUPnCFp0DB16Ac
	M8FzBTxSAjy3RSTGt3w0XVIrrYRKZzr0SMS+hNSYaNdOoCDasqFXdcd2JnJpxqOKymnz
	yLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZZQeRrdyeYRTNDMZ83EhWu5ozCYTdu2tYFyfan+dGb0=;
	b=QVjRUdiEpqosGOHJBkBNO/EIYlpTtzx2PL3h4jTY2+7RxI5GAW32YyzJsZ14yDkBmZ
	HL4/umng7pLuZoF7j3o1Wm/QUE4FEx3hEOUzpLi56DFR1lepxso4GHXsatwmtkmu/Qi9
	OwTw4+UuFnUt4ntRMKf9qkpaw6jewl1PnFMp2ViP7fq2Vpir70kaIMnEGRyEen0D02yF
	Uhfv2OCDStWSGuyOvwKhF40B4hQUmrcqivMdINT1Aawahm/nbn/L2+gREvh1r+ekAfhj
	0g9zBqcZaBoasVe2ukZcQZWaKAyl3/nVlcQ/R2XPcxufJky4pSJ6KJbBTxpvSd+stUKc
	ll9Q==
X-Gm-Message-State: AG10YOQAV5pXyF+LX71wD8AlXpQsNz1PaodCv/x/ariNhnKIus3kv5k6Vpl46vEqZOmFAA==
X-Received: by 10.66.62.229 with SMTP id b5mr49342572pas.114.1456253682830;
	Tue, 23 Feb 2016 10:54:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ll7sm40535922pab.6.2016.02.23.10.54.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Feb 2016 10:54:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 10:54:25 -0800
Message-Id: <1456253665-2420-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456253665-2420-1-git-send-email-armccurdy@gmail.com>
References: <1456253665-2420-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] harfbuzz: add explicit dependency on fontconfig
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
X-List-Received-Date: Tue, 23 Feb 2016 18:54:42 -0000

The fontconfig dependency was previously met indirectly (via cairo).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
index f88e634..fead2d3 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
                     file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
 "
 
-DEPENDS = "glib-2.0 cairo freetype"
+DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
@@ -20,7 +20,13 @@ inherit autotools pkgconfig lib_package
 PACKAGECONFIG ??= "icu"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
-EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
+EXTRA_OECONF = " \
+    --with-cairo \
+    --with-fontconfig \
+    --with-freetype \
+    --with-glib \
+    --without-graphite2 \
+"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
-- 
1.9.1


