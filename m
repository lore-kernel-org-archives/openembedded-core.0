Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCD2C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:28:13 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web12.10027.1646922492605722005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jEr4Tx/o;
 spf=pass (domain: gmail.com, ip: 209.85.166.173,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id i1so3843765ila.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=fx7kakaUN0eZedUZ5wsmaNQt4BG3OKV6mdphky3h/74=;
        b=jEr4Tx/oDLU7ArpqO94sc/4uVxeZO4pORD9fsOSexT6GotZEItGYHolRzlKO2mKRq4
         Gr4tpwItfDVf4+Om+YG7KcIG3DwlwRjXJEBJOlmnlPWHxT2LWSzLyNJ3Peh5WNdt0GgQ
         xAg1dcYWu4ZDuh2JxHktBEO/kbQIJRpFCtJd8RYvLkIVSO/gyKeOPtE2sTCckVozd4iS
         3v0vuaje4WjzxZDTVXuKZSXxwj3eultRX1VRkBxF62Oe1HuxfjW3lX2f5HFP8C18A+F0
         746/9X7LIHmCD68m5n+romcziTvR+09jWl4hNEHxDeDNgLdt0ukrPUbZ1+HC644BFFbD
         VRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fx7kakaUN0eZedUZ5wsmaNQt4BG3OKV6mdphky3h/74=;
        b=R7yC7yZHBH60MvYir6yOLtBsz7KkBG0012UKP8VpRGhT8O2QmKDYsvW8tQlWAyv/aD
         DCLLBQ5dPZqYVoaKwxZA9iJF65kaAXMR8CHnI6t1kYdHAdJdg0incSJbHAcR5tLEQIKQ
         4pvKBCPUro+1zbZYIsADRMsys6+lCk2bBa/3QotGlrFhyiccjfd6SryulWLYlJhxx0pA
         i2Zbl8NkD12+ZSlnJb8XSk+7NeQQ0a/l3EyhIubg5gEd3jtkOrMMTRa+PwIAMQ6yOnMy
         7p1LTFUW01kckRogRnfJN6SIAJOUBFpKEdg27ULCBp3VclS83cpz0efuB72vNA6xuJTI
         MUGQ==
X-Gm-Message-State: AOAM531VhNNQ1BJSILdkck/v5hSESmaa4pm8fjp9lUCmyCnR0Igkv9sH
	tuU4HSSyQCzBuPzVjiEAs1hrIYCdFynLzmOx
X-Google-Smtp-Source: 
 ABdhPJwc/ppVUsqJe8yjperbS5IWHlZ3SDLcYP8HsfJaTiVVwaM9WYe8BMo96jhMVL4XzaFQQX42bA==
X-Received: by 2002:a92:ce85:0:b0:2c6:33fb:7430 with SMTP id
 r5-20020a92ce85000000b002c633fb7430mr3896794ilo.270.1646922491845;
        Thu, 10 Mar 2022 06:28:11 -0800 (PST)
Received: from [10.128.86.8] ([72.10.162.4])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a056e02180d00b002c25b51d5ecsm2872477ilv.55.2022.03.10.06.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 06:28:11 -0800 (PST)
Message-ID: <4914a575-f6da-59da-1fce-12064f83dac0@gmail.com>
Date: Thu, 10 Mar 2022 15:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/4] Patches and bugfixes for overlayfs
Content-Language: en-US
To: Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org
References: <20220310131329.1906537-1-ch@denx.de>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20220310131329.1906537-1-ch@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:28:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163029

On 10.03.2022 14:13, Claudius Heine wrote:
> Hi,
>
> I bundled my patches to overlayfs and overlayfs-etc togehter in this
> patchset and fixed the whitespace issues.
>
> regards,
> Claudius
>
> --
> Changes from v1:
>    - fixed whitespace issues: converted tabs to 4 spaces.
>    - changed git commit title of patch 4
>
> Claudius Heine (4):
>    overlayfs-etc: add condition to package-management feature conflict
>    overlayfs: add systemd unit path prefix to FILES:${PN} array
>    files: overlayfs-etc: wrap long lines of preinit file
>    files: overlayfs-etc: add overlay mount options to preinit
>
>   meta/classes/overlayfs-etc.bbclass     |  3 ++-
>   meta/classes/overlayfs.bbclass         |  3 ++-
>   meta/files/overlayfs-etc-preinit.sh.in | 12 ++++++++++--
>   3 files changed, 14 insertions(+), 4 deletions(-)
>

Hi Claudius,
Thanks for the patches. It seems like the first 2 are already in master 
branch or I'm missing something?

Cheers,
Vyacheslav

