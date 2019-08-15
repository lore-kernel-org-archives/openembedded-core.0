Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id 560826BCDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 15:54:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id p197so1983255lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Iprl+sTO5IERcCeChJ/5JpzjmNjB2cXeOD1aho15hJE=;
	b=wfu4zGYCM8LFVIbERRMf3BFyCQXhhlBdAP/e5MdSd68ynxrJcb3cHin4WijKLC7+qe
	wqo4zCEbhUh+7zWnjnwxNOxp7lXbZFz9SJuidx6z4nZu9q7HZYIEv4b+HGSWkt+NR4Eh
	sFOGVO/boGSCnP5/k79ZThqg8jWH2S/0xHRE9EpmlfUbJVWY7JvllcVXgABcwT6spivN
	RHPaVsyvPxXZwi0X0Ny+2ZOjixrfmbnr4UE14jH9PK1I3UTG8ainw7iNOYr+PAlyl3pW
	TuPZ4vEeyDW+66NN5HOMEGtlaTyOotlQprZ3MkrnioAla+K8UZfKF04NYzlndyxFcjje
	4Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Iprl+sTO5IERcCeChJ/5JpzjmNjB2cXeOD1aho15hJE=;
	b=KSb+IQKVohlz/BHL1v7PFo21+xG3GlMhnizIJ1gM51335svtGbcqAVWUZlPHNzk4IU
	1yjrVyuRyysizoRbT6Y0+6rHgSlmM2BGugvZzYtANOtvId+QG4Z7Vykv1yP2ar9ECbcM
	JUmo/bPq3EkNWXnTTFxDXGbSM0+L27O7053FB6Zfd6hZRICeW/NS2+jyBlgn4D6H6Yyq
	ICO+H5hAziOvrqKL+CI6KJR7PmvF2V6RjrATUwLkznZJTH2sA/IrLfafozfP8Wm7+cW8
	2+/ThzEloSbiXA6RmobNJ3bCFHAI8XwODX0EgeuLcLItkeeR6aJClcM3bDNMabEPdACK
	2CWg==
X-Gm-Message-State: APjAAAVcowdysfbdeRRxiQiIVgRzguVTo7VNK4bEhce4EeZTL6PhmoN0
	p/Orspl9POsYpsiX1z6PDLc9f2Nq0rQ=
X-Google-Smtp-Source: APXvYqwb7Ih9vaiw4mj22xuUWDJ5nK8ZHqpyUErzGaH0sUxtf9ME38dLVFt9lKHsnFB84KEAgyWrdg==
X-Received: by 2002:a19:5d53:: with SMTP id p19mr2694787lfj.109.1565884474486; 
	Thu, 15 Aug 2019 08:54:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id l14sm602586ljb.63.2019.08.15.08.54.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 15 Aug 2019 08:54:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 17:54:31 +0200
Message-Id: <20190815155431.5529-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ffmpeg: update to 4.2
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
X-List-Received-Date: Thu, 15 Aug 2019 15:54:34 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ffmpeg/{ffmpeg_4.1.4.bb => ffmpeg_4.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.1.4.bb => ffmpeg_4.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.4.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
index 884973d237..2d69d8bd72 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "5307931aeb7aaee5e1509d9996040661"
-SRC_URI[sha256sum] = "f1f049a82fcfbf156564e73a3935d7e750891fab2abf302e735104fd4050a7e1"
+SRC_URI[md5sum] = "fb33a9110251873002869664686b2a3f"
+SRC_URI[sha256sum] = "023f10831a97ad93d798f53a3640e55cd564abfeba807ecbe8524dac4fedecd5"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


