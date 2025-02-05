Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E489C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:34:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.13236.1738766095745915808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 06:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lRQlNkbM;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso48601565e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738766094; x=1739370894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8VyK+/K2wgBttKy3LyA6ijkSnUwmtdFqkSla9wH2Jg=;
        b=lRQlNkbMSiWDk+nv1OAk2q1fzCaq1G4l5VfwVoq2YjHGMh2ubEyRRbGjP3GBAp6TUA
         aSfwwQcDLTYHzybsh12N/BLJCDcN/VCjuEBl0gpQJ46VvEvtVTgKWFlPk3ZDiyEkm3OH
         Ysw0womsnfjieHeljy0YjG9evbLYqR3nljK08Mc7CpRfC5hDIjpOFaNnBIY1cK+ydX78
         oHbviTyV3gDBrs5JO7Hrcgi9Y61n9ZWPxSaGU8rOFnN+TZi+8L1K0ePu/psyJLYe/z5H
         eVIosS85SLIkDnDaffZbS1mz5TvCnHqSvOf93CgjG1Aj3TjU0frJodHyeaGbM/V3D5qu
         iLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766094; x=1739370894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8VyK+/K2wgBttKy3LyA6ijkSnUwmtdFqkSla9wH2Jg=;
        b=T8GVATrPmxsZyixwa3Ws5rNmBHyq7uZ2Mx8RoC5NgTc4h/I6M+eMU6IVdEtW0AXWYK
         vM+oEwrnL6V+xqQrDJIvpTXuq6ZRrF+JcHHUIOSU2pVsMuQpio30YkB9Ruu7PqgAk8ma
         VkVBXBsWfRBGP6vCclXZhVbwF47b3t+pxrR+M1PpBGcZ7qv8wGnBHpHbamnCGxRgx3Kw
         hnJvJCmymrMRUOMP1SX3ZlAB4pTWwiDB2Xc/rnNuuulckuoaODQ5p1YBakq9dWx7fJd0
         EwMoQaeYJVpTb2xsGIS+RLTK29bh+eN+1f047q/PuObcFabQrfggFQkrQkBmB6aWj9ly
         dV3w==
X-Gm-Message-State: AOJu0YwTonrOSsUQ56PnfHururOfWCQfTFrcsm2qrsXErvltY10Lfntq
	31QkE45KjhSqsSLHmjcGVqUjdYoEoDaV1YCqrWRJiexjt474YX5aScFZ7Ry3
X-Gm-Gg: ASbGnctRqBI+BPKi/LHdoVnPQOfYDiFYI1+1LcYr9v14YjqZrO/PifwEYBveT5lRtrb
	gw+Rrs8uEbh8qgnM2+SQ6e4yRit69zXPzvH9i6AGuJHpg9bxSxYjLR1T0m5ktuOiIq+t4nTxtxy
	Py15dZ4UqmADZVp6jV//giU1WAf1W9Yl7BKqHEYyRmLhsEfbVgUaPx6fBJRhwnZTkwZmguAudEj
	cwb2CBMJa9aPV0oTyNDrwhXuBi/+KHIT4WFCku95PQRTYiLoYw618XgeDylCb41Mcns4kBpLHp2
	BAFVaKYNC4+lYas7hJYT6jrJvuL7FSvgaJCBs6kXwzKv
X-Google-Smtp-Source: AGHT+IHc3nqn/EG3H5kso1XLzgKCPYdc/XgOqaUfodICIabrqGRryl+vFyEIF75JX73YNNefhNU+bA==
X-Received: by 2002:a5d:5849:0:b0:38d:b0fe:8c99 with SMTP id ffacd0b85a97d-38db49101c1mr2439327f8f.48.1738766093551;
        Wed, 05 Feb 2025 06:34:53 -0800 (PST)
Received: from localhost.localdomain ([2a04:cec0:10ef:d61d:4bb8:b29b:dacd:c52b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bccsm18614600f8f.27.2025.02.05.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:34:52 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v3][OE-core 0/4] cve-check: allow feed selection
Date: Wed,  5 Feb 2025 15:34:09 +0100
Message-ID: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210849

This series is allowing choice of the NVD feed to use, you can
configure them using the NVD_DB_VERSION variable in local.conf

Available feeds:
- NVD2 (default) - the current NVD API v2 feed
- NVD1 - the old NVD feed (deprecated, but still working)
- FKIE - the NVD feed restoration from FKIE-CAD

Marta Rybczynska (4):
  cve-update-db-native: restore
  cve-update-db-native: update structure
  cve-update-db-native: add the fkie source
  cve-check: allow feed choice

 meta/classes/cve-check.bbclass                |  14 +-
 .../recipes-core/meta/cve-update-db-native.bb | 405 ++++++++++++++++++
 2 files changed, 417 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb

-- 
2.45.2


