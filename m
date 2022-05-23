Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8A5C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 16:34:16 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.29577.1653323651465809227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 09:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qqWpV1oD;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id j6so13192106qkp.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ssFY4k82VCu8yu9gP207/Qefg7vl6Ovdi01DqynFkkg=;
        b=qqWpV1oDy8Hd/bHez5upoZVK/TvTIyFu03Aw6k+uTmwtuKCK/w6rJ5bbZGgC82J3uJ
         kFl2guCQnvgjrZ7DzHxutI5nsibwx6uYe1qTOg8O1xPPiJtlldFURQJguCYzpT51hLjs
         T6+YOL0jTDigZsNCTqfyJBRmAT6c0xkAX9LJQRTNBfnYYZX7AaHinZdf3S+nCXpQJsCd
         tNQttMqbpyt7Hqw+G9gLJ3NDxeEpngzZIGyZjyeFZ8pBa8coBsoo0UU/bLlAqx7LJEuL
         MBbuZKTJJg7QDM3MWSR2aYlWLnJe8EIeweKbywjVrOACwA8beI5y697RrZGw1Ue5IwiO
         G2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ssFY4k82VCu8yu9gP207/Qefg7vl6Ovdi01DqynFkkg=;
        b=JTDnrHrBgQ4iiDzH2hsLe3EmGHi8Jj/Ed8nKfGDSGA0Hc35RKaYlLFXcfQaOzsmMmx
         v7M6QewaZEnK+QUitKMauIi/YhmqMYg2t/MvdhDGXWPLJ9wqI5g8y96zSlfug9oRUtcj
         I6F2lTl5Bqd0UvZaB0xDuD0CGZ9FLTXkb96/el5kgEwXe20L0OdIJTD+/a7viKF3FLJj
         vPaP+Y4XCi1keTXaMOHxNh8CHsSX3Jn4BcBkT4L+J5T5mGMHEYX0rRc4/e0iYZuZqZYO
         HshL5Tj4LqTcF4DUETuxCUmIMNwZPtvm1jgbK+3/x0gsJpGMqNR6got4jWgym1PIvrn8
         k0Xg==
X-Gm-Message-State: AOAM532wZiGt7T7fExOuO5QO1u1KP9k3xKttVelPu9OztePCNi2e4i95
	DF3204k3Kd1TlegJv4P0ANy9xT3uVtDQTOyvzqFC4c87pdQ=
X-Google-Smtp-Source: 
 ABdhPJyUo8R1ROwYm+01CJnXDbHhuDw8KxPMbe35cz5bgM5b4HT2CjZ7NdC/BJ2tn0eOwypIlWlntOAlCzkVlkKrveU=
X-Received: by 2002:ac8:5bc7:0:b0:2f9:14ee:885e with SMTP id
 b7-20020ac85bc7000000b002f914ee885emr14161062qtb.532.1653323639940; Mon, 23
 May 2022 09:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220523112433.383046-1-Martin.Jansa@gmail.com>
 <18e8883e3582f2d8057f0608a6edab4a0837f031.camel@linuxfoundation.org>
 <CA+chaQdRxAuQTgdiuQC5im5FSKy=8JHsvnOtVZZaFEZFRJZTfw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdRxAuQTgdiuQC5im5FSKy=8JHsvnOtVZZaFEZFRJZTfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2022 09:33:33 -0700
Message-ID: 
 <CAMKF1srfwQOxQ500CSumNka4U9MsHn31dUieRprhv9FyLqZTcw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] glibc-common.inc: add BSD-4-Clause-UC,
 BSD-3-Clause, ISC to LICENSE
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 16:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166040

On Mon, May 23, 2022 at 4:43 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> The LICENSES file is already in LIC_FILES_CHKSUM.
>
> Unfortunately the files themselves usually don't have clear license heade=
rs, but at least there is Copyright in them, so it might be possible to map=
 the LICENSES files sections to actual source files (in cases where it's no=
t explicitly mentioned) and then map these source files to package names an=
d set the LICENSE:<pkg> to match.
>
> I was waiting for an agreement that this is really needed as BSD is quite=
 permissive and it would be surprising if LGE was the only company which ha=
d to fix this LICENSE issue (in long forgotten bbappend from 2014), so mayb=
e someone else have already better upstream-able change handy (and this e-m=
ail would be just a reminder to upstream it - my over-optimistic self said)=
.
>

I think this improves accuracy of our license representation so this
is a good improvement

> Cheers,
>
> On Mon, May 23, 2022 at 1:34 PM <richard.purdie@linuxfoundation.org> wrot=
e:
>>
>> On Mon, 2022-05-23 at 13:24 +0200, Martin Jansa wrote:
>> > * the main motivation is to get rid of this bbappend from 2014:
>> >   https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf=
7f91974799046975fca
>> >   which unfortunately doesn't explain which files under BSD license ar=
e included
>> >   in which package and also uses ambiguous 'BSD' license which was
>> >   removed from oe-core's common-licenses in:
>> >   https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone=
&id=3D14d4c007c49652d836d325a12bdbcd3bfa42e6d5
>> >
>> > * COPYING mentions only GPL-2.0-only & LGPL-2.1-only as our LICENSE va=
riable says,
>> > , but the LICENSES files lists various licenses with various Copyright
>> >   holders, the ones I was able to figure out where:
>> >   BSD-4-Clause-UC (but with 3rd clause explicitly removed)
>> >   ISC
>> >   BSD-3-Clause (with Intel Corportion copyright)
>> >   BSD-3-Clause (with Oracle America copyright)
>> >   which have just small formatting changes compared to corresponding
>> >   license in common-licenses, but there are couple more, should we
>> >   list them all (and create new common-licenses if needed)?
>> >
>> > * there were only 7 changes in LICENSES file since 2002:
>> >   https://sourceware.org/git/?p=3Dglibc.git;a=3Dhistory;f=3DLICENSES;h=
=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta/recipes-core/glibc/glibc-common.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-c=
ore/glibc/glibc-common.inc
>> > index 90a6a534f3..7e3dc3b816 100644
>> > --- a/meta/recipes-core/glibc/glibc-common.inc
>> > +++ b/meta/recipes-core/glibc/glibc-common.inc
>> > @@ -2,7 +2,7 @@ SUMMARY =3D "GLIBC (GNU C Library)"
>> >  DESCRIPTION =3D "The GNU C Library is used as the system C library in=
 most systems with the Linux kernel."
>> >  HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
>> >  SECTION =3D "libs"
>> > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>> > +LICENSE =3D "GPL-2.0-only & LGPL-2.1-only & BSD-4-Clause-UC & BSD-3-C=
lause & ISC"
>> >
>> >  LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3D1541fd8f5e8f1579512bf05f=
533371ba \
>> >        file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>>
>> I don't mind updating this but I think we'd need to add something to
>> LIC_FILES_CHKSUM to show where the context under BSD* is...
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166008): https://lists.openembedded.org/g/openembedde=
d-core/message/166008
> Mute This Topic: https://lists.openembedded.org/mt/91285771/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

