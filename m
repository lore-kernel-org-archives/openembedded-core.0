Return-Path: <koen.kooi@linaro.org>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id F0E8F71AFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 08:30:06 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id q7so44428854qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=kheZWvRXz7xgR3dxhUhmvLkhicQeyzcigxkMM3d6CmQ=;
	b=hsmVrwRwqIlwGBIdA3ZKGKq+Q1PkQS1ntVqQS9NVVWzkuKmO780NqRVVHHB8v7QjQC
	n2umwN3rbVZc41AMYVGqjYsZwvFhxEVjkG+ABXM97KZcdf0/0ywQ3kZv6aeVxU/FKLVz
	gAARb5It3c3+ezcprcwyVLlEwAGj8YrnuAFX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kheZWvRXz7xgR3dxhUhmvLkhicQeyzcigxkMM3d6CmQ=;
	b=aKi5EzXiqIDHgpGDiMWXaLN52gPZzp2yv1injb8bBI44zL1vkQHjjnuDgp9sI+Xsp8
	dDfnEXJCxmWoiWeeWNyVkfq6O7cwn3XMzeKZ7NrEy/jz0wmuApStZuj4YJhJaEFOIXlA
	4nFj8NTmOL48tfHo6N94FBvExoM0Pa9QKJ+m0ilPuTb7+Yz+iuGDEA4hXhX5tIKA6br2
	9JOOST2TtRfyxDKbv9vXm1YM1XMJ1q7H74oqShSKNmbRxNREk7CHNIMWoAapZle6puT3
	6M40fPJTpBTs5KbEcCVPK0i9YZQd0kytYem74QxSvZuU+sdWVrSGzCZXFacv4aep+0if
	CmiQ==
X-Gm-Message-State: AA6/9RnMHWRh+Rddefdt2Fh3pCc7UFEAXk5hEiuSmP/zrw17wykcb6WBbr1iThILspPPhjJ+
X-Received: by 10.28.38.2 with SMTP id m2mr5589912wmm.102.1476952207518;
	Thu, 20 Oct 2016 01:30:07 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	a1sm13576584wju.41.2016.10.20.01.30.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 01:30:06 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2016 10:30:02 +0200
Message-Id: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.11
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Thu, 20 Oct 2016 08:30:07 -0000

Android-tools depends on it and to build the native versions of fastboot, adb, mkbootimg and others libbsd needs to support native builds.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/libbsd/libbsd_0.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.8.3.bb b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
index 92121ef..6f734ab 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.3.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
@@ -41,3 +41,5 @@ SRC_URI[md5sum] = "e935c1bb6cc98a4a43cb1da22795493a"
 SRC_URI[sha256sum] = "934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8"
 
 inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.4.11


