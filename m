Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5C992745D4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 14:45:41 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id c41-v6so4877464plj.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SPCWXxny/ZQRHOnB8M5u62bNP+Xbp3rUOWVIs6hBQME=;
	b=i84aqiZ8IIYA6fgWo02Kve7aUyonp/3PSbtUcrJ/oXMi1nvodaDyB0mQX1dz1xJ/oI
	K14vMSXSSFCljNzxQuYszwRiXDKFi+abYXM7hRnYvJpcnD2hyDYNRCMuCPPSyuizpFVW
	AUuREn2XMcmwgiyDyeC6ZigYISs0Y5D/tvgim15bsEgydSzQ9TkqNXzLh7+eP7cg6X2K
	6nw6wHr5dmCBY4QI1n7yYS3lU7m94Wh5iwAvgDPekZu1itrMCYDPP7QRqoLGM1fIZ2Ke
	kNxNIgrpRrE0K6dwzR1hSKXsnbaq2DQbwTGPH0JO4AxZUk4Wu7MZACI2jWe+Xy1cVJdj
	VddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SPCWXxny/ZQRHOnB8M5u62bNP+Xbp3rUOWVIs6hBQME=;
	b=PVgQvj2RoHI3JE2e1mdg5TJ08+c/v1gQxEQ3KJNbNicE2m96Zt3imdSIgyvYLUn/mc
	KdxcIblqPHIiwN4mwC6hWIq/LUqISyrQg5pwfY30OIlbeSkEnaZl5TIq7RMUmYZN+LvZ
	N2/2AjLOfK3r5z0Nt7y3Cs4q2iW26HmEKDzhuDWeULb0dkT/3CURLQyf+qJdeUNCBTQK
	+9j8tgVg3Za3MWVrVcCvD1o8oxPvdidDJa/siA+EL9w44gtJ8qshhQM2u+aZnFoZ+DxD
	VE4Y2XBRqkPrQs2lpxSpzkDHRM7TZSDAOPDw9QvAjWvZae4FOT13NvdyBtj7B9bgErqS
	VbNw==
X-Gm-Message-State: APt69E2MSHonhLxKYkBYqTb81XFr+fFUUktTpgOqdr10PWG3csW69VjE
	T+XG6fdhkkCtOwQ7T1N+KvPYUA==
X-Google-Smtp-Source: AAOMgpcw5SiCFqGbCH/UPOn0N4/73xuLl3haWAGA1kAmaA426PEVM4dgghyOvL8FOYY4KUaYI8bOjA==
X-Received: by 2002:a17:902:7581:: with SMTP id
	j1-v6mr6602038pll.218.1531061142602; 
	Sun, 08 Jul 2018 07:45:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:3c1b:9cfb:14ee:ef7a])
	by smtp.gmail.com with ESMTPSA id
	e186-v6sm25076064pfc.13.2018.07.08.07.45.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Jul 2018 07:45:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2018 07:45:38 -0700
Message-Id: <1531061139-14602-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
References: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/4] libxinerama: update to 1.1.4
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
X-List-Received-Date: Sun, 08 Jul 2018 14:45:41 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxinerama_1.1.3.bb => libxinerama_1.1.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.3.bb => libxinerama_1.1.4.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.4.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxinerama_1.1.4.bb
index 367ad26..edce35d 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.4.bb
@@ -16,7 +16,7 @@ PE = "1"
 
 XORG_PN = "libXinerama"
 
-SRC_URI[md5sum] = "9336dc46ae3bf5f81c247f7131461efd"
-SRC_URI[sha256sum] = "7a45699f1773095a3f821e491cbd5e10c887c5a5fce5d8d3fced15c2ff7698e2"
+SRC_URI[md5sum] = "0d5f826a197dae74da67af4a9ef35885"
+SRC_URI[sha256sum] = "0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


