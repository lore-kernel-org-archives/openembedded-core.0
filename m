Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF495C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 00:23:35 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.346.1670545414363995471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 16:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SysQo3m+;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id y17so3193304plp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 16:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CWGZjunBiUO7xRXHLn768e9PG0HqAHHD+tvKDvzuqK4=;
        b=SysQo3m+C/ibTEl/t0N18JHyvqicy5truaRJFcOfQzr4Nbd7z5bQilUM+W4sHQMdFa
         3+B5E7zFJDMT6CP/qUe3FGoV3T0kvp7AQBQ9ISTJcvL35Jye9giwZQrj6iHDyJ+WcDT7
         wkwKOBcdWOWoEtkFTLfTixFpjNpj4WXoSRWlm/ECmN5pT8SSN2nClrmohwaZ5dR40eBs
         fl7ONiFuN9fNJJ9s6tIElzwX0FOqcAltck4pBYRgduhg7BsMf4oIZz2uCgsQHydrez/L
         Q30q0Q5N+Pt9kVvXl0VGYqZVwctLXAXJTnsG7dPN1SUJbckq5n+EIwf9l/R4AUfUi5au
         IvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWGZjunBiUO7xRXHLn768e9PG0HqAHHD+tvKDvzuqK4=;
        b=xf++iL2bZwuvuGMYcigwgulaVVjQsudzCgnLMQ/a11t9uLd1xUIJhkpze/GGyMwkRX
         82WvImPR9XoGUAWc3901IIIWc0dgJCNo2oPzrLoGdOlI9EqmySLmiShHsBOBJViAhoBy
         vrLghwyT/vbs5hzYNKib95DS06MY2/ztC7MIFIBHA+Wob7O4dBYbBC+tByTri0gHl7ri
         b09XgX1Us9HomDpcO2/L1oFSDpDCu28gighatuIzzJfyGe4rSzLtzz9zHIkB4nW4ZQjX
         Ug4znCIWGcOWy4MsmL/FS8fIm0/16NrifnDNXe0y7zGeiBln4oJoHpqxtvKE0cUYhEpw
         ptWQ==
X-Gm-Message-State: ANoB5pmiHsSAq85XQLO19qMkEt1mwV7QQzaEQpDzHHI6fkWO3rWcceVJ
	mQOcPlsjzPTgdWFgvSE7QJ0=
X-Google-Smtp-Source: AA0mqf7VAsThO4Jd+8w9nhALUwdhymlXye1sQXtq7XsHUMT4cpVossNICbhDKv6gZA1OQlimK+1iCQ==
X-Received: by 2002:a17:902:c18b:b0:189:8e01:c72a with SMTP id d11-20020a170902c18b00b001898e01c72amr3977204pld.17.1670545413505;
        Thu, 08 Dec 2022 16:23:33 -0800 (PST)
Received: from ?IPV6:2601:646:9181:1cf0::f6ce? ([2601:646:9181:1cf0::f6ce])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709026e0800b0016c9e5f291bsm26330plk.111.2022.12.08.16.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 16:23:33 -0800 (PST)
Message-ID: <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com>
Date: Thu, 8 Dec 2022 16:23:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: Ola x Nilsson <olani@axis.com>, openembedded-core@lists.openembedded.org
References: <20221208071136.1967696-1-olani@axis.com>
 <20221208071136.1967696-4-olani@axis.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20221208071136.1967696-4-olani@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 00:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174426

Thanks for the patches

On 12/7/22 23:11, Ola x Nilsson wrote:
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 meta/conf/distro/time64.conf
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

We should enable it across all 32bit systems
something like

TARGET_CC_ARCH += "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' if 
d.getVar('SITEINFO_BITS') == '32' else ''}"

would do it.

Also adding -D_LARGEFILE_SOURCE will ensure needed functions that LFS 
needs is enabled as well, usually its automatically defined when 
-D_GNU_SOURCE is set but that may not be case all the time.

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
> 
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

