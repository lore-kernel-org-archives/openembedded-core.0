Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3B7C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 08:49:29 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.6019.1638434968174391511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 00:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=idclsDfl;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id l22so69728094lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 00:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2Tdi2SH3BSFB95fixLpEVjWd8qzmNtncTHR+eaeO4W8=;
        b=idclsDflP/Qd6M+M5sYyNX4UPQb/obmgqAySoSF7uPW2xkYi2Ab8IRnvgZbQ+laKdt
         QVfprMBxQeBUoYEGcZlNuXgDfTz98dtdz+o3NTPd4m80tVePZ+NqBsxxwD6kcA+iKKRT
         OmFyf4Fdo9DEYYfPDKalOhY/qaeAe+sIYa+6GSl+s1c1hVcBbgUTMGvEu2n0le9yKF18
         BhGR2or7ElTOTytvI7X/QrfLfHD6BnOOfx31otxMAupOrrXJc3dSKyiB36y8/EZSwQTA
         tdt7jZ3p+kJ30Q7IGvyegnib/lKRHa1fOva5kqAzQK0mqlD/Rkw9IHQ7TKhOGh6Na4xA
         VVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2Tdi2SH3BSFB95fixLpEVjWd8qzmNtncTHR+eaeO4W8=;
        b=VN8iH4GObAhe2KcwPcjEw5ZTVrwM//Grjf5psyEHh4Zq1Zs/nPxa7pDUAyQYY3/4mT
         Td5N8netkcroIaNPvT6yC0eZGIgOQ95q7DsPyivEVLOV/MRikO35x6YzeoyVnHXVcLOU
         rhtdirJqhSNXg6fsfbQqmlxHiJLvZAx/s48yaV1diBwKef2c3JWZPjqye/5Qmh54a7AF
         r/VVfbWQBGVlrancmAyY2Oij9LVTt8GPwA+4+kTXT3Km7r5tUpjZtCFNDsl16lAZXyCI
         MK7I5He6/DXIINnE6H5H8gKcvEPx+I8MOVdi2xVkKdqugcfTWClJRp8Vmhy61aD/DAxc
         ZKAw==
X-Gm-Message-State: AOAM533mVZEHXHVzvriM3CWQrKUJsWy4wiAtGjHbUKKnZ6LPQ2AQCttC
	Cye2rlw6iv0aVGUGiifMme8=
X-Google-Smtp-Source: 
 ABdhPJw4LEen0FtMpQFH8gfbVOEZ4gbCtWHeM7Kx6w4HOvXDNB6Pgqc6GgmyCsjXCXBRveILxyawpw==
X-Received: by 2002:a05:6512:2249:: with SMTP id
 i9mr11291101lfu.62.1638434966098;
        Thu, 02 Dec 2021 00:49:26 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 m27sm261143lfp.268.2021.12.02.00.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:49:25 -0800 (PST)
Message-ID: <accb2806-163e-e29d-46f7-705771a231f8@gmail.com>
Date: Thu, 2 Dec 2021 09:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] native/cross: make ar wrapper support to read options
 from file
Content-Language: en-US
To: Hongxu Jia <hongxu.jia@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
References: <20211202083742.69650-1-hongxu.jia@windriver.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20211202083742.69650-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 08:49:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159077

On 12/2/21 09:37, Hongxu Jia wrote:
> If ar input params starts with @, it means to read options from file
> $ ar -h
> ...
>   @<file>      - read options from <file>
> ...
> 
> It failed to call ar wrapper to read options from file:
> $ path_to/oe-core/scripts/native-intercept/ar @bazel-out/k8-opt/bin/external/llvm-project/llvm/libSupport.a-2.params
> |path_to/oe-core/scripts/native-intercept/ar: invalid option -- '@'
> | Usage: path_to/oe-core/scripts/native-intercept/ar [emulation options]
> [-]{dmpqrstx}[abcDfilMNoPsSTuvV] [--plugin <name>] [member-name] [count] archive-file file...
> 
> If input params start with @, append option -D to argv list
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  scripts/native-intercept/ar | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
> index dcc623e3ed..32f45171d6 100755
> --- a/scripts/native-intercept/ar
> +++ b/scripts/native-intercept/ar
> @@ -19,6 +19,8 @@ argv = sys.argv
>  if argv[1].startswith('--'):
>      # No modifier given
>      None
> +elif argv[1].startswith('@'):
> +    argv.append('-D')
>  else:
>      # remove the optional '-'
>      if argv[1][0] == '-':
> 

I am a little surprised this works, since "-D" would be placed after any
archive/member parameters. But if does, ok.

Otherwise maybe we should just give up if there is a '@' and fallback to
not modifying the args, unless we want to process the file itself in the
wrapper.

Jacob

