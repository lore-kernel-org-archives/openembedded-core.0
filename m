Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC83C3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 20:41:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.162.1659559268062398478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 13:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cuy7MM14;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id t22so28057404lfg.1;
        Wed, 03 Aug 2022 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=syDJGE5Ph7CISiYqO5MlTGLVgmHSt50JryaSv3vJpmA=;
        b=Cuy7MM14zdzpSNzz32cbuXt6oIU4yOEtxfkMjKmS+hLaYE9LzW+HQa2/6Gzfvtx3Rk
         i31whoo5mmiJ5th1xc/Iy0BuHA+pWoM3Hag7luTsGb7+SU5jjKlV4+ZlxyBp0/iF4syw
         8VhwkHvrNLS2B8BtL1J1ujXsPPTfSNIvAB7xfJV7DJIKktqmUIuhkpEwimyEcWYN32Cn
         TkkKX6k7ISj4Uax/8Jefn9Ia3L9iL27tqZCEf8TSXjaVw+aYaeY7e/W7as0vBDLJEwse
         0AiTx3qAzLphGgfRi/aCxpdH5vg5QGygPozmJEQ4a3smk00KWzjQ2OWsejtE2TZ2p6pw
         q0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=syDJGE5Ph7CISiYqO5MlTGLVgmHSt50JryaSv3vJpmA=;
        b=WbiozMaSe6V9SWI2b0Rlk3CeUoaE1dyokLbLWJut/j3JujePGlJh7ZLsKThDCCPU5q
         RhEoQRjSUimbKUeCn5csQctUT3Dw9tC088Gu7MaCx+2x6T+uzgLvB2smEi7LX7wVD+JO
         fg8Ynq/ecDXXqY7H+O3o/e8DxjlQAScbQIXkzjblzGAbOhM7rrGzTRnTaHn4PNxtpMzq
         ixiZa0MevjyiMkJtj3lptp2GiZG28Tcdbm3t3/Afq8rPb8mnhA/NwZk7y+BOd4biFxjF
         wMKDw8khu+cO2j+MXrFZSmfMrQiN3oaTzfTsDnU1hlQtZoP1T+cJDgdZN7MMNzcrIZN4
         7/1A==
X-Gm-Message-State: ACgBeo33zuQwwTJCsorz64vtfnJGIv7cLnuxbSBqbac5Pz8rV93zemvN
	2CZ+Ux0EOEOMvE5vYFD5keIkBxYS8mR0mAxrr3Y=
X-Google-Smtp-Source: 
 AGRyM1uIJRQSRgWqCMW+v2q1hqh/EZZqlEd1qzWWiQUrGIe1e+9pDaH6jxHciBz/txtJ4LjNuk7JTsaZR67DOWe9dWg=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr9081449lfa.380.1659559266193; Wed, 03
 Aug 2022 13:41:06 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Aug 2022 22:40:54 +0200
Message-ID: 
 <CANNYZj_z_sBEfsHWkNeBwbY5M+rMPowB4wX-ArSzjnM5rkea9A@mail.gmail.com>
Subject: Re: [OE-core] Introducing yb - a new tool for Yocto environment
 setup/management
To: Chris Laplante <chris.laplante@agilent.com>
Cc: "Openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 20:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168826

Hello Chris,

do you think any of these pieces could be moved to 'official yocto',
specifically as bitbake-layers subcommands? I read through the README,
and it seems that things like 'status' and 'run' would fit very well
there.

Also note that there's a proposal for a json schema and layer tooling
that would be provided directly in oe-core:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/setup-layers

I can't help but say that there's a certain bit of irony in referring
to https://xkcd.com/1987/ - when introducing yet another external tool
for yocto layer management :-)

Alex

On Wed, 3 Aug 2022 at 22:21, Chris Laplante via lists.openembedded.org
<chris.laplante=3Dagilent.com@lists.openembedded.org> wrote:
>
> Hi all,
>
>
>
> Today I=E2=80=99m excited to publish a tool I=E2=80=99ve been developing =
internally for about a year now. It is called =E2=80=98yb=E2=80=99, and you=
 can think of it like a cross between kas, Google=E2=80=99s repo, and myrep=
os (mr).
>
>
>
> Project page: https://github.com/Agilent/yb
>
> Download it here: https://github.com/Agilent/yb/releases/tag/0.0.11
>
>
>
> The tool is written in Rust. It is statically linked, so all you need to =
do is download the binary and put it somewhere in PATH.
>
>
>
> The primary contribution I believe this tool makes is the ability to not =
only setup Yocto environments, but keep them in sync with the rest of your =
team as your product(s) evolve. This is realized via the =E2=80=98stream=E2=
=80=99 mechanism - a git repo that holds your specs (basically like kas=E2=
=80=99 configuration files). Most operations in yb automatically fetch upda=
tes to the active stream before doing anything. If you need to add or remov=
e a layer from your build, just do it in the stream. Anyone using that stre=
am will automatically get the update and be informed to update their enviro=
nment.
>
>
>
> I am also very proud of the =E2=80=98status=E2=80=99 command. It works ev=
en with vanilla Yocto environments (i.e. what you=E2=80=99re using today) a=
s long as the tool can find =E2=80=9Cbitbake=E2=80=9D on PATH. The =E2=80=
=9Cstatus=E2=80=9D command will automatically do a =E2=80=98git fetch=E2=80=
=99 on each layer. When used along with streams/specs, it will also first c=
heck for updates to the stream.
>
>
>
> I hope you can give it a try and let me know what you find useful/broken.=
 It is still in relatively early development (in particular the =E2=80=98yb=
 sync=E2=80=99 command) but it is already helpful for my teams=E2=80=99 day=
-to-day work.
>
>
>
> (P.S. Please forgive the multi-mailing list post)
>
>
>
> Thanks,
>
> Chris
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168825): https://lists.openembedded.org/g/openembedde=
d-core/message/168825
> Mute This Topic: https://lists.openembedded.org/mt/92800761/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

