Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.21120.1595344339678761516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 08:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CyUwz/bm;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id o1so10402808plk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nDcljKnAAKdopg66KtDI0tMZ/fK1uOVT31mRt77oKf4=;
        b=CyUwz/bmrxL62Dvc3DYw5/7SYh9tYSJDzOAIdKPwGnIK/NCNVr8d3Lvu95DSU6kHlj
         mSzzfOGHg4fFsmHpIXoIxRrwM73olJwwcaZfkq1zeR5xXhZkYGD1tQ66T0YweWwglQ3Q
         8mRP73dpD1aEuSE2Xpu1nVDo5qlBzj+GBdAr7K0CnyEmiOHlQ8cjUMXyQ2O9QU12+zG0
         +PgPpw4JM4PKSdbJuezUhRZexAqHp69VJ1WolCWwfmqP6+20AgW3pTbo0QYhGK5ptoU0
         eU/jfN1c4IAPg/uYEhcGDMJhEzNpX87sIBdDC19i8BgRIDAoJL+UurrUS/kmPb+ynXi5
         lJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=nDcljKnAAKdopg66KtDI0tMZ/fK1uOVT31mRt77oKf4=;
        b=jH5341gzdzSjDyPJgm0NcDIObljeh0xTdgRyhI5amopiRxm4ZyR/u80f/KiO6/OuXI
         pS9NprcB3vJ0J2kyuIxpVAE/vwoptKYnR0HqDWgNpCOfthhat1LgMhaK5MN2YmLdWYbn
         i33bpDETPdeXlJnJWZzjKg1hryERtfndTxR1fzOUgwRCuCkRGurSkfzrSUouWeeNFbjI
         3q12bIL51ahMArRm30zpe1ITu/01tR2Q2QZAuFqSLnAIsGQ7un34/x/q8s3MzizGwc2u
         ePUDtpoFAWLMtmJWyOoKZTjUWx9+DsT1akAnQaeDGFGwVDGypvH9eHCZa17eCyS596Pa
         bLgQ==
X-Gm-Message-State: AOAM531snhCtqplqvvZlU3QUuX9xG0yiHaTtlIgPgcHq/nvNf1QTdmMc
	4QyG0q+KXvaCXMOz/pYouzhwGtuvAMU=
X-Google-Smtp-Source: ABdhPJz1mAFR6Eh/vzHePjGgQz2pwfPfuyXi9Y+dcA+9UDF9SPltAbs/YyiQ68Ln/b/AAJPXVG2Xsw==
X-Received: by 2002:a17:902:654e:: with SMTP id d14mr11615833pln.257.1595344338852;
        Tue, 21 Jul 2020 08:12:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3078:3eaa:6235:1a83? ([2601:202:4180:a5c0:3078:3eaa:6235:1a83])
        by smtp.gmail.com with ESMTPSA id br9sm3430499pjb.56.2020.07.21.08.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 08:12:18 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: always save cve report
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
References: <20200712223828.584-1-akuster808@gmail.com>
 <20200721095450.GA25648@localhost>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ec69a306-faf7-67c1-1e47-e37895e994ef@gmail.com>
Date: Tue, 21 Jul 2020 08:12:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721095450.GA25648@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/21/20 2:54 AM, Adrian Bunk wrote:
> This breaks building the SDK in distributions with INHERIT += "cve-check":
>
> $ bitbake tmp-sdk -c populate_sdk
> ...
> NOTE: Tasks Summary: Attempted 2785 tasks of which 2785 didn't need to be rerun and all succeeded.
> ERROR: Execution of event handler 'cve_save_summary_handler' failed
> Traceback (most recent call last):
>   File "/home/bunk/yoctomaster/yocto-tmp/sources/poky/meta/classes/cve-check.bbclass", line 65, in cve_save_summary_handler(e=<bb.event.BuildCompleted object at 0x7fcf4e4bada0>):
>
>     >    shutil.copyfile(cve_tmp_file, cve_summary_file)
>
>   File "/usr/lib/python3.6/shutil.py", line 120, in copyfile(src='/home/bunk/yoctomaster/yocto-tmp/build_tmp/tmp/cve_check', dst='/home/bunk/yoctomaster/yocto-tmp/build_tmp/tmp/log/cve/cve-summary-20200721124814.txt', follow_symlinks=True):
>          else:
>     >        with open(src, 'rb') as fsrc:
>                  with open(dst, 'wb') as fdst:
> FileNotFoundError: [Errno 2] No such file or directory: '/home/bunk/yoctomaster/yocto-tmp/build_tmp/tmp/cve_check'

thanks. I will take a look.

-armin
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> $
>
> cu
> Adrian

