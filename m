Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8563C282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 11:34:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.51386.1741001642998948959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 03:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GPQ9C7ud;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so10804145e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 03:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001641; x=1741606441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvfnyTNgfK/BDhx1XxB7pZYWiVovpRqhLQcMdRIeLCY=;
        b=GPQ9C7udoAcQ6HxgpUKyvZmL2qn1YbMrs2nwir8k0xqJa55Dx+iQ11KnFDy/X2mh+n
         Md3tmy0b2Kw4H81ybWTGshIrxY30tfQ0LHfxYHaX42I1NW4ApJh6oYMo9JAT9kDqY7r1
         7Z/yETIO23g4gqgS4tQ4jUWYBDC1R9vMAGkHGqOdv7V6lKcODkKRGw8uRk1um2V9QpHg
         TPeeF8BQhUKS/9GSoeeFCfexyhc8EvrcvvCRrAtg8GF+Xsnjy9+gc/dRQHGXWMk5GVK8
         MLvXbdt1zTslKfLMU/7mLznhRAwgQriYIW6rKGXIsABTT7md5qxl7cZ+rBb4/IH88p8N
         0dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001641; x=1741606441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvfnyTNgfK/BDhx1XxB7pZYWiVovpRqhLQcMdRIeLCY=;
        b=C7vNHYKtd4cO5koN2qjFOkY9jO5IFh2fkatEphjZJPMn8T8ejMJqAnKYJYHPvfevxk
         9ameTPczD9mK81J+McdzYLWoLA5iAaQVcDxNX3Oy613kiWsUTyg1Opi8KPzmYuOSzZIX
         6dgF9pZ2DFcF5pblkJeW3kb5N7CyL1xJf9+WIhwHHgDB2aWDIcW7htRkzSf28p4jlDFC
         kyV0ob39Nya0ze5SpNdIg5+lcalzKomK2zSN6sNKbby+YllJr6EmNDhjDktmr1t2ec7/
         8YfdSM1EkZvaBqlX5TU56nG462sZMWf/7fri5dQYXd9P6MBPSEm4wGqV/uy6jK8zSgHb
         GuYw==
X-Gm-Message-State: AOJu0Yxi5sU2Tc/YXH+B283GWDcBUjLn2Oq+5IAE6JHzuZrbSeyIlW37
	BepuVFiQB8OOtjF87wHE+wF/6MuPaEY1Qm6fpKWi59UftDJAgtOwM5X5CA==
X-Gm-Gg: ASbGncvMQ23funeKcqsU6Ja/bMcQRYLhkkNpynfFqoT8LOHYRwVDdXrumoHS1O5VLtp
	LA11TQxKPGw0hSSYTYJgq4uUn9L5+Jl5Rg93PUDQLnVcIJfpQB3BOSBG3k3sIIwB28hhAWazSK9
	1NuFnW7io3Sd8w2bursdA7lOPCBzcMJRFGvnJT8Ms7+EhjsDAnhAVx2AGQtWNZXOH13QXeCXk4E
	cKi+fnRlyiixcOR6Ca61mZBVJPVDGNJPYhKHC1AlNXZ5amD5xg9Ef9788GC3SptDheF6uoNw4ES
	1OiKkdoZlMZSAwbRK8JmbfnpBNi2FgXy8XnTZZQxC3y1S0GfLLEhWjYmFYRcXulzMJ+39bsPBA=
	=
X-Google-Smtp-Source: AGHT+IHaGX1glsYADad9H7TMCBMaQXwwvvvDVvdaYGsumHVPlYi2XfvoPcA/Q8i14xv0YMM/p50gmg==
X-Received: by 2002:a5d:64cf:0:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-390eca2793dmr13919220f8f.38.1741001640490;
        Mon, 03 Mar 2025 03:34:00 -0800 (PST)
Received: from localhost.localdomain ([2a04:cec0:110b:e359:af83:a653:df92:25bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc03dcb13sm38350805e9.37.2025.03.03.03.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:33:59 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>,
	Marta Rybczynska <mrybczynska@syslinbit.com>
Subject: [PATCH] maintainers.inc: change email address
Date: Mon,  3 Mar 2025 12:33:54 +0100
Message-ID: <20250303113354.12911-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 11:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212205

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ef0f16ea64..a6f413caa9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -610,7 +610,7 @@ RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim Orling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-babel = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-bcrypt = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-beartype = "Marta Rybczynska <mrybczynska@syslinbit.com>"
+RECIPE_MAINTAINER:pn-python3-beartype = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-booleanpy = "zhengrq.fnst <zhengrq.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-build = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-calver = "Trevor Gamblin <tgamblin@baylibre.com>"
@@ -703,7 +703,7 @@ RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.co
 RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
+RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
@@ -719,7 +719,7 @@ RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@bayli
 RECIPE_MAINTAINER:pn-python3-typing-extensions = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-uritools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
+RECIPE_MAINTAINER:pn-python3-uritools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.45.2


