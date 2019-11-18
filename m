Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 96B067F9C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:32:07 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b3so19740518wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p3osZEpf/FHr6EdW6atElM5JNCAes4PfnQ3X04o+6ko=;
	b=tq0r+RoR2y7z6bhlpW9Skr8Q/Xu4EGi2GbgaMB0sAUTruPPwSNVxvI8Bpnk2Ooe8/f
	cX3985bfciDvk+nndfUr5UVSff4rEiKSoTtwOrksIFZ2kCtlf07DOe1Caaoqgl/gV5w2
	ne+4wC4e43yXhkB/w8jLm9dyUNDAIGpNgQxgu6fajCQmBUWm+uEVA0eRf+vs1qWG+ZKu
	vdGKS7dSxuPNEaiXT+Qmd/x7pat/+5Wird/WYgW4UgH8BA9UT+ZqwK8dHkOSleoVJ/aX
	NqhwwddL9QmZJ2XADzIwMamkWko536vN3+NfMFv9wRKRsN0l7SovwaYyaX1LBoddqLLI
	y7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p3osZEpf/FHr6EdW6atElM5JNCAes4PfnQ3X04o+6ko=;
	b=UOO7RXknB6acV0kafoEBGE+LxCGDJdK4q2f/jviYosMLnth3X1JBg7YtwWDoFT3cvk
	TNzVz2RbdOR9dxAnJRC7Lo1lN2Z4djs9tena3jSEm6Vxm3iW3bvgFCcIiL2h7XWA8Mlr
	gBWY5IIdTu7zlDpzatHUqlCFJbzWd8lY7igFo/Gnr3pWo6AlQxK5R8zzUvYHv7Zpqpr3
	wYxlZ0pkk5EPC97GQj5qUff0mTbFNC9R13B6TLrsqVsivPLxc6uzDXcFBFeFqzGCzJHv
	qu8+ymRzpybcwQ0OEcV2+6m97Y2qKxG1D92s42oRTaD25Q9BgcvlnD3oSLsXowNcUTes
	C+ew==
X-Gm-Message-State: APjAAAU5nI82s54/F660VGu5eMMHOLEiBG5d9hMdGuA9+PkNHBRHThZc
	IXKkiV55QAiLbBUHzQAFYvvuExhH
X-Google-Smtp-Source: APXvYqxjLpPPSKLRW8eYO2BnLfoEr3gTpg14oagn30n/oUDA90giDbCgqCDcxFJEmBYSkRPS6FxCdw==
X-Received: by 2002:a05:6000:1602:: with SMTP id
	u2mr16593349wrb.249.1574087528268; 
	Mon, 18 Nov 2019 06:32:08 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.32.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:32:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:49 +0100
Message-Id: <20191118142852.22981-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/13] mpg123: upgrade 1.25.12 -> 1.25.13
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
X-List-Received-Date: Mon, 18 Nov 2019 14:32:08 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mpg123/{mpg123_1.25.12.bb => mpg123_1.25.13.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.12.bb => mpg123_1.25.13.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.12.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.12.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
index a18b2f44174..125574fcfc9 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.12.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
            file://sdl2.patch"
-SRC_URI[md5sum] = "ddb38254966eb38c77f220d456a1839d"
-SRC_URI[sha256sum] = "1ffec7c9683dfb86ea9040d6a53d6ea819ecdda215df347f79def08f1fe731d1"
+SRC_URI[md5sum] = "294a6c30546504ec3d0deac2b2ea22be"
+SRC_URI[sha256sum] = "90306848359c793fd43b9906e52201df18775742dc3c81c06ab67a806509890a"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


