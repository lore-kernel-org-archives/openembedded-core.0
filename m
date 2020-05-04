Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.7148.1588602083974704089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 07:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=PmRwUpR5;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f194.google.com with SMTP id o10so14079740qtr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=sN8D2FeK/OhPjf6t9Hz2872vpyzjgpng/+jXWUG+Q2s=;
        b=PmRwUpR5mK2jXw5uEu3j3hmHXXV//KmaXUEn/+zAF0h+G9j6Yt+WiIXHHWyelPAKkx
         gHfOL9I6Jvxe/+bi/W8NRmT2eJj5rbFjM0DzEUc7Qgl6ZQplsraTY7ui60HvFM3D6vUs
         0BCHZxC/nLdiil0yPkBtA+qMDvM6tRU8hPiyC3j8Vns5VbjLcMiUgIi0Esbi+xu4mOkt
         buP7FGKSC7nnPXH0AqyWpnG/wKpHKp1B5T+pftTIWElgvMsIXBbHjeCH3/RR4B0XAVKR
         FnqFOPthBr/uVcgUxef4L59hlo8KuxM+zaoelhPQp/Rah0/oeNCK/6uTMXmWDsa2VaEO
         rYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=sN8D2FeK/OhPjf6t9Hz2872vpyzjgpng/+jXWUG+Q2s=;
        b=aV1/JHK8YzSSpCpHiPKjGzb+e9Q6D/xbyQiZgW61WmuhajKVwumoYUCm1SoXWEHair
         d8DE3WMD+9qEq06G2dFny5u8DOxUw9aFRfiq9T6SHbz/OAsRpR19oTMOKcsMPV6t4X8v
         g/MLWgXB+5HrJjpUR117RN+sALhoyi9Bqvo8HUCNKIZD20PhDpAmRFHXXC1iFEbpIPXk
         UXQeSChBNLDXj1Toc+1eGs38t5zAdZsa+bZBgTg23ar1JIAvHfzPlYB9z+/CS/R3ykMm
         D4CKs1GOfzlDCfMlgBWo3prYKZ+J04Si7hD5XmtmHnGuvIUYf18zus6UEVsSk7ygRjD/
         gSZA==
X-Gm-Message-State: AGi0PuaADWcG9zzI1a2SncutpTfx5np4iYAD7qDKdFNeD4gqSMj/+YcP
	KNhD1K/IW6SaP3krmkYqZFXQlOdhMbUAgA==
X-Google-Smtp-Source: APiQypIUjtiWrC82wSIvyLccYd/YNy4K8ZAmOJhNUNmm8M4MN93QQSCRUMn7BiqdZVpZnlUsTWWEVw==
X-Received: by 2002:aed:3346:: with SMTP id u64mr17366997qtd.1.1588602082812;
        Mon, 04 May 2020 07:21:22 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id p31sm11502560qtf.11.2020.05.04.07.21.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 07:21:22 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id i14so5495484qka.10
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 07:21:21 -0700 (PDT)
X-Received: by 2002:a37:b1c6:: with SMTP id a189mr16735148qkf.26.1588602081088;
 Mon, 04 May 2020 07:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141004.9988-1-sno@netbsd.org>
In-Reply-To: <20200504141004.9988-1-sno@netbsd.org>
Date: Mon, 4 May 2020 11:21:09 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqjipD3ogk7SadJP9n=sJcwE3vPZKQuqqx9AE9ktnKhPQ@mail.gmail.com>
Message-ID: <CAP9ODKqjipD3ogk7SadJP9n=sJcwE3vPZKQuqqx9AE9ktnKhPQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] initscripts/init-system-helpers: fix mountnfs.sh dependency
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, Jens Rehsack <sno@netbsd.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020 at 11:10 AM Jens Rehsack <rehsack@gmail.com> wrote:
>
> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>     Author: Yue Tao <Yue.Tao@windriver.com>
>     Date:   Fri May 25 10:48:08 2018 +0800
>
>         initscripts: Avoid starting rpcbind daemon twice
>
>         Check the status before start it to avoid duplicates.
>
> the use of a script {/usr/sbin/}service is introduced - maybe earlier
> provided by systemd, nowadays mostly by init-system-helpers from
> debian project.
>
> For the very first shot, maybe discussions and improvements based
> on that script collection, use just the init-system-helpers-service
> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
> boot stage.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
...
> +RDEPENDS_${PN}-update-rc.d = "perl"

Can't it be replaced? using perl here is not nice.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
