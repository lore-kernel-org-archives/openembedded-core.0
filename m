Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 608017896B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 64so15130885wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OH64NLHQfWyr6AfdKpEVF8iS7Ol7b73j2KcEsG5l1Ek=;
	b=ylrhrJYbaqykyqc9OM+z4JR0cVuYJN7RpApDYNvVdrxOUhGDfYraZkobsz0d8ZGUXt
	3iH1ZVoAXc58BHpl0j+rjpYkQ1uG+t3w9AwhdFd3ubXgukj1btIqsjZaOBGyjDUG+Gvc
	Bo3ofR2gb7wVqqD0TTMcNgj+Sup+u32fPvjSKE/aseSk0z6QauHr4jQwTRtScJ6c8k7O
	n/gXlnSaNzncREnaH6icvMZLDOKe015B3lBZbn5yXkIS++iYna3ORKHznpQd2fAIaMCf
	aRX8wWP03Zml3cum078vUXKNYDcYYLJXmqKHObKZnNXy3MWNbHYBH/8Rgtd3c1w1TUvT
	1UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OH64NLHQfWyr6AfdKpEVF8iS7Ol7b73j2KcEsG5l1Ek=;
	b=tGxnzDr0mdE8kUuZIN2D217yfGEBn2Vy6SRHSZ9Kgaef2b7Hqs4+wBI2yyio0NDERw
	W5nJI/um0+AAb88zlvcUApk6JAKq/mirH3EJkFcxO7CIxGEeUzx/B63qB2rRZGOmUGil
	riHNubWnodUz8kNdfOZ9NnD+zksEMlRLijJH72yNoHidfhiBMLOs6+j58XQgoW9mqj3A
	XTZ6QeXLQpIsmIbOEekSawfOQENc9U2SwgQDz6xYr6BE4gO7oPOZyF8E1cQCP+xxgETs
	rCZiyYTYdii9jgcDEttq6Q2P1mqrAM514VD5k1BIrSbT2owffqLORUknW6EmR0UxInmH
	vqNQ==
X-Gm-Message-State: AKGB3mJ8vhVJl/QWKAJzRK1f6RAOOZ99idoTFg/ohgU7QPsafnmZkNMB
	LOZWB46+hqku0LgbIRLyj+IVu0VV
X-Google-Smtp-Source: ACJfBoumYhThjBLtijiAQLC/7pX0J+Ujd2ElvgaCJHFYfFerU56mPjz9zdnJs7IsrH1AdVppUdyZzA==
X-Received: by 10.28.118.16 with SMTP id r16mr8960794wmc.152.1515427245965;
	Mon, 08 Jan 2018 08:00:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:15 +0000
Message-Id: <20180108160021.4715-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 3/9] bison: remove pointless gettext-minimal-native DEPENDS
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:45 -0000

In native builds USE_NLS is set to 'no' so the gettext class will handle adding
gettext-minimal-native to DEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/bison/bison_3.0.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index e5ac5672f86..58728f5021f 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -22,8 +22,6 @@ EXTRA_OECONF += "M4=m4"
 SRC_URI[md5sum] = "c342201de104cc9ce0a21e0ad10d4021"
 SRC_URI[sha256sum] = "a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d03ce10b1bb0716fe1"
 
-DEPENDS_class-native = "gettext-minimal-native"
-
 inherit autotools gettext texinfo
 
 # The automatic m4 path detection gets confused, so force the right value
-- 
2.11.0


