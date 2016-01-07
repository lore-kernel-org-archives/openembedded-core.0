Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 936E97321C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 22:29:44 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id uo6so252044203pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 14:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VOlzGlx9bdgG1oxKFP7+rtmrDDz4u+Y4DFOT46vTms4=;
	b=ChBeiie0b6usDyJsVuzQPemDzSh4a5fVEekZMS5RbW0vlgaLEg5wotMN5HVYzxd5eI
	K5Q6F9+APHuDoML4zI5CHPDHhTEdYOTIY+qknpIStHVDUxto3Bngdzm7xSxE4wTOlMX+
	QjN9o3dH1VB0Csy0xQnBaQNB8jLW/AuKvRKEBIQ1SovieIqGSg9Xrrdv0QlHNq6UwLB2
	RRc8tmhVkZQ0J6R/WAdUkfpN2dO3vjKNYkGFAmjy7mwjOYmJgJal67T6AoNw7aI5jnBC
	HQmpXSfslrtgTJ5WohDA2aRow3sUDAVeRbuKWHVW/XrkulokftAT3J4Cgw22ouAU5lBX
	BHtA==
X-Received: by 10.66.236.129 with SMTP id uu1mr50197753pac.158.1452205785302; 
	Thu, 07 Jan 2016 14:29:45 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wa17sm93819672pac.38.2016.01.07.14.29.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 14:29:44 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 14:29:12 -0800
Message-Id: <1452205752-6353-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 4/4] libpostproc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 22:29:46 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libav/libpostproc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
index 4aaa50f..911ae86 100644
--- a/meta/recipes-multimedia/libav/libpostproc_git.bb
+++ b/meta/recipes-multimedia/libav/libpostproc_git.bb
@@ -18,9 +18,11 @@ S = "${WORKDIR}/git"
 inherit autotools lib_package pkgconfig
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF_armv7ve = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
 EXTRA_OECONF = " \
-- 
1.9.1


