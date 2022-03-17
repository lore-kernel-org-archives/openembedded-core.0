Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CD1C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 17:38:25 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.626.1647538704802772657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hMYlDQ+z;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id b67so4925533qkc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EGkn5ae6tG9M+QSrucuIU6UlXTVyQlVi9WmcYeMFAHs=;
        b=hMYlDQ+zL90QGu453y+KQf4++e7yaN4YrV0kZ4Doxe/5u6ahg3yoZOZTN4o8SifWTg
         dO8YFJsGjjODX0iAX5CLfVQ02kVj+8EJ87N3KU4l19Epw/+WicU/karHOIEu5mLTNYYx
         WrH9jw1GwGa2Js1fQk3PaXKvlbsNH7Ny+uONzWUrQiXV6/G+xi2u1nQJThj7kBgdUVvx
         uSUCbmCls1WNVSgXXWgpyUi2LItZNOgwAAiQxLLRDq4rOoDRhr8zJ4q9wkQunXOKC6gp
         PbZUm8HpnZBUP0K3OZ1H3eFUcfZvBTtbLy4Yfx1Dv/yog/61G+NVO9xq0ICMCrkCDV/U
         3fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EGkn5ae6tG9M+QSrucuIU6UlXTVyQlVi9WmcYeMFAHs=;
        b=TwSVXstakIEmte1oxeCSR6LbZhSw0uI1g9Qm375a5ccvXfLOalwaOuyCyid69cpfsr
         5y1BI9tRP3gDPLn+XK3S6o3hD7XeUCPuM4w2dyPOgRJw1D7z7uxYsDSIzuIf64811X2g
         aWAHmLXHDILMq74NIwifrPJ/RHz5sbdzm/NfbdblVC6yMhDnPEOuC7wwHF24F9Tp2KaW
         mPDioQwb9sYi3vh64YH+HYr2qqt4UIeBprn1VUKg4jIJfVaa/0QTXQKA5S8eCW0jS6V3
         06+ld3OrV06xYACc8XKbEKGufZbJtrT7OMIeEr8TZAlLW5YuN3/Vwxmr0h/8kj4tX2ar
         9LaA==
X-Gm-Message-State: AOAM533iIMNgPoIEnFDjMi6geAn2avSDrhXCbZjffpjO0pkJGPpHACdx
	8W+Ovq3AZKjzJjjBUcWSFJ8whkSArDZ2lWn1+yJ2angU7LrQig==
X-Google-Smtp-Source: 
 ABdhPJxQlaWV3HjbZn0Ifqq0B+k+CpWW5JUMr6k3+ZBdAunGiUlcbJfS2fBDJ0rAHNCe3ZhNiy2Xccbyz1gy225Njwo=
X-Received: by 2002:a05:620a:2982:b0:67d:6c77:b427 with SMTP id
 r2-20020a05620a298200b0067d6c77b427mr3637262qkp.149.1647538703791; Thu, 17
 Mar 2022 10:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220317164434.387779-1-ross.burton@arm.com>
In-Reply-To: <20220317164434.387779-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 10:37:57 -0700
Message-ID: 
 <CAMKF1soeWs8=oU11T5-WPC=iQUj1jLEpnqr_D1UogM6KfAhTCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-cryptography-vectors: upgrade to
 36.0.2
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 17:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163430

On Thu, Mar 17, 2022 at 9:44 AM Ross Burton <ross@burtonini.com> wrote:
>
> This needs to be upgraded in lockstep with python3-cryptography.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...vectors_36.0.1.bb => python3-cryptography-vectors_36.0.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-cryptography-vectors_36.0.1.bb => python3-cryptography-vectors_36.0.2.bb} (90%)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
> similarity index 90%
> rename from meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
> rename to meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
> index da6718fb90..be0eda056e 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] = "fc8490afd5424342b868215435bd174dcd76ab396b4ea9435498be5721dcd598"
> +SRC_URI[sha256sum] = "2a7924449a03025faf7f8754a6f4200001cab210734a6ce6ac1f6bdacd3a68e4"
>

I think mine here [1] is better since it bumps up libc crate which
enables riscv64 as well

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20220316222526.264261-1-raj.khem@gmail.com/

>  PYPI_PACKAGE = "cryptography_vectors"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163425): https://lists.openembedded.org/g/openembedded-core/message/163425
> Mute This Topic: https://lists.openembedded.org/mt/89849716/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

