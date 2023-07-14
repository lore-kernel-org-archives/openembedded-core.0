Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5754C0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 13:48:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.19629.1689342493878318837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OqbQeUEc;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9891c73e0fbso387312866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689342492; x=1691934492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xi+wWbQGhG+CRjPdup4xo3aSJ2XiGAyVdMp8+w0YkS0=;
        b=OqbQeUEc3qyHWI3zrrm+lSHPzHHtx2frtNbUcdSCizk1AFegCtK6SRjciNu0FpQV4E
         01ibXyP9Lu2ETJ2gp8iH/eKg7+4oNZNmib0ZwWmhPwaJMbww98vuh1BX6Bwz9PM/Fvl7
         AdfT4jrJKl65DPGZ2aIM2gBMV82J8ycQma0EG1P9lOQr2TbGRMPvptae+xbZQuD5I+ba
         Ft2TUwJh1gq4e1LbL1MExPoshO4cLqa/s/k2vbOYp/axBghYexKi9syog1RFvyY9mYwF
         qE6RXlJQbEQILxlsYiYy1dDpWjfGp1kiXntNoNDxVYSM1ZEXjt7p1J4vaV0NzfocTaHM
         uTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342492; x=1691934492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xi+wWbQGhG+CRjPdup4xo3aSJ2XiGAyVdMp8+w0YkS0=;
        b=iMpXpkXmi2ABGwrlfCHQMmLSuTuMu3gwUAJ5gqD3l6gMhpxkALPg8AFf9x+fNHi2Zy
         BXzHRTlyKwXH17yD+2LKTahd+2y9OtkJd42xvBmwgShbgkVFfhMImHqNq6GCmJJf2AlO
         F3xhR1ZYFceYdO+fGu8pRGxxI4IRbdnC0kZyVWuUMQbpUhmSui5YWWhGm6uk/BiK94HF
         RgxT5kwwLn1Tr2S7vYaaXdidF5QFOsM3FtvF+ypVdb1FfFf8xuQmSFnPEZjDz+smpb2V
         o9YcOQa+j4eRINozEjxzqefWdDCNj/jAwHxcezniKdqJ8Bt0vKHJgVSt+mR10USyHdpY
         HBzg==
X-Gm-Message-State: ABy/qLY2W1lhk3xKV9LzuSa/not+qCXKpPGYXuDV5a+prTZNtwc+J+BU
	LN//4uvwSUh9uh7aEVWo8X06QeACPCg=
X-Google-Smtp-Source: APBJJlEptSU6doLkX4QBbD2NqwT4bkrZMmzhF7ofwMJ6dxYMCCfEKTYIE0UKyeC7zjHChEaToozSGA==
X-Received: by 2002:a17:906:5190:b0:993:e695:b585 with SMTP id y16-20020a170906519000b00993e695b585mr4019110ejk.9.1689342492166;
        Fri, 14 Jul 2023 06:48:12 -0700 (PDT)
Received: from [192.168.2.51] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906940b00b00992d70f8078sm5407157ejx.106.2023.07.14.06.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:48:11 -0700 (PDT)
Message-ID: <ee3e5bff-5067-e798-d2ed-ffbd1e4159c8@gmail.com>
Date: Fri, 14 Jul 2023 15:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] rpmbuild doesn't work on the target system out of the
 box with standard macros in the specfile
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <d8337e11-0727-a5cb-d3db-1cd6b5ad9190@gmail.com>
 <98E1AB5A-E531-457D-97B5-CFFD1C4A1103@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <98E1AB5A-E531-457D-97B5-CFFD1C4A1103@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 13:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184265

2023. 07. 14. 15:23 keltezéssel, Ross Burton írta:
> On 14 Jul 2023, at 13:53, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> It would be nice if Yocto's rpm recipe added the possible
>> buildarchtranslate lines for BSP target archs automatically.
> As you’re in the perfect position to test this, would you be willing to come up with a patch?

I am trying to.
Currently I am stuck with making this work for Yocto 3.4.
Later I may be able to come up with something that works for Yocto master.

> It might be as simple as only changing the macro files in native builds, so the target rpm has conventional macros.  Then again I don’t know much about RPM so may be wrong!

rpmrc and the platform specific macros file need changing.

rpm --eval '%{_arch}' also not correct. strace shows that
it looks at the contents of /etc/rpm/platform and then
wants to read /usr/lib/rpm/platform/<platform>/macros
which doesn't exist for e.g. platform=genericx86-64 or
other BSPs.

Also, I am not using multiarch so the default
/usr/lib/rpm/platform/x86_64-linux/macros is not correct
as it tells rpmbuild to use /usr/lib64 as opposed to use /usr/lib.

Not sure what to do with a multiarch Yocto build.

> A test case that does a simple build using rpm would be a good step too.
>
> Cheers,
> Ross


