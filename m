Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B06C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 15:48:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.6800.1652888902043060814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 08:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XJsnGGin;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id s14so2152739plk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=JDLTZmEJk3Z2CcbIJ8D2FyMkQjEFzBWCHFfLKt4XQ8E=;
        b=XJsnGGin3jW+NTJLLnOMBV6vK8EFhNYx4DClLkGWOgscns5lexHixidpT9KUePaEvG
         d369yXpba36TYT+/t2iSDjzjxb1gn0hvgJ4VkmvhPguHvintE5Zx256jpbn9iomSSOjJ
         DBZso9hfY+T1fieV4FMYPdTaZru8xz3wGDjLwGmPHFh4B6N0+vUpw+1LX5ZfCSYGLIDY
         gIgiRBRl9TCB+5pxUM8aoH2dMyr+EUHWGIKN4BY9IaQLXy91pUaMbBuBwop5/TtI5ZnQ
         GAcDTVNv9y/wT/QOAF7zqhuHFGQbMRpE7PE4bfKnJMWaeo7jPbFwVbE3TBUYwfucorpj
         1Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=JDLTZmEJk3Z2CcbIJ8D2FyMkQjEFzBWCHFfLKt4XQ8E=;
        b=p9puTJ2YKS6aVnB/tWCWcmheEzWrvqbsBZpmweRv8i+QM8X44UEdpypEp2I2Ca/K5n
         3F6Sj6012xQawZF2B4We1T/tdIsAFD7n18duFO1Go2UZn/aMXXAyI5rnMdSUZW2S0D5W
         guiDPI9zMvYuwue/SPh9GUv8W27vaqELkAYC4Jkfcrmwk5Q8yq+KIc4kFTbMMDgwmp5R
         ewKmcit50jAMPeDkgcsuIilfJ8WeRfDAJyVCiV6go1rZofFwqaC9JgrFYwu+AoJnuQoj
         1O5LsOIbaIYEFXpWHjVaofcTNtjCL79gFi9M+XhmX0Zc5/YdxDlrIAU2ZTbzOv/Ir853
         5c4w==
X-Gm-Message-State: AOAM533r4CUX9kVPWLlvGeZNXTNRnCWxd+3OirbVN87IyPDIlgi4Zcqe
	di+zW7yBj9gJDtskesEfHrY=
X-Google-Smtp-Source: 
 ABdhPJz1OAajt8+PX5L/E5j+TEYFeTsoPlc3dpovmQWZN0bGJqMGnfO1IwFTXkSnnII5Dz1IICjn7A==
X-Received: by 2002:a17:90b:4b52:b0:1df:c1ef:2cd1 with SMTP id
 mi18-20020a17090b4b5200b001dfc1ef2cd1mr83527pjb.130.1652888901403;
        Wed, 18 May 2022 08:48:21 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:20c7:18ec:c14d:acfe?
 ([2601:646:9200:a0f0:20c7:18ec:c14d:acfe])
        by smtp.gmail.com with ESMTPSA id
 16-20020a621410000000b0050dc762819fsm2110024pfu.121.2022.05.18.08.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 08:48:21 -0700 (PDT)
Message-ID: <518dcf32-5623-bbb8-242c-3f82afa86b8d@gmail.com>
Date: Wed, 18 May 2022 08:48:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [OE-core] Is BOOTDD_EXTRA_SPACE from misc.py used correctly?
Content-Language: en-US
To: Claus Stovgaard <claus.stovgaard@gmail.com>,
 oe-core <openembedded-core@lists.openembedded.org>
References: <0bc27fbcd5ead0feaef26e96be12bd6115b5593c.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <0bc27fbcd5ead0feaef26e96be12bd6115b5593c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 15:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165859



