Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.52213.1595843467368014325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 02:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CThPZCKr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 9so13542213wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VirhIP2IVlcd6UmBcN1pgZ2m1xnAjxXrPcNs8QgQQRc=;
        b=CThPZCKrHMgWIqXIvEhDLV3JctVPvgkzXENzM1oGNcKladCcGBBp14Ouowb0bffgzR
         6SMKoYkUAgLhrWxwb4/RhjH6+x4MUJUY+KbOW3osVAw0i2U7sL5u2FCl6EPixUBwm27k
         1+zS9b8s0OhfYzXsTv2LhMhiFNzmShnMCJjF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VirhIP2IVlcd6UmBcN1pgZ2m1xnAjxXrPcNs8QgQQRc=;
        b=aIVYa5q8SLhancybRrMjkcMG3CyBAnbuKcK21RoyJSfRxmyNTNl6jiWRiQ4jqRgLrA
         WSjEquNZbbAhJb7zxgSYGZzTaLKweVeUOKdGfD+2jrSu97r7ZUeA0SRJz3VOYOVLStA5
         49iuliQBb0RKna3s1tSqz6ds0AYn8M+ZVCGbLHtRcEGrpM3yEqoj+57rLeuLGEOzlB0F
         0ZRdaO3XBohObk695jbTZtYJpMNL3jqCxVvmjra57b3kfxH7EZu6NjCSjfJsOJHeGerB
         CWxB2BDvsyx5mRaj7USE1at7kqulk7EW2l77igKWznRRI4HMhEfwM1FBJy8OhrD+3cY4
         Kprw==
X-Gm-Message-State: AOAM532n8JghazT6Xm7q5uo2EDqbM7d9IrU4cTp6hQPPTxnmFxMHFfkC
	NixrSuEg7/IzKeRyNY0FXkKEuA==
X-Google-Smtp-Source: ABdhPJztUnW2VfiTC7GBvt0vHVytEbueivuzsCESPqBzP7d/rkIPN7hDWf1FEpfCD+VG71hDR8f3qA==
X-Received: by 2002:a1c:b007:: with SMTP id z7mr18937224wme.37.1595843465827;
        Mon, 27 Jul 2020 02:51:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id s19sm13155482wrb.54.2020.07.27.02.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 02:51:03 -0700 (PDT)
Message-ID: <037aa5161aaae9f91a2a92877bcc9edd5739051e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] adwaita-icon-theme: has a dependancy to gtk3+ add check
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2020 10:51:02 +0100
In-Reply-To: <20200726182135.477-1-akuster808@gmail.com>
References: <20200726182135.477-1-akuster808@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-26 at 11:21 -0700, akuster wrote:
> fixes:
> 
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'gtk+3' (but /.../poky/meta/recipes-
> gnome/gnome/adwaita-icon-theme_3.36.1.bb DEPENDS on or otherwise
> requires it)
> gtk+3 was skipped: one of 'wayland x11' needs to be in
> DISTRO_FEATURES
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

There is a patch in master-next which I think supersedes this?

Cheers,

Richard

