Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.4570.1588671783942426990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 02:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FhfJmgyA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id k12so1523204wmj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7qSbmqtPFW5vDie3VOl/XQxg8Fi1OUuB3wV1wg0Me+k=;
        b=FhfJmgyAcwHOu4hnbKCyEK9ehcjDwgQF8jZJgI6+89+/zgtlotm00AAeygg+SZvIA6
         m5YDxNC4O1KmpYpBexcg+F4MF53eyG80XDnCRhmPCXBYWL2pXxBgLpNeVbX2set03umq
         azbDpaccs10lkD+cQiWHkiyq/gWz2AYalwr1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7qSbmqtPFW5vDie3VOl/XQxg8Fi1OUuB3wV1wg0Me+k=;
        b=GPxcWC/0lJVNjkR/I1QJQbgv25YVoiEB7Zj6wpbNLNIIPdT86+KTR23XZjCV3o54Ps
         Pca6V3vYIzMw1s8rd4tYoGISRR0pSNZlVfj7kO9pIe0CexynV/LR5bK7NyX1RdDTGxO2
         H/KOXfTflnNk3Rlt0fgkolJ3XSSQtU9Fyr36tyQau+ZAJtBYwOEKp3cxRlWQzZsjnN6t
         5BxOILkMXH1Lac9sYPnYdj2tqzMH64ZxnW5MugvNEYVOAbBeSrqNDi6d3xFVOmOFgwzb
         JkBOcby1hAw6NasSulyWwCt9zbn9ZNVzkx5D1ihK7P5Sw29qkjRjNoysWYNQymxA2+yG
         zdOg==
X-Gm-Message-State: AGi0PuY9us2Gs12t0Q/kmB8BUaUjipY/pCd1RmfBHEU2+5ayQCg9rGFJ
	lyEf7GjKqQ3cYM9xZMf47u130E5fqkg=
X-Google-Smtp-Source: APiQypJ7HoODiOUFEligT9IeS+f3fEqSeHTQRyKmCD3QXmMxhNgiJRC9gAs+QsSRPMiKoM1N3hsomQ==
X-Received: by 2002:a1c:e288:: with SMTP id z130mr432234wmg.0.1588671781962;
        Tue, 05 May 2020 02:43:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s17sm2824251wmc.48.2020.05.05.02.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 02:43:01 -0700 (PDT)
Message-ID: <86cf328e4c36050eb971f350babe3fc1a7a8c602.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/17] libinput: add ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 05 May 2020 10:42:50 +0100
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-03 at 18:25 +0200, Alexander Kanavin wrote:
> The test takes about 17 minutes, and fully passes.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc  |  1 +
>  meta/recipes-graphics/wayland/libinput/run-ptest |  9 +++++++++
>  meta/recipes-graphics/wayland/libinput_1.15.2.bb | 14 +++++++++++---
>  3 files changed, 21 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/libinput/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index c13ff724b1..ab44757a11 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -72,6 +72,7 @@ PTESTS_SLOW = "\
>      glib-2.0-ptest \
>      gstreamer1.0-ptest \
>      libevent-ptest \
> +    libinput-ptest \
>      lttng-tools-ptest \
>      openssh-ptest \
>      openssl-ptest \
> diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest
> b/meta/recipes-graphics/wayland/libinput/run-ptest
> new file mode 100644
> index 0000000000..5a84c568b9
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +/usr/libexec/libinput/libinput-test-suite
> +if [ $? -eq 0 ]; then
> +  echo 'PASS: libinput-test-suite'
> +else
> +  echo 'FAIL: libinput-test-suite'
> +fi
> +
> diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> index 810532774e..31652cc342 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> @@ -10,9 +10,10 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
>  
> -DEPENDS = "libevdev udev mtdev"
> +DEPENDS = "libevdev udev mtdev libcheck"
>  
>  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
> +           file://run-ptest \
>             file://determinism.patch \
>             "
>  SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
> @@ -20,7 +21,13 @@ SRC_URI[sha256sum] =
> "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834
>  
>  UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
>  
> -inherit meson pkgconfig lib_package
> +inherit meson pkgconfig lib_package ptest
> +
> +# Patch out build directory, otherwise it leaks into ptest binary
> +do_configure_append() {
> +    sed -i -e "s,${WORKDIR},,g" config.h
> +    sed -i -e "s,${WORKDIR},,g" litest-config.h
> +}
> 

Nearly :)

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1869

(I think its failing when ptests aren't enabled)

Cheers,

Richard