On 5/18/22 5:55 AM, Claus Stovgaard wrote:
> Hi folks.
> 
> I think the BOOTDD_EXTRA_SPACE is used incorrectly in bootimg-efi.py
> and bootimg-pcbios.py?
> 
> The background is that I am forced to create a rather small efi
> partition of 25 MB. Not a big problem I thought, as the kernel, plus
> initrd is only 12 MB. But the resulting partition was 28 MB.
> 
> After some digging I found this identical part in bootimg-efi and
> bootimg-pcbios.
> 
>      blocks = int(out.split()[0])
> 
>      extra_blocks = part.get_extra_block_count(blocks)
> 
>      if extra_blocks < BOOTDD_EXTRA_SPACE:
>          extra_blocks = BOOTDD_EXTRA_SPACE
> 
>      blocks += extra_blocks
>      logger.debug("Added %d extra blocks to %s to get to %d total
> blocks",
>                   extra_blocks, part.mountpoint, blocks)
> 
> So we calculate some extra blocks and if the extra blocks is less than
> the requested extra space we add BOOTDD_EXTRA_SPACE.
> 
> Why the value of 16 MB.
> 
> My guess was that it is for forcing mkdosfs to do a fat16 and not a
> fat12, it need minimum 16 MB
> 
> A quick test showed that 8 MB gives fat12 and 16 MB gives fat16.
> 
> clst@clst-linux:~$ mkdosfs -n test -C test.img $(( 4096 * 2 )) -v
> mkfs.fat 4.1 (2017-01-24)
> mkfs.fat: warning - lowercase labels might not work properly with DOS
> or Windows
> test.img has 64 heads and 32 sectors per track,
> hidden sectors 0x0000;
> logical sector size is 512,
> using 0xf8 media descriptor, with 16384 sectors;
> drive number 0x80;
> filesystem has 2 12-bit FATs and 8 sectors per cluster.
> FAT size is 8 sectors, and provides 2041 clusters.
> There are 8 reserved sectors.
> Root directory contains 512 slots and uses 32 sectors.
> Volume ID is bbbd3650, volume label test       .
> 
> 
> clst@clst-linux:~$ rm test.img
> clst@clst-linux:~$ mkdosfs -n test -C test.img $(( 4096 * 4 )) -v
> mkfs.fat 4.1 (2017-01-24)
> mkfs.fat: warning - lowercase labels might not work properly with DOS
> or Windows
> test.img has 64 heads and 32 sectors per track,
> hidden sectors 0x0000;
> logical sector size is 512,
> using 0xf8 media descriptor, with 32768 sectors;
> drive number 0x80;
> filesystem has 2 16-bit FATs and 4 sectors per cluster.
> FAT size is 32 sectors, and provides 8167 clusters.
> There are 4 reserved sectors.
> Root directory contains 512 slots and uses 32 sectors.
> Volume ID is bc573a89, volume label test
> 
> So would a better solution not be to rename it to BOOTDD_MINIMUM_SIZE
> or something like this, and change the code to something like below:
> 
> 
>      blocks = int(out.split()[0])
> 
>      blocks += part.get_extra_block_count(blocks)
> 
>      if blocks < BOOTDD_MINIMUM_SIZE:
>          blocks = BOOTDD_MINIMUM_SIZE
> 
>      logger.debug("Set %s to %d total blocks", part.mountpoint, blocks)
> 
> Can see the current behavior is pretty old - from 2014
> https://git.yoctoproject.org/poky/commit/?id=df634f3b1e02aa18f84b4b74f13c7260a21691aa
> 
> Please comment about the BOOTDD_EXTRA_SPACE
> What do you think about my proposal.
> 

I think in your case you can set BOOTDD_EXTRA_SPACE to 0 perhaps to get 
desired behavior. Your analysis is correct. BOOTDD_EXTRA_SPACE ensures 
that much of space it available, but perhaps what we need is minimum size.

> Regards
> Claus
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165852): https://lists.openembedded.org/g/openembedded-core/message/165852
> Mute This Topic: https://lists.openembedded.org/mt/91185286/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

