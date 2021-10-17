Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632B4C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 08:26:52 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.20866.1634459210836211361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dgenzSe0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id x27so60153563lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=Op57Ozf5cO0IvvJQbn5V9NLcafi0aBn9zWnXY+Tjzts=;
        b=dgenzSe0zE94Nvmq4piyv/Cd07dUv/yI1XUupcS/cMIyKPx9MMmx2QgaMqzdZ8qH+S
         pESniZd8otzgyRolDZwKa+Arkukc2XbKC76kYauRmzxnRJ9S5sTP7RGj9t1/kYU3GCft
         uJSRoZlm4OU/I33n2Y3JrM4/PPgRTw7Xg/7MYJtfTpTu+5lAv7LMOXmcRLqrLnEag6k+
         w67WGynmn1Nw8T9/td4zrwmTiV15f9UzD1BMBtSBQJ6oPFfJIP8Zs+qpEyUDpat86KKU
         tCVkF6eC4saLJu0Lca8krfC94x+hYj4F4JEfeyRqt0DafOwFyaBESPHC5EsTI3HINlXR
         szIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=Op57Ozf5cO0IvvJQbn5V9NLcafi0aBn9zWnXY+Tjzts=;
        b=DlDXsixYKmbxYhNxnrQFR2oLsc6jfgUVW/2nDnwdXnsMzB5zmciZCDHDtm4fMrHODw
         lOgIp2Re25Spe5MmVgZxq9WKjRkhTe7UDTPDtHJ8AN4RbhPZPLS+yxX5ZvvDqbSF5k1G
         Zw4vbl8ge3KrkaPLK7EwCBgyphw3yi83zHfPGvDR4Vjoq1ybYuyGp5POn9AMHf8/lD1R
         rtpJAJqTxm/yB6OWkFVHqfqDDKYD/OR36XVbE4Trj90WMcbRnKmO17CiI5tTuHMdOzSY
         kAKYKDLqPytyO+r7VKUdunWZhbjgjhMp3I8PjFAUW6lsrnX4Ee0CFofwQlffhSfOpMsy
         wM8Q==
X-Gm-Message-State: AOAM533ZRPI2KBLyGHDR/voP40akul3v1fsH3yJCUu3BckLT1GVx9+cM
	0nCZHxvlxOUm/M8RWNjTlXRXiCPA0XW0uOMJ
X-Google-Smtp-Source: 
 ABdhPJxGeutxO5hVlwqn0SY4jeEOOy3hfBph8NRyQnJomsxG6IDIwSc9PLEDIqMSztdfARcipkSofg==
X-Received: by 2002:a05:6512:de:: with SMTP id
 c30mr22911034lfp.153.1634459207786;
        Sun, 17 Oct 2021 01:26:47 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 w24sm1094359lfc.99.2021.10.17.01.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 01:26:47 -0700 (PDT)
Message-ID: <086e00e6-0cd0-0304-8021-f25dcfeb7287@gmail.com>
Date: Sun, 17 Oct 2021 10:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [OE-core] linux-yocto: Set CONFIG_ATA_PIIX=y by default
Content-Language: en-US
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
References: <16AE71B3ADB3BD09.11150@lists.openembedded.org>
Cc: Saul.Wold@windriver.com
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <16AE71B3ADB3BD09.11150@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 08:26:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157031

Hi Bruce and Saul,

On 10/16/21 09:18, Jacob Kroon via lists.openembedded.org wrote:
> Hi Bruce,
> 
> My Yocto images (which uses the linux-yocto kernel) stopped booting in 
> QEMU some time ago, and after some debugging it turns out this was 
> because the upstream Linux kernel removed the legacy IDE driver. Instead 
> one should use the libata driver. However, I don't think the linux-yocto 
> kernel has builtin support for the HW that is emulated by QEMU by 
> default (PIIX), instead it is built as a module, CONFIG_ATA_PIIX=m. If I 
> set CONFIG_ATA_PIIX=y, my images boot again.
> 
> I did a "make ARCH=i386 defconfig" in Torvalds master linux tree, and 
> the .config has CONFIG_ATA_PIIX=y.
> 
> Do you think it would make sense to have the support builtin in 
> linux-yocto aswell ?
> 

I'm using KMACHINE = "common-pc". CC:ing Saul Wold, since I see that 
commit 0d4f5ed5dca41a48423ce738131e52f7863d8ca6 in yocto-kernel-cache did:

> diff --git a/bsp/common-pc/common-pc-drivers.cfg b/bsp/common-pc/common-pc-drivers.cfg
> index 71608433..0b821903 100644
> --- a/bsp/common-pc/common-pc-drivers.cfg
> +++ b/bsp/common-pc/common-pc-drivers.cfg
> @@ -5,7 +5,8 @@ CONFIG_PCI_MSI=y
>  CONFIG_ATA=y
>  CONFIG_ATA_ACPI=y
>  CONFIG_ATA_SFF=y
> -CONFIG_ATA_PIIX=y
> +CONFIG_ATA_BMDMA=y
> +CONFIG_ATA_PIIX=m
>  
>  CONFIG_INPUT=y
>  CONFIG_INPUT_MOUSEDEV=y

which changed ATA_PIIX from a builtin to a module. Maybe this wasn't 
intentional ?

Regards Jacob

