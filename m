Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.35605.1607956645808201297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rSzXs4nv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id t22so2770008pfl.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GnKiQtTtav6ZKJeHE498E+JD5SAE1YZIuQcBH60K4f0=;
        b=rSzXs4nvn48rZ8a4TfSO9LhTdoXpPCabvBfFMU3Kn3E0p4sgrXX6pdhiE/tJUKj7bk
         O+S6H6C8+URKovCGxbQPfse/EgsT2COKcskEjK7UUrUzLvOH1Z1ryqeTf/UOZUqQfdr9
         QV/86SBAnLBJQxPwDZHp0WpRwhg8HeTBiNO7yaCL7dGIsFbmX0nW+kITR/ZX6yD/EP5K
         Gu+RhUVnfo9UAfOkKGXSVQFxA2ceD+gDtQixCUGJqUqgoEHfXstVIMbno4I+GQ9M12CK
         0Jt3YadMz9nO6CebTmtL4Ahh44Xcx+GCve7/W1+5mBHIkvoeKB+pZudkycCdT7CbASIQ
         Xszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GnKiQtTtav6ZKJeHE498E+JD5SAE1YZIuQcBH60K4f0=;
        b=N1J8GZ+SIAYKVR/xYM6xYmW8R6kqt4WFBoB91oB/LbctkLcw7+E5CjBV1JX7/FbhaZ
         5/xPq+Jrb3OA7xZoUZCiOX/eG4sAmaK23Mupw6qW5vywIUXJEPi4FmtGe2nccxuwWXn4
         XRcV/l0OoSQi3me/JR+V3QOL05ewAqSiOglWLuVvYhsNQ2cw2okyVIDEEt74xxxuBx27
         Er3W/XfLY4/cj3kob+tPi2W9YDqz6mvi4sMRCg0/smeW/0D7CGJNNCFkgY+aYD4Niq80
         u0ua90XJ42BGOIs76u4I5IbgdftqFrJdPY92SRfiYDlx7pco86H5g19mT6OBUZeeJ37M
         A68Q==
X-Gm-Message-State: AOAM530IOtwo73hBOvoHF3cb+DAftDCCUfXePJdE1fKossbCbI/lqpgl
	jD0cWBWUQwdELkHNZ/1FDnTyCdiXFYoF8pNV
X-Google-Smtp-Source: ABdhPJycqBVPHZP1LFh+NXSIMX3vgjEfQQmMXthk/qw5nZgc9qWo0zOTUpVfVycFMQHk9FBdiCEbqw==
X-Received: by 2002:a63:e049:: with SMTP id n9mr7710856pgj.339.1607956644999;
        Mon, 14 Dec 2020 06:37:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/25] devtool: remove unused variable
Date: Mon, 14 Dec 2020 04:36:35 -1000
Message-Id: <7317bc23d55dfd0068910e3d8524a284cc2bacd5.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

This variable isn't used at all.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9676ee24d190b144cb50be6ebde3990644a6df2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d140b97de1..261d642d4a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -531,7 +531,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
 
     initial_rev = None
 
-    appendexisted = False
     recipefile = d.getVar('FILE')
     appendfile = recipe_to_append(recipefile, config)
     is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
-- 
2.17.1

