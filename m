Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A732AC63705
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 10:01:14 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.9732.1670493671733308999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 02:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qn/zCSfN;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id f20so1012129lja.4
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 02:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TtdLgBKNI7OJZx389iFiu4L2SHTJVkFEWZFYM7szeAc=;
        b=Qn/zCSfNpCDZK+Y2kQusIWodPYJZAhVew1o5R6dj0v7KB3nvoKHAQPGnunCwW2ju/z
         AS/42/2eBC4HyI/bZi/iQH693DL34hbgzKA0LI+KbAVKAS4n4lZVO1WTp1Hoj2I7Qi09
         F/SSZ/QTZEFDUwCcqzN9SdsKmTuMCXtSyBWMmhc4XmMsB2UorncdoCYTHVzfLYy5TQkW
         xG3RxhN+Wu8E6XtpscjENCnh0Mcm8boRx7jusd62X857W++22+6ZUtA5HYHxh7VOigTw
         k4BbEtUu6/QlKEP2ZdSH1+njdTKZDK+KJtIFS+ojtlA43RJ3v6XwuYlgwAAl9xkWObqr
         zm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtdLgBKNI7OJZx389iFiu4L2SHTJVkFEWZFYM7szeAc=;
        b=Ig8iQIFWochlD/Jf9sM7Y3n2me2zUqiUEMYPhAYeUXGWgV51dZqrHIjY6p0fcKkDdn
         YVYgOMF65X269G8UwlTni1zE75UIiMjf7d7ddSqZ/YI2ZMSO4gipsVxolbpmk9AQKwe9
         ZWYszhARPn0cVuSujcbxdNaL53eY5V9q0B8ZGdeMNLtMlvKURpqrLlsri+pIIfF/z3mr
         VZjSiUkKk1UfRfm3+Jbs1DyYh3zxheXRr+zWH3hWgfiKs4Z9ZpqKvcjqfvReq7pmrNeW
         43go5LZDiarsRknuWLsXvIJqe7eu2Be8yFhv9bhXRWbWeXEXnRMTfLrafr2AHCwU3wuH
         siug==
X-Gm-Message-State: ANoB5pnTdzPSvf7GFudL0vFI2M4wddffEkuT7Qpn+759GSl1TAsA7D4x
	50nbD2A5kegYUX9TUXpUOJB6NzqeR9+QtC+eRtw=
X-Google-Smtp-Source: AA0mqf57NZMpXhuMHzV0mXSrOcJiZNtxTfqUnZDBibnv2LJt8VhD4NC2FOavGozvPuwAeH9046I/RJyJFQp/uLGZyPc=
X-Received: by 2002:a2e:94cb:0:b0:279:8865:38e1 with SMTP id
 r11-20020a2e94cb000000b00279886538e1mr20151708ljh.217.1670493669913; Thu, 08
 Dec 2022 02:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-4-olani@axis.com>
In-Reply-To: <20221208071136.1967696-4-olani@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Dec 2022 11:00:58 +0100
Message-ID: <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: Ola x Nilsson <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 10:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174394

On Thu, 8 Dec 2022 at 08:11, Ola x Nilsson <olani@axis.com> wrote:
> +# TODO: Only for 32-bit architectures?
> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"

On the contrary, why not set this globally?

> +GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
> +GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
> +# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
> +# Needs further investigation
> +GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
> +GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
> +
> +INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so] = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> +INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
> +INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> +
> +# libpulsedsp.so is a preload-library that hooks libc functions
> +INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"

Some of these perhaps need a ticket in bugzilla, and there should be a
meta-ticket for Y2038 that tracks individual issues (by depending on
them). Can you arrange that please?

Alex

