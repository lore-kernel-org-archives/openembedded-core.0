Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9ADC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:59:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.19306.1674057556705438512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 07:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vip0K/Td;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id r9so11630577wrw.4
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hh8WUtDmyPT2/1UqN92AhdguG9iF+CXIKGAHkHRuwdE=;
        b=Vip0K/TdDNBngMwOvP6aXH7NBwOyq7ZHoEgMYFQGkuqFqwI3N1JT2nFmr+nOz9Yhzm
         U1vqmcZNtw2eZdh0mjuExah9ZaZiFqP8jUCF5l5MfatqrEq40Hlo9xfZBIy6Bjtm6sOC
         D7Qjc5UTBPOLyp35HSu4DTpjio60FXECkm+RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hh8WUtDmyPT2/1UqN92AhdguG9iF+CXIKGAHkHRuwdE=;
        b=BKOJmIHGhgfRmwVrSyyOsEQuDnxHMI7ZYA50nIYLqkvjDtE6ZiaNriiBE/jt3tvfO7
         RgTFL4JQoDNHQF/fsB0qwnXYwxBnyqeqJoa3YeEudYLnEtaTKRPPbvyPrXR9jLIYq/iL
         PIgTMOGnEFuUgX6e9jhRtgpm3Lmr+si7lTnMGmXxtDvKSDA7OUHmSk5mtTllKrcWCOs1
         ite8bs0RJ3hk7uvlpyr13r3Cuqvt+1/6nc4sDn7RvkLk3BzW9YFTvoSfDSBondQbcz3m
         RUcP9uooNrZ2vfmyFEaeNFXe/jciPVvtkmT01mCuM6yLh3LpWnfd8CWgguPECk7cTYw1
         LwcQ==
X-Gm-Message-State: AFqh2kqvsPGq3cJ5bi5ku9GDaxcc6VbdLhtxbhyixThndSSt7zr0zTRi
	OhhJjXAIdd+iCnVED+F7qOZNDg==
X-Google-Smtp-Source: AMrXdXulSeO4KpNOv2RG51RooP9TRyvH4lcHLiHJADFVlBlDX8qblgrwllMmlWTENeBETzKS2Iag6Q==
X-Received: by 2002:adf:b646:0:b0:268:885:bd87 with SMTP id i6-20020adfb646000000b002680885bd87mr6776930wre.37.1674057555064;
        Wed, 18 Jan 2023 07:59:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:54cb:642:5dda:e3f7? ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id f8-20020a0560001b0800b002423edd7e50sm31367408wrz.32.2023.01.18.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:59:14 -0800 (PST)
Message-ID: <c58cf7b3d2cc4e4d552529b89c20f9a85a6e7b00.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 5/5] defaultsetup: Enable largefile and
 64bit time_t support systemwide
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2023 15:59:13 +0000
In-Reply-To: <20230103200553.52973-5-raj.khem@gmail.com>
References: <20230103200553.52973-1-raj.khem@gmail.com>
	 <20230103200553.52973-5-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176105

On Tue, 2023-01-03 at 12:05 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/defaultsetup.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index f6894f3ab5..1abb509629 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -2,7 +2,7 @@ include conf/distro/include/default-providers.inc
>  include conf/distro/include/default-versions.inc
>  include conf/distro/include/default-distrovars.inc
>  include conf/distro/include/maintainers.inc
> -
> +include conf/distro/include/time64.inc
>  require conf/distro/include/tcmode-${TCMODE}.inc
>  require conf/distro/include/tclibc-${TCLIBC}.inc
> =20


I tried this as requested. I saw:

x86 binutils do_compile failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/6562/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/5424/ste=
ps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/6572/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/6493/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/6528/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6481/step=
s/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5304/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6437/step=
s/11/logs/stdio

lib32-binutils do_compile failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6437/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/4042/ste=
ps/12/logs/stdio

mingw binutils do_compile:
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/6562/step=
s/13/logs/stdio

meta-virt xen-tools do_compile:
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1166/ste=
ps/20/logs/stdio

qemuarm glibc-testsuite issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6539/step=
s/19/logs/stdio

qemumips glibc-testsuite issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/6500/step=
s/20/logs/stdio

qemux86 glibc-testsuite issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6481/step=
s/20/logs/stdio

Close, but not quite there!


Cheers,

Richard

