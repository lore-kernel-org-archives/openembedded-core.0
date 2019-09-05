Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 173807F29D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:22:53 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y23so2602321ljn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2MpzXlWj4P427rYF65PbfgYibOWWCWstCmL24hlZo/U=;
	b=VYa3u2ODIO+6GkNwa6aCItsJe0gNVkXs3XbF+A24K+J61wwVgDm0drpApqq5phT1Bt
	10sHUYmaQlMak88LMHzoF+zIJ1PAqeEMKQcLhokJhyk08O3A1BDirD7A//m4XA3Lomjg
	pClO4GFU5s0JfJ8zaAMM8irPFKas/Vceazb6Sex6XIgUziQBjQOwcVvkStHvrTZLMzMD
	Sg5JB3+o/H9ahIAJKSrfnuFcaA9v60pOYWyshwUjkWh/pHBORFpSJmeUU03Qxf1Xic38
	4A5N9ob1K2J78ZKb3xcwMe7x4yW/pcpu5d7507V4xeg0tPeg8MVA8YeRE3ZSxrBmp01i
	zO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2MpzXlWj4P427rYF65PbfgYibOWWCWstCmL24hlZo/U=;
	b=kmuY2wO+juoVOMZ3baPMsCZcQAtNuYgzWSKbGFKkes32/yNEgA+Yh3xcc6ZXons05Z
	qPHN4wQqIX6kjrOuYpVNamXVHVUe6QPu2s0Sne8TFjvMAdJyqhYqwdkXXoQusDfPN05k
	/MOCQRJ8v+H02Apxc6fqCT5tiXlaQzkV7jhGRdtsKkjRhz0yVPRrzymwFHu38SmD1RQg
	OcEAwnZEDU08sJlPB5RAQwJiaVDtjgU9UiK/wW70lmiwfVg9Jl+mknGCWkNKU3nA4TNK
	nYpp/dQCZLpmh88nZHc2WmX9a53E4ATK+4aQe2Rhdv4oAXiWnoK6ME969kGKiF9TvI4F
	ZGwQ==
X-Gm-Message-State: APjAAAV+THRJ7xPL22bKJQbCaiRM4/u4FMw9ibOx0hYhTG1rbTNGEeTe
	B8+RiAmhX+SlXNsdkJGmOu4mBiN/c/4=
X-Google-Smtp-Source: APXvYqw1o51TBddzp7AUik0JPFai1gm/VNrICJpAhfYwna8V/DY4/0dGy7aZLZvz5FuL15W+AsraTQ==
X-Received: by 2002:a2e:87c4:: with SMTP id v4mr2577708ljj.234.1567696974259; 
	Thu, 05 Sep 2019 08:22:54 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h9sm493386lfp.40.2019.09.05.08.22.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:22:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:22:49 +0200
Message-Id: <20190905152249.27953-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] libjpeg-turbo: update to 2.0.3
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
X-List-Received-Date: Thu, 05 Sep 2019 15:22:54 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../jpeg/{libjpeg-turbo_2.0.2.bb => libjpeg-turbo_2.0.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.2.bb => libjpeg-turbo_2.0.3.bb} (95%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
similarity index 95%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
index e1df754b76..15bfa340b2 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
@@ -13,9 +13,9 @@ DEPENDS_append_x86_class-target    = " nasm-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
+SRC_URI[md5sum] = "bd07fddf26f9def7bab02739eb655116"
+SRC_URI[sha256sum] = "4246de500544d4ee408ee57048aa4aadc6f165fc17f141da87669f20ed3241b7"
 
-SRC_URI[md5sum] = "79f76fbfb0c6109631332762d10e16d2"
-SRC_URI[sha256sum] = "acb8599fe5399af114287ee5907aea4456f8f2c1cc96d26c28aebfdf5ee82fed"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.17.1


