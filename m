Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A63675147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 05:41:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a14-v6so522824pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 22:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tumuZTw9c+kmQGOwYKMwkf5iEVVclos4ZiautIu5MjU=;
	b=EFbCXcJKL/7/dS17Swe9DNRHTBYcojiR71FAAh89QXmeEsofOTbQOge57V51NFsZP2
	frdJDHwnKsaFC3Ev5WF65zKLbOsn5+mfCv85hbSFAx8I5lHhDFnJHkhTEizmKhG1KTOF
	7sV9aW84Fty2Y39JcR6mv6LJVzKFGnQ6SBFqpuZiy7V9mEvdyH/UnLEihbwj888Zoko8
	qDIIAS2WENWM7TbO5A2ODGOQTvdK6rgxVhgcbgEh0gtzUJxzxFevjVbsIZatMydC5JiL
	CUdgXOTUfoGxP2h/yZ/Fpl8JAmac1iBsOAeSWlmsbIo40rDJ2q35CpLpCDhr+wBI6XxA
	9Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tumuZTw9c+kmQGOwYKMwkf5iEVVclos4ZiautIu5MjU=;
	b=RHI6FWHJDW3HFTzB/QDpvoPMVVFKtrLiz6U2jFIvZdjLAOHOIg0wclyYmEbFEp2i7O
	R8MMf6yKNafiQq+IUvcj8FYVyu0z2cD14Ad6IkQi/f7HbUIBi7lgffqATUTuJIlVXozc
	wNUFEmGgidVv0NN0RdrfRRMI2ouH0TvmH6EbsT24vyypGrLw6xUBrcVW5wdt7ZFJystN
	c8j8lA7APCnbkZ17v0Zdim0pIKlLF26B0vAoE5URZG9v3lNWJOkHQO8d8iVk8e05xlsW
	se9ExsLjDj3vcGE58MI3xjU1b0Ml8xw2e0RbQhtdSL2175smMoLupbiQJ4BJtUOFdLSj
	1acg==
X-Gm-Message-State: ALKqPwdsSj1lMx1wDEcSytpowumlWZfk+sPeCtx+lfScoU1nb9Wxe+2g
	FFAYZDdi9i28aaS1wvjfS3rK4iI5
X-Google-Smtp-Source: AB8JxZpG/iwKaiFP/Du1LzfkshQ1iBF0sjQHEjuuuDq6MfjpO4iSdBYjvcmgLJdYkr9uUr6MYUuKIQ==
X-Received: by 2002:a62:9696:: with SMTP id s22-v6mr9871pfk.191.1525930864649; 
	Wed, 09 May 2018 22:41:04 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:d4fd:d1d6:d3fa:558c])
	by smtp.gmail.com with ESMTPSA id
	y18-v6sm9881pfi.104.2018.05.09.22.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 22:41:04 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <874d828c-9387-3a1c-3a4c-381da0a0e270@gmail.com>
Date: Wed, 9 May 2018 22:41:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH 1/3] bitbake.conf: make libc over-ride lower priority than _forcevariable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 05:41:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/9/18 8:14 PM, Andre McCurdy wrote:
> Fix long standing quirk, _forcevariable is documented as being the
> highest priority over-ride.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/conf/bitbake.conf                        | 3 ++-
>   meta/conf/distro/include/tclibc-baremetal.inc | 2 --
>   meta/conf/distro/include/tclibc-glibc.inc     | 2 --
>   meta/conf/distro/include/tclibc-musl.inc      | 2 --
>   4 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a21b728..a772cab 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -735,7 +735,8 @@ DISTRO_NAME ??= "OpenEmbedded"
>   #
>   # This works for  functions as well, they are really just environment variables.
>   # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
> +LIBCOVERRIDE ?= ""

Overall this looks an improvement

>   CLASSOVERRIDE ?= "class-target"
>   DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
>   MACHINEOVERRIDES ?= "${MACHINE}"
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> index 8d570f0..1bf44c8 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -4,9 +4,7 @@
>   
>   LIBCEXTENSION = ""
>   
> -# Add baremetal libc overrides to the overrides.
>   LIBCOVERRIDE = ":libc-baremetal"
> -OVERRIDES .= "${LIBCOVERRIDE}"
>   
>   ASSUME_PROVIDED += "virtual/libc virtual/libiconv virtual/crypt"
>   
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> index ad8000f..8d10764 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -4,9 +4,7 @@
>   
>   LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
>   
> -# Add glibc overrides to the overrides for glibc.
>   LIBCOVERRIDE = ":libc-glibc"
> -OVERRIDES .= "${LIBCOVERRIDE}"

having .= appear was letting user know how it was being lined up in 
overrides, now it might raise question in new readers mind as to why ':' 
is prepended

so ideally it would be good to define LIBCOVERRIDE = "libc-<libc>" but 
that might add useless : in case of native recipes

Maybe bitbake should just eat consecutive separators without consequence 
but that seems less than ideal too.

>   
>   PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
>   PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
> index 54e1acf..052ae0e 100644
> --- a/meta/conf/distro/include/tclibc-musl.inc
> +++ b/meta/conf/distro/include/tclibc-musl.inc
> @@ -4,9 +4,7 @@
>   
>   LIBCEXTENSION = "-musl"
>   
> -# Add musl libc overrides to the overrides.
>   LIBCOVERRIDE = ":libc-musl"
> -OVERRIDES .= "${LIBCOVERRIDE}"
>   
>   PREFERRED_PROVIDER_virtual/libc ?= "musl"
>   PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
> 

