Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8277360720
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jun 2017 05:58:49 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g76so4583493wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Jun 2017 22:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tAOD16S6qKcnhKhQ1mKIn6GqzHOB++VoTgBynqBv+TE=;
	b=Yc+HlJTRx/85skLz+aiRTYjIwiCZ3J7PK1DSPXCidKR/7kFkMbjY2X4B2nQZE5sY7K
	yb7kbutv4MQSfN+r4DrfIUGAKyM/86ecXAjfWJlHtIfbueqETJT6AM7X3Np/TiyKMqZk
	/r5WMdRWEHQ0SxHVvZM++eYcUbhIkuX2T/KgC3x8Lt/fS9/UKFYGAqccB6DJYM872Paa
	GbkxiZn6TUU0q4+aLgRpZ+5XZkawgtF/V32KXrdduZCzR7dJb4cM5DwOgFfyp1BHBEAb
	DrVgx3q8s7aMMlsTEioyg07wM8A8g82fgBdNsNALhk9kOkOqQEyGjvSnlqXRE6xxH23E
	wCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tAOD16S6qKcnhKhQ1mKIn6GqzHOB++VoTgBynqBv+TE=;
	b=Gpuoflhdn1ItUHSS5wGPhwOiz1Td36BVE4RHdsQHi0QaYd/g5PpPI3HhS4xv9An0XG
	wdoyRPo4iXqzPP+87Z+NAoCV7OMdcW1HHYI6dqiHHCApcMI6N35R6poL48drZ2DRSX54
	syon+uWEkoi7Q2wDRXkn4PUqPc/1rJ9FCqgUIyeVBEpy+bqINGoZmXIbx8ICn/Lb7ugG
	125AdjZMh0Uezy94UpjHy4JuX5uU0KeAf6fQXW2iPc3XPIUjsseTO72YkY7npWQ1Ne3J
	Q2xCvxSN5Wx3SMw572jjkWvWirBH9SdowcSyAtj/PeuKhlfc+2DsWRj8CkqMJgACf49U
	BUcw==
X-Gm-Message-State: AODbwcACmOlZjZsPeJ4c6esvjNwmh2C6WotSonrDgS731K7l0zRc+Rok
	w7xymqkXjL1tQYCG
X-Received: by 10.223.171.196 with SMTP id s62mr4293230wrc.119.1496555930007; 
	Sat, 03 Jun 2017 22:58:50 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	39sm28468597wru.50.2017.06.03.22.58.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jun 2017 22:58:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Jun 2017 05:58:45 +0200
Message-Id: <20170604035845.29796-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [morty][PATCH] eudev: set LGPL-2.1+ for libudev package
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
X-List-Received-Date: Sun, 04 Jun 2017 05:58:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.bb
index 211252cebc..857d20db78 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -1,6 +1,7 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-LICENSE = "GPLv2.0+"
+LICENSE = "GPLv2.0+ & LGPL-2.1+"
+LICENSE_libudev = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
-- 
2.13.0


