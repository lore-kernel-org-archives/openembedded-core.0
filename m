Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.8025.1603974726981443792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mq9KIaOs;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id t25so3503327ejd.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kEhnES/GXJ6FO0Y29+0TLK8y17rYnDbHPuBL8oL8bUk=;
        b=mq9KIaOsvOYMxy5ekRsnagB83WH7dkIEGsG31lrWNRCk5r8R9p3GR0TKuHjH+1CIpn
         Ve8zhLsXEKbI07fWniL8cEiUlRxUOilziPna9GdRky/o+hQZK1seJp8Bm6HR5WAsHBuQ
         Q5Vui70efBE4AyQC+RCe7nZeIvoLzxIitOKWuHVquOiux+B5AhVah4eEKxIXcaTY+r2U
         v3if83jM/i3lbIMEQNZn5b0n3tyb/Lu1+xoLIpyzqnDdjMT+nu0fhaOC/9/Zs6+F2fDl
         W+rCAX/hly67lhSMsq8rcgJc26IX7U9IxjdGOlECJ+l0LXfNn+a2tm2UUsJXXeDIFwZ3
         ALNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kEhnES/GXJ6FO0Y29+0TLK8y17rYnDbHPuBL8oL8bUk=;
        b=SFnibWL23lpGrx2K6j0CYJOWr7DMpXY/35dNx5PW//Qx1TkrgkjskobtA/ynV/LFa8
         UjL5a30/gLWY5muBeB4pW7DZAvHloYW/PjWej/bSnDOyeBwbn5S/BgQOYxNDfYr6lXCW
         8s2/yfWq2hw+k6cuNftnEB0BR2G96+QhugZKoFtJn9ArPkvd59Wvjka6QdIXDhqJ4qEf
         Mtlwo5zhJAd1S8NR2AG4/rdkW+HIBf2zAovbTbuVEc+X0SJ8v+IwV3AdBKV2D5Q5K91B
         eMMFJoJBc1dWRwRybDtygYwaJdU3Kllf//knM4W9bhD3myH3rrV/CO6aLUsfcgMCRkSe
         Sdfw==
X-Gm-Message-State: AOAM532EZsth85CHNTMRdCo0BqaSaTPy9p1UgKHwuzTj443oFlIEV/Pd
	ZLig6fqNwWRqqUDFVZL/F+hFnfBrWpXdtqAQFl8=
X-Google-Smtp-Source: ABdhPJySxDBI5JsA3pWwO40O4XKMKKg44MTu+/yPI3Mpim8fVEtiy3/JS0EBMZYRC9rgZR0WR4xDPVq+tP4PcFLx8eY=
X-Received: by 2002:a17:906:a119:: with SMTP id t25mr4082394ejy.67.1603974725438;
 Thu, 29 Oct 2020 05:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com> <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
In-Reply-To: <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 12:32:04 +0000
Message-ID: <CANPvuRkqQtnCN0O5Y8tcF8-WGE0rq+s7ZSqS=Xh4M9PWoN4tdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

You are right,
The current version of the recipe in master has: delete_unused_libav_copy(=
)
and with this it already uses the ffmpeg present in OE-core.

I need to review this patch.

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quinta,
29/10/2020 =C3=A0(s) 12:20:
>
> Wait, ffmpeg has been available in oe-core for a long time:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multime=
dia/ffmpeg
>
> So the issue is not the absence of ffmpeg.
>
> Alex
>
> On Thu, 29 Oct 2020 at 13:01, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> Hi Richard,
>>
>> Starting with 1.17, gstreamer1.0-libav will not ship a copy of FFmpeg.
>> ffmpeg is on meta-oe and because this recipe needs to be moved to
>> meta-oe as well.
>> I think [gstreamer1.0-libav: upgrade to version 1.18.0] can dropped fro=
m OE-core
>> and I will submit it to meta-oe.
>>
>> Sorry for this. I have built all the recipes in the series but I have
>> meta-oe present in my layers.
>>
>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
>> quinta, 29/10/2020 =C3=A0(s) 11:18:
>> >
>> > On Fri, 2020-10-23 at 19:41 +0100, Jose Quaresma wrote:
>> > > V2:
>> > > - Fixes the build of vulkan plugin
>> > > - Fixes pacth headers
>> > > - Upgrade orc 0.4.31 -> 0.4.32
>> > >
>> > > V3:
>> > > - gstreamer1.0: Fix reproducibility issue around libcap
>> > > - gstreamer1.0-python: install append is not need any more
>> > > - gstreamer1.0-plugins-[good/bad]: disable new meson options
>> > > - gstreamer1.0-plugins-[base/good/bad]: add new meson option as
>> > > PACKAGECONFIG
>> > > - Update pacth headers
>> > >
>> > > V4:
>> > >
>> > > - gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland
>> >
>> > Thanks for these, I've tried running some tests in master-next with t=
he
>> > patchset. There was an issue on no-x11 builds:
>> >
>> > step1b: ERROR: Nothing PROVIDES 'ffmpeg' (but /home/pokybuild/yocto-w=
orker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.1=
8.0.bb DEPENDS on or otherwise requires it)
>> > step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav-dev' (but /home/=
pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstre=
amer1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)
>> > step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav' (but /home/poky=
build/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer=
1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)
>> >
>> > in the build:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/262=
9
>> >
>> > Would you be able to help sort that out?
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma
>>
>>=20
>>


--=20
best regards,
Jos=C3=A9 Quaresma
