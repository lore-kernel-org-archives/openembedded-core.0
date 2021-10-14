Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF114C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:21:16 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.8694.1634214076147725812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C3kOW3Ld;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id v10so3575480qvb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/uEqxp1Dqk6nrBSlxeM+wYXXWk3sa8iPUZylsYcFiA=;
        b=C3kOW3LdjGI/pIIarszeQIe2B/QYc8BIaxQWTrn7ZVDSSxMxVwAMQ0RVY208VWUf2m
         B5MBRIfAur2RYXeW0gsCCfmNupf15RqYQZy59Gz4jzU2pzjFQVJ1c5+P4WehMPagWr+T
         TPh/xXVpGzA4RdV3+ly+gs+1FT8Fi3ldsKvLUolBi+7U0kmwzQIBUXxu7twcwwqibXOt
         +vAyQPyj5U0+YICym7Lv/OZK6rhSxSbGJLv9RcNSiNxcSLr8ZdXP5LtJ+sSWD/fG+hJq
         otJSHtgI5caWA/48P5hK8GnYxNobxVDcUP7DKtmJVE3jBj9eoqF25cqFiIbpkA8Qamzj
         22Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/uEqxp1Dqk6nrBSlxeM+wYXXWk3sa8iPUZylsYcFiA=;
        b=17tLjfIWVBWyMcctjvqYnHigwJe+zhCYu9VkFUEp6r9DpyIrN4lGKqaLlxtzLOqVde
         ISFJTyct91odt5Aes/ddSvBML76MTgTYSHvrgn7zPHGvT/ZT31TvH8kdvHj7SErv120W
         1/uxJimYP6OfEf7Sq+yasgiIEYG8VZt9VgjR41KNEGrVnP90UcGlqbLF8UAzAa7vkBoW
         hoJTvFkssBnsP+hS7gj7GeGDDnd2cysQQqyAE8LSjNmx0L84Usqeme2zUMjsKMyo4euS
         eE07rYADN1H4EZ2Z6fSmbc4yoGAWV5vKMJOLr1Oga4Tsp8rgjb0zIJkiuWZ1pfeiy6bX
         zi1Q==
X-Gm-Message-State: AOAM531kc9qQHEuyaBcp8yqVDRfLZoobjerj/Jc7rQi03kc2r6g0gtNE
	NbuNkO2Fa24coaQGB3RM/qA=
X-Google-Smtp-Source: 
 ABdhPJxt47E/TG2toB7P98Srtl2pWfHYUwLojGISaLJwtIecHsYUZINcdS0wFWrUyAo3h6mSZ+r+HA==
X-Received: by 2002:a05:6214:194b:: with SMTP id
 q11mr4812845qvk.38.1634214075203;
        Thu, 14 Oct 2021 05:21:15 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 s17sm1222983qkj.55.2021.10.14.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:21:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: add 5.10+ native dependencies
Date: Thu, 14 Oct 2021 08:21:13 -0400
Message-Id: <20211014122113.19327-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:21:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156946

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Some of the kernel depencencies are moving to kernel.bbclass, but that
requires version (and architecture) checks and other complexity. So for
the time being, we add the dependencies to the recipes that need them.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index f58b5ab0b8..005b688778 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -38,6 +38,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native libmpc-native"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
 
-- 
2.19.1


