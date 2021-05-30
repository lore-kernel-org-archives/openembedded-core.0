Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.37066.1622413243879107036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zu/zydxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so7717233wmk.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GN/iZWM0aXv6MI26UpreXCSiTTGpDLxbgPN00YMp7nw=;
        b=Zu/zydxvONKU7NZMP/d7L7wCNc/KZPJyyJl28vA6CfjXdat8zOyWuIvpWSdYeEqIPq
         0nfHzivh3+f+9TI4wjQqxBMcGLCnVIj1xBhIQw2zgDRBq0dlHKlzVg9lgethxVQFAe73
         cLWj+x53tq4XL7uus86h8VWSkCr32N3wsVbY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GN/iZWM0aXv6MI26UpreXCSiTTGpDLxbgPN00YMp7nw=;
        b=fLHKTHn/VkqOYm0si1wLtwYF6JX6cHy3r91mPp/Gklc/LOfc/BjKFROj6dy6BYDiHW
         3Hh6/gZFO1zxviB9MHq6Md0uKRFaN7MG38qz8RUt7unVqITNG5ceslec1UDW4C/tJkpT
         JejY7EIw0GiCy/WNJt3TB/0MdC9R5+FyocXaFZYGOcsQfBf7Iry+IRawm1xXvntKsHOz
         RQD4ILalTg/4GWstWinWvlHYMq9XKp1H5WfN3Mk0HiYOyaGOpHIk3Zvt6guwRHeh6m9t
         WSfdMBLa3zhydks/vXNF+QvZydRaZ/PAMqylxliosBN/tCeNlvoW9NZxC3rM2AwJ7GjU
         OAzg==
X-Gm-Message-State: AOAM531w71CDctujYWlSf9O6aY5D3OKjq4J9mTpnSWgvhGuBKZhv54r5
	JzkbPWhZltMoaU8JqE3/a3Xl8w==
X-Google-Smtp-Source: ABdhPJzDJFr5zlDvmX5lYp75pZmC6khd5eUzP0/+7j429O+Qf5zcj+xb2AfE50P5Bgok4jCucNY3gg==
X-Received: by 2002:a05:600c:1913:: with SMTP id j19mr20597104wmq.167.1622413242032;
        Sun, 30 May 2021 15:20:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:fcab:51bf:ac39:992c? ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j101sm15869627wrj.66.2021.05.30.15.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:20:41 -0700 (PDT)
Message-ID: <9e8235b427f09fab8842adf05991ddc22db80974.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] Upgrade status: 2021-05-28
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: auh@auh.yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Sun, 30 May 2021 23:20:40 +0100
In-Reply-To: <MADEUP.16833731A817E903.665@lists.openembedded.org>
References: <MADEUP.16833731A817E903.665@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-05-28 at 04:23 -0700, auh@auh.yoctoproject.org wrote:
> Recipe upgrade statistics:
> 
>     * Succeeded: 19
>         iproute2, 5.12.0, Changhyeok Bae <changhyeok.bae@gmail.com>
>         libxcrypt-compat, 4.4.22, Khem Raj <raj.khem@gmail.com>
>         libmodulemd, 2.12.1, Alexander Kanavin <alex.kanavin@gmail.com>
>         python3-hypothesis, 6.13.7, Tim Orling <timothy.t.orling@linux.intel.com>
>         python3-importlib-metadata, 4.3.0, Tim Orling <timothy.t.orling@linux.intel.com>
>         python3-jinja2, 3.0.1, Richard Purdie <richard.purdie@linuxfoundation.org>
>         gi-docgen, 2021.6, Alexander Kanavin <alex.kanavin@gmail.com>
>         libepoxy, 1.5.8, Anuj Mittal <anuj.mittal@intel.com>
>         pango, 1.48.5, Ross Burton <ross.burton@arm.com>
>         libinput, 1.17.3, Ross Burton <ross.burton@arm.com>
>         xf86-input-libinput, 1.0.1, Armin Kuster <akuster808@gmail.com>
>         libx11, 1.7.1, Armin Kuster <akuster808@gmail.com>
>         xorgproto, 2021.4.99.1, Armin Kuster <akuster808@gmail.com>
>         kmod, 29, Chen Qi <Qi.Chen@windriver.com>
>         linux-firmware, 20210511, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         lttng-tools, 2.12.4, Richard Purdie <richard.purdie@linuxfoundation.org>
>         puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
>         libpcre2, 10.37, Armin Kuster <akuster808@gmail.com>
>         vte, 0.64.1, Anuj Mittal <anuj.mittal@intel.com>
>     * Failed(do_compile): 5
>         libxcrypt, 4.4.22, Khem Raj <raj.khem@gmail.com>
>         cmake, 3.20.3, Pascal Bach <pascal.bach@siemens.com>
>         python3-setuptools, 57.0.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>         curl, 7.77.0, Armin Kuster <akuster808@gmail.com>
>         libgcrypt, 1.9.3, Hongxu Jia <hongxu.jia@windriver.com>
>     * Failed (devtool error): 6
>         elfutils, 0.185, Zang Ruochen <zangrc.fnst@fujitsu.com>
>         gnu-config, 20210522-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
>         perl, 5.34.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
>         vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
>         libcap, 2.50, Yi Zhao <yi.zhao@windriver.com>
>     * Failed(other errors): 1
>         adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>
> 
>     TOTAL: attempted=31 succeeded=19(61.29%) failed=12(38.71%)

I've pulled out the majority of the successes here and submitted them. My intent
in doing so is to let people concentrate on the failures above or the remaining
successes where there are issues (lttng-tools has ptest regressions for example).
I merged the libxcrypt and libxcrypt-compat patches so that failure is handled too.

I'm planning to have the AUH run more regularly, which will be easier
on the mailing lists and maintainers if the successes are handled and should
highlight where help is needed for the upgrades.

Cheers,

Richard

