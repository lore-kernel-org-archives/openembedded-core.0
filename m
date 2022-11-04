Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F8FC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 16:25:12 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.176.1667579107102728799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 09:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=js8Dmbea;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id be13so8090337lfb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNEUvjw8eeLHQunPv7gN1ZMkKqRp+r//zowrza6Bvx0=;
        b=js8DmbeaihEgQEs3QKH/aoY01gKurWiiKgFIn+L+Rv+ce9dqBN2rSxkBD0fsGYbR+X
         D06RpvGhoG7hi8RTHxxXBOEOzhUxMj9B865bXkB8yQerGvfPKdH+pvbnRwOj1DTtiF4o
         uAd6SV/qFYNnybXnBIghTLZxWPSyur5vignm8QQ5xx01zNw5vyQlWKJcgDknR8SZDyWU
         SjHW6obhTJAvwpPQKHK5Q/geLRsgzQoEh8najIaRWjoEt65BIIrxdEkPtk0t562SbOIj
         nhoqwd/5x5NAUgX6Y+I9Xf6I6/k0N2nI1El3uUTsfloIRPwnp+sAlBp1TfXyqW0jcboc
         APoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNEUvjw8eeLHQunPv7gN1ZMkKqRp+r//zowrza6Bvx0=;
        b=X32RjzWEApguwa45yuCb1zYXaOhbI9rBD/LScN4p4Huc/JxcWWLdjea0gFSeJspyxN
         ftCCsWJLy443ZQ9Fu2N05w+y7o+qlm2gb9T8QJ72x2Vqbs6li6mS/LMO/xW1eBxU/oj4
         R/kajgV+/SCHXhl7HZrsaQEPOIpAdPKPCaNH3wMDzyBE4P8pMAuyhxFgDhNWyK6NIgW7
         Ca/gLqbXataJdLVv0zdLd4RI3R63GB4dLamCiNDHkbkBj0i7E/EaCPgHq6FcywIjfegM
         sndSFdZh1kX1DaasYOhUiEQ+ql0n9S0jLf1D0zD9Zql9iTxEbjUmtotHP5tS7F31Mb2L
         9LBw==
X-Gm-Message-State: ACrzQf0ImvgmTeX3WK5fMlsmHD3eNMC3X9JFg94OkEr3oszJe/TbWN5f
	MQSDU+4c9LhqlUzPZOnxuGPXi1xu2qJ286lliLo=
X-Google-Smtp-Source: AMsMyM4JMqD+gzi4w3CoTh6QWwC2Yz2gJD6u8Q9YvleY5P+Vk11k1qb2+oURU8A/ir2GGeJ6rqIGYpaSnQRmSEYk4po=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr14006149lfv.131.1667579105248; Fri, 04
 Nov 2022 09:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1667525891.git.cp0613@linux.alibaba.com>
 <F334F7CB-A181-4439-A050-47F8043125D8@arm.com> <C79EF1D3-8140-4CC1-9692-8E6F42A84258@arm.com>
In-Reply-To: <C79EF1D3-8140-4CC1-9692-8E6F42A84258@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Nov 2022 17:24:53 +0100
Message-ID: <CANNYZj8d9s+u06=udWrz1OKzMh34z7Xd5whLO4FitsyxWzncrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in meta/recipes-devtools/python
To: Ross Burton <ross.burton@arm.com>
Cc: "cp0613@linux.alibaba.com" <cp0613@linux.alibaba.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 16:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172723

On Fri, 4 Nov 2022 at 17:20, Ross Burton <ross.burton@arm.com> wrote:
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1609382f94635271=
2a319b4b=E2=80=9D
>
> Relative paths are relative to S, so this can be just file://LICENSE.
>
> +# there is no valid file in pypi, so download from github
> +SRC_URI =3D "http://codeload.github.com/google/brotli/tar.gz/v${PV};down=
loadfilename=3Dbrotli-${PV}.tar.gz=E2=80=9D
> +SRC_URI[sha256sum] =3D "f9e8d81d0405ba66d181529af42a3354f838c939095ff999=
30da6aa9cdf6fe46"
>
> That looks like a dynamically generated git archive, which means the chec=
ksum will change over time.
>
> If there is no static tarball, use the git: fetcher.

There is:
https://pypi.org/project/Brotli/#files

You just need to set the filename suffix correctly (pypi class has a
facility for it) so it doesn't try to fetch with the default suffix.

Alex

