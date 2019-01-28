Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1B47C7C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r10so17863654wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=c9qAIjBod4TwgnbO6SdR8pmSEPOchWOha5KhRwWuzd75P4nnN8Jha1NUD/96NC7xdh
	YKov5zqZ5PtY8+Ff87w1izMUABhim8+K2xCYgw6MEdqNUaQ8r6i83jY0aDlSGHbJ8qce
	IdMXpcxs8U4T31ih48O17jbegx2pyh/7oBJm0hxU6I4cCoCyDh9EiguvUWXWa5VMe/WE
	dZF3KZSsFVgD6Fa45Z2a5J1ZoipMaVhkZgs3kcI0m7b4a25XkJ3lihwYSL6iRyDRlhG6
	VDyotXMZL5qmrF/R3pfPBxQUW6Gk5e00xOg7EaDiDkPvOB46+TX/LY21BtyRG5iDchF9
	XiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=fl1QNaPGxZ+p7exwderds1dR2brmTJlT0cGAVTQr7cdSjTJeRobEb4OLDStdmQJ114
	XRIsbVKwwMoS4XVQzOAbRkMgY1SJy8bOa3t8fVFA7zP25AGKvZemsvy07BRILsOkytEJ
	5P9KqP1kIg+ji5Ren40AdG8T4A1yGtW4x4OVK/JuPUAyDQsUgB1sa7cfbs7crR1I6E6p
	DbzknxucC7Y8GXSidwY5q2+snYq5WKUXHROdcK735S1kzgqSg4G3XkuW5d5rWB4ZJj+5
	tLAjJZ96gCu0ZR5DJLwTtAdbIbXK5NcZpDPe/vjMQqJvRgxDZ0PRTFuB5fso1SvIesKj
	h8Yg==
X-Gm-Message-State: AJcUukfzI7GpwqHNwKhCSyv8aC/eTmmMVsBKsz4J2ORpQBFeWaFbc1RZ
	tsh7vypdnOQyexE/a5hXsJ7dUbcI
X-Google-Smtp-Source: ALg8bN4XYjgGkG0ZG+nzqhSwOGkwxqBdNjpoRrzToTYefYtvpribZBnZefVloLC4h7gg3c0acEbPew==
X-Received: by 2002:a5d:4303:: with SMTP id h3mr22001322wrq.273.1548679645617; 
	Mon, 28 Jan 2019 04:47:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:48 +0100
Message-Id: <3e25aebf2269e2ebc0a77597e6bef40486f9d06f.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 17/24] libjpeg-turbo: fix nativesdk build in same way as native builds are
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index d9d877dc0df..029847ff5f4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -31,6 +31,7 @@ inherit cmake pkgconfig
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
+EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_SIMD=False"
 
 # Work around missing x32 ABI support
 EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
-- 
2.17.1


