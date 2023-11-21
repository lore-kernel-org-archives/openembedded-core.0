Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6ADC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:24:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.39779.1700573091222973484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LcBQyFw4;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf6af8588fso9944595ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573090; x=1701177890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts1a+VX+9vW093JRP/4jbZg7jLFY1j81rlnMQePRpEc=;
        b=LcBQyFw4bD8/KV3XeAmQ+6HoDoC6KHUwk8zdKkIiuWKUis9StJN/wfxp1r9KxOI84g
         VL0MS5thL7t7rI0LxVzT0gBdSELTRHX419KZ1o3vpEEyaBhdOJCJk32kf+u2nKZjYqLK
         Jy7LeGKRfHc8XBaNo9TDku92W8RneFVm2XdY4gMnDQwd/BnVZPkFhvrZqQUHpv3I8nXi
         A0mVCZYXLY2OfRR8at4EqfLbYKq1O7VwXr7Ev77+R+ReZ+X0yATPjeoa4yLvbiNtWA+N
         wNyATivvhKcxkMl6naOtmS8MqIhuXMXTpbUO86/D8BTKBkx4Cp1jdS9i6e3EN4WQT5Lp
         RtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573090; x=1701177890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts1a+VX+9vW093JRP/4jbZg7jLFY1j81rlnMQePRpEc=;
        b=wdKhpf3Jg2gJGGZBb7KTiIg/1+d0Yz2zmnRev+1Qgt+X9Exf9aW+m2NUbBWtLvm0uG
         bNO406Jhw+UMmyzk/W1qXw7UCoqYYWXqGjPXU+rwQkyoDbe2GwcaYdQpBv2sIEvhG79b
         lTCTva6NZM8IJnkLg9sOww6A4Bo1sOfpcTlZjz8mQAG9Vt/QwEJJZ4ARdSXfZzsavPsg
         AF2Pbn/+9qtGuy+WaEa1Ek2RJoY9Vbs9OQSTI8JGm+AajbYeqPMvsmSXn9BlwY6cweI3
         U55QeIInWVUzlPYnnQ1Ks6x5Es3m7KBtUkA6gHxmdPDCf0r3FbeS1j+q2XudmqCLLrmb
         lyTQ==
X-Gm-Message-State: AOJu0Yy5YdQT9inKOLBOXVArumV8javzlrhNcffFRibJ39EY3h4SRtET
	Y9B/VJDNmVL8D6zOZSDW2NuiLoYChhQ=
X-Google-Smtp-Source: AGHT+IEOa2DeSFzflkL91sUCq7ZpXZy4+ZPIw2Qo/lnHU9DFzy0ZIs96MWHIQSXDYxW9AnD57P3nuw==
X-Received: by 2002:a17:902:9309:b0:1cc:7077:c87c with SMTP id bc9-20020a170902930900b001cc7077c87cmr10675162plb.14.1700573090026;
        Tue, 21 Nov 2023 05:24:50 -0800 (PST)
Received: from L-14805.kpit.com ([43.231.237.137])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c3c100b001c47541ecd7sm7241117plj.250.2023.11.21.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:24:49 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] ptest-packagelists: Add sdbus-c++ ptest
Date: Tue, 21 Nov 2023 18:54:40 +0530
Message-Id: <20231121132440.933298-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190975

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add sdbus-c++-ptest in ptest-packagelists to run ptest

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..f8047b27ed 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -65,6 +65,7 @@ PTESTS_FAST = "\
     python3-webcolors-ptest \
     qemu-ptest \
     quilt-ptest \
+    sdbus-c++-ptest \
     sed-ptest \
     slang-ptest \
     wayland-ptest \
-- 
2.25.1


