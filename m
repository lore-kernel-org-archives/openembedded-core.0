Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.24767.1620600496816938833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 15:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M+ILeivF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id i128so8094319wma.5
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 15:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fcXISzQi6QJ7grP3xGoFfWZcxID4c6All4dJ9oBzOJU=;
        b=M+ILeivFrpgeRyEVvSSflkrwTXKS/8EaU7eg7OhusmSayKyHPidM5QmwnfLY6sLAW4
         o5xSZNGtsMhXQpr7T0KJpO0Mrm5B6YoRLCD7zSCwUzfuDnW73fKNYEE/QAvKTeWDw6+C
         5Db5oq81ixcZ32E8PAjCaan3oNZ2rvIdPDKgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fcXISzQi6QJ7grP3xGoFfWZcxID4c6All4dJ9oBzOJU=;
        b=P+bgUBSkh58AD77Y97KaoKYM9RuzsK1tjA/4M8LI3KDNGJkCoPS8H0WXGyMYmq8zxi
         idQ/w8XTbB8Kt90SpQa6CwilpmxMOjEfzKazKu3ryFfTN9DcuTYF8E8Eca7b0HA+PyMP
         VnTad+6Yh0nTmvwvH75q0cjfITRCe9oiH4Dubo6T9jCqMuRucmhvXcC+cg81LqiXdCBQ
         q3PSiEM4dzddFvl4t3VWObHZv6E/CSzIgYl6lSiyRYvb6LzN0G7J0lBzlrsnD4j5DZVS
         t290+IoKMm5w1R64J+8angrFolgwqE8JK/GzYkiY1ZmyB7FHMH/96ydWA7TPxcEQk//s
         M9Ig==
X-Gm-Message-State: AOAM5309mXjHVUoCqXsKvbGkbXNbp4qUaFHNXhzTC1Rz26PsxHhIKaKT
	ZCqrxDf6H9rgqLniLr3anB+ZOA==
X-Google-Smtp-Source: ABdhPJwm/7ZI6GvuPR+L6Pk6BDDZ4VpaJRkPK27Py69zkHAv+5onw2vL6/gQ2+uqU3nOrg3RyGYQXg==
X-Received: by 2002:a1c:e409:: with SMTP id b9mr34188885wmh.189.1620600495290;
        Sun, 09 May 2021 15:48:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id e10sm20586399wrw.20.2021.05.09.15.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 15:48:14 -0700 (PDT)
Message-ID: <1c456ff005e730656a20a74fbe547808a4972844.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libepoxy: upgrade 1.5.5 -> 1.5.7
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 09 May 2021 23:48:13 +0100
In-Reply-To: <1620435855-48558-4-git-send-email-wangmy@fujitsu.com>
References: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
	 <1620435855-48558-4-git-send-email-wangmy@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-05-08 at 09:04 +0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.7.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.7.bb} (93%)
> 
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.7.bb
> similarity index 93%
> rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
> rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.7.bb
> index a404fe2852..acf2ab0b03 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.7.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>  SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
>             file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
>             "
> -SRC_URI[sha256sum] = "261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556"
> +SRC_URI[sha256sum] = "9479cc0146ffb395fdecf9bd2a5930834fd0bce490cbcc4681ffd716bb3a0763"
>  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
> 

Somehow this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2113
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2080

which have failures in the selftest:

runtime_test.TestImage.test_testimage_virgl_gtk_sdl

Cheers,

Richard


