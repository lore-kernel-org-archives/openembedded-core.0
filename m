Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 36D60789A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:21 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id y22-v6so50233wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dXpwTBOD+Suee/gSopdCp0aDbcbCINLeOhSaJQ5KC+I=;
	b=n54lcGDQnxInCsOrj036PvbIn7tOgM1TJqOIbFJ+u8YMuiGZB1s8Zz9wvfXA3pFokO
	HrbGUFdfBlImrz9dKjvT5p7haSt9YMRX8gMlrhBGkRA7C8F0BTF5JQ7nU4tM7ZGTNG9X
	80iFrugirSvVuTUOjRlP5EoKAoLgYfPxNZalAKJx7ZK+5DbGGU0LzGjWgyvuYezgjCrv
	QCrmWkzFTiT28HNhRhJTMOmYPYIgaNG9xVDSmHCLg1vmaVk5uZg+yO8STH0fh+1gBMLY
	JQRe1wFZuswDIa15iFlr1XKdwOTSdVlNFQTE5J0n5rXCXVp2RXFmzUoWPnZxU07qbMoY
	+JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dXpwTBOD+Suee/gSopdCp0aDbcbCINLeOhSaJQ5KC+I=;
	b=peSM0ssKV5vlWFmBEjZJPLq4qgFENEKvxVWDIoxM4jEM6s+myMbus5vCQGnLSBJiHj
	phZQRAktXRmR7OWPUo9Cf1ejO0IYJlYUq7mNhLj5ucapkR2e64owuVSnkcrwr3ohsYBv
	0EgEIPrF+1V66R2Kj4fV5to3ux5Iv3QLDs+iMIFT7vutTexoF11B7aeTaY+/4Qgbu6Qr
	kXuu6TRFPO1zzBL5S11EWxnXtsYuRH5S7DDRh5EIjow9e5qIpcGK1Q2Md1WTNENDDwxt
	DxlO9jNlfeU3qqJEuMdTn4GtIp163GNE8QaZX9kX96lYZLnMJOhhmNVDQllhqtfa6/9u
	Htug==
X-Gm-Message-State: AOUpUlEaNWH3zSUznRXpcs0M2C1PHozV2YE8jSRmqclrxzJMzyiRd1Je
	wPDlwrqzHNuEpscjexQW44/QYpG8
X-Google-Smtp-Source: AAOMgpd23cE8AfUQsJXUdYlomcKvC1uZVPb3VS2jN13pTD8hwiQCHJF4tTO6Vtrz5JHdn0f96angPw==
X-Received: by 2002:a1c:6709:: with SMTP id b9-v6mr1890442wmc.68.1531845561539;
	Tue, 17 Jul 2018 09:39:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:01 +0100
Message-Id: <20180717163910.3196-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 06/15] libgpg-error: upgrade 1.31 -> 1.32
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libgpg-error/{libgpg-error_1.31.bb => libgpg-error_1.32.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.31.bb => libgpg-error_1.32.bb} (93%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.31.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
similarity index 93%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.31.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index 5dd861501eb..098242ea105 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.31.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -15,8 +15,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
-SRC_URI[md5sum] = "5cc6df0fea27832e9cdbafc60f51561b"
-SRC_URI[sha256sum] = "40d0a823c9329478063903192a1f82496083b277265904878f4bc09e0db7a4ef"
+SRC_URI[md5sum] = "ef3d928a5a453fa701ecc3bb22be1c64"
+SRC_URI[sha256sum] = "c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.11.0


