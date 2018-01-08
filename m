Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CCB478961
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i11so15117517wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wOGndAp9hCXz4Kr3Krk4mCVWnT+TocDrs2H/Fexunh4=;
	b=s3CkrIsrwqHcUL/F3YTqdKXFRaU1PaxZTJ1vkMtpcWFDnEABtpQuXk7f9tRLctgj9t
	ih5NiUBKWyDJNTMq5TIDgqms12sP3OIo8cXUEogQ7WSGd6tBqGp2E3Xl6aU/g8IAOJeM
	B1YdXQ5/HbrIC1JHeOZLzG8iHN9JxOtK42EsgZjRVRvz+GHEYq/DuRGOqhSJbzcaphMV
	gpAwCKdvFLDB68QXsvEc5Y01LxwmJ5HyKPcMBlUBMF8l0bFKswiTwzuY6NjqBUqRejbg
	hN4i0wlAbs+N9WXzJo9pjEkwEkj3wd86i4CT+BGxegTVs1tRHLS4dzey4xVo2fuuLK5W
	8fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wOGndAp9hCXz4Kr3Krk4mCVWnT+TocDrs2H/Fexunh4=;
	b=r2xDQJIrT7s11hyqttAzqMUXROxtzMDxx424iOAmCxPigDqQ+LSUi6Se+nYWAuka00
	GinZ8LKVH0Vc9dugX1OfEhVu2w51NjBWqy7lwvN/g+bpvgULQG4V/bHPfCtCSRnhdzN3
	EPYWBzYsfrVdeqY3DRj8urTo/JIheQtO9TG51t4pgvr2ZDQQglVBDY2CAhs3W7SjDqlf
	vbaZj4bVagg2qocFbPPG5zBDoeU0qCUt746l5suThhM2OmSxsFdy3x1jAOPfYtiLeXRh
	YxKznuYx3hEQ7IOyuZ2R1eTJSbjDIl9jDIZ+oFoMireYS2m18508sl26dGnYi8rcnRGk
	q1Wg==
X-Gm-Message-State: AKGB3mLXvfUKycQiw01XyGtTukePn0BDVUHl07QaANHZarkKjrNDGNlY
	XkNMhjsV1/+b2OMwwJdEdCkYU/r6
X-Google-Smtp-Source: ACJfBovlF2e5wlHAndVP0QWQ/Y7CRWofXB/d1wMpa/VH6uio7Y3iA8AelThC14zVDo+UFmkW7QUdEw==
X-Received: by 10.28.22.67 with SMTP id 64mr9300368wmw.28.1515427253506;
	Mon, 08 Jan 2018 08:00:53 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:20 +0000
Message-Id: <20180108160021.4715-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 8/9] libcroco: enable nativesdk builds
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index b0af75919b9..465ed15916f 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 EXTRA_OECONF += "--enable-Bsymbolic=auto"
 
 BINCONFIG = "${bindir}/croco-0.6-config"
-- 
2.11.0


