Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634E2C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.16834.1700651313417261086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=3ILwknAs;
 spf=pass (domain: baylibre.com, ip: 209.85.208.48, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-543923af573so9747146a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651311; x=1701256111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nip7trbZF3Y0TMkgviRM655GjwY8AxeMKSU53PuXgXA=;
        b=3ILwknAsu1lWJovDMR9WAss1JzIGsF/6Qe4De7fkqTRre8fkxKpLTDEPkkxByUb8hL
         qGUfLmASVg0Gyi8I0lmCdPM83bxaat2aALNwQPU1Yhli+WyqwVM2t0pwvR1csim+HvYQ
         5YiYA87Qu3hdINb4q/zTNmHYnwBdyPaRGfNVDKkFZBGfW3A5v38dJupvTJe6SwKQ+K67
         WCFYQYiSiRwox9fROkFzwRFJSrttckgHDmjta8xVembnPOs7XoYMNdGCy7caPDLPoKb3
         yWcWR2HVSf2DooROnS4wTt9hyp2Iy2zwWV/TYPBHzHIc72uol2868dyO4Fo+gTvmaIVO
         Oszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651311; x=1701256111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nip7trbZF3Y0TMkgviRM655GjwY8AxeMKSU53PuXgXA=;
        b=UkQ88cnSo3GOGPnmgkyu+3bWvnAbvcmGWTUEsL+Y25qIWNtbwxWgo7EZvT3dSgN1IB
         r/LCZP/dtLC7gCcOY+Un9QqmGLmMc01ev5s5SQFU9o7OqfQkApH61z8Af0yiC3UbYJwZ
         5lyW2dSdTZ4ayBJueCAEm5EhntjYRgVf4YHdI84i76ZMDB5zJKj+9kl6ZFjjYxbUqDXR
         Dnxlga79OBubiUOJOTykUa5UQriZ7ulcvNji6E1ePl7ogCBw1C17I35+EsM05tIs1fTj
         T97fH5bjEwp4zuwgPd6g64ccvx0C4RvdV71WOXFfwXFne1pm8RLH9Ny1zP2kf7fEadf8
         C5uQ==
X-Gm-Message-State: AOJu0Yznf1Kk/Bz5cmN3r/aKR/rpI9mlXuz7tioEG7899GflZMUe0WaY
	klhGGAJwYViRPxc5JfiPVJOhXK64ysIumWuQYUaFFg==
X-Google-Smtp-Source: AGHT+IFZ9LNd00r715OOMvA5inLQEP9QHcCGg9Ww/g4gDrBVEXAADjVOiN7inPHl/Fn3xheazqtOBg==
X-Received: by 2002:aa7:dad6:0:b0:540:2ece:79 with SMTP id x22-20020aa7dad6000000b005402ece0079mr1654103eds.10.1700651311364;
        Wed, 22 Nov 2023 03:08:31 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:30 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 6/6] lib/oe/recipeutils.py: remove trailing white-spaces
Date: Wed, 22 Nov 2023 12:08:18 +0100
Message-ID: <20231122110818.932618-7-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
References: <20231122110818.932618-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191066

Remove useless trailing white-spaces

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 58776f4a9a7..25b159bc1bc 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1042,7 +1042,7 @@ def get_recipe_upstream_version(rd):
             revision = ud.method.latest_revision(ud, rd, 'default')
             upversion = pv
             if revision != rd.getVar("SRCREV"):
-                upversion = upversion + "-new-commits-available" 
+                upversion = upversion + "-new-commits-available"
         else:
             pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
-- 
2.42.0


