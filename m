Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.730.1795888593521992377
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 09:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iCX+q1Cy;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so14779825eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 09:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795888593; x=1796493393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHcJ+nX4tnW45LyJQ+qTM9pgJlTODqaKNr1ssxIDDQ4=;
        b=iCX+q1CyNvYyHlZICAHw7Th5wKgEpk8LJzDLLobpGnl876BYsCa7zSQMSW2b1LoeeF
         kz1avObFMySRBWXkcjq3pMyPi4OtHZHEQNK4/Qr4WJkyWznrGstir+/AlmfPowybd63P
         zQbE30UeeH/N0kYgCZgWXoHSfsq8dR95Ztf8CdtI2yuUNDr9I2s2Pd6d3W/HXOQgRJz7
         fKIqjwBYF6MsIePOFY4yrGzs4s+4bDMz13eOCPWR4TfsibvFGdZyZ8xrCMjYx7ULwde9
         3A/Ae+a9cZ5tSY89q0DYxlpSuEnNUzExpXC1LUlHfk7c3Ew1Q0hoStUodJ+pdMraOolz
         9KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795888593; x=1796493393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHcJ+nX4tnW45LyJQ+qTM9pgJlTODqaKNr1ssxIDDQ4=;
        b=p1wiv+kU/w/o03x5lPiXRCZkHi/JDeJk1jhDDsXxxMVNh8hFTSUZmcZp0jEqNS/8Fk
         o/tGF9CsxEspkJq88K8kHNnlOBK2Lu+ZdMDr/rXKULrxxR+uLdocCy9bzYNHyVi1lZOO
         ZztKlNxPqmhaIF06gkNUV33C5OZ/pWzKXYhSoFIUh0waf7BoSBhCMxPijJ7cED+7j2/n
         4mLUeG6uXUebSmf0yk5P9jy/F4Lg4uumbwGZUbhfV0EbMr5FE5s5zzisioPuJplxeRYh
         6PtFvrKvsEpeWKHcjudKjHHXnfmUPy94NKh1EX8/Ibx78ZrOubz64zLrclEoTREwsAAI
         yAgQ==
X-Gm-Message-State: APuU4Z8xNuJBcGFh2/DQvkok+4z7xyL8QGv0Oj6G9NglE2Io808M9d96
	CoL82ilO76zqpMtpRzdJEg4Be//2yr1gZWLXxtmcd2dAnTUby/vEg3c6pFN1H+OE
X-Gm-Gg: AZFdTZds+oCQeD8ievt23dimRtBom75YsY9TDXTiilJ6mtrzZQbCQMYfBxiWhAe2H+8
	V/XqFda97kF/bFKSxfHEuIgENByWy+FqAEp6iGChLnomjxdZGvfvFowrrzRaRiLg+YXsju9U4xO
	hCWA5YpL7TCO70QSmCc3kzau9uytwebloziSPaiXIpSBiyKiJSxGe4MV/bAwL648TWtJUZClEY7
	bvE/Y+Cha5yyPaWkREWpk4/vqCMcwoVCEUDIdmsQwlnWItTQEnUJNzLPbMfLgq0wjfTJGe/6Gti
	2WFzFX/sG51/ezod3MuUVNredaQhplAptlQFYzvwyiObzgN3uCOd8OCT56e9syOTs2atGbh+4LI
	vDW50JBEpe50HycNqHdoo9nKMMl14kO3oH1ZV7JeZjF/5pB2rGO0xfvXjR46oS93SvA/wS0+aSA
	DqsSKMAFijzkdCbdgrWUcQbQKpW+ZFxMglUk5z320AJj8wNT/anTYgNq1BS7mvW1+yTfSbXfvlg
	kNDQ/zXgyTuofglubEl4zyuMfNkUWCrctQJAmSivebARJTpquZHpmCdzNUdd41m0ZdGQgRxKDx7
	iqPRwph3m5Lsb9P0FEJom3F+hmZbmYFXai4Ve14BuGEyWBz2nSiPxwl+ZpiDXONOyFYuz/iER36
	k4zBcwozjHTTjyeHUMZzgXbrWiDWk955/nFjCtQbE/H+FpVITUW+p2+6dCeIfM+ahUmKKhamHwN
	JgZltNW/eYSOwFL2lcKM7pv0GKqYupqNegyhRzoT149ntTmtzyIHgQ0CZPpJnLvPa8ekMV6QBPp
	8GITlUdTWBgvYynW/m90fwoabut2CAvTiu+a75F2XqjRMA8gniwEXNcyGjAUR7mT7tnb4Xwp8k2
	asaA
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr23951153c88.39.1795888592765;
        Sat, 28 Nov 2026 09:56:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm76080399c88.6.2026.11.28.09.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:56:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] libtoml11: Add upstream version check
Date: Sat, 28 Nov 2026 09:56:28 -0800
Message-ID: <20261128175629.1475352-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 17:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251503
Content-Type: text/plain; charset="utf-8"

Only consider vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index d9f0fa82f0..82a29de837 100644
--- a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "\
 "
 SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 inherit cmake ptest
 
 CXXFLAGS:append:toolchain-clang = " -Wno-error=c2y-extensions"
