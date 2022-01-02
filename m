Return-Path: <neuberfran@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C539C433EF
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 17:25:14 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.15494.1641144307227759982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 09:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZXNH0UbJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: neuberfran@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id o10so29044693qvc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=JR81c7WzFNGuYDraolxCKzHlCk74HEiZp5HFZnYRGa4=;
        b=ZXNH0UbJt+4eenHFQ3Trt6KDDZrwIZkVcwGAK4dggdpkBp68YcGVIZ1K/11zyY7sXS
         vpDadcAIrwX+woHKXfZ6Vtp3PxBZY7EfOWHXs2PChJj4UenQbt4u5F3jAk/bPH/C2nVg
         tA8S3xnLPtpKtA6l11Z0uMuEFB6esfyI0Gme9GHCVrz3gqS5HOpHYWD1ySOwi9uBfI+n
         koP1nuDkRWOLo9UulPgCyRwCCW2cwQK+55LFUrRAzlmpxKV+D/o5TK9MwtHYYVgeRI4/
         UiX4W+aU4WAKHlTNlnmZCc0zCB2kcjj+E0+Aar4wePrM7AqoEyI55hx48SHKvaSMSR4h
         y7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=JR81c7WzFNGuYDraolxCKzHlCk74HEiZp5HFZnYRGa4=;
        b=nsDyNBZQsBE13XiPkZuIsf5/NEdOY6b/lVloqf86ffIjLnStJjlmDk+xd2iwBGX3NL
         V3tjcMzM0TWYm96tG4giTWpLn5Z8903LUuvC/j9McpEo7056vr7arIsaevyHFJfzSeSK
         uff5DctSGEUw5GwyimCj1V8HfDq1qYux/xJ2xMPPRGIpkIWti/dnaOaOVzVk3EYwsnQ7
         wRaQ3XRdnFjR61qbXWpFDfyKsaK73YWPagCZREsTqW5XKAkWqNpvH12+gcV+BLAi7nPz
         bPbcfX9fjiVm84Ti+oXjnzU93HuGH/06Nh6r/lUqh9/WNQjSLG27tvOC7LGU2BMx4len
         wdOQ==
X-Gm-Message-State: AOAM5301hVptqLUzBriOP8CIid/I5HzSF5tSYPL/kXW4bAzm+1jvHsBI
	QCyLL3f2W8fP24sW5GwdkT5GbPhpRec=
X-Google-Smtp-Source: 
 ABdhPJzbWEH4rqkZdmg78Bv+bPB3Es/FTqKxFsrwqiE1hjNIdYxcKvp2kMoPqgOgG3jEXPZt1kMnMQ==
X-Received: by 2002:ad4:596d:: with SMTP id
 eq13mr38217372qvb.53.1641144306114;
        Sun, 02 Jan 2022 09:25:06 -0800 (PST)
Received: from ?IPv6:2804:14c:b385:7700:641d:d761:9d3a:ceee?
 ([2804:14c:b385:7700:641d:d761:9d3a:ceee])
        by smtp.gmail.com with ESMTPSA id
 t6sm25295374qkj.33.2022.01.02.09.25.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jan 2022 09:25:05 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Neuber SOusa <neuberfran@gmail.com>
Subject: How to put meta-openAmp in using imx7d-pico with Hardknott
Message-ID: <a2412045-e8cc-40a7-08f3-2c31f53391c8@gmail.com>
Date: Sun, 2 Jan 2022 14:25:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jan 2022 17:25:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160106

Hi,


I stay trying RPMsng in Yocto. In my case, I have imx7d-pico with 
hardknott now.


I need your help to do pingpong aplication in RPMsng with or without 
meta-openAmp.


https://github.com/OpenAMP/meta-openamp/issues/15




