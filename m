Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 637B97FD02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so150430wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=//XThZ3bqnZReCCAggWUV97oaGRV63HFHGeqM5XZ104=;
	b=QWQ/jvzXuU45Zz0Y5MzCE90xnPULFrATWagcB9OLUCa1QydiyukK+GAghu51uWWeZg
	4/VZW4NHm9BsqhcXallR/oEQ2K+SytoPaVdBHE1nnDs65zW8r5I2Tq1MS0x2AMsvJ4IZ
	Y9+kQEhMeRx3R7TsyzgyHD7CBJb8QTILPTGIaTvSZ3fdEOVrAkj6OJnjF4ksHUjBvz33
	BTWH2LBlcE/pspYqXxsGYf+XslHvMvSjyW3wSkSTuD6p4Hf+U+btD6rnd9BWL0619obf
	nkVOfVg19o7TpM8wktkesVbpJqtdPAVXhl1TVJ7eWS8hN2irC6D6HHA1X6ZdXEST+GEC
	3iVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=//XThZ3bqnZReCCAggWUV97oaGRV63HFHGeqM5XZ104=;
	b=MuHoJ9M45jPKj9uRQrKMoavWRLKBTbQcuTQAmWVNXcAHPaebT9H0jNc4Os4r3kmE4L
	gi4t0ZI96vEnrHFJ4kWXZpcfal3RFHZh45hQFdH6FQ7UWM2paOO2zjvbn5aWIQT3VfaZ
	4J3r/Vc4YE/2T7USMJoqUJdUmHAMK4AVDTRrr/uAOGNGoi9ngfBE2cK6dUTLKdXs4GDz
	K8kwGt0zBlqvy8/NQcWleY9SGOFCUPR7UcGOhjcFLqJ6jZTb852Ck6KHBjw4aqE3DfsZ
	b833dnsFzeboh+Gy5QIS6ILoSOVLz8A/JwIemOdS1nNN3PJze9okUkJTMttA4EPcv52g
	o0Jg==
X-Gm-Message-State: APjAAAXHdfxDxKAG9wdnt5hWQyIQIGm3CH+QkDedUDav93XySZcAX+9D
	Tih/iU5oKhECZRk668SsULH+W0xj
X-Google-Smtp-Source: APXvYqzTHjXiNMgit9CN4fCjFv9G0b3Dzby5CN5njkSZZ/6hxc+Mu7vKznzCIkIUzW40tr8lIXhyKA==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr374140wmb.126.1579541142692; 
	Mon, 20 Jan 2020 09:25:42 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:07 +0100
Message-Id: <20200120172510.22648-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 21/24] libwebp: upgrade 1.0.3 -> 1.1.0
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:43 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webp/{libwebp_1.0.3.bb => libwebp_1.1.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.0.3.bb => libwebp_1.1.0.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.0.3.bb b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.0.3.bb
rename to meta/recipes-multimedia/webp/libwebp_1.1.0.bb
index 5082bf03748..68e5ae2b3ce 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "906ad85daaaa2eac97c8aa2dec9e8b77"
-SRC_URI[sha256sum] = "e20a07865c8697bba00aebccc6f54912d6bc333bb4d604e6b07491c1a226b34f"
+SRC_URI[md5sum] = "7e047f2cbaf584dff7a8a7e0f8572f18"
+SRC_URI[sha256sum] = "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.17.1


