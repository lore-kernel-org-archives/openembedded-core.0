Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBE27490D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 23:30:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q10-v6so9605391wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+f4ZPNIMnmHmsJK8KZSSAETp8suQ4GZ8adfB/BOBIhE=;
	b=NYh8vjO6EYYEgDjIuz+H4SVj+9wjEfaqHFz8gsgbdxXR4Fi+9ZQuJ8rcPH3wlEvkoi
	sKMftDZA+oPDSaNuMSIurdsU6Y1PKSF8ADUVENNb9F04ofOT85itHouFbWt0/6pb3uq5
	k9gU0oLTC2gKybrmIsHodKwdHwVuwaviRindsA0yXkPfoQ1w5nd70G4jwOw/f1L6Cvt2
	hN82ocXFAkKlOJrByVkIG6YY2m6/rf2sKNKzXL7MrbTY3n3zDea9vsxAEgkLkM9YKil6
	oetlOE1OKYBVhwMFv6oMbcufk/b5JINaBzQ54sZHzh6F4Rxp9T358VvTTYuvg5nCUium
	Qhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+f4ZPNIMnmHmsJK8KZSSAETp8suQ4GZ8adfB/BOBIhE=;
	b=cReGG/WRjA3QqwJWgJ+lbxpjvK0399nDT+TctlLPk/kkhdPRPRTOEBgSB3H3LBIM09
	CEz3Jq67Qv6H0fRMpkPQdX186N8CAPpl2O9a8iMxfNObtHiTuJy8+sdBLAql0UibQZkU
	mcOyoHf00oTYcKZkandWQU4ErPV0wmx8IqlbVleSZ7iujZKZGUH7YLA/G7OricuOSgcl
	PLIl3JcYxnCGQ8Tdjsh77rmZywQHsip5dJH6suQ6WDFWdvyh8c5nX+ohMSONU6xcKnO5
	IbXrrB6/lTBCks5RWb9Cnxs3Td3KRHdAiH3AWBBH8Spmwp+rQNgR+Rewuu4C+xW2MUFe
	UBHg==
X-Gm-Message-State: AOUpUlGrWlDRkZYiytFraKd+uTaBVTV01+1BG2CHKUEZilj8ZV2Ou3L1
	cjvL5y88szrVskP3sjUg/DAmUybFyXs=
X-Google-Smtp-Source: AAOMgpcxmovciVR+OqHuemlpHNELYJOZj1Kna+IZ7FJoHn+QUkheY0DktWkB2JQqhanGBhyYadFEmg==
X-Received: by 2002:adf:e405:: with SMTP id g5-v6mr8973256wrm.96.1532043033408;
	Thu, 19 Jul 2018 16:30:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l10-v6sm301458wrv.23.2018.07.19.16.30.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 16:30:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 00:30:30 +0100
Message-Id: <20180719233030.30450-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libx11: remove redundant siteinfo inherit
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
X-List-Received-Date: Thu, 19 Jul 2018 23:30:33 -0000

The recipe doesn't use the variables, and autotools inherits this already.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index d9a2b52ad69..36c950ad343 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -6,8 +6,6 @@ basic functions of the window system."
 
 require xorg-lib-common.inc
 
-inherit siteinfo
-
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
 PE = "1"
-- 
2.11.0


