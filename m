Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D55103A99F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:32:39 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13919.1774405951655587384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mopTqxxh;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so4926577a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405951; x=1775010751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqTqeAMixXBuRU6KmyqROSnnshcXqAATQxoR4EiFkuI=;
        b=mopTqxxh0QljSjkdQd8fhe363bihsnwLWdEETINt0pBcPoO7eGrQdpyXY18DFESNmx
         tjK6aAxWiBBv1IjZAqwkTkl253wuiHveSLuq8ECD58AbwaWrspwWwa0jKs9a0PWzh4ng
         50vry1tiJinNgxUP2WcDhBZen9SvAW07G06f8REjUaPYadJGo8eo7sPf0Uc6sD4HOKJc
         ftE2WIqE4eTy07TyCuOWpFHXi1hgUuJUegMwMjeG+qGbbB/i257pGEM3Iq+veeP5MLB8
         1XlAUrV+7NJi4dqay41uKRGL685rnlbHWHAsa3i/0P0ttRC3gZU4QdwTJ/m4b1PT7vmZ
         leXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405951; x=1775010751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqTqeAMixXBuRU6KmyqROSnnshcXqAATQxoR4EiFkuI=;
        b=JdTv4GjwfQkVGc2pI3S0kEbIam8rT2emG2hvtE6PPOIL9MDIFJCeE/CsrhYfBgsQxL
         0EE+jzuH7imhUrAZc90lnrE3PQgGJYT8XHc0/77dM+a32btsAqm++xsREpPWUZGwTVhK
         AIZ39/vu0Zgiw8Yj6KUqT1F4IjtgwDRGUIImN+/RgBzF2YidwTsKAauZnJHkzrmCDNhO
         unJ7PKEASxfvVmpHPxJ9Av7rM2Ga1c0ifsKgsjOkBI47EuOt2Se1cVvP8PsszCkbhQ7R
         dH28Xp9ckprqBfg+kqyKc4r1AcQgs1GYnDiXhN1maneERFixX9exkX9HhaOG8EYeyzf7
         cFbg==
X-Gm-Message-State: AOJu0Ywoivv20Odxau+qVi/r52HLKvyx5JFnkABDJtzSk8QC8X62iDOc
	3jRXDtASZQ9v099z+wy5pZjUgC5d8WzijVN6pe4cjf2vLyXhsFRJ38KoJ5NlnsTq
X-Gm-Gg: ATEYQzw2yqtpMD4xtI/f7c3wUH8GF2XT6dNZlTX9/Rjt82NhHDcemCPMniz2cOkWhWa
	zXd/oOaVROVxAqIWDnJy6mglW/vDwGAn6DuVtmKbZWNffWOoXhu9dHndUEctmeMw+zhSe8Cj5dr
	4g8JTWU1hzvZYSGI18kYurtO5IiYSSpKRnMbfzp6yQ7pyGIO70Kuf+UeszPOW2Xr3IqyBeV8KYi
	F1EWqzRzZ7Oi12nVf0yQcvRzw/bPyXazOY+2C2n6YgLLu4EFpIwJ9CJj/1iFxuaw0N8iOrb2EjI
	myPporcjrgzdPOSGHBSPDICkRB3iSibLI9PJL+C7W+U1J0kx4Tom8lQcXJ3tY1ndo+iNONDtwxy
	p7MV0sZcMnddHjsqXYtWmztvUgssVo2vY8BFmoa6C2ruIqQrfnvTrLOLLwRyTePRFDFaoapbgPr
	VqN9TY6tqyp+R3IuYxu/gwSgprp+3y7SlH3Qc=
X-Received: by 2002:a17:903:38c7:b0:2b0:4fd1:ed5d with SMTP id d9443c01a7336-2b0b09c217cmr20820595ad.8.1774405950787;
        Tue, 24 Mar 2026 19:32:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm205535365ad.60.2026.03.24.19.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:32:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH] ccache: upgrade 4.13.1 -> 4.13.2
Date: Wed, 25 Mar 2026 15:32:20 +1300
Message-ID: <20260325023220.4066338-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233853

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://ccache.dev/releasenotes.html#_ccache_4_13_2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.13.1.bb => ccache_4.13.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.1.bb => ccache_4.13.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.1.bb b/meta/recipes-devtools/ccache/ccache_4.13.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.2.bb
index f1940b75bb..9fe82f5ee0 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.2.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e822547b0344c567c6f748f75d4da056c360e2196da12d213ec0caf39d72896d"
+SRC_URI[sha256sum] = "e87efda8ae54f94b1cb0e8dbfdf26397bd7d0a9c0c4f38b18dde73f4ec9ac721"
 
 inherit cmake github-releases
 

