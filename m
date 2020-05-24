Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.14901.1590332763374073710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 08:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Th/w7hc1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id y5so737432wmj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sEhwpMSFs6I/79rDRzsm1j/ql4XRaBYZI1M7F/lijxQ=;
        b=Th/w7hc1AUQpJVxj70t4f05FOreZDzRUdoIFabIsYohYnXRqYLeJBJaSzwha3K7AMu
         y9Ldua1w/EnkCSbilUTCJqyHJwAZ+g+PzWOaBogJ99rhcPrFWiB4/Y1WpyxC1uYAyGJz
         UYsX9EhIZDcIYlHl9H6lZn49C256CaaOkK7K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sEhwpMSFs6I/79rDRzsm1j/ql4XRaBYZI1M7F/lijxQ=;
        b=KD9A0f42J3mi7wQweH16fbvMPRX+sMxiuDAVnHjagnbvpIp9iglva/sZzG9fJBQ8ob
         LcM6G1cNZKA0csWrBLC0y+pPSnQJPPcGDZlsJsudXK+lRrbknR06A2utePzhNtyQa5zh
         4kkEdZ3D2DmLNEuVos6kTpdikioHJuX0haeSyS4NjkwkFBcXa20KgZJ95LAFCAKOYBEt
         l1QUPLjKZQ1MHxFGT+/hzLIYg6Bbh9xf8dbP5lvMwQDHO7DyN220dtdlnAO9NjUJQ2XT
         853jN1/d0HuteelO66oMk+KpycEaOHGt2JJ3ijrbbvjzJu6yNB9xV6usekPVvtyaD6JE
         zunA==
X-Gm-Message-State: AOAM531Jl9G7vG+5Cv8yH5+GjkgokfD6RqmQav37TWWpekuM7FUIHyE7
	kYEsvyps4C0VfXkqyJAZGjTQMA==
X-Google-Smtp-Source: ABdhPJzon3NCE/lsxYZsknGil4mFyxzTVjhZDpfx1ry+aTNVj4gALEHUyfLk48PLI8IzhWQZrPZusw==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr9858158wmg.180.1590332761900;
        Sun, 24 May 2020 08:06:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r5sm11020438wrq.0.2020.05.24.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 08:06:00 -0700 (PDT)
Message-ID: <c42f7177bad53c832e02eb2cd036e3dc9691dc2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] strace: upgrade 5.5 -> 5.6
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 24 May 2020 16:05:59 +0100
In-Reply-To: <1590231936-22488-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1590231936-22488-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-05-23 at 19:05 +0800, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb} (92%)
> 
> diff --git a/meta/recipes-devtools/strace/strace_5.5.bb b/meta/recipes-devtools/strace/strace_5.6.bb
> similarity index 92%
> rename from meta/recipes-devtools/strace/strace_5.5.bb
> rename to meta/recipes-devtools/strace/strace_5.6.bb
> index ae552da028..5015e87b22 100644
> --- a/meta/recipes-devtools/strace/strace_5.5.bb
> +++ b/meta/recipes-devtools/strace/strace_5.6.bb
> @@ -15,8 +15,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://uintptr_t.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
>             "
> -SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
> -SRC_URI[sha256sum] = "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
> +SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
> +SRC_URI[sha256sum] = "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
>  
>  inherit autotools ptest

Fails on musl qemux86:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1938

Cheers,

Richard

