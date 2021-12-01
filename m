Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFDFC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:34:38 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.92898.1638369277305895975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 06:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQDGpbq7;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id u22so48579312lju.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 06:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jj79ALM7W6GtwqK85scWQ58C9zTq4I2iIFJY3ltIjnU=;
        b=NQDGpbq7+UirHydiyLpsQu4sydAC748dLCh0z3Fd8EvRiWSSvx6Phqndc9i9yDTVFw
         i1rON8zDSxCDaYNV9F+5WM3W1hAGetMF86bOCmyKGnsXyfNpcEVFQBM7L3+fzhUs2hYN
         8VYlzyOGdns25cE8oPJthNenitLuJF90oFB5/8dQocKfNhm6lh9xwmv3WijlsdIDx1pp
         a7+ZTldPcbcAjHgI1mBR7Br6FovojHPBQtFdhsGo8AL+T/hYH9UvGQP1gUCK2XyYGwZX
         jjme6iQ43aOMSbZ1Op5e6yr+aZp5psd0+lIqasXwISgdI8NH4GJKY3+l4RYob0xmjD+8
         i8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jj79ALM7W6GtwqK85scWQ58C9zTq4I2iIFJY3ltIjnU=;
        b=x+LNJIAcRzwrPXcLH/g+xz3JQFwOxp3iHz+e/pPTWyYi/4kbi1WpZFpj+UJlbEWJQR
         U6XP7XUfOJw0puOi/g50AhPBFY0C2ra8s4CcfUrvqlfqj0QZdEuJPYgsEAmPDAkhZYru
         SGnEcarbeahd5AfPjnhJIfKIthFaHN+RXYFMliEmde+5LyFP+vo3RP5d3TmuttUisoTd
         WmZbQYiTLmuRVzmwmPngp54b+ogeS1maOQQAyfIxxw4pI9Q1OQ4IUSiRwoQB36pQPUV5
         ZAaahyhAX9NfmkAzn3mYHVG9C9iw3TB/jycvN3XXaps+s7sjev/Qu027WrjeukwFGLRl
         ZTkA==
X-Gm-Message-State: AOAM530uh+l1xQbcZfoflYOXo7fNMxmSsPyEnyCrAu12o7+7yphiwofK
	9rZ+buxDWFLrOnKoavyOAcU=
X-Google-Smtp-Source: 
 ABdhPJwAYdVX5nUqs4u/bW/et+7jFcIlGCmUfLxBdKDRYLzlZJts10o/f7zmquG4vboL3Molbm0TjA==
X-Received: by 2002:a05:651c:106b:: with SMTP id
 y11mr5892295ljm.504.1638369275088;
        Wed, 01 Dec 2021 06:34:35 -0800 (PST)
Received: from [10.133.218.216] ([185.253.97.11])
        by smtp.gmail.com with ESMTPSA id
 t7sm2400335lfl.260.2021.12.01.06.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 06:34:34 -0800 (PST)
Message-ID: <55b80756-4bba-42d6-755b-25ddfb1ffea8@gmail.com>
Date: Wed, 1 Dec 2021 15:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] patch files in a directory aren't applied
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
References: 
 <CAEHkU3Va4+i+Y2mhxMWxS+rcTxaTFFrfTjchPedYE8yAFCsCuw@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CAEHkU3Va4+i+Y2mhxMWxS+rcTxaTFFrfTjchPedYE8yAFCsCuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 14:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159034

Hi Max,
I think you are interpreting it not entirely correctly. You are reading 
do_patch() description and the task would pick up all patches it finds. 
But SRC_URI is another thing and it is looked at during parsing time.

Vyacheslav

On 01.12.2021 15:26, Max Krummenacher wrote:
> Hello
>
> I tried to add patches by specifing a directory in SRC_URI and have
> bitbake appling all patch files in it without explicitely adding the
> individual file names in SRC_URI.
> According to the do_patch description [1] that should work, however
> for my example recipe it does not. The files in the directory end up
> in ${WORKDIR}/path_to_lots_of_patch_files/ but none of the *.patch
> files are applied.
>
> Looking at meta/lib/oe/patch.py src_patches() I believe that the
> documented behaviour is not implemented.
>
> Does anyone know why this is documented but not implemented?
> Has it been removed for good reason and is now undesired in OE?
> I'd be willing to work on the feature.
>
> Max
>
> [1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159033): https://lists.openembedded.org/g/openembedded-core/message/159033
> Mute This Topic: https://lists.openembedded.org/mt/87429103/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


