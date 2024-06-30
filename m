Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D997C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4351.1719778086854793042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LQwVNOnV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-706683e5249so1306954b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778086; x=1720382886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP8F31Ek2iWlrjiQf8AnInOUj0v3WYLwR25tIkfldZE=;
        b=LQwVNOnV4pHaPQewCJXCr/Fi7/x/vYqhcHO2/dWV+65oASZKPHYDaxlqSW/mm9P9aS
         bXwoZEc69CSoWMWsZb49aGBtml//rpR/cJBbp92hVF265UwnNarVRtOqll4ZQqtL7qfq
         mjkBnmaBKjRwj+WXL0Hr1Xi/jQBuo1etrchFDd9ZJT+VhNCsx8IFzcProNSJsUC5B0N1
         BBLH7i7MmQajPyyHAQqBkax+kMgaVWkYQGxvfzfsWAF5vXSO4lIGGAzrkM0lZMZ69Fdm
         u8rl5Xl+2D+1jwltFSm/+k3NykNt9Y9UzTuvylM/eD0Tad2d9oMdMtLyf97IaNMFzhbW
         BDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778086; x=1720382886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP8F31Ek2iWlrjiQf8AnInOUj0v3WYLwR25tIkfldZE=;
        b=LGXO3uwfXNx29KCwzufV/YAEV3ncf+ZNNTnomjzEr3SOqwT/vCZOqmhIdfIQLBeoWx
         E86oYNfk9n1dfIEXcheeXzDYU6kRDCLDfDfUCXH88MNo1mKznHJ5J4/M9TKDqTkeelWw
         oQ6Gm4G35dKmnmU3DZT3db4V5yRpCZrSsJCRfXZg2E3gNIzanQj2mTo074W/Dl12nF1W
         JrKX2FyIRqJOpBdMhEsCmN+E7GUfQvGOoanFAw9h+8+W+7f+97tdGxuG+ckDtvIDEl2t
         3gL2bYFHoDmTZpDG6deKqA55tNdd7eYyvPXZ/EQaBb+CZeqaVxsuADuTM2v8W4HfbLxy
         NJNQ==
X-Gm-Message-State: AOJu0YxjdM+2xr+owOaXNk12mePDO1sqwhlLNcJEXAc7yle2B8Gw2npG
	xT+cPk0elWY++43qeyqo2LPD7Az9vsZhbjbzFdz8hSm1T1Ms66C+r7VuoEBz1ROV1XlAUyyvvQB
	0XBY=
X-Google-Smtp-Source: AGHT+IETe9t+vNpA6Nc1rAdUWs0/2c4F/GOAiXk5IjLscknxp0crZnmITJymqFC9lon2vT+zplwXaA==
X-Received: by 2002:a05:6a00:2d06:b0:706:62d9:a4f1 with SMTP id d2e1a72fcca58-70aaaf44f51mr2614046b3a.31.1719778086087;
        Sun, 30 Jun 2024 13:08:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/35] maintainers: Drop go-native as recipe removed
Date: Sun, 30 Jun 2024 13:07:20 -0700
Message-Id: <f79af0f5a8fa02e83fe5ae688715caa0627caaa5.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201245

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1227df3d03a2e959925c3f4016fc5760689262cb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 58ef13f423..180dfc1918 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -225,7 +225,6 @@ RECIPE_MAINTAINER:pn-go-cross-${TUNE_PKGARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-helloworld = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-go-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gobject-introspection = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.34.1


