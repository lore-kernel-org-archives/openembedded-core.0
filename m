Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.76.1602545077375586092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 16:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=Oo5J/lzM;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.193, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f193.google.com with SMTP id c5so14785311qtw.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 16:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uEisYs6GkT4xn9BVQMoVlNOo/qUbCFlBai3zS7uF7JE=;
        b=Oo5J/lzMzUpILhrV1I1dRvDyiXheTslIyZ3IxF1p6b5nMCYLKncV7j2FhIq3K5oG8I
         MygeGrInZoh6tZep2SK3b2a8777BenivSgufYQ/3wKlhhkMRp6bTeE8TDRU+PmCP02uS
         9DivrTps3w3PVwTbkZ3NXXlWZPe6kuXP8f5Tq1/wxUUZEuqxO5EaDqmjmCg4Kwc4k1KG
         yzSRNaLb9MORTLpZ/GNi91XFWHL1vWJ7By/phVE0nFpucviRY3vhsvd2vja+R34mQDSx
         i62TfE9RyK7wFvuv/0OwFqXCt4NydE758kqIFp/iynB8gae5HVqDvG29BwnbAZiaf1ca
         ixjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uEisYs6GkT4xn9BVQMoVlNOo/qUbCFlBai3zS7uF7JE=;
        b=tuA8wUEvM8seJoxNFt0j/BC1XuXDRfSmR2OVbUhrkHpTS+U2dLuoIh6jEeEWiDXWz8
         BOgYuuRZ98PFUn8aenxoqE4twfunyj5PJogt1UJEsXETjFs0l1Y0mUG4Cbl1BnuqqqkE
         P0mBlME8HbuFRbdeGyq3R4T6xWi+1aSXt8m93KJiqX8zEghibd//x8iAxPOaY5Ncc/k5
         VVlzV8mpGckoF5u+Fdmw1EfOaPPcK3/x5H1CXsRB2i1XYusW1qTEbNgA37goibBI7o5K
         lLR/SEJUfPw89CIcD0cTC6EyzCrEY/7TiMbylcot6dYJHxtL1XgkCh84D0mgPcUGCSJc
         /b0g==
X-Gm-Message-State: AOAM533sfKaDqBC0/lxhw1IUzDDdFtqC8h8Kr0AC1s10SDwZmunw148F
	o/q84tEicoba6ng6/6n9ElAK3CiQvfoTYn2V
X-Google-Smtp-Source: ABdhPJxIrO5gLHqcHGHH6jkeevqZYcVo3TaZMBfkspRnAfchOb0F9o9JUyKRRV6nm8QKyKwKZZZAug==
X-Received: by 2002:ac8:3aa6:: with SMTP id x35mr12979930qte.0.1602545076189;
        Mon, 12 Oct 2020 16:24:36 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 185sm13486887qke.16.2020.10.12.16.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 16:24:35 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id q63so19259808qkf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 16:24:35 -0700 (PDT)
X-Received: by 2002:a37:7086:: with SMTP id l128mr12525053qkc.64.1602545075065;
 Mon, 12 Oct 2020 16:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
 <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com> <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
In-Reply-To: <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
Date: Mon, 12 Oct 2020 20:24:23 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpfw=aamn2frhxT9mnUbCyPwG8smZaMLu70n2yrK_1gXQ@mail.gmail.com>
Message-ID: <CAP9ODKpfw=aamn2frhxT9mnUbCyPwG8smZaMLu70n2yrK_1gXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 12 de out. de 2020 =C3=A0s 16:45, Alexander Kanavin
<alex.kanavin@gmail.com> escreveu:
> On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin <andrey.z@gmail.com> wrote=
:
>>
>>
>> What I meant to point out was - there is a dependency in Vulkan on
>> glslang, irrespective whether it is compiled standalone or as a
>> dependency of another package. I believe this Vulkan <- glslang
>> dependency should be solved first before Vulkan can be included
>> anywhere further.
>>
>> As I know, it is currently solved locally in meta-freescale-distro
>> layer, hence it was my question on whether it should be moved to
>> OE-Core to solve the Vulkan dependency altogether?
>
>
> Can you please point to where glslang is used in the vulkan source tree? =
Is it something recently added, as vulkan bits and examples have been build=
ing fine without it in oe-core?

It seems as a good addition to OE-Core as more SoCs require it; this
also allow us to drop this from meta-freescale layers :-)


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
