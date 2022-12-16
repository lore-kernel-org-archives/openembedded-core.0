Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E700C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 18:45:01 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.2810.1671216291472497260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 10:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iOjzvZ0n;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id v82so2708085oib.4
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 10:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TT6rVQfGunFHxXA9R1xarScJxuhfG8KruxGhbfsjoM8=;
        b=iOjzvZ0ndpWxOIRQou0gKVJhzQCSq/Y824tDpToNjQzTgrGD0ArqyOno39q78mUmj8
         uNYwc0nCeLFbKEPrHpgI/LkZzWqjdFyv0zyr6cLuJnvBIrSpIn6ovPMnMgPiaSQSEyj1
         mHnMoXVS7saUMbwpLgDSE3ZLxjFEod7MbCSfwS53z1FOQwDvUiqISInZQLIi91AUOF5q
         ML/NU1O8q5SVWWd0J1dSS9Re0OcmDQz4WY4MtwKlR+7CB+Aufoj+9pzzPH2UyS1ctD1t
         pSF0MA1q+BOufwGExooxWXb1zzAME4PPfdsDuqXMoAYSiku1Ma0QqMC2Ru6ij6Ysw3Ii
         1CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TT6rVQfGunFHxXA9R1xarScJxuhfG8KruxGhbfsjoM8=;
        b=7jGHkBBvNUHWgVP+5FuCdpj/TDhCnlsKUYX7eBIuFH0IfbkwVpkW8iAiMCSpWAFkx/
         pKrzTECW7EJQUPCIiTxoeEbX070AuPiBAto7Kcq+b9XZFaKrfYpdsloCvMT21TiwKGgj
         kd+xnGHAksByGKiwCoYyX1un1n+tN43eX5I3WrCvWJ7eMfv5+1efvNBLAaLgeHZJjUT8
         eNqbQwZ1Ah9nd30cJadjD2S9FNjyGG5Gx/z4ai6MR1IAkapny8LLvsrlbvfB5EmlSZGS
         zgwIfDaeKICePwdu6S2Gd3bG9u5/3gohkd5ntPl8XSP21u9e1SscEazZFmUk+8PFG/mm
         0nyg==
X-Gm-Message-State: AFqh2koOxbkf6ntgQhEGO5A8f2aVLIdrTZiltUI9thpXaLIJd2MOJgA1
	hX3o28K81+otGxtM+KlyhPEYVZ1QfHtQRWDJ7co=
X-Google-Smtp-Source: AMrXdXswTElJL87mZMoHT2WJnG1XlPqx1+AYXklyZJj0Y2u2eEGjCIQ8ifjO53ST0ZACo0H/I4EEcd0Q6WrdgY8SATQ=
X-Received: by 2002:a05:6808:1456:b0:35e:dcb9:46c7 with SMTP id
 x22-20020a056808145600b0035edcb946c7mr317974oiv.55.1671216290599; Fri, 16 Dec
 2022 10:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-4-olani@axis.com>
In-Reply-To: <20221208071136.1967696-4-olani@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Dec 2022 10:44:24 -0800
Message-ID: <CAMKF1sr=cEyJ=EvmzcpschzVLrbu_mnNLNr+0YByT+bjPX6HJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: Ola x Nilsson <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 18:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174762

I ran a build with time64 enabled on meta-openembedded + few more
layers enabled on qemuarm/clang using yoe distro settings.
there are some failures as below.

https://errors.yoctoproject.org/Errors/Build/156858/

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
> @@ -0,0 +1,23 @@
> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +
> +# TODO: Only for 32-bit architectures?
> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
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

