Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E025CF3972
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 21:22:55 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web11.4392.1726780966439474344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 14:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UJOSQQFI;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-502adfff6fdso384389e0c.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726780965; x=1727385765; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bYO9fViZSjmerCBgqFiXsjHCO31BAzfFbO2n/3Xi32U=;
        b=UJOSQQFIsreIu6PpsC2y6GfD2a9AmmG+tzrRADm2XQzLYL0h/GfgmL/zLyP99X211I
         d9zZhBUtMLxe3XC5dUy61AcIBv+awHRpWgt7eSeWbczMog79PTRRGXgoTdIuLl1cDih6
         jhyAFx9hFud4j2sUPY7POTuqxpAzs34OTs4c0Y0MX4EliHJnrrq6k8c9Z9upgO446h/E
         92s2QopxnbZMnqiFrG6YPrmMPEGVd4r69b23qnclarCZ34qe32woCZvBsv9muSSJW5w3
         c12hAi//S7qKyA1SWCJF0UYmz51Lb1fuzHjUVjY8KDPmVrcIxCFosp4kSKQe9tEP7lDC
         oUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726780965; x=1727385765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYO9fViZSjmerCBgqFiXsjHCO31BAzfFbO2n/3Xi32U=;
        b=vzsNbzLTdpPan0Xts09kUSqtaXQoYd2bJAE/IFznytpJNV3PTCAl82p/WoQh67Wx3v
         VtWYMIZ4sH74dcsYfZt7Est0sAVuIgymfNtyXC7y7jvvK1QPK9STsjWFPQla1Aq/tqAk
         hxUQ6v3V4LMnhd7rQ/VvM0aJ0CBlMI+OyZNjG1QbA26E/3jVljak5+t8gp/9cQPL3+iy
         RaSpzHRbTJ3eDsCbKkR5OEuT7nwtmpcM+f37fHg2vL7+SOLjzyeq+v5wAjxFE95rP09f
         2itQXU0xfowF2iedUvLzDPOnt/pqgImxZjE8097meeYezrPnbOSOueOr4SbKAIWT4TNb
         cXrw==
X-Gm-Message-State: AOJu0Ywi5PTYUpmExo11GcDQVA4OMVuTcU/BE7dgHYkxwEvmAbDcxXWg
	0SzBEVW8VdFjhyfBdowBWTokuc2vhKK5+6NBqpcr7/R3HqwIAG01K1csojBuc4N3vqVzKe5bgOV
	qeaPBJHBXCC845WWN8WM/UBgrVHY=
X-Google-Smtp-Source: AGHT+IHV1mG88UM4ye4g4YwXr72waE2C/x8QpooR7GpCYhSzVMrnEQArnqFiEFbdrvHtsnCwM9dWydTHJI36W37LWqg=
X-Received: by 2002:a05:6122:d9f:b0:4ef:27e0:3f8c with SMTP id
 71dfb90a1353d-503e02299e8mr1438738e0c.0.1726780965240; Thu, 19 Sep 2024
 14:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <17F6B1F8381C459D.22254@lists.openembedded.org>
In-Reply-To: <17F6B1F8381C459D.22254@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 19 Sep 2024 15:22:33 -0600
Message-ID: <CACS+7ZQ9nUiXwdAxPsjhxm=S34oKuvFJWjfcq=5xpdHh07U3Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] python3-pip: keep pip program name
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204718

On Thu, 19 Sept 2024 at 10:26, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> Python 2.x support is long gone, and may tools expect to use pip

Whoops. There's a typo here, it should read "many tools".

> by that name. Keep the pip name around again.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/recipes-devtools/python/python3-pip_24.2.bb | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
> index 1f8aeb35fc8..5e1a467990a 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.2.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
> @@ -29,10 +29,6 @@ SRC_URI += "file://no_shebang_mangling.patch"
>
>  SRC_URI[sha256sum] = "5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8"
>
> -do_install:append() {
> -    rm -f ${D}/${bindir}/pip
> -}
> -
>  RDEPENDS:${PN} = "\
>    python3-compile \
>    python3-io \
> --
> 2.46.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204707): https://lists.openembedded.org/g/openembedded-core/message/204707
> Mute This Topic: https://lists.openembedded.org/mt/108543258/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

