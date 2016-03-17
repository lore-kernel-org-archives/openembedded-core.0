Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A07FF60116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x188so518190wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1MwP6trhutNSzuOXJsMowj691A1VveQbv0yPxBx3vo=;
	b=WloJyIPzcdlKwh8SC8QSdsY3zXtsIJ2MhuZ9Y3kob9C/TEu12DjQj3z9DDbFC507Tw
	fRvqLgzetbIHRZzQ/nzn0z8muDeTjVZPzCQyQWhGyidnTFAGphC8JlxkMXmL3LY2VaSy
	ymoEYZHYB0VKHmanH2z/HGuWLQ0f3zXXd6gGfQGQ7X5OJP/G88Vrr6Bh9o671qi2io3R
	sif6OGc2+KYypkCTiIu/kTNZNnIQ1hp3O/Iwe9aeZaqQBInCli4zpFKK1fVz8+KQ63ii
	Yk32zKNWvlaqKsFIZJ/JQMlmWYqN7XBea3ive2jXTfvsKfWQbCTTFCMzYHRoDXS//1CH
	DRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f1MwP6trhutNSzuOXJsMowj691A1VveQbv0yPxBx3vo=;
	b=GcNvBrOCbiiifyoxI2+V8b6wBOLbBRjIkROpb3kdIUUtGxysv9qR5y5LZAcBxm+xqH
	9oEs2VeX9nC1bQ/hpTHeJWSFQH+KwH32kYU3cduGTCAmP1cdlhwUDRP+eLsdaIKzXHvu
	XYE+ZzXw9M2ltYEwIDk+0Jal2fo+GN+0f72vEBU6BkuhG3i1dxKqKnWypUDMNFvl25DT
	3v/ajD2/fayUbMVTr7/thyx0+qwxUVv8yKrsQ8gIMuR3QPihXBEs9oe7BLfWYYQpcbdt
	YpdDStOtNYSlUYPQeB+/2Gmp9K+fE19niBhlmdugnOCbQtKUtTSfAN48pygo9Aq5RDfT
	cVAg==
X-Gm-Message-State: AD7BkJL7i4SuWRox56JBC/TKy4hkTj24kgmZ0TPHJnHFayUWoKBgIuTOWhORBfHIaR5UdQ==
X-Received: by 10.28.63.13 with SMTP id m13mr39602187wma.55.1458235177571;
	Thu, 17 Mar 2016 10:19:37 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:22 -0700
Message-Id: <1458235169-9267-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/8] bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:38 -0000

Support for gobject introspection was not previously enabled by
default, therefore it's not appropriate to backfill into existing
distro or machine configurations.

  http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-features-backfill

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7ed5ffb..9cec7dd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -761,8 +761,8 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data"
-MACHINE_FEATURES_BACKFILL = "rtc gobject-introspection-data"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
+MACHINE_FEATURES_BACKFILL = "rtc"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
-- 
1.9.1


