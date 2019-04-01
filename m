Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE7E6C42C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 02:20:39 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u21so5092963lfu.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZTW6Q+ZHSp0qwqEJ4auyODWUue3vJtyZM9IUyNRRHis=;
	b=ksnTfwtNJmcMI7mp167G2re34nTyNFwg6u94rd2zuqP5CPUSmQ+TYtTJ1b9O7B6bCv
	f4c1exdukPz0bYaeBGVd/8rACxgjIiSRjSgtS3Of7XZFcCIJrLaK6t9ZWtP/JUOvKOhX
	CP4nYa7Yv6CJTe6J6w0Y8t+CGuVSwnbH1yw1+JGUu5q8UtAwTDkUW8/ujz65rM5VFBpS
	DOPXvuhAxkNVZzsXXiBaJwwazSaqadHDRZ9xFDfsATAnoIkS9rsMt/qMafrtIdJPK0lf
	GkdJnKPFXeiZ4XKPh9h1MOTKPpaYLNLOKWSQIDers58sZ/uSTNAn4KnJldcRVSVpyHuM
	84Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZTW6Q+ZHSp0qwqEJ4auyODWUue3vJtyZM9IUyNRRHis=;
	b=Gj2n3nSnoEcuNX1y2JR5cDnXLRmwButKjDdV9KIHR5PPDLJ9q88GMoJaT8Kb/Q0sMN
	XKnRaBYjz8+IDEa0pUMGuKUgXRIojwhBthadYyQNVch5rR2D3pYchX0KpMd6gxX0EVp3
	Bvn0yo0hb035rFdzGf9w4eZ6GmeQgK2h+mOJLJh9JEsUICeiRdq5ahfm19wi4kXfoOTj
	B/eZhuo2IVgJAFvY888+b7s61TaJRNFmxcA0w5RsPEid2l9LA7lcl4GOfmrWbz690k9f
	KjibjZW7eph0JizSdQlG1vbxM5GDmjZuSZGbE4iFDRCEbApVEUyWRbPgZpkcQX78N5bf
	uZbw==
X-Gm-Message-State: APjAAAXSDixnqLBe9K+sWTIpERIPJz56fcFMNLgOhtoNBLJ6l5/zguHM
	W2KnPHzChzKUsUPWZVoYJi5kADLfktk=
X-Google-Smtp-Source: APXvYqxQYPfoeoVUb2fvRzu4PmoYYKY+qW5q8NSUPGuqIwveO5z/bY4adpK9HANvTyfaxglyl0tJjA==
X-Received: by 2002:a19:ec14:: with SMTP id b20mr17336560lfa.55.1554085238781; 
	Sun, 31 Mar 2019 19:20:38 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m10sm1576480lfp.10.2019.03.31.19.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 19:20:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 04:20:35 +0200
Message-Id: <20190401022035.10074-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] cronie: update to 1.5.4
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
X-List-Received-Date: Mon, 01 Apr 2019 02:20:40 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb} (94%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.2.bb b/meta/recipes-extended/cronie/cronie_1.5.4.bb
similarity index 94%
rename from meta/recipes-extended/cronie/cronie_1.5.2.bb
rename to meta/recipes-extended/cronie/cronie_1.5.4.bb
index 3abca7f920..d35c6672c4 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.4.bb
@@ -16,7 +16,7 @@ SECTION = "utils"
 
 UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
-SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
+SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "703314f58a49ea136e9966d3937d9bf4"
-SRC_URI[sha256sum] = "370bf34641691489330e708bd4cdbd779267296a030668a12f77b7e36872fd75"
+SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
+SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.17.1


