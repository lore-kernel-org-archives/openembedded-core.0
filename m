Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 158027D5ED
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:29:52 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v13so7875134ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=C+GM++IMwFFK75OSNbkc6xoVTI4jKR135itoS3YJ31Q=;
	b=cfXtCRFF9TviN3/uxydAOhfc94kj04CbxBlRrFzg9cVIDAmipKYRiIFl8VMOboKaqL
	5iARazbl9AXzdFxVIaeXcFNxb3CxrGltPTJlaFaE0t4Fh1+Mb0YZdh58pZ5jxtSB/XRf
	795qtS1GaxrTUrkFWhucZCpt1iL2uqDnrR25zDyisd9WLeEHh5E8KJsF3rgxqyf1al7+
	8+O3ZJG/oKJ2ZO1784e1Q30+iLg52JNNc6FYl2rdiPoPkU6Pi4cmrrdQSXwjB6BTOMN+
	qxRBSZ5hlHrqt0YEYnbk6Dic52QQ7eYu4KzDIBdgDun6KaByzuub7fWE7nXqNz0leuEm
	RhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C+GM++IMwFFK75OSNbkc6xoVTI4jKR135itoS3YJ31Q=;
	b=Y9M6IEwQWpEBEMWEY5AmQw/GvWFO0KPcGpa8JcFnibCrzvId6n5kGBTjvjSnrrN4VR
	lKCiHGwF77/nwzH1GeO8Clp0RVP2/X3cU1QqUR6QrhB17onqQkxMzzkYrJFzullCsj0Q
	n9LftIZW5U8OzPc88RFuPKgbkBopRoGiul03kspWHuwT3pkxO+w7pOw9CzmeCu6DPhaJ
	x5pA1D4hdbV7ihYkrE0+cnmicUu738ghQ6LojrzBnC0G9fd/deRi8KGSGZu/C6S71CWY
	l7OSA3G7rIo1TPSjLQeAjLu/5N1fmxZCZUHN2gjB5tYmoCrzSu17FmhN4RkU6oimCxJN
	nmNw==
X-Gm-Message-State: APjAAAWjKlc1er21Zw9c2gZNyUMIff7kq4GJe+o+kkk0SE0XNNr02Z2N
	OXSdBLvjSH7zx5jK54XtC5VJasFIt/0=
X-Google-Smtp-Source: APXvYqzZL6mvf4H1J3eXoLkrt8TB1VEJCoU39CDVolAIKrwCGvkq4t8tiWY0nphkhQCJ2zuohvI+lg==
X-Received: by 2002:a2e:6c0f:: with SMTP id h15mr10287800ljc.155.1554575392949;
	Sat, 06 Apr 2019 11:29:52 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id w3sm5486656lji.59.2019.04.06.11.29.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 11:29:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Apr 2019 20:29:43 +0200
Message-Id: <20190406182943.13662-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] makedepend: update to 1.0.6
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
X-List-Received-Date: Sat, 06 Apr 2019 18:29:53 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-util/{makedepend_1.0.5.bb => makedepend_1.0.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.5.bb => makedepend_1.0.6.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.6.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.6.bb
index 727ab54965..2760edd173 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.6.bb
@@ -17,5 +17,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[md5sum] = "efb2d7c7e22840947863efaedc175747"
-SRC_URI[sha256sum] = "503903d41fb5badb73cb70d7b3740c8b30fe1cc68c504d3b6a85e6644c4e5004"
+SRC_URI[md5sum] = "8a583055c84914060c35b6c2f963fc07"
+SRC_URI[sha256sum] = "845f6708fc850bf53f5b1d0fb4352c4feab3949f140b26f71b22faba354c3365"
-- 
2.17.1


