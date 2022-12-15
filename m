Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05846C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:32:53 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.137951.1671121965798727711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 08:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ocd10mS8;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id v19-20020a9d5a13000000b0066e82a3872dso3894272oth.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Nkh9c9g3el0oUn92dpRj7h372RtyIEIClFmGeLnZ4k=;
        b=ocd10mS8mTxY0wyKS0kX48wkA757KmZ/alkWvriWv6D1C62aWRpFaMzuFbpkqzWrqr
         dAuOVWSzX+Mhnb/m3qmYpa4RAKdjBMxtn1iVxzATfct3isKxfLFfwUhlj+ewoN6SKQfo
         McSV3fkDiXr+3N+Z/lE7tqu7LrTlv/9t0CA0dN/0RJon1fIOcEw00lI3NiBRGtO1VSCE
         UzT0AMW8hJ8t67ywVQJcnJ9SZ5xzWGIrPzU4zr4y5bH1wZKiyoAndVdp9L31ZGFiMVtP
         C2qXFXd/p3EjQxKgQkXS8WGMPioYBXnEp0XLLzRKCzLKk0zO08yjVN5vtBxjZXp208n7
         o7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Nkh9c9g3el0oUn92dpRj7h372RtyIEIClFmGeLnZ4k=;
        b=YA4PA8X5Ea2SxDEZSaKddC7CE5lHXl76rMpJ0TeEl1KVSNs2OODBfViYVAyGnkY04A
         dqbAWv7w7rJrxeyLXe3b1wolfOxvAs6aGINd18e4lp0KV83pSt5ggf+w8eJMVULtBrG9
         JwrY91RDkzQTodgIx09wpjU+yHLqtoQ0KyZIwBaPP/DXWMz7tfAfw0V55TlMiDwRQJFi
         JHS4I+jw11LUgwgHdita38IMAJqsW4Vnk6w/66OvN78n4k6A+lHvlbz6Ho0LcqOtK7C7
         ARzlAx1kuWw6OuFppz8gdfxPsU0jg3FusfWMBGm2X2WXi0Ar8j/h/RzSrYtv8Ypog+UA
         RcIQ==
X-Gm-Message-State: ANoB5pnxoqOTJGB1k+lY+83v/cVP2h+TO1jI88+3RaXXpV+m3KaGQ3VT
	fkVT8+UZEtb9z/Aryq65mjsNNWT0h511w2Kk9Jo=
X-Google-Smtp-Source: AA0mqf5+NZ5P1kZ43Ch/ex+04maTJNIg/D6LsitKqQa1itNzspIcyvClr8MpJd23K5Y3yziPUc/j2WPdo3Y+Zjf5Mfs=
X-Received: by 2002:a9d:68d1:0:b0:670:9d62:667f with SMTP id
 i17-20020a9d68d1000000b006709d62667fmr875509oto.111.1671121964968; Thu, 15
 Dec 2022 08:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-4-olani@axis.com>
In-Reply-To: <20221208071136.1967696-4-olani@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Dec 2022 08:32:19 -0800
Message-ID: <CAMKF1sqAsU91XHhhN=JkpSX-EZ3RWmbFs+x8KkejRzyfwPnLLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: Ola x Nilsson <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 16:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174584

On Wed, Dec 7, 2022 at 11:11 PM Ola x Nilsson <olani@axis.com> wrote:
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/conf/distro/time64.conf
>
> diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
> new file mode 100644
> index 0000000000..99eb06dc0f
> --- /dev/null
> +++ b/meta/conf/distro/time64.conf

I think this file should be called time64.inc to make it similar to
other distro fragments that distros can use.

> @@ -0,0 +1,23 @@
> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"

Also add -D_LARGEFILE_SOURCE here too so we have all dependent changes
in one place

> +
> +# TODO: Only for 32-bit architectures?
> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"

I think it should be made generic across all 32bit arches as I
mentioned last time.

> +
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
> +

Earlier I thought we won't need it on musl. Ideally that's true, but
many applications do rely on _FILE_OFFSET_BITS=64 so I think
we will need to include it on musl too even though these defines wont
means much from libc point of view.

> +
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174389): https://lists.openembedded.org/g/openembedded-core/message/174389
> Mute This Topic: https://lists.openembedded.org/mt/95533494/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

