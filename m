Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.8126.1601069361350877880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 14:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CrioU9WY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id a9so680068wmm.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 14:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/RsPBTLXwFtMZoJf9T5N8cu4xTzAVB2k+EALaAp82XQ=;
        b=CrioU9WYkmzFwgSzWg2Jisda9F/3O2lyMbYPBTO4UJ6sdHNcf23vZXtCipUK6ecgmn
         IigLz5k0521b7SHpNGOMb5LVowe6HJZkpMYdWc/SqyArAhD4g21SV4ki+3MKOWlNO95a
         Mx2a7Kneo/4CDpOE8ELwP6VsMDAwNDcs1ckyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/RsPBTLXwFtMZoJf9T5N8cu4xTzAVB2k+EALaAp82XQ=;
        b=sNzDNNmQFDwQrQscKTt/MRmxpKE5Cj8dBOjHPoYS9FiVmtQ4yysOZ06Ljtkij265Ca
         Y/5QRBCD0mj4XgXDQdTFBIzZpfrJLUMKZ1ETQUMTEhgquCw7/WPhOpY3uip3O5/dpsPJ
         r6bcAFtUiPZFqmog0CXlvzPga36jVlVC1+9xc/tF2hI6wX31UStHQe/thJ4rBQh2fWYa
         0vLGzIanU7MRlh7h5tT7BLyu7AmUwn2aeusVGUuhQw4eqMdjy0FOuuaJgsY+hbAo/u/z
         hxYoQi/nG9T7ePpWoIrC3opXNMAy5I+zyo/zJj5cBI4l9P7kqagNoNaIvwnfOMkvNIC5
         +YuQ==
X-Gm-Message-State: AOAM532IyXUbiLIW9A9K5XIeIwGMobcWPnO4+MCKAiUW9wF7SX7bsezN
	fyCoG/evkR1mgMF2sWvQ7STVMw==
X-Google-Smtp-Source: ABdhPJzD3Ce5HVvNOpmMmjEwZ1cEWRwAjjMvpULPjLgxgyxKrYGXjpqv0DzXrGRqie9dUkaBMkUTeg==
X-Received: by 2002:a1c:bb45:: with SMTP id l66mr519053wmf.79.1601069359598;
        Fri, 25 Sep 2020 14:29:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id h4sm4906808wrm.54.2020.09.25.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 14:29:13 -0700 (PDT)
Message-ID: <6a248843f00759ecac0785cea187d8724bd362aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/6] Space-comma Cleanups
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2020 22:29:12 +0100
In-Reply-To: <20200925192810.1372-2-jon.mason@arm.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
	 <20200925192810.1372-2-jon.mason@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-25 at 15:28 -0400, Jon Mason wrote:
> Multiple files have " ," instead of ", " in expressions.  This
> changes
> them to conform to the way the rest of them are done.
> 
> Found and corrected via:
> git ls-files | xargs sed -i 's/ ,d/, d/g'
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/classes/linuxloader.bbclass              |   2 +-
>  meta/classes/rootfs_rpm.bbclass               |   2 +-
>  meta/conf/machine/include/arm/arch-arm64.inc  |  10 +-
>  meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
>  meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
>  meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
>  meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
>  meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
>  .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
>  .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
>  meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
>  meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
>  .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
>  .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
>  meta/conf/machine/include/tune-arm920t.inc    |   2 +-
>  meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
>  meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
>  meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
>  meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
>  meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
>  .../include/tune-cortexa57-cortexa53.inc      |   2 +-
>  meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
>  .../include/tune-cortexa72-cortexa53.inc      |   2 +-
>  .../include/tune-cortexa73-cortexa53.inc      |   2 +-
>  meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
>  meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
>  meta/conf/machine/include/tune-ep9312.inc     |   2 +-
>  meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
>  .../machine/include/tune-strongarm1100.inc    |   2 +-
>  meta/conf/machine/include/tune-xscale.inc     |   2 +-
>  meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
>  .../recipes-core/images/core-image-minimal.bb |   2 +-
>  .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
>  meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
>  .../vulkan/vulkan-demos_git.bb                |   2 +-
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
>  .../linux/linux-yocto-rt_5.4.bb               |   2 +-
>  .../linux/linux-yocto-rt_5.8.bb               |   2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
>  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
>  .../libpng/libpng_1.6.37.bb                   |   2 +-
>  scripts/pybootchartgui/pybootchartgui/main.py | 184
> +++++++++++++++++-

Cleanup is good but this last bit doesn't look quite right!

Cheers,

Richard

