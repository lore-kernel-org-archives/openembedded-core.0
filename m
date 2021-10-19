Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254D0C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 16:47:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.12603.1634662053407470148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cK1Wfv3f;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso351496pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=/jioD8reS4VYCIDJdgRhLcfmmC81qok0tEEoFUZrbns=;
        b=cK1Wfv3fpNsyErqXBdsK34QEq5YweRi7TcbuKms4gobcmLBIR2lAZqU/jJ0AtcHVi5
         PUo70LC5IvFuBUgqHIk4VOuBLYIMkfu6dEC4TmJcxLR0FoMPJHv+wrGsVrv2tTzaMEXu
         Otgicf4DGPDr+K3GQTMBkUHeqk5CTWC+JrNcKN0CYNVSRbLxVtYKflajNEzZPlbOD8ic
         SiXXnoeaSaiEo6mXHGfRnmOzPfF1Q6Wvr00kNw56fk4NrDJj48SsDE5zhjdnq/S2jPim
         6tEs9HFL0EDZoP3dwCUrbxhiAbhYCTv/was2p3dpjyVtjWNi9P5q6PbwVMNepmAmoADT
         XqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=/jioD8reS4VYCIDJdgRhLcfmmC81qok0tEEoFUZrbns=;
        b=R7bFAEOi1Yag0yozLPCL4Ze3CpOI6PTot2vJ5nxvhE3qKSbIbFYbWYg+RqtFugF73b
         XEq1p/8Z/A0Iw3J9+Qau9aWYE6vWluQHSzws191F74U+EBzLSPJCaL+AdjxbvLvg8hcZ
         YhvRCsoWR5wOaCdHB4n489e/QewIhXIu5Nq8ZjGBwuYixg5kvjL6PK0jZQXDQBPD2tPX
         03kGJQ0Vu5UPl9HhCmWg1aG+4PZWIMLopuXb+mJpc6WPAV+kEddMQG3qktykWD2ta9CO
         RCtXglJlNChqOf8QDE7tKiew41cInfl0W52Tl3/zbnoUEUnakNlWa1DPhVhFIrOzSIWX
         PMiA==
X-Gm-Message-State: AOAM5320e0yhOr+xF+213HOAwp5WQhQgbP7mA7pdTRwT+AAtY0vwG4WS
	D6AwAsGnXlkLoeh5hGHTddfprKmQYE+7MQ==
X-Google-Smtp-Source: 
 ABdhPJyG2EjSwEkbPzEJtQ0Fahfc5NVLxCMz5VS2iVuXqGco38I7XdJ2yKYcyWrdpquwBa9+x0NssQ==
X-Received: by 2002:a17:903:2304:b0:13f:2457:11dd with SMTP id
 d4-20020a170903230400b0013f245711ddmr34039349plh.57.1634662052711;
        Tue, 19 Oct 2021 09:47:32 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9fc:73ad:7653:581d?
 ([2601:646:9200:a0f0:f9fc:73ad:7653:581d])
        by smtp.gmail.com with ESMTPSA id
 x17sm16568059pfa.209.2021.10.19.09.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:47:32 -0700 (PDT)
Message-ID: <ebae2be9-c655-3f39-cd09-eeef03b30e3d@gmail.com>
Date: Tue, 19 Oct 2021 09:47:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [OE-core] [PATCH 65/65] systemd: disable seccomp on mips32
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-65-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211019153419.3319802-65-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 16:47:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157188



On 10/19/21 8:34 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/recipes-core/systemd/systemd_249.5.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
> index 70f8813895..47d5209f96 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -111,6 +111,9 @@ PACKAGECONFIG:remove:libc-musl = " \
>       utmp \
>   "
>   
> +# https://github.com/seccomp/libseccomp/issues/347
> +PACKAGECONFIG:remove:mips = "seccomp"
> +

this should be mipsarch

>   CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
>   
>   # Some of the dependencies are weak-style recommends - if not available at runtime,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157184): https://lists.openembedded.org/g/openembedded-core/message/157184
> Mute This Topic: https://lists.openembedded.org/mt/86442719/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

