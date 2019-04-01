Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id CDADE6D74B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 21:37:29 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 10so7408359lfr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 14:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WEnU5Jt2PlfRNlomPDjoZS9PI8UxHXf7VvqqMlX2WLg=;
	b=WNol6oOEBi+KvsewzlbQ2jVpmGv8Bd4zy0KnaNtnYWov5ohr3WhpQyMosBevU+p9l3
	S4ciyQky53B6y9pkPhEVQtbceST6EOy6uGUrP+QvwdcVvA+1OhXuK+8MmB5ciZBij8Fn
	Zpx269uaTYLSYPmO/JTx4wPzGrr3QCWgTJiYk/y7SUoHhTzz63ILEguD27x66pPdpbY6
	Kmc9vTooXV6PxeFATmen5pqGaXoh/WNhDp80BIPXkAGmg5HE1Ln3Hmf1aqCEhAqOIDuD
	RxRpGIAvNul2wddKCxPoT08YvpT7OI/h68rJ2xenLPc22M+k2uQ2fGTCY7/VPZGm1tou
	9Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WEnU5Jt2PlfRNlomPDjoZS9PI8UxHXf7VvqqMlX2WLg=;
	b=XJiAnf83n3/GPp9eGx916dhOOsiSfJpv3XJfxxnuE66kFR1yzNh6QktPLf0BCKUBPO
	xf3npf1dbO5A3lFAa/G2x4RTL7sen0raKRkZRGh9M/kZ5IYOuDcNF+CdWVXkLPDeTcvN
	HHZ/bf6hmH6U3PKNVIaHrEh1wx/ZQwfreEhVugyoWIn2vejQCGExczLaCIy/t49r0VXZ
	w5oab26UDe8tIOkFsGOllIMaoioIJB8AS4IyO9Yx9pBthHNT+7/q0Jowc8VhNHGedndu
	b289zeyp/oXkkzaTKCvM+6KP98iAcRMhScR+6lgtKXCzOzQFE/MgpR++60SNJ7vm+dya
	BOFw==
X-Gm-Message-State: APjAAAV6jtWgdifBjtdQzEN07g4MIXLB8G4kQjNPeQebtEG5++m1w/5E
	v3A3WUdPlS64yMbprnkISHmeyspYD6Y=
X-Google-Smtp-Source: APXvYqx1zBQyiGDoTiseL5ukUJPntwdfkqLK4sgXbXYK18HMIVBd/yGdmuuM71LKDMCw4AHzYJ7YAw==
X-Received: by 2002:ac2:4310:: with SMTP id l16mr22592466lfh.58.1554154650228; 
	Mon, 01 Apr 2019 14:37:30 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id u3sm2430110lju.51.2019.04.01.14.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 14:37:29 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 23:37:27 +0200
Message-Id: <20190401213727.23667-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xtrans: update to 1.4.0
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
X-List-Received-Date: Mon, 01 Apr 2019 21:37:30 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{xtrans_1.3.5.bb => xtrans_1.4.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.5.bb => xtrans_1.4.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index 200716fb02..5bf134b5f8 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -22,5 +22,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c5ba432dd1514d858053ffe9f4737dd8"
-SRC_URI[sha256sum] = "adbd3b36932ce4c062cd10f57d78a156ba98d618bdb6f50664da327502bc8301"
+SRC_URI[md5sum] = "ce2fb8100c6647ee81451ebe388b17ad"
+SRC_URI[sha256sum] = "377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773"
-- 
2.17.1


