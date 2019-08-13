Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 419207E721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:27:39 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l14so12512297lje.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RinyFrXxUxcJ0Pri7AyhOMl7p8gQ7kovY7SP+N3bnnc=;
	b=IFAMXWeB3868hS/tWeVklBZgZKd4w0jJ2ktBDJhlu8h1aSa1B5qIPvfeV5VXj9poth
	DKBK2E0/ZAI7z5d6b5r4sxglUWRJXCaLGkwNgzP7dJA8CysKMCtTfjsHm/DsTm67J/Eg
	5Bbqp4Sk2bmjdh/3njSM7fiy27OtA72ccgbmu8Y8Cfl2Rv58/e46EBwJWAWgvVe8/vKA
	ST5SZmJ9w4M2pvGzJqv6rR81pbaBYRBPlOaw5seW5orhwsOhTqSokBbtW+VLIMyFCRM1
	3F6ZnfFZ/6sbFgPHix/e8Cwd3CGrThVgnQhJOmxXjsuQu8ID6K55BMUEEIUVUu2/GDkm
	/rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RinyFrXxUxcJ0Pri7AyhOMl7p8gQ7kovY7SP+N3bnnc=;
	b=dYZfYRafX6kZo3ptT8pxZ3GR2V3q4hBnzXfpLep4Tv1aa6cxcPZzBEcNGNsLmEsK+B
	K/pKkJIWM28f9kNvDG2s6ntMgODoiFprxbcQAzHT3woXOsIr7M9+YZNKZracG873qxAX
	fEBHkWPjjRTttXR4XhtCHZ+CeOHPaC4cTcH0Hgsug2eOW1A76XHYQOeUGwuXpuna2djT
	NuWbm8Jx50FLpN5jtJrPiHsc3cdUUdlFR2hmOGWyVJCJ9xm/HbsrXK/S9cq4d0vNp5u6
	Q061CaU+hTcKRe7rI3fmVmyl1tL5kk8aHGCiocwqDhXOfYWUUlYiKXyJRHponlQ4jab/
	Bhsw==
X-Gm-Message-State: APjAAAUFMeSs6hr13nboX6QdAT1LErcDTfuvbQLmTp30Od6fZbNt+4GA
	ifBDTeg4Co4n33zO5kWjE6rhGhFtYUA=
X-Google-Smtp-Source: APXvYqx27/khz+TJIs5e3+B2YMUKdi50/3gVHuHL+pforTH1JueHXcnZmlg53CAt2Nv8yMtbjcak5g==
X-Received: by 2002:a2e:8495:: with SMTP id b21mr22136459ljh.149.1565720858838;
	Tue, 13 Aug 2019 11:27:38 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r21sm6383562lfi.32.2019.08.13.11.27.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:27:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:27:32 +0200
Message-Id: <20190813182732.20799-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xf86-input-libinput: update to 0.29.0
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
X-List-Received-Date: Tue, 13 Aug 2019 18:27:39 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...input-libinput_0.28.2.bb => xf86-input-libinput_0.29.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.28.2.bb => xf86-input-libinput_0.29.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.29.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.29.0.bb
index 19123e06c9..f87083e575 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.29.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "b7548bc1d7e82d189205794ff86307af"
-SRC_URI[sha256sum] = "b8b346962c6b62b8069928c29c0db83b6f544863bf2fc6830f324de841de2820"
+SRC_URI[md5sum] = "d600e8e2e30747b8ce49ec5294ff0ab6"
+SRC_URI[sha256sum] = "c28b56a21754b972db31798e6a4cf4dc9d69208d08f8fe41701a94def5e94bee"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.17.1


