Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 49BB76D494
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 17:55:34 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d19so16106017qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TWqramaTDGAIQsVbE/4/gA/1ePzhX7CG4MWQpjeeaeA=;
	b=mYZvXK7DWZC+etpFDFwsXakH4NzDUdBXNTeUg+osHsZeqgpe7dqqcCW63K4E/FR0Su
	moI+a1pOKZ7A8J9H8ZiAt2q0DpmV7V/AdgKohnb+nCYAuNI91vMWSzat2uXsevx6Q/ha
	3UoYzCqRcWtWKVuRWO9ktOWPCm5Ixek4d3ODT/gyaWDo5hqVZQUhlRQP0+4EvNGYmT6c
	w1zgJKG1VKs22CmQIDja9SlGxqdyNQx5k9kjy1SoZCCOxTc+4mP1F0re9zWqww2XZURY
	LshM09LI+XkYNgUGFSmff8jo1tbYdh2qwOlTLd8WPYKmVThpf67rT5SRVXxLvaKNO+iZ
	iJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TWqramaTDGAIQsVbE/4/gA/1ePzhX7CG4MWQpjeeaeA=;
	b=WDCTwva4nj+oZW6LoHcznjGLyqdZ6oxsKC2NXLD6VY+5WCslxpdXjPcUAY8UuyyQUX
	ZMMYG/iUjIDVvT9LR/6F5pXQPJNGYYPn/MYQOjFsSWJnkdy8I3pb9NiycFZX5qUj3MLL
	07KcEPb4NBwMH4d8O3Jqc2heWWwkMkck92OKqMaEf67z7Rc5GeNzhCkdaZM2gfvQzT23
	x2PQf3jkFuTe007IhQzPVUVdp9QwJMzVddIdVdrLBW/HxjTxiLvF3rWoUAL6UQ+jfivQ
	ympjzX+h9vZq78YMFWqauLEsFZPnSdHzaJFyw3EwITKU/RPcBI6NNXIhE3m0KR9UlLFN
	Fjyg==
X-Gm-Message-State: AJcUukduWH78SYlRn9mRY7NGo3uOtaExcfWBiUlnnJ/uyropHZQjkrZY
	YHHqCeVY59zb6LwA3b4Yyzh/k2bkf/tO2GCx7Yc=
X-Google-Smtp-Source: ALg8bN6OmUAoMSwhCSekbg0bp9YgmeqfnvO8lmizj0Vk++Rv+TxJg8rVIORXPOxPq/qbdr5ZezTDykx4X/e8xDeOsN4=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr16443473qvq.55.1547834134805; 
	Fri, 18 Jan 2019 09:55:34 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
In-Reply-To: <20190117071227.57387-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jan 2019 09:55:08 -0800
Message-ID: <CAMKF1srbHBH8ZUT7ChbJXqc=0f2HxGM=ZWJyY=osE=RLzxTW_w@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Fri, 18 Jan 2019 17:55:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 16, 2019 at 11:13 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
> Specifying -fdebug-prefix-map is equivalent to specifying all the
> individual -f*-prefix-map options which means including
> -fmacro-prefix-map and -fdebug-prefix-map currently. Option
> -fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
> by __FILE__ macro expansion for packages such as llvm and librepo.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0bdcd04d74..d20460e845 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
>  # Optimization flags.
>  ##################################################################
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?= "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> -                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> -                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> +DEBUG_PREFIX_MAP ?= "-ffile-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> +                     -ffile-prefix-map=${STAGING_DIR_HOST}= \
> +                     -ffile-prefix-map=${STAGING_DIR_NATIVE}= \

I am bit concerned about using -ffile-prefix-map here, its gcc only
option so will cause clang to fail

>  "
>  DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
>
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

