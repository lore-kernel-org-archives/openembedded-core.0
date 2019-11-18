Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 542097F9A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l1so17296476wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3rVr9G/k5x4gEBbjPjVrRHpZVZBSKrFALuqhDj07MYM=;
	b=BGWomHPNqo7qcSpLWcCMJv4VAUtb2uK7ZoQBljcE9ZUHMZ8mPvnGohypWRfWiWPbpB
	VWcDwFEN3BWItHTqPJBZcJYsXmZrb0UMYeA/s+r2pS6UMosqHG4fT0iGG0NophSmqaec
	HrgJXL1JxQ/hdtjivR8mg9kDaJvBL2uJHAKwebxfQIxs/ZCf7XDlCdXnX6GSXwhQk5PH
	C3QRSQX9TZq/4P1mFwVwHeNQndFjwShFULewokejLXV13Lwr6jBLX7dgSeT5PzwV/buR
	Hu2E1DDKLLoAcv1JqhI8X/PBgPB/Dn5fWCMyrSSLrShXWHamv57hdxDCoFrhfDIFC7mg
	bBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3rVr9G/k5x4gEBbjPjVrRHpZVZBSKrFALuqhDj07MYM=;
	b=VtoCApC7z8/mHttmVflxpi3l6FwPtnjY3+BiuwctUb8S77i8G6cFJw4FcG8CLqsSb1
	lmpJtQvRfFv9qqYqJ8a6NlrzXyH1NSOeh4tHeFKp7z8p96dmbT4D+IeWOh009CZIDS3h
	bY5JLBBoPD0X5zyEXMK8lwLFZXUKRA0cUsNXzX0UMjv5YYxKcHKeJfK4fJgofvayZ68p
	gdxygCS9xfea5vND6kqHJpx64NG7Odw7l2w70pJNR/5Fce7tfpz04hZ4+spNM/Gj0HRg
	ogEgZFxU+ttltQNnwZk4LYiOAIz90Jzw2T7UyWYiQ8nfEt/7dPnAO15jJQgGTCyF79Df
	me3w==
X-Gm-Message-State: APjAAAVePMc71niSKURygvN6CfExzFbKa3TNKxcNm4bP1GQo3FIa/KyH
	eYgm9fqLi3ZG3K+d0TF0hL0OPyWR
X-Google-Smtp-Source: APXvYqzQgHqrO4XaId0AZuDRiHB2MK2YZvO7AKLNVfrok0r6cN9Umt8YlYbfpNX0RQA2dt1r9t74xA==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr30080756wmd.176.1574082528877;
	Mon, 18 Nov 2019 05:08:48 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:58 +0100
Message-Id: <20191118130801.21860-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:48 -0000

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


