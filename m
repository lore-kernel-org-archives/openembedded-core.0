Return-Path: <attila.hannibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0CEC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:17:47 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.15628.1707391065563859122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UK+MqRof;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: attila.hannibal@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-511689cc22aso2626662e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707391063; x=1707995863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBYXqf1TZegXgof1qh8Llx3spKmV4WpIG/4S09kY5F0=;
        b=UK+MqRofwZXNIlpv9gHEAQinwr5vxVl9AfjXma4ii4TFI/ZJvHb7QwHIEuEunh4sjC
         xdBk7HBHQO4PGoGGi5qLnpHBTz0N/NVKZtSA+WP9URHH9aDgWNd7lwsyIcZ6+yZAPG5N
         5p90rDYzaiSrUPdmJbQJXubnvQYpn6NzdWywnJZ2C+Q2oWqzxOnnXcE70Z9w9fBP6sPU
         Ke/ZToTk54hxFqBX0I9C+/MLnoxmYQJxKEYM0zXdUYWXbbv35utARJfmMsAWTX+6i21m
         NQOZmfyZBWWXT7QCEleQsBFeUN0mH21L6p1sg5hpZkxY+HVWTQav6IhLyDtmXQnvr9FI
         0m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391063; x=1707995863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBYXqf1TZegXgof1qh8Llx3spKmV4WpIG/4S09kY5F0=;
        b=HHKl9eMX9/TiQeH1tR86UfKU4rImxsKZdNHlYsmfh0OBK74feHWH+hOyKrSZWhtUbv
         3yJNpvAa6UPrRLR4zOgeNAAPzMvW6KHzEByw8CgdUJ1584HwGUXftLIhv+7TrHtkXwbR
         sZgaF+9p+PD2qhwuGli+11ht9qQAaSaGeXlGUpqQxPJjBCJVHL0QDjWHAsd3JxUr+Qle
         lTlam+dPAJbNB7lCtQES8r6xQN5FtuEhIZMWNBRIl5W89Qbq47JAQx0QYx8xyioMCdi9
         O532mQMisOg+5GSdItBCfVWGDpOKD4JXos9hx2qhi8C0+4U5Ot4lhhWzhou3zEnpZ0uI
         DA3g==
X-Gm-Message-State: AOJu0YxMUmjnZBsMUzmUCtgSMTkV9WQOmjzNjURJgLJcuf8XTx5pSPJC
	pHo5LuBu3ACKcnZCiKqBho0LoLnwScv9YHHSGXIHaoGQVYYpQb+20WJKH/xyMko=
X-Google-Smtp-Source: AGHT+IE9IXOwMXZUA5jG/fH/4WD/UTLbPPwPz4XYV/ZcD++nTvza6w6kmpFjt11BEtHhcBx/K6PtOg==
X-Received: by 2002:ac2:5dd8:0:b0:511:6fce:e25d with SMTP id x24-20020ac25dd8000000b005116fcee25dmr693047lfq.21.1707391062675;
        Thu, 08 Feb 2024 03:17:42 -0800 (PST)
Received: from alcon-VirtualBox.heitec.net ([195.184.11.18])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b0033b422356fbsm3367726wrt.80.2024.02.08.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:17:42 -0800 (PST)
From: Attila Hannibal <attila.hannibal@gmail.com>
X-Google-Original-From: Attila Hannibal <attila.hannibal@heitec.hu>
To: openembedded-core@lists.openembedded.org
Cc: Attila Hannibal <attila.hannibal@heitec.hu>
Subject: [PATCH] gstreamer1.0-omx: remove commercial license flag
Date: Thu,  8 Feb 2024 12:17:37 +0100
Message-Id: <20240208111737.6480-1-attila.hannibal@heitec.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195133

The gstreamer OpenMAX IL plugin is completely LGPL licensed,
the "commercial" marking should be removed.

Signed-off-by: Attila Hannibal <attila.hannibal@heitec.hu>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
index 05d64748bb..fad3714839 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
 LICENSE = "LGPL-2.1-or-later"
-LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
-- 
2.34.1


