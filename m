Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.7591.1625716205524612644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 20:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VOWeTudE;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id o6so429150qvw.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 20:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4CNFQq7v/ved8NTMfY5WfwdpAJZJWbi+Z3f/P2GglA=;
        b=VOWeTudEIRwvXXCgmds8eGAILW8IG2mYHGfTvYtnBxrgTq9NbR56az5BMf72M5hUDj
         P+dVPDIuX4ipuFu5QAt1kVsilbm1ua5kgHIdCW2Zcr1S8/XZKWlnPZ6mT/e4suQePF5m
         XoAcIV/iP4RqwTnwa/tMqO8fUgZiazsyBv7Jde3orkYmkgbU621bjuONPJLeDxSynQTq
         ibw+PaKJNRof8fcWsNaT9+XIoE9r2OuzY/Cm7SL5S6fj5MS2q5s29snSI0cjIwEGqHOV
         cQjyYFiVeoQ61GRY1ewyR9/SMyuYDv5NfYxzWb7h+v4RJBXF97RaXxweChazRu0xnmnA
         e7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4CNFQq7v/ved8NTMfY5WfwdpAJZJWbi+Z3f/P2GglA=;
        b=pc8l+9YvUDMsydYwfMnbmskrrUnPrHcSOuUVAO1eXuJBSDetkHmynGuAoI2mJcqsZT
         n87qoCp+go3R4C05h152OXbAx4ClConBa7AWjXlH0o0jT89DI8jmsPz6hbF83nAy3L3s
         jOHF120bAVszIna2/3PIqdL/3q0gmOl7bNAklBUdFkmv3G1B8e2YB7p2wa1+jhmmy2lr
         j52a33vC5AW1K9smZU+rUxi7RUFaOC2mCR7miP/b4hEwHC3Axw++soQVLdtVCNDu/Uud
         vAnkntYV9Lsr1m0g49yx42lv3hdYzm0Ijpzgw98a6JoATph+hYC1gIYScB9Lf03JTCm+
         5qZw==
X-Gm-Message-State: AOAM532IKLPXqlNUpBAYgH5Y+XGokPIJhi1JlQnS5UrS9+1MeSgrvYEZ
	u0mc0V8lPBqlMBpGZqOKQUojhdN1+7RPx49B0F4=
X-Google-Smtp-Source: ABdhPJzLp9lqoz5PweQPZIjFYhkDUC2LWleBIgDQLu6FF5pJDaUk6oykFn+u1rKzjAtTTzRMd7KGwEaHXDVxs7p9Lo4=
X-Received: by 2002:a05:6214:c8c:: with SMTP id r12mr27454742qvr.16.1625716204743;
 Wed, 07 Jul 2021 20:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Jul 2021 20:49:38 -0700
Message-ID: <CAMKF1sqnh0w_psbrNdfTNHq-zkyEzP197mXeY89mX8rvJ5oipg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnome-desktop-testing: upgrade 2018.1 -> 2021.1
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to build on mips https://errors.yoctoproject.org/Errors/Details/587476/

On Wed, Jul 7, 2021 at 8:45 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...esktop-testing_2018.1.bb => gnome-desktop-testing_2021.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/gnome-desktop-testing/{gnome-desktop-testing_2018.1.bb => gnome-desktop-testing_2021.1.bb} (94%)
>
> diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
> similarity index 94%
> rename from meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
> rename to meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
> index e5c69c0c46..b82eb8af2e 100644
> --- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
> +++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
>
>  SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http"
> -SRCREV = "4decade67b29ad170fcf3de148e41695fc459f48"
> +SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
>
>  DEPENDS = "glib-2.0"
>
> --
> 2.25.1
>
>
> 
>
