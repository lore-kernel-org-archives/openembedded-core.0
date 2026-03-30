Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788DFFB3CF3
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:40:28 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47242.1774863622191843035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Mm0w62gc;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b97b07eac33so47330366b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774863620; x=1775468420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ3nXGmf+Q49K3GqIIhzZrcjandGLr+2Z2qvJUPWcpI=;
        b=Mm0w62gcMya3zMNd7rYsYDdO30ol0PemT3iQymK7W8K3jNXiyYy7VBL+WYR6RjSg1t
         bCmkFgmlzcxMTpSrWi+V4SUo8gB6Cxm4P0Vv6KTeApXC7cf72vQEJ+KTdUCqQv/Y2nsy
         tiexqXcBfyaCnPggLxKfFdsSh1lRgXguPzDXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863620; x=1775468420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZ3nXGmf+Q49K3GqIIhzZrcjandGLr+2Z2qvJUPWcpI=;
        b=emWeZQa52wstmTPSR6MNY7n75SSkxi1YJSOkl0yRQGxobNc0Ub+uD0y0GHlrHFJpS9
         U9VYKIgebP8Gwdy3nfgm9w/MUjLOkoHcdIaMNPYrkL9wA6PBoLjSsBraJpjdV4ymKJRl
         EOZxuwch2clgwieRfvdLfdeGZvs0ARV/oLuSeXJnpxRD47qYPAmgA1JOgT2uiIerPI78
         q4Fn9wbK/OJPRAcbBErEKtx8/Ps2etxnqAlwK8zoWcR9bMxDnMB0BV84UrDQJdbmdBbY
         G9H9hHR7iAnFsC2bNUwlhEjkeunicyt6TR/nytz9ciQ6s0ETk0xgB24f510UEt8+B+Ke
         iEyw==
X-Gm-Message-State: AOJu0Yx6gDM3oJxBrm+4C6M2RRZbrk++1e4S2nmuyk/LWAeAdzs6z0bD
	vWTUiTR3HcXjcKibxVc0l2BIz6KxCGXwPQr7FvMqBQRb4vs7/VGJ7hBFNqLjgiWl3W16Zt24TEA
	jZlLtdf4KZA==
X-Gm-Gg: ATEYQzxXlKGcZoT6h1MnNKivmVKqJ3GvhNLYr1IFj1Bfgyzvzpd4rE/6AonmvlCvmo5
	xg9Tdryo7UsTiRkAYzTw8ZB67OvqccBk0BW5NLC6zqD2tl/r9EnH1SUJnLvtcbCJAHYQmGYVZWn
	/r7Lx5gJ5Y1gr62vU8InP4k/0BapLLtHV+99k0mwCsgitpFwBiajkA9ktLkAlEhLzDlOAgE6wmk
	GYyYNbMeUK1nOSb2ItKaxvY0pO47op/ZAD7BsO7PzOzvMIOgkQuq2oI6ynkWssq09DAdYBX4cxM
	JuX8RLLmOkJNwe3rksr54Im0noFF0t7pab3ydhtOOVF8fG02i9DOO6alBVLArG8EcnhnXuleq7X
	z2OqFELgSeIdgKakky7Ng7zGV36ezKo8dNzYh1Xv8O32TRuLezQPFP0kd6VtHoGB1oOAwtXB8E4
	N+A9K+CbjCB7fMPpAKRmLlfXyuOF6faswvI9s3wI41WyTjDmSfcUfQWgCXdb3DxGUxAJjVXQCJO
	VTRSB8mFix0dWoEebr94j7ZAsLWfOxSTVdX0e1BNNCP5PrBmXPSy8+xSafqbgrUpQ==
X-Received: by 2002:a17:907:2d0a:b0:b9b:1f00:108d with SMTP id a640c23a62f3a-b9b5029280amr308388066b.2.1774863620502;
        Mon, 30 Mar 2026 02:40:20 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm266108666b.58.2026.03.30.02.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:40:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v6 3/7] libsolv: explicitly enable comps for rpm packageconfig
Date: Mon, 30 Mar 2026 11:40:12 +0200
Message-ID: <20260330094016.102637-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
References: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234209

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index 852e79c45e..8a941ce4b8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.53.0


