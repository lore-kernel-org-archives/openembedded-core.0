Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0830DCD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 18:37:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.35434.1694975854699651636
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 11:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HRSHDWs3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4050bd2e33aso1319105e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694975853; x=1695580653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzTP2auLiUIuRMcuaF3PmWR5JEuOpthIabfONvbqmuE=;
        b=HRSHDWs3iAPiDRDCh2ciEIWrs26tff78mhOOYC8ydaWkR32ehDVb0Rwf54gG5irIm2
         +OCVaT5TOKlEhMhsG3ffL5mKKm8qcnDM+c3I7ikVZNJySGxnUJineNg8zYQ04BCqfVH7
         iTDaZ2CLGfrhaU++Hz0bO22w4lwGP116Ju7/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694975853; x=1695580653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzTP2auLiUIuRMcuaF3PmWR5JEuOpthIabfONvbqmuE=;
        b=ToaHdu/oPVBj8VmmM/cxONNC0zwItxlJD8cdXmCsWbY1EWuXD+tBE82OwkvWmeVTX5
         rTcXczYkW2QuzWIXwbFBNwRQsM0/Y/CmP1QuUlyCqgnoJhub4TRoQii2LwncjuAPQ+5B
         TvGoZAaqZmv1wsXv315PzrZESqyoTMi1CQPFl0lEHJeZ8NMfCjLR+2EKKjGqnlN+Prao
         iVV2kN++3dsCfMUIKS6p6Fq21OSOZNl+GtXx83Helx2NHY8PCxe4c5AwhAACMSI+y869
         oNyU0ET8ISyiG3h4FnoP74XQAqUBDMWb0xPfIqhCLaMjQeNAKsVA+ph3D6iS6SR7WTSO
         q6Wg==
X-Gm-Message-State: AOJu0Yx3egMSxTboRCRBaiGNzQGloItkVZj4gW45Jv3tm3Jc5htuBMIy
	PqCXLMhb/TwxdOWOZssEfsT94YBiErMritEzq5Y=
X-Google-Smtp-Source: AGHT+IHt+rjgiRv7dBqtdkMYmw1DfWYifCqMtUaxBxOUXpVIwO5a3+WHw7mkJWWzrtXfD9TS3MsO9w==
X-Received: by 2002:a05:600c:2057:b0:3fe:d1b9:7ea9 with SMTP id p23-20020a05600c205700b003fed1b97ea9mr6524498wmg.36.1694975852733;
        Sun, 17 Sep 2023 11:37:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bff2:f038:1163:aa6c])
        by smtp.gmail.com with ESMTPSA id t9-20020a7bc3c9000000b003fe23b10fdfsm13150988wmj.36.2023.09.17.11.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 11:37:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] devtool/build_sdk: Drop unused imports
Date: Sun, 17 Sep 2023 19:37:30 +0100
Message-Id: <20230917183730.571417-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230917183730.571417-1-richard.purdie@linuxfoundation.org>
References: <20230917183730.571417-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 18:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187815

Drop some unused imports.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/build_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/build_sdk.py b/scripts/lib/devtool/build_sdk.py
index 6fe02fff2a4..1cd4831d2b8 100644
--- a/scripts/lib/devtool/build_sdk.py
+++ b/scripts/lib/devtool/build_sdk.py
@@ -13,7 +13,7 @@ import shutil
 import errno
 import sys
 import tempfile
-from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, DevtoolError
+from devtool import DevtoolError
 from devtool import build_image
 
 logger = logging.getLogger('devtool')
-- 
2.39.2


