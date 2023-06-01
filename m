Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDB4C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 07:10:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.25086.1685603409668159547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 00:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ApDI1ojO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f60e536250so13349715e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685603408; x=1688195408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jdt3lqnTJR7IZ920tem+JdRJ9NaO5twgXiJTLwH+7Ro=;
        b=ApDI1ojOk9Nm03i6/04IiRcDBWj5M1gZk/ya8zbdEUQ9fCau5jpQ4gmN9xZU84M4wv
         lNFzwsgSVqWUJjy8Pzznn9Fi5znZuJyDa59ORZvpK0Frwv6IpN/tQXkHZhPrn46hW+WM
         09/J4Km8PH0ED4yWkYoHfzxJlGaDGhkzoEXQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685603408; x=1688195408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jdt3lqnTJR7IZ920tem+JdRJ9NaO5twgXiJTLwH+7Ro=;
        b=jkF1J1C8zzHS01kcLH/0S2kkIzWhjppFJ94E3CUofdSj2uYulMb9HVhdXpx5i7t7WY
         IX+0FNOOMwru36Z4PZtpI2wZI+7/k6WssWtrlARjeL/n3z8cFBo6rA4iyiykJKv2VSjS
         FMggq7e87/SG0lKy1KDZEGV03+oVSgQmCKSaNpnuksj/4hLuL7n4tBWp0SRMF4VwHgE3
         oT5O+ogaYe9OYjQ0MJpftWPhj2DwZ/4Ab4d/EGCOwroO80GCtbPS+nLjoPs/UZChBsCd
         FAWhBXLU1KeS4WcVoMwye//ydCnQttgOY1UloHFXXh5DiIdPcBkzSzk9omV+RQ7ffl6S
         mIsw==
X-Gm-Message-State: AC+VfDzQ6mkcArOG6EDCKwKCq0idbZm71ugwxQZ7ZqG5vQTOYJdtsKSS
	CyCj+qRj3WVdoUnRrcIlLf0GFQ==
X-Google-Smtp-Source: ACHHUZ64yhxJKdTCcHIi0ins1cF7zUTLhqD0nLS4n+uZEy3AWDRcvAAwB0SQqVaPDZJOYjTqrretrQ==
X-Received: by 2002:a7b:cd9a:0:b0:3f6:1ac:5feb with SMTP id y26-20020a7bcd9a000000b003f601ac5febmr726914wmj.16.1685603407968;
        Thu, 01 Jun 2023 00:10:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5363:779f:9df8:62e7? ([2001:8b0:aba:5f3c:5363:779f:9df8:62e7])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600011d000b0030aefa3a957sm9280060wrx.28.2023.06.01.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:10:07 -0700 (PDT)
Message-ID: <fcf04863048c9e529df03a0bc034a8f86e468865.camel@linuxfoundation.org>
Subject: Re: [OE-core] Is aarch64_be under maintenance?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leimaohui <leimaohui@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Jun 2023 08:10:06 +0100
In-Reply-To: <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
References: 
	<TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182047

On Thu, 2023-06-01 at 06:58 +0000, leimaohui wrote:
> Hi all=20
>=20
> Recently, I want to build an image of aarch64_be, but it seems go badly. =
Those recipes that "inherit meson" have the following error:=20
> ----------------------------------------
> > ../fribidi-1.0.12/meson.build:1:0: ERROR: Executables created by c comp=
iler aarch64_be-poky-linux-gcc -fstack-protector-strong -O2 -D_FORTIFY_SOUR=
CE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/ub=
inux-dev/ubinux001/build-ubinux/ubinux-202307/build-poky-test-arv8be/tmp/wo=
rk/aarch64_be-poky-linux/fribidi/1.0.12-r0/recipe-sysroot are not runnable.
> >=20
> > A full log can be found at /ubinux-dev/ubinux001/build-ubinux/ubinux-20=
2307/build-poky-test-arv8be/tmp/work/aarch64_be-poky-linux/fribidi/1.0.12-r=
0/build/meson-logs/meson-log.txt
> ----------------------------------------
> It seems that qemu-aarch64_be doesn't work well.
> And glib-2.0 also failed in do_configure.
> So, is aarch64_be under maintenance? Or is there some issues in my usage?

It has worked at some points in time but isn't part of our automated
test matrix so it looks like it has suffered from bitrot :(

Cheers,

Richard

