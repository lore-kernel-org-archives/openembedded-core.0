Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id F12D56B50B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 20:25:52 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id u3so9420387lfl.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 13:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RgR0V6mWQ83MkyT3osRZU4xRPXqE63Z6fCrbJBUVjfU=;
	b=KSbKd9VZAJeb/WtGS6gxSF1NzAYMmzmUgYhCVVzuHerrEjP89VDUq0sw9ugxyQK02/
	9p9vywqXb3lTszuWgmgwEfRPa4ZxGTLwqlcmQDUa2vPL0PZDFNmM3cbOX1c/W5ipztHv
	ZQntmrf9WSU9HdLaXZHepVZ4hRH26EUASj12XD1+UTC7H19+GhM4PzM2Y0a03XitWRt+
	DlCKAxFU0Cj4EB/J6D0OGDyCnGjMwPJFYvV++m9g1BVJq20b76+9Zus9c7uPV7Uw1RNG
	6ptexU/fd2sBViaf9KR5IZfgSNXkPLhcQku67mE6JivFUrSDYxHXOhUAyhoN79VhKD3s
	etpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RgR0V6mWQ83MkyT3osRZU4xRPXqE63Z6fCrbJBUVjfU=;
	b=pfwIItlTfLMVHS53H5hH34icgRKEtuN63ATjnhacQpSKhmJtk738epjMNHPRVoqiTC
	H6ypjZFTch/ZVoEm8uM8iBjDR2TazkNPXSfokdDfmOg75a6fYbV2wEf+uoEvpDWMMQ22
	TFTzwo3IEeuAurJ/Na0ldYJCaMxXcLykd7PUDIR1GhnMbD28LjSCFCpJgDS1kmGvXD79
	VOOTrLRYi9C2dXnYdMcbo/8mfcU5/AycrFQV7gsj4yHpW9A54sESypSwXgDFNcUI2ri1
	R7a8J7vulVViCboD5WnOxy73cHkHWsFslLNXePGoERjq7Nm829vNZQcjXvwrBOk8KKx/
	oKjg==
X-Gm-Message-State: APjAAAVDPU9Z5eNNQAB3d8vvmaJp9g3NSkIf6uCQjXusLi6Sjr24Vigb
	jqtqR0hVEeZtsuNQmTec/wIspX2QVeE=
X-Google-Smtp-Source: APXvYqyl7Yi+TQzD5D97hSaHWpXSzGEyb2m9aa0plTw/2Pu3cx2FOX15RmQpcqNGM/7ivlIIdUVA3g==
X-Received: by 2002:a05:6512:210:: with SMTP id
	a16mr33541839lfo.42.1568492753004; 
	Sat, 14 Sep 2019 13:25:53 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id v6sm7147100ljk.17.2019.09.14.13.25.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 13:25:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Sep 2019 22:25:43 +0200
Message-Id: <20190914202543.18462-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] expat: update to 2.2.8
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
X-List-Received-Date: Sat, 14 Sep 2019 20:25:55 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/expat/{expat_2.2.7.bb => expat_2.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/expat/{expat_2.2.7.bb => expat_2.2.8.bb} (81%)

diff --git a/meta/recipes-core/expat/expat_2.2.7.bb b/meta/recipes-core/expat/expat_2.2.8.bb
similarity index 81%
rename from meta/recipes-core/expat/expat_2.2.7.bb
rename to meta/recipes-core/expat/expat_2.2.8.bb
index f213bc3c3e..0ea2edc122 100644
--- a/meta/recipes-core/expat/expat_2.2.7.bb
+++ b/meta/recipes-core/expat/expat_2.2.8.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
 	  "
 
-SRC_URI[md5sum] = "72f36b87cdb478aba1e78473393766aa"
-SRC_URI[sha256sum] = "cbc9102f4a31a8dafd42d642e9a3aa31e79a0aedaa1f6efd2795ebc83174ec18"
+SRC_URI[md5sum] = "00858041acfea5757af55e6ee6b86231"
+SRC_URI[sha256sum] = "9a130948b05a82da34e4171d5f5ae5d321d9630277af02c8fa51e431f6475102"
 
 inherit autotools lib_package
 
-- 
2.17.1


