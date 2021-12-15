Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B80C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:01 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1758.1639591018125266617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mI8hjdzu;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id mj19so3202549pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:organization:subject:in-reply-to
         :content-transfer-encoding;
        bh=n4UTP/onXe86wUy6SzpsE6BCH7DTemmYEEcZD5dO74w=;
        b=mI8hjdzuuiV2an8q6/ESDWQ+/vse6V69y4CsVHxbhCnQDCx8X8OezPzbOJwWJu1hp9
         FRFq1U9LPM3TUfyeNyNXoDChpBG9SglwBQ8r3u/Dk42JLrfoi60CJIyMnpAEf2mfvTu5
         sAsH0FLoMSj3Z1UW8ThMdCzEKQZJdyb/N9JTcp4sTgR3b2B+5Gi5gTZ4T/Z+MxipRSk8
         T96jrUS1/Oh4/NZYrBp0nLdcikj877FBMuOUuMUWhAnHhMooRqALlGFaaUPBAIKym2OS
         naik0EUQWldSgduDINQxWcvN02zdzuL4g0prk+qP/ELra4fh9IwMsr34Edh0nmC8t1ST
         DDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=n4UTP/onXe86wUy6SzpsE6BCH7DTemmYEEcZD5dO74w=;
        b=Yxu3TFsX/0IqPhgZ7ih/HQKfkddIQ+qgMr7deGbeNKqqc5hMDm8fLtIJgzeTHykZAX
         /XmQZkB64txnO1xWBd2mrVLmNDTefBDOC/zDFN/eP9h6PzCByEXmCEJh8zermSZoLEwJ
         AuGZxcfcVEp3HRwSQHBbuOkjzBF9MrTvDicLYXuq0bEesp0DRn8BupPstwiIy7Vt0OBI
         XfGXElfttXHYm7JefaxGJzdFrJIG4feCOcQsWWeQrxT1xLxWl50b5e94KK36x0DzivZZ
         grR/EkCkBHqJeqcEqkvYMBHEqghpcQAy4alZ8FnM6VZ7sFSLdDwWBtshQudbJMM9a0Rd
         08JQ==
X-Gm-Message-State: AOAM532pDANlTejqEe4dh3/S+7KVyFQUe9MF8lZlBX+E1+npyCvFgCAS
	zD0xf5r7FC5FATWFEIpwhJs=
X-Google-Smtp-Source: 
 ABdhPJxZ2GHMLrwOwXKSkvzl5YeDOVhsL454PVtH0Nqrl2UyBrtkmHmPNzrcfxTIiqlkMKNry1SSoA==
X-Received: by 2002:a17:90b:4b51:: with SMTP id
 mi17mr1063824pjb.48.1639591017605;
        Wed, 15 Dec 2021 09:56:57 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:cd09:406c:9104:34eb?
 ([2601:646:9200:a0f0:cd09:406c:9104:34eb])
        by smtp.gmail.com with ESMTPSA id
 p12sm3731328pfo.125.2021.12.15.09.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:56:57 -0800 (PST)
Message-ID: <caed28f7-e3cc-c64c-4095-b94221d58bd1@gmail.com>
Date: Wed, 15 Dec 2021 09:56:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Matt Madison <matt@madison.systems>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
 <CANNYZj_eCMyQYHhx7uhZ34NTGekeWAwcGSPCvE1P-tO5wLhp8g@mail.gmail.com>
 <12b73e8c-d4b7-d8cc-0c1f-425c045a95bf@gmail.com>
 <CANNYZj84Y8azO2aGLUu8q8_AqcSX=iaP8MUfJGuGS-wB6+7fyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
In-Reply-To: 
 <CANNYZj84Y8azO2aGLUu8q8_AqcSX=iaP8MUfJGuGS-wB6+7fyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159737



On 12/15/21 9:43 AM, Alexander Kanavin wrote:
> On Wed, 15 Dec 2021 at 18:40, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
>     Lets try dropping -r option, I think it should work. Good test would be
>     building qemuarm64 on a build host running < 3.8 kernel and see if all
>     builds ok. or qemuriscv64 on hosts with kernel < 4.15
> 
> 
> I don't think such hosts are tested or supported, and they're going to 
> break in various other ways anyway.
> 

Picking from set that yocto project supports

https://docs.yoctoproject.org/ref-manual/system-requirements.html?highlight=system%20requirement#supported-linux-distributions

( centos8 uses 4.18, centos7 uses 3.10, and debian8 uses 3.16 )

> Alex

