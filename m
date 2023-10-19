Return-Path: <twolber.bruker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA17CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:57:31 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.30214.1697727445848531001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 07:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DaRQPw8M;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: twolber.bruker@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso12690912a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697727444; x=1698332244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLXAb3pt0Fvxk5CPQqZ+8zxNuiDGUDPkFGIWeTM/v8o=;
        b=DaRQPw8MvvVvOaPHMssFJqQxyzRiY+hgF7Pwf4t5TQ0j5HLARy5we7XINU3Z9si8ae
         owE3xo4AXhNAoXKs5JnH/mHtqYZYOVq/HMqbl/RzB7TCSNtWiOdumfOJgEL2YtlcF8EH
         kIqYfKteP3I6CwGpyYuMPrv3OGTUfyUnORdRfXH7m4oc2Kw/w5pwj8U368uMpPHNK1jD
         CwTwjHgbxWL/IADkAzRf0tspRpnCBBfjxVu5WLlliCZxpwqz7u4llSRTC6evpyc55gEe
         C22kncc4MFIV3u4TfrLhKm+L2sYlRzTGjGrhbJK2a1+Bq2Ia6Al2sIil8ONnbdTcjEkX
         YdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697727444; x=1698332244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLXAb3pt0Fvxk5CPQqZ+8zxNuiDGUDPkFGIWeTM/v8o=;
        b=JEpMJOhsrgXK03ygOhhD4JqBU5V6h7yBopPeRAApdR1bD0h9SVc9wPfOYxpslXj1kD
         xsesnvZinWjT+IKNW2I6cOjAQ/I090ZuHbI+ZN4wUIHxMDR92S1a2XGNocD4Hn4UL/Do
         6B3KZERIkO0PDGtM0BOQ6U2TB0D5rv1qRSeP6OEwTUSHKmtPb8y3I4S42GRJKfH0WiWp
         LKBptQSiBFmxKRqIVmNs49MF9XC9YqUSHGO7cQX6s9MFnVmcVEDBoK9M2dUFZjF+VgEc
         TKmtRS/j/rRT47cqsiU3Oytw/VnfPNX4ob3lMiURBoNTCEZjltaBwWe6MwePB9tTk90g
         TyYg==
X-Gm-Message-State: AOJu0YwMLXIyoK7GrojJCLJ7anzggfeIOSdt/Fwl4ckm50cCS28Dk8OX
	ueNttnEU5VmRIPrQFyl2P5nZsBpTm1ANtQ==
X-Google-Smtp-Source: AGHT+IHiewg52oIlL/Y0z60WOWTJEAR8CAMxI2ExZZdLP8sLJ/nhzAgTYK2B7NX957RkjH1CjEUrCg==
X-Received: by 2002:a50:cc99:0:b0:533:9df5:ede with SMTP id q25-20020a50cc99000000b005339df50edemr1921280edi.14.1697727444088;
        Thu, 19 Oct 2023 07:57:24 -0700 (PDT)
Received: from ubuntu.localdomain (tmo-102-63.customers.d1-online.com. [80.187.102.63])
        by smtp.gmail.com with ESMTPSA id bt6-20020a0564020a4600b0053e3839fc79sm4501576edb.96.2023.10.19.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:57:23 -0700 (PDT)
From: Thomas Wolber <twolber.bruker@gmail.com>
X-Google-Original-From: Thomas Wolber <Thomas.Wolber@bruker.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Wolber <Thomas.Wolber@bruker.com>,
	Vyacheslav Yurkov <vyacheslav.yurkov@bruker.com>
Subject: [PATCH] kea: drop unused directory
Date: Thu, 19 Oct 2023 16:57:17 +0200
Message-Id: <20231019145717.93876-1-Thomas.Wolber@bruker.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 14:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189467

the usage of /var/kea was dropped in the 1.6 release (see
https://gitlab.isc.org/isc-projects/kea/-/issues/538 ).
Creating the directory fails on systems with read-only rootfs.

Signed-off-by: Thomas Wolber <Thomas.Wolber@bruker.com>
Signed-off-by: Vyacheslav Yurkov <vyacheslav.yurkov@bruker.com>
---
 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index 91aa2eb14f..f6059d73cb 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -6,7 +6,6 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
-- 
2.34.1


