Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45445C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:19:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.12729.1639063146125154524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ib6hzUVX;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id k37so12675592lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=h620nTOmRrFJPc3NLEOWB1rjh/R9lzFVbRZ54/x0O0Y=;
        b=Ib6hzUVX3TxiEsaep1EJTQ6/JCeyvx/xmYqlXNh6GjRw9eNChFraaEvlXyVRibjO/R
         iBFVPulMUMhAKXqlXkglf3ruvpLjdPKnXTb4PYQNW0ARLEtxlz022cX+suxW9/s9DARE
         V3OyzIotyl2bACIezXUWZBesxkQgHHKdvuEinWEVs32qyBVXQtIw922bdIAUnWhBNdR5
         uzgt8DZB+vv/BbQ0ZVdPIUJN8JjgreLNGn30tiDBIDeV0W0Z8CU7MayolM1kE8zE3y/S
         CbcaZkQvPFMWCOQsVQFIPjFHAZHMwh4gyupza+zIdiDzwDfKPyEEBmrQTS43qYmZee2j
         4P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h620nTOmRrFJPc3NLEOWB1rjh/R9lzFVbRZ54/x0O0Y=;
        b=UlK/43eUuoFpItvAJZB9H4CZ9v0xYHsRgci+BaVW2rbS+7ixyV27BQ4XSytp7ET5sm
         9h+N8f+NDpoVykmOgssgLRBfIpwrvBmH1GtjtTjqoMT3hvwfjlRJE3h//qpTBnicmj1S
         YFM7JLFB+eIpSdVME1RnBoF8XjEj8U+iIMb/xqo/hCDJslakZCLsmtlPCzfPTwSks4c2
         lMVhj5AJprQZV6Gb7VLadDzcbtuuGhbsgba72701t9mCgXziztWm1LWx4RaR/08zImuP
         rfMqso4o79f9lZpx9Ny8tfUQum+a6LYJkhw8zy04zQBbCdyhQ2lYQVdpF6EiJ+zRsyiR
         Pcpw==
X-Gm-Message-State: AOAM531hhiq+OXC6zx1D90vQsSvidKiVxWoLJkLM77LSVxB3oRLpLO2T
	TulugQGGGloCQzhqDKRx0pc=
X-Google-Smtp-Source: 
 ABdhPJxrxvLVowRFf0nIBm1kzC49yesJQQql5cw9Ikyz8lWOETIVkBgGIdEBiCC2fbwoKWxlnE0hJQ==
X-Received: by 2002:a05:6512:34d0:: with SMTP id
 w16mr6510361lfr.420.1639063144179;
        Thu, 09 Dec 2021 07:19:04 -0800 (PST)
Received: from [10.133.222.104] ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id 9sm15132lfr.193.2021.12.09.07.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:19:03 -0800 (PST)
Message-ID: <0f6f7f5f-313c-2f03-5eb0-67f7a8d90836@gmail.com>
Date: Thu, 9 Dec 2021 16:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH 1/6] overlayfs-etc: mount etc as overlayfs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1637301667.git.uvv.mail@gmail.com>
 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
 <26ede260f595ddb3d8cdda552d74ac478c1e529f.camel@linuxfoundation.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <26ede260f595ddb3d8cdda552d74ac478c1e529f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 15:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159455

On 09.12.2021 12:08, Richard Purdie wrote:
> The second thing which I don't really like is this mix of shell and python, it
> is very confusing to read. I'd much rather we put template files into
> meta/lib/files/ and then read them from there for the variable substitutions. We
> do this for other scripts. I appreciate the overlayfs class merged without that
> but I think we need to fix this there as well.

Thanks for the feedback, Richard.
I see only meta/files. I guess you meant this directory.

Will do the same for overlayfs.bbclass too.

> Adding the tests in this series is really great through, thanks for that!
>
> Cheers,
>
> Richard

Regards,
Vyacheslav

