Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2037FCAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:40 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b19so128851wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OK+B5qZifGzTPPCyib1fn7HcTqhhzIW2mrm6oPIcvUg=;
	b=Gnlo73XKP6Gyb+yL6VcOQvyC9uZl8yx+2xYC90ypHcqkWqqSsBfZw6p6JfwHK3YScD
	KNCCvh7jPgRNL3zMB/8n8om2EsNknViXhhufufPqlz5+0DinDrxhz/ro44mtri0Krg9j
	ggjzCNMpNboEwcfM31nQdrJO8Ga033DPZBkJZV7KZPg6j4JYkA99GsGhOMcxMlfDzHbK
	3Yoo+affYADacFrB2JVer6cMPE7pmU46L0JnYRtAhM5F6tkbyM+qQqP1KyT5rIzVvqOG
	2VCtWvSeud4ciNo3oX39i1zoIVDxH4sdMLvnYQQeeNd49kxXJ9l9a5227kFVU94Yjoua
	sxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OK+B5qZifGzTPPCyib1fn7HcTqhhzIW2mrm6oPIcvUg=;
	b=gg6h5LjYTH9pvQDAXL/CWF6Tlj249txjkWj8MOfKIgZHbi4gB870/RmPxD1r8yZCP/
	hdDepkyX86Z9m9pEy2h7imxMnq2XWaDn0lVZhGrWb2/roZrkEod+mx/nfR7bgNbopIXF
	u3jxxn9lA8teG1fufS3PCjV+3JvEd5Sd42OkOveT2GJnR31u8LAg6IJ9VMz5i6WMKw8b
	YHlQqESTH4EPsPOSfmcIs28XQ2+38IvBm25iay64Y8JLSnjcVjvDTyRHxj0Je7uuCyhw
	tzyzYbteRqK4w3XgujO5YvoSaViRq52RwS5lO/erL9/9VAMbrL9mCt8piB+Iv0KbydTR
	wlCQ==
X-Gm-Message-State: APjAAAVj3G/VuyOdB0PeW68bOtLdwgwt+rEualchN50kNCbjwJw9+gS6
	6WTJY2bsN5bodO/kHsmtnWxAw8uF
X-Google-Smtp-Source: APXvYqy3N0rvXK1cvLaMrbAzS/jtnbIep4qhtt/TDFWzONuzKUull4wLdiYXdxykIk/b6Y3jmtMxFg==
X-Received: by 2002:a1c:4004:: with SMTP id n4mr333860wma.153.1579541140850;
	Mon, 20 Jan 2020 09:25:40 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:05 +0100
Message-Id: <20200120172510.22648-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/24] ffmpeg: upgrade 4.2.1 -> 4.2.2
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:41 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ffmpeg/{ffmpeg_4.2.1.bb => ffmpeg_4.2.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.2.1.bb => ffmpeg_4.2.2.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index 5ac18ba3f1a..a3cf0c1a37c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "67da904cf9fddeeb10a1308fc0dc39de"
-SRC_URI[sha256sum] = "cec7c87e9b60d174509e263ac4011b522385fd0775292e1670ecc1180c9bb6d4"
+SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
+SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


