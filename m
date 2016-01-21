Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id EF2C36FF91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:00 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id oj9so1833432obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G00yG5gEcNesa/ckEFDp7qhaY8dyjB++nXM3yt7xI3s=;
	b=a0wTI9alEt7RKLGbtlksT06VBXVHBcqdmV+nFbb2cabR9s6EDoUa5F71xslu2ILvlc
	ghRQix2jsrhYPIb9ohzgy9RjfUlzhdKvbBC7j1ExijO/IDJ3bPY4hiXldxtgi68zidHk
	KK8X/Phwjv7UfuGeT5O9nUvJPMqkGHDaRYdBHKJxHbY/vjG91rl53Stfsy7lamyqRTML
	mhSbRaR0h59Tsi1WdZgAOTt4yzRdsJ8ikP3xha7q3nDKE6ffSEPRVbBnHC+nFfLW5Sjy
	phacnFdjajmT2Tpcrm+wrSuyiNI3uSYk+xywrhJXy+oZWwOHlZrPZhF7bKpKm54DiDmB
	ErVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G00yG5gEcNesa/ckEFDp7qhaY8dyjB++nXM3yt7xI3s=;
	b=E//8F2ajS0M+uKz93UWjoVpRgclxwkKGh8gQtTYwqOxGHwyKKrf/P5B4oFna02viIK
	6GGk76GVrliEsc38642uWxSSrgjUmpkelfNs9x3/jBeciQQukaFpM6D1t1+7qS20VqbV
	0R74qt42j7U5yfriW9GuZV+7ZUvTQTKm4KHABlgrEeivyE5v+sO+JDlTiK09Jo5AppAw
	yit726PV5eq4v1M2HtjJAcqRGnepwxE+BplNDIi6JKj77rKYRBcTdSjkBme0Os0sOEom
	wuhPyQ7+rhaGp62mM1H1C4NJAbzCh3raCrn/axAZiMkeRZrTHsfCQzt6RAuz50fsHF/Z
	FGvQ==
X-Gm-Message-State: ALoCoQk4zBtfmS5UauT2mILgqia3RHzWVRrweAUwTh1jpFp9OUYXzkMhmad64LTuPhCM3CcUHcRmn8Wt0GuewXuFjI8Olwr3Wg==
X-Received: by 10.60.179.49 with SMTP id dd17mr30268393oec.5.1453344241887;
	Wed, 20 Jan 2016 18:44:01 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:00 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:13 -0800
Message-Id: <1453344203-7118-16-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 15/25] gstreamer1.0-plugins-good.inc: remove duplicate --disable-examples
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:01 -0000

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


