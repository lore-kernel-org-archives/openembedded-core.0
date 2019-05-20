Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id E43CB7E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d18so14808930wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9dfBivIfakHihEGHWuGivw3Nmrsf+WaO2Pd9yNz6O1s=;
	b=jJBg/7DZApvU5q1NEl8S4KTsobXox2H48tjNCBn/ZsIBf/mLVUkTReXUbUJx7sJuA4
	pdGAQExjUloT1RaFNl4USdY6wD5qT7U+F043iOm575yENY9BNAarh9/Y1TLsHNnx81Hq
	zAyloURnfaPKnUxJQZsW4U+xkgMwHNRTERG6xXo03WZhbz6z45SZeL0nvo8qYEsIPFvU
	4tuY4sGt1SdAIVBbvzym2tYb18D2BNSm38Ybov1ikCUO3GIkjZY3rqssZVoqIv+gNXaV
	B7vOmQNRSE9yTnbjLLhRtbxuRjOsxzWN452ZcncJ0b+q2LCL1nI+e/QcQ2WcfuyjioGH
	+cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9dfBivIfakHihEGHWuGivw3Nmrsf+WaO2Pd9yNz6O1s=;
	b=hhOwml2KxKaCHDXQZY9dqxd3a2s8zdshKe4GLin6lM0dPAIGJkIRTaz/8Ls7+mGHAR
	NyRnhF3UJQr42tE+Iesaod04ZbFtrrMw9pN6dYYN05JeBomr6gtSBraOvtQiusNvvlK8
	i7d5ZpcfwgdXkr32LcdeT+whNzGs6DVYsspIgdv0KkTKeqhL3VH2hdso8osYBniaubO8
	j5zZxfIeQKeAuSKrME3skfwVYjF2sUTVCTieWYQUqLZ1i5PybQcO5YoIjGg2KtKhMUGD
	Y/S/4vfKzQmerMQGk673h4jB4sFVnTJTK9CbmKBaAkTisytUvDZOOzlNmzlvRecwpA1j
	bZgw==
X-Gm-Message-State: APjAAAUafJl2swgys17h9unb/s9d/AhULCvnAS9XhqaVAGJPx5GkhTwd
	ngENseiudPplv+6uBcknutSVM1JH
X-Google-Smtp-Source: APXvYqyn2f2tK0XGlSZ7no3r1e1GTPPfaTSbqPpeOfaZ7tfUThOVizLRx5DoaYQznwUmW0nA2glmWg==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr8896903wrm.166.1558361518539; 
	Mon, 20 May 2019 07:11:58 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:09 +0200
Message-Id: <20190520141125.10805-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 26/42] glib-networking: upgrade 2.60.1 -> 2.60.2
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
X-List-Received-Date: Mon, 20 May 2019 14:11:58 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.60.1.bb => glib-networking_2.60.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.60.1.bb => glib-networking_2.60.2.bb} (87%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
similarity index 87%
rename from meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
index 09af229d698..e0910de32e2 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "83321ffc3c336894b8a5bc18db3fe58d"
-SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0af0d17b14435d92"
+SRC_URI[archive.md5sum] = "bf46d1208ac00d78a45fbf621d459025"
+SRC_URI[archive.sha256sum] = "c022f3d10f55a5b7c31676fb001b4cb6401db8ab9f6e8418c69de00d0f268732"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1


