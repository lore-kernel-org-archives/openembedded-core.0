Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 24E0B7CC0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:16:31 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id s23so736627pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=YdI7sNNaZLt+z+LYikEUWHGrFURRHwNZweyJfDkUbjo=;
	b=jeksqgtR5dMHCaYBaKJgdgoQHDLo/QSPxKpQ9ymbuIgLceDWb07pZkKT7vLCwWs0Xc
	mreNZdkMKf7ws9Y9xfXY4Ncj83+HPABpE2HFHVgmut0aHzr3vRwtXmOta9/U0Lr5Z7aO
	m9CQ6kDVLKB0EVsHYXlsG+NWUu5as7ahtQqgJt34pznR/hx+rRx8UbZTpWfPWN/B1JO3
	iFU5n4RKiuCc9xPUILJPnirGHrQ89ZTP6BLMQqLwie5zyZTJo6Z2UPS1KcxPDibO14G0
	dxWq7/GtgEWV1mT6QsLO1pGACencF+YXEc1RfsEyd/afM+i3qb5y49Ax+WYnsYIq7CRg
	NbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YdI7sNNaZLt+z+LYikEUWHGrFURRHwNZweyJfDkUbjo=;
	b=LHnp69IBUNLA4Jpltke84epbo0Oh4fyqcbitasWR3ecboe3mXO+tml+cuOb14KlcUg
	dERxx0qcYMkh+gTvrVo6XsAhlJmq5jQdmCQmyZHxg+AyMxdLHRXeP47Hq1WTU9SmPY/S
	IQKVWKnln3UOe07tYFsgHjeVa3aaBmIRJAxWrAvqspWw6dahhb74Xc8pVlSIc5bGBsHP
	4NX+2k9stLS32H5oCHDea+2gcRhpfU6VxIjQTPFWzMoYCMzA/5jPEIe5i8CCAT4iVOsu
	m4Uwz63BalH2JNJpa4CAHmUlkgoBJ9DQuZ6oW55nUBKVSvAMMDkRioiHdn1C//FGIVtE
	39TA==
X-Gm-Message-State: APjAAAWARWJ4rc4CRbM+56oOmiNtaDV/dQLitRcRFYx/gYqfQUQWNiK6
	SEYmPuNh2t9C/PCImTyzMLlmqo6e
X-Google-Smtp-Source: APXvYqyLJQZacM6wqbF6Mx2hOLUA8QZ2U8LA8tTgNsIV7mOPg/Pi4PdKg2JrgFKfTHZdTmX9mUa8kg==
X-Received: by 2002:a63:4650:: with SMTP id v16mr572609pgk.329.1552281392973; 
	Sun, 10 Mar 2019 22:16:32 -0700 (PDT)
Received: from localhost.localdomain
	(50-196-139-177-static.hfc.comcastbusiness.net. [50.196.139.177])
	by smtp.gmail.com with ESMTPSA id k9sm7512565pfc.57.2019.03.10.22.16.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 22:16:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 22:16:20 -0700
Message-Id: <1552281391-31620-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 01/12] xvinfo: update to 1.1.4
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
X-List-Received-Date: Mon, 11 Mar 2019 05:16:32 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/{xvinfo_1.1.3.bb => xvinfo_1.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.3.bb => xvinfo_1.1.4.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
index 2965ef7..a913ae1 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.4.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
 DEPENDS += " libxv"
 PE = "1"
 
-SRC_URI[md5sum] = "558360176b718dee3c39bc0648c0d10c"
-SRC_URI[sha256sum] = "9fba8b68daf53863e66d5004fa9c703fcecf69db4d151ea2d3d885d621e6e5eb"
+SRC_URI[md5sum] = "b13afec137b9b331814a9824ab03ec80"
+SRC_URI[sha256sum] = "0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f"
-- 
2.7.4


