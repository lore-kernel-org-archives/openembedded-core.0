Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49649C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:12:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.167.1652717554020775086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 09:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TbsLwF6v;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id i8so953072plr.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=SOyhBkU5hL0Z2q5Za1z6ZW91GAYgTtExzI7Be2DbXkM=;
        b=TbsLwF6voh2hJ9e0vYwJtzTkFfX8+IHVWong1h6waU8eTLt9DY2DgK//Taz08LrPSh
         VyJDGv07vCY5t210MER98hTm7Q+p6B9mcoK3slGL5L3yekHl+p+BYFgc6p//xtjBRZlf
         XKWCiFalbSaEDeufYa6TFTT/bIhz+qi7Wpw4htgk5R3ObJ/O93OpRozXAtLy3r9r9yBc
         oSkgdHP1iVlSvR33SfI1xCpRmS+p7GMOP3X3yYSc52coImW5s3sQhpYQiImSpta894pM
         mmxIVrPWgtqVNToG1WZYemP/VW20EDs8D1cJ7mR7WpHqKUXpYU+KJEDStU7U3Hl0qcwZ
         CL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=SOyhBkU5hL0Z2q5Za1z6ZW91GAYgTtExzI7Be2DbXkM=;
        b=jbk0WRlTnOvlI2baD7LwgfIsyVkGDmhNigL2+HgWVdsJXXAg1D3GXtG3XN8aBshsP6
         +lkQyH4ntwdUs1a5kuuSuLKvRFHUSfj2DTtuEUMFwaLg6QPb6rZ+phRIatgMrgIvP+WC
         LUQXI936xonJILV6RyGLedZdz9OIXZhjfcttlqJHUcnJ8XEiKw4x53aXYPhPTP67kf0u
         nzXaZhJmtxekUnqkqxG9e2enS8yLpF8/dXfRoS+C+vMXjo/TqVSaCOa7ELjpWmzjsGH6
         hw4YL/VSj9vN5Y5Pr69+fK5CyJgDVSNpmOwGVZE54HCoN2jgF3tduUs9xBY885MXlSec
         hxew==
X-Gm-Message-State: AOAM533tNRMrRQ1cvgB5a5YOhjssXi8AS/Umc0vEZu1m4kHpcd/nspHl
	AJ0pKbcs1N41ImdwON96t8fS1hi/SgxXRQ==
X-Google-Smtp-Source: 
 ABdhPJx3NEs062hwrr+iOP/KXcBBJxoMm2jNZ5LrysHWnt86rt8Q7tSto72PTV5RaNxor56xsBbraw==
X-Received: by 2002:a17:90a:17a9:b0:1df:4826:5155 with SMTP id
 q38-20020a17090a17a900b001df48265155mr7578691pja.201.1652717553095;
        Mon, 16 May 2022 09:12:33 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:c8de:10c7:fa38:24ed?
 ([2601:646:9200:a0f0:c8de:10c7:fa38:24ed])
        by smtp.gmail.com with ESMTPSA id
 x4-20020a62fb04000000b0050dc76281a9sm7054786pfm.131.2022.05.16.09.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 09:12:32 -0700 (PDT)
Message-ID: <f843ab80-94fb-a6d9-ef87-fc815baa2862@gmail.com>
Date: Mon, 16 May 2022 09:12:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] binutils: Bump to latest 2.38 release branch
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220516071118.496613-1-samuli.piippo@qt.io>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220516071118.496613-1-samuli.piippo@qt.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 16:12:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165688



On 5/16/22 12:11 AM, Samuli Piippo wrote:
> Fixes Qt build with GCC 12.1.
> 
> Brings following fixes
> 
>   * 3d549e5ccc0 PR29142, segv in ar with empty archive and libdeps specified
>   * c473aa1b9d8 M68K: avoid quadratic slowdlow in label alignment check
>   * 8d1187516e3 Adjust ld ctf test for 32-bit targets
>   * 9c67f6382ac x86: Properly handle function pointer reference
>   * 9a01457e02e s390: Add DT_JMPREL pointing to .rela.[i]plt with static-pie
>   * 82a5bb730a1 s390: Avoid dynamic TLS relocs in PIE
>   * d54081c642a LoongArch: Update ABI eflag in elf header.
>   * fb4d148004f IBM zSystems: Add support for z16 as CPU name.
>   * 975b5540232 libctf, ld: diagnose corrupted CTF header cth_strlen
>   * 99852365513 dlltool: Use the output name as basis for deterministic temp prefixes
>   * 210bf1d6225 Updated Serbian (for binutils/) and Russian (for gprof/) translations
>   * fcf60fe8482 PR28959, obdump doesn't disassemble mftb instruction
>   * e4a35c73196 PowerPC64 DT_RELR relative reloc addresses
>   * 7183434818e Work around gcc-4 warnings in elf64-ppc.c

this looks ok. Out of curiousity which fix is particularly needed for QT

> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>   meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index 3544c0c7e7..dc0a2a4054 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>   
> -SRCREV ?= "6938a3aca19044aeb9bc4b9564e04f9092a701ed"
> +SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
>   BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
>   SRC_URI = "\
>        ${BINUTILS_GIT_URI} \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165664): https://lists.openembedded.org/g/openembedded-core/message/165664
> Mute This Topic: https://lists.openembedded.org/mt/91134867/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

