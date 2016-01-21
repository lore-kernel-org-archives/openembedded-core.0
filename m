Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1532D75894
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:33 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id x5so2017350obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G00yG5gEcNesa/ckEFDp7qhaY8dyjB++nXM3yt7xI3s=;
	b=oytulzQ6CdzD/ufH1hGmQxLpwmCaR1a+NZUKy61xZduheCMs3+Q1TgL1hTE3AI0FVV
	aQNGnIsiOhlGTCJ+5zP/LlEVCQcHvYG0+XuCiWS2mlzuuc7LI4r0JnNYQo1QeVqSrc3k
	055rrJkKbqr4RAke6xnD9kzcVnLIzFNZpCZT4wiemiqE77bVaO6IYiQg16lOaHuLEpI8
	oVo2KQW7BtDGks04CUHlPB7cKWdk4dbTKs7ZBqsYJJk3BXcubrlVgofibY3fiSmHaGSe
	BSTfNkT7KJKm4Cd8+WjhU/nHEqqK4ZDujHOvGfAZYo3Qhir041J1xQWiBuMwT67xZchg
	gOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G00yG5gEcNesa/ckEFDp7qhaY8dyjB++nXM3yt7xI3s=;
	b=F8TjoV9MjEqTqlkD7e43TwlLCViD+YQ7r1Y7Z9ShnNsNq1K+FmA8KICemhddy/zr/7
	AKuH8Qh4TZ/03tpBPzbpPumd1zyG3NXk8eskyk1zvRR63ujeC3mQPz6S3QHumo4AzVig
	onTsWQdTjbA3a6LIXYuFYS1O9vEtIYNDpVRGqzOLI7gmv4kKgIzFIZwRRqTWt8gfD32e
	2jzi8Yz0rSQQ+/lNlmz7lUirRDzEgNQxoB2oEc4CEsHR5gMwlYHcFOz+ghwKuHBRNJdI
	oS8Hf0WQ+nOllcSK4Q/+u0mk8B4MLQow1040Aw5a85x7EZWnrRxTgCK5y0RQ/sps3BYG
	gb/A==
X-Gm-Message-State: AG10YOSwhdns7b1umes/lHD1uHYuMmVxLL4yr6lMPOd3YrKVf2zLCpKwuzPY9u88U5rrPQ==
X-Received: by 10.182.102.136 with SMTP id fo8mr29111063obb.11.1453354654021; 
	Wed, 20 Jan 2016 21:37:34 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:33 -0800
Message-Id: <1453354610-19218-16-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 15/32] gstreamer1.0-plugins-good.inc: remove duplicate --disable-examples
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:33 -0000

--disable-examples is added to EXTRA_OECONF by gstreamer1.0-plugins.inc

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index e79da9e..8f996d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -39,7 +39,6 @@ EXTRA_OECONF += " \
     --disable-aalib \
     --disable-aalibtest \
     --disable-directsound \
-    --disable-examples \
     --disable-libcaca \
     --disable-libdv \
     --disable-oss4 \
-- 
1.9.1


