Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.2425.1588581720757976911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 01:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h9XVZfXB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id r26so8061332wmh.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=v5MEh5WvpwOdQTF8GhI0VdpXe5BRCtaPPyHvCE4xPJU=;
        b=h9XVZfXBVn4R8Ky+k7IgYELqqlSvdNy6i/Av7TfmXrrc1unu0tOYmvGBbDdrEQytIa
         uA/jioC+jc30nVW6ifJt1Upp6sNefpo7dkkkpGxkBvz4PmQ5zr9TO6f9KmzUeRaMhy0e
         i97eQYkzoW2funSP6JamyJHxl12a+LoQsfuAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=v5MEh5WvpwOdQTF8GhI0VdpXe5BRCtaPPyHvCE4xPJU=;
        b=mmUwMhdAvxIxnjy8oI8qRApZjG9WXq8YK22UcxbjcNOF2L+Whw+PM7p/s/K+hgAEYH
         2HewwDfXhhOn+DunAJwLkVMNvJOiZ2M2XVWdZ5A8npqQmRpHA64UaJLGzSaa39XfQfTd
         9aFHr6gzC09OLHtzcLi6Mmi7WXLNEanLmb9Avx7vWgBTvzruZsyEECL3uej6YNapoOsk
         Oqa1rV1tFxxFeZU1JihNSir699evROERuOuu3bg8jEFlZ0MBKwrlUiCgJsbjNLPrwOts
         9ZnB0eH+y41VCHMxfGfxiOh53SCjv9d4U4WO+TI2wI/fWeXCK6psI6Ud/Pfxc0w6KiP/
         zOBg==
X-Gm-Message-State: AGi0PuaSNH+e6adOVg0QSbQc2yQRxN+Olx/layXhzlImB7XPyWhS+Pw5
	hwB38GlaxVlvzPziwQSCn0RzeVLGkxw=
X-Google-Smtp-Source: APiQypKkpQrzDxruikLWS5AC2SohbyDRI4rm+eOO07uRottvAODRj09xgSoHq+V3X5r3KUSmyMo1Aw==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr12911778wmg.109.1588581718938;
        Mon, 04 May 2020 01:41:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q14sm6561238wrc.66.2020.05.04.01.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:41:58 -0700 (PDT)
Message-ID: <48695bd63fb996907ba8d49cde07672725599177.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 15/17] libcap: update to 2.33
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 04 May 2020 09:41:57 +0100
In-Reply-To: <20200503162559.946-15-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
	 <20200503162559.946-15-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-03 at 18:25 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-tests-do-not-statically-link-a-test.patch |  9 +++----
>  ...hread_yield-with-standard-sched_yiel.patch | 24 +++++++++++++++++++
>  .../libcap/{libcap_2.32.bb => libcap_2.33.bb} |  5 ++--
>  3 files changed, 32 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
>  rename meta/recipes-support/libcap/{libcap_2.32.bb => libcap_2.33.bb} (90%)
> 
> diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
> index e568cc47c5..5a0b25758c 100644
> --- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
> +++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
> @@ -1,4 +1,4 @@
> -From 1179b423cce8d119b42cebfb3daa77c540fdca43 Mon Sep 17 00:00:00 2001
> +From 99ff8da92cc1bdf150fecd1ecd0fa50794be0259 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 15 Jan 2020 17:16:28 +0100
>  Subject: [PATCH] tests: do not statically link a test
> @@ -7,12 +7,13 @@ This fails on e.g. centos 7
>  
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +

libcap-native build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/905

Cheers,

Richard



