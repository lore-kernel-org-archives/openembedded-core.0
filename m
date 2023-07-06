Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10A9EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:30 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.26477.1688656041589360557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=f3+Lesi5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b89e10d356so4111335ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656041; x=1691248041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IaxelWgxqBipqT2lAhRvA/KLU378jmd2LrQz2qfzwE=;
        b=f3+Lesi5DLCGBBny7VPZZCErV0qEp3sif0CEP3IhyhqOXdIGYIWnL6xFsSjkVozH/Y
         KdPseWb/pPyAdUxucPajzQwpqBkmRXD18l/35yXUXKCL/XVATdZ3KwehRn7SIgGsAdzr
         8/tcbSL/W5Au6hT8Wo2lNMKF5fv7W1UKrjt5JhxPJKo+ajHeJrNtla35/Z8tj9iXNqhP
         5eC5hpztKhuOTlmMUZ1xFRItdkfDQqe6a7F0xBatJon/W2UCYdS71Q/pmcN+ZJyC9SKk
         fDdugXopm+zFR6S29UtnZ3avslsYN6jt3e5G02q4YRle+ivYiJSn3n0ezSeq2AB8sK3C
         6q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656041; x=1691248041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IaxelWgxqBipqT2lAhRvA/KLU378jmd2LrQz2qfzwE=;
        b=X01aI9kYif/K868pc/tC1yvxqB5WXXywerKHkFJgVU88GUtHGimOyQk/S7MqD5xEs3
         6vQmOFjCJlk8j9zXd9DbiEAKpz9ivgnPHM/TxoqeiHPp8qsuR3U6g+F+SSYsxxwvza6K
         kMswVmDMl3GyfkhT+USVf+ljuqAUYp3czc2VYDyzTqTO5F7B/rS7JJUGlWOUkWbVCiTt
         UfNWrimjhvrkRooXxZw9ClGPT9DuaGiOsD9JtS+HkkheqZPr23D4uRCPJv/CNNwzst5p
         YQEaTnV6s84RZGt2fOpBRx4bDnUWQokvYTMTqS7CtKQE1rM8vyVDhsXSx+HVOs6MTpy1
         MR5w==
X-Gm-Message-State: ABy/qLaAMHy1TbzosTAhh9Dn5lnKAj860nr+zK5V5RDDx5KfPQsjnFyO
	41YnGK2ojak5ktRmBTmZx/XuBO5JpgiwXttNJ7c=
X-Google-Smtp-Source: APBJJlFPCPBrTLKp79WEexmJb+MIAqgojujviw/40Bry1I9eLI/1S4qV7kMKbyHyyR8pO8r9GmCSaQ==
X-Received: by 2002:a17:902:758b:b0:1ae:6290:26d with SMTP id j11-20020a170902758b00b001ae6290026dmr1735015pll.7.1688656040616;
        Thu, 06 Jul 2023 08:07:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/28] maintainers.inc: unassign Alistair Francis from opensbi
Date: Thu,  6 Jul 2023 05:06:23 -1000
Message-Id: <61e64e7af709dd03dd4018c69a752f2eadc5372e.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183973

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60eda3dcbf96b5982a0e282fd0c3c13b0b4d7787)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 35911fec27..65db1d039a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -541,7 +541,7 @@ RECIPE_MAINTAINER:pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
+RECIPE_MAINTAINER:pn-opensbi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-opkg = "Alex Stewart <alex.stewart@ni.com>"
-- 
2.34.1


