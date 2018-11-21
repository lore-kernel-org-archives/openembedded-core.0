Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id C52FE65D48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 13:57:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v13so2328167wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T+S4erwPgshQeoYBRiNJ5lXzizcXq4zx71XHFEGOIHk=;
	b=Is0DhI3eOPj3th5MWPxw7ybIQEoJXj/Uo0r37a6EhodGeFgDWFQaeJgX5SJA1IrSAU
	ie3ABlG/57E2aBso0wML7K72tWAU4TpaBJ3xW1cdA0hAeKIAXIa9RzcUgv7U19Hbu5B7
	/Ij9BkxOxMajj6SBqqoKgEFM+bHo1UDItjsn5+tHHOoc1huByvZgjGmFfgrX1La9Gwk9
	smTA01Zq1v2xNxhuo4Sy+ksxPsCeZZphdBurYk1pDEEeb7WoSunBLdME5Ec3dtcJl2n2
	JEcVHx6hBbLuPGhLhyFH9wKlo33CdTOkTwPkM+fGvAIZAHtoVKJFUjtUre1ulh/tdwy1
	ixYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T+S4erwPgshQeoYBRiNJ5lXzizcXq4zx71XHFEGOIHk=;
	b=OHq0xaeWgDKRNuD1oWda2vZ1Mmcantsn4Kf2l1/xh6G2luIh4gfN1m3Y7BMYYL4Oxk
	lLrrZgJde+EgjjYEw3w4ui+R0T9MChu62QuR1AaVwmTNC12s3d1XFQ6JGIE5HrHdIlBR
	hH7HGRP6dNyyQIvd2UErTfRwsb5CMcFWD4vwdXvEr/aqkZUbEAimaw3BmoO8dg9XftWQ
	dlaZnaTALxsjk28VB+vUdthJZrmqDNeB8bXu2OI4JM0u4rAswZfZyePZThZTjcSjmXaH
	ZL8+2sL1cu+J4yfBvWp6d0cX/18pg0gcinkgyPMg+b6qse4t+Eb7k+Iy8/445CDiRKDG
	seJg==
X-Gm-Message-State: AA+aEWaYiWLDP5J6Stw9fcGv83J1v0EF/yXMKG2L+jNLP6+KuXG2MuL5
	IZIrMSMTPEFz5Z0eVt5bVBZZbAQ/
X-Google-Smtp-Source: AFSGD/VX48/aDCgL4DUg52GrhlQW3DbwP66tlqNOVmWSBHSBvof5iGhwe4glQtHagBUieBJl0PJM3w==
X-Received: by 2002:adf:bc02:: with SMTP id s2mr5727907wrg.255.1542808657106; 
	Wed, 21 Nov 2018 05:57:37 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o8sm11203560wrx.15.2018.11.21.05.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 05:57:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 14:57:22 +0100
Message-Id: <20181121135727.115509-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121135727.115509-1-alex.kanavin@gmail.com>
References: <20181121135727.115509-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/7] rpm: update to 4.14.2.1
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
X-List-Received-Date: Wed, 21 Nov 2018 13:57:37 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rpm/{rpm_4.14.2.bb => rpm_4.14.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rpm/{rpm_4.14.2.bb => rpm_4.14.2.1.bb} (99%)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
similarity index 99%
rename from meta/recipes-devtools/rpm/rpm_4.14.2.bb
rename to meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 200fe4da26a..ef5d631917c 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            "
 
 PE = "1"
-SRCREV = "753f6941dc32e94047b7cfe713ddd604a810b4db"
+SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


