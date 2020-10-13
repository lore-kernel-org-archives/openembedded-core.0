Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.6998.1602576677235915375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rEtniNtH;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id cq12so19934185edb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oZj6qkIzmFK6rDdr/Ae2ThDUZj1aRMNZT19Rfi7B9Ck=;
        b=rEtniNtHdpwNDv3T9h4wZDYPMnKHx0kTIWAW6hSTBvLtb7rM5tJaIuwU/gC9tlcR+1
         MSGfzuFZQBZXxpdQd4qGHNYJ7jo8IuX/bWISjH4OpCONMm18JD1bpHxxoP3Pdsj4INEz
         2eRerGOILaJ0IQfeJ/1Z9z/zeTFaR3vh61AWbq5pls6NPP1GYK6bI4Vjf/qNNO1HzM8q
         4svw5j/0d36GPpeYgudxH/H+SJlLMaBoBXqfvTHCz75+2lxhzQEgOLLLfiHwUxmCphtG
         vJhJElDbUn/9dLj1kRdYXRbedS1QRd1iP1Pj1DcHor2gOpXm5FEfFcBl+Oc1L+Yfeo+O
         xztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oZj6qkIzmFK6rDdr/Ae2ThDUZj1aRMNZT19Rfi7B9Ck=;
        b=IG+6Wl1wCCR5CgD1WZbN+iU/U6KmZsCW//Fml1BAgjmL8o3wY0vOUQlG6jVCn5Njkk
         4GqUCfFQUYSm1JMOV/hUU+TG2yuQ4HCWC/r8ycuO4NBIJW9y0XnDo/gYMM2C/l8KXULX
         5HBEDEJD2RefocWctjG5Hp45X9dxm+gJJ2nmESrBlKlUmMKwegokzMnlCsbPEC/HsGms
         kj66sRIrTCP0HkyaZh+LIDdVufNyvlOj2PcrtlLqum6YaT2SQ+FTWbaCqUo41vjlhsB7
         ytDucC7wj/TdaqU1EgeMDNvQ25prsqISu6yEe/6RaLQBaoCjVZ3nyXuY2isbK9Crh5dO
         nwwg==
X-Gm-Message-State: AOAM532KCL5np/rZyj/88ecItqHenj/3BipQJbQzv69uzwhQler1FQOG
	dHSPifaWxJgSwCXkqn8SjsXNFr2f8ZaRUXVs06I=
X-Google-Smtp-Source: ABdhPJzl91FDWY0vcU4JENuWfut4zadOH5Ik8uS4unSsDSrETVFzY7zAPKfofXzygiT/n+5SoGbf84FzcNpoyZtgp7s=
X-Received: by 2002:aa7:de06:: with SMTP id h6mr18582686edv.31.1602576675673;
 Tue, 13 Oct 2020 01:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
 <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com> <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
In-Reply-To: <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 09:11:05 +0100
Message-ID: <CANPvuR=BkV+=n2rGoNKAHHmiVTCUbSDNgsy-tWisAyuXFYhu=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
12/10/2020 =C3=A0(s) 20:45:
>
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

I am working on a recipe for 'shaderc' that is needed for build the
gstreamer vulkan plugin

This recipe needs glslang and spirv-tools.
I don't have knowledge of the existence of glslang on
meta-freescale-distro and I created one for myself.

>
> Alex



--=20
best regards,
Jos=C3=A9 Quaresma
