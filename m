Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id B6FCE79AE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 02:52:13 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y198so7667724lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 19:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=aBw/urAgmbkd3VyVk6Kk8D/7rBPoIKOQO837YCeV+ug=;
	b=WALItje695mAy39iQarIsRDtAyPGbKNI/1ZAY7PYi0cimhmuwM+ye+vRFW5Ng2HmDJ
	BxmL63BF1lbsA7giISgMwtyvYmL2VX3g6IvRrVsBxOTTCVtIzZS7XC41eHx1uS0KOuqj
	mSipJpk06PypJM7g6/BLB1CuwnOFVnmN6sSNCOEs5mK/BmPF9i6RVVi7pmjThQkG/S+y
	lqJxO8tiVkSFbBB0mXgh+JgTSkQQOdR8ioxZN6LFWdSxaNszTBC5gjECQerpqGjSAWua
	C1Np4tYP8SKkohYq2tjofcrd1JUQaYYG5ywBsL5pvN28bGNEqKwk11WkkIIFGv6AY2gs
	V+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aBw/urAgmbkd3VyVk6Kk8D/7rBPoIKOQO837YCeV+ug=;
	b=kipmTuZkvc3ysLTtGLsAWRcl9DvZQxbQwn1ZXtKIMutc31YeQu8g5T7iL9BCQDZ1vV
	Y6JpvERU9OXSJjtVgHRw5LCtLgyS7NMgnV2YUKgPGbjMOvlSEwgQvZVkBnCsJI3qnLbx
	wmFX6BMDOn0X1NNx0LhxNb1fXrhpbSorXRHoKW0Xsbj1PhiDZ2UBN9dy4hPh4tHtvTGh
	dhCPxasvIazOz8v4AlISoE7dOoch6uYlYIlqLFmSOZO43kwxM/Wkje8LkiLAB+EX9liB
	3ZQRXEcRITFrHvqpkud64/ZzlAXjpvo1LDuisWNaHuagzcavuZD+0RKvGRgOvRkndhP5
	WO9Q==
X-Gm-Message-State: APjAAAWpMUaCb0hg0ysLFdazO01oQNFiMezTeO92NahlSJ4ssoPY5SzU
	AIZ+qms4zLeo7lPKHdPYghAiEurCSYU=
X-Google-Smtp-Source: APXvYqx3COauybB6rrGXA8qXxpORh872ANVCClB+adonj80ld5gn1Nvo+ugb38yHVLZ1Ztda+gIGWg==
X-Received: by 2002:a19:ec15:: with SMTP id b21mr11325382lfa.32.1561949533850; 
	Sun, 30 Jun 2019 19:52:13 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d16sm2187731lfj.41.2019.06.30.19.52.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 19:52:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 04:52:11 +0200
Message-Id: <20190701025211.10437-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ruby: update to 2.5.5
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
X-List-Received-Date: Mon, 01 Jul 2019 02:52:14 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/ruby/{ruby_2.5.3.bb => ruby_2.5.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.5.3.bb => ruby_2.5.5.bb} (94%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.5.3.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
similarity index 94%
rename from meta/recipes-devtools/ruby/ruby_2.5.3.bb
rename to meta/recipes-devtools/ruby/ruby_2.5.5.bb
index 519daf294f..8ad59a7657 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -6,8 +6,8 @@ SRC_URI += " \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "20c85b67846d49622ef3b24230803fef"
-SRC_URI[sha256sum] = "9828d03852c37c20fa333a0264f2490f07338576734d910ee3fd538c9520846c"
+SRC_URI[md5sum] = "7e156fb526b8f4bb1b30a3dd8a7ce400"
+SRC_URI[sha256sum] = "28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.17.1


