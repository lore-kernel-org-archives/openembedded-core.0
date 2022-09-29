Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0900C32771
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 02:06:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.5950.1664417169044386269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1AcW0SU/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id y136so185999pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=o0eknPdS3bLwL/C54zINc/KmiuNcrA/p3605dmzaZLY=;
        b=1AcW0SU/AyyzQ+dohZ/GtgU/d+bKlc9P2ufcGNNbQr0b4Jp9pEqZwEDe5OcplKB88+
         LM7hegZReNnBP8kIWvLptqGuarcrd7H5qKxVfOhMmZm7Ul/QfxVwrzH5/AB2L+PaDduZ
         IP9zhA05OA9LkGglvcQZ2AiQvSWEK4QXb4pySG9GCUDckZxkE4Xwabe3RXtmPe1Vpsc2
         frO5RrTPIcPPaZwT0NWGyepY6pThdOkTPmtLpWfyZTfNI1YaEEOjYGtgkFKrYtnjY8XA
         IZVcdgsQy9JqOcm0nuNXSL4oxPQforLpy+G8pFi+Hsia8P0qRGdM7g/8a9IqnyLgsk8S
         sP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=o0eknPdS3bLwL/C54zINc/KmiuNcrA/p3605dmzaZLY=;
        b=f+ivxmXCHUxYMEPCm5tUvX48lytR1cGre/oF1fwFUEIa462DnzsG0QVZp6HUgtcU1G
         YGw8+3mGEqOHFiC/1jQ34tDAG6ZzGR36AD8TbH7JwqmdjkzqlyP1dxuphponR3zLCkQm
         Zm+6RMiPcEkoWwRlkGlpQvOaj7r/m8FdsEfl6nNZ2kAEEUv7HKN0BRL7ioZAzGbCrE+/
         iRM448puVS+Yl6H0F0eJcc8jSvTnHD9IyaL+ydsv/yhhRkx5iFq8INQfq5JoJLJssLz4
         CGnJtpcU8FpP3qAjVWms0vSESrZp2uJY9WDcumT85NtfegR5C6WHE7aC9XR6+hi8ECQo
         k6Gw==
X-Gm-Message-State: ACrzQf0truMEu03CukP9wpN8ntOrxlzrRI/ICgYy7PkbGFzvLTobPrPd
	N+NAX8UcP0v35GY5QiV4aP8ywgteYQ31KHTO
X-Google-Smtp-Source: 
 AMsMyM4AYEzex2L2S/fiS0xV2D9EDBG1WVft/DGccz3MQdKrzhKKuGHCKCjz4M55BGzIhjJzE8ue7A==
X-Received: by 2002:a63:1b21:0:b0:434:7610:11ba with SMTP id
 b33-20020a631b21000000b00434761011bamr766712pgb.396.1664417168088;
        Wed, 28 Sep 2022 19:06:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a1709027c0100b0017680faa1a8sm4464214pll.112.2022.09.28.19.06.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:06:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] vim: Upgrade 9.0.0541 -> 9.0.0598
Date: Wed, 28 Sep 2022 16:05:51 -1000
Message-Id: 
 <bc13c16bec7a898ae3246e2a9ab586e8241af28e.1664417041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664417041.git.steve@sakoman.com>
References: <cover.1664417041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 02:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171162

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2022-3278.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98c40271692147873a622e168e8b2e90a9fcc54c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8a914ae524..f2cd235329 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0541"
-SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
+PV .= ".0598"
+SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


