Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 36AA17CFDE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:37:32 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u21so4559809lfu.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KpEf/Dd79vuBKLA1LYsUjb6e0ZNUO+UEA0Tds3hSM0c=;
	b=qIbpNCsVHjZI+omr8cxpF1BmwYpmHUQUK7MptfPVhykeTbsmj544BCq6Og+kE9qF1b
	5QAcMgkZJ0DVKvWDIgDyCz5LFxewR+DHOUrf1F3u7n6dIoITjemlNA9ByYCAwIDgVRz5
	JWrNiXEbPNQpVhCJMuNBPqNoKjGmRp/Ml2Y9NdUeVAnMB2lIl+WTPow3Mt7aNGTPDm8F
	eKRGPqTUN4kEd7/R0ntKvyHb/FHekNSZ0C+DJlVFOlbFvLVH0IlFJmjTh0B5DNQAPQxS
	qQBNlVVR3cO80O5MGOZMx2L5YM32J1/foC8BTM+si/4Uqa0CgVNFnEA6ikfsbmrK0R4c
	5/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KpEf/Dd79vuBKLA1LYsUjb6e0ZNUO+UEA0Tds3hSM0c=;
	b=TyubSrQzetAN7Lp2itSbzqvtoBkB8ZDWEiVNCwJEWnsa9mGwtEju3vHvCmEWgvGlYB
	cDo3PdZj+7CtrvbFJGy4btUvEX9594zrpt/jKYWTFPIc5fRLaTyDPH88j6rrux3FaI1x
	l8KRBxC58iri/ZgXklNz0B8Jp/kauQy0LHeXsloels7aq08Mp7bldZ2yj5SAmXhknr9h
	9O4UCSv4c+L9uFKKS+z2Z+mSArsI3bPvBksONnvK6PCNiMLScTlgHVzq9lJ2gzHK6bcU
	0isMB3sJVkjkNX7a4jNHoPTjbqinLkBGo+100oLt62fRhxTWKQE45e/q3tN3VGQaaLRH
	yeMA==
X-Gm-Message-State: APjAAAUmA+ALcBxj/v7Q58BiO2aSmJmLlNz0DgKozXtkpYmHQ8oXXihG
	h30HahXQWXFQJTL8CRAB66NC6676Ty8=
X-Google-Smtp-Source: APXvYqzhNk1gk5Bk4HTf5nra/DcHDUukaMKgYLV1HSoUwXiSFYrIW/bHzGghXD9pzXgjtxoQ8s0QDQ==
X-Received: by 2002:a19:c204:: with SMTP id l4mr29802047lfc.143.1554050252825; 
	Sun, 31 Mar 2019 09:37:32 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z83sm1549664ljb.48.2019.03.31.09.37.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 09:37:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 18:37:27 +0200
Message-Id: <20190331163727.5058-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ffmpeg: update to 4.1.2
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
X-List-Received-Date: Sun, 31 Mar 2019 16:37:33 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ffmpeg/{ffmpeg_4.1.1.bb => ffmpeg_4.1.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.1.1.bb => ffmpeg_4.1.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.2.bb
index 749b3d0dd8..e76fe7cbbf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.2.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "720fc84617a2c38aeae79aff3689a567"
-SRC_URI[sha256sum] = "373749824dfd334d84e55dff406729edfd1606575ee44dd485d97d45ea4d2d86"
+SRC_URI[md5sum] = "8f7f0a6c5d81ff20d9d65d000a6b419d"
+SRC_URI[sha256sum] = "b95f0ae44798ab1434155ac7f81f30a7e9760a02282e4b5898372c22a335347b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


