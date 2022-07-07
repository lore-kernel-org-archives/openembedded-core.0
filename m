Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F30C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 17:19:17 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.398.1657214356281393934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id s38so4874035uac.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXB3AT1Sgd1XTatMtS3WDDwW06lRG7Y5JzgZbjkz+jY=;
        b=dx7BPSLm4xdzpK46e6w8JDyqmQc1c9qoNuEeIXb1UMfvk0j7608UQ83UDk6RjxKbQx
         VekbNKAhuic8BH2bx3pJcXyo3Q80lwmCkpaAgJcQ9q2V0WjSD4N6IHbglcsHx1B+e0B/
         AV8mZTAjyqfF1KZ1BkAxLj9x8zNiLZHbNOHqzEZXO5AhLNHRpfwzuvHNpDicuOxzZr71
         ZARX7Z+py3dLh0v0T+voItffhq9Ulr9nC/cGNxVwC5n1xcihUgYQy04C+fVGnS/ANUY9
         yi1mcE/oroSYBradtU3ousRFjnuXoSjUspBtjNSLlwyEHGByqLZ0/9s11eTQm1es41gP
         bqyQ==
X-Gm-Message-State: AJIora/TLa43xlipXwFRUSi+06a2KMurv1B4G9aiEENSfq7AgVfsExgB
	lAmajo+GCEE1gmyogE313x1ODCb6kgv26Bir
X-Google-Smtp-Source: 
 AGRyM1vOULs+PcA8/z6wrd0impIDOCwjRGDJT6xuGqVY/m7U/F+lDVdQwdrgdwudswM5TZvRZXXRvw==
X-Received: by 2002:ab0:1670:0:b0:369:36c1:c39d with SMTP id
 l45-20020ab01670000000b0036936c1c39dmr24245534uae.101.1657214354785;
        Thu, 07 Jul 2022 10:19:14 -0700 (PDT)
Received: from localhost (177-4-253-164.user3p.brasiltelecom.net.br.
 [177.4.253.164])
        by smtp.gmail.com with ESMTPSA id
 x11-20020ab0488b000000b00382c1aa7850sm4109485uac.37.2022.07.07.10.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 10:19:14 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	Hulk Robot <hulkrobot@huawei.com>
Subject: [PATCH] Linux 5.4.202
Date: Thu,  7 Jul 2022 14:19:04 -0300
Message-Id: <20220707171904.338441-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707171904.338441-1-otavio@ossystems.com.br>
References: <20220707171904.338441-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 17:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167796

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Link: https://lore.kernel.org/r/20220627111927.641837068@linuxfoundation.org
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Shuah Khan <skhan@linuxfoundation.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Tested-by: Hulk Robot <hulkrobot@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ae9156f804e5..021878dc23f9 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 5
 PATCHLEVEL = 4
-SUBLEVEL = 201
+SUBLEVEL = 202
 EXTRAVERSION =
 NAME = Kleptomaniac Octopus
 
-- 
2.36.1


