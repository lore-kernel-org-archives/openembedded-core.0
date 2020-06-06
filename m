Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.6157.1591481798307323827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2020 15:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UmuYaRPj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id q25so12736037wmj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2020 15:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=q9sNEJ7Jc1mdzc5pFWgSfeI41eQLp/b2/M+OMwQlUF8=;
        b=UmuYaRPjUvyDkzBmkidv47qOlXZTbSMbyCNDkjPgSrUdchr6ljDxIFpC9t8w6bvu+W
         J/2Joa1abytoVI69xZWDePTHHMfaGXu4LNl4AOYlBH36DCl8zjFtLtFiSJ0C6P7mv50F
         cBEk46oxVmfv/ZvS6WLxXWkWyuNBuDyg7U9IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=q9sNEJ7Jc1mdzc5pFWgSfeI41eQLp/b2/M+OMwQlUF8=;
        b=MmkgK4ChAeF6mA6yPBYxRX8YOhGeOhVbeIt1xii5haDrPq3TzcT09Uofts9LCfUP8O
         0UAzreK4tP/njZKFGWbEpHfF8how+b6wlYKsXFn5oQNgi1gzFLLMgeK9zQLajJdfC1YP
         8Ea/QxADNK6KZrzYTTh6Fp+sbb8T/mwovXaQR+SkOHJFfQ3qPvAOQocry7fpJgCA38Dx
         U0cR1KPmDwYzbG9VJJvrSns7nhq8lqWx0pSEtiT+2JibOEe6FmGnaxMD895TKO+VPibr
         K4d7sc1QpP+V94ok4AH53smWmT29cZZvNGQYQ3K5QBuhXG4PnDXGeeFzvMYYWA9NrVbX
         lOSQ==
X-Gm-Message-State: AOAM530ETRi7kQeiEiPbcH5QP3YBxmoJrDJ/nabaKiB3hTLf3tUp/lTN
	LN5Rxxs+LyBkLWSqCSJBKUwngg==
X-Google-Smtp-Source: ABdhPJwmRJ8PZVXPtPgVgZQTTf9UtNaYSfmqzhzgdiPS2Z2cN7MtFsBmVEpL1Rod1soaFTvB8G3dVQ==
X-Received: by 2002:a1c:ed08:: with SMTP id l8mr9020259wmh.169.1591481796804;
        Sat, 06 Jun 2020 15:16:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l17sm18113397wrq.17.2020.06.06.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 15:16:35 -0700 (PDT)
Message-ID: <5f4e92d0f303fbab8acf72dcaa7e0908d0dccd80.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: add tcl rdepends for python3-idle
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 06 Jun 2020 23:16:34 +0100
In-Reply-To: <20200605084729.563714-1-mingli.yu@windriver.com>
References: <20200605084729.563714-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-05 at 16:47 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add tcl rdepends for python3-idle to fix
> below error:
>  # /usr/bin/idle3 -h
>  [snip]
>  _tkinter.TclError: Can't find a usable init.tcl
>  [snip]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.8.2.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
> index 0474f07214..0ddf88699c 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -346,6 +346,7 @@ RDEPENDS_libpython3_append_libc-glibc = " libgcc"
>  RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
>  RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
> +RDEPENDS_${PN}-idle += "tcl"

Shouldn't this be using the tk packageconfig too? or depending on
${PN}-tkinter?

Cheers,

Richard

