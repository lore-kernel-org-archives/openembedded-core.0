Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web09.5328.1604569927206668634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVF5VU9J;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id gn41so1705628ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 01:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mkpmO1qQZsN2/RGtAnlo+plBWWw+8V2Ohh5xeM8IxFk=;
        b=VVF5VU9J4R4dX+OPvmswqUa+0E4ZHXjHDGcbTjPzZIrlbNwFkfRNJPC1LkW7QoT41F
         0WWBwXFoapF3ZNjCC/xFISWDf7VYx6F9eeZ/6sBb2EzoN+SYvlfWIM6TmpZI9oKtcYcZ
         3fujJqrf9DChXDbGdQxboLf2M9NpvG4Bt4N0v0buqrkWdoIrUHfUjq1VLVuYbK437GbD
         XnONkCGcdRVGAzc4r8kwQaE2zOsvLgjfBMAB25pNV3NFTuQFi3hQXb0zcZX8OZZ7TuBn
         QqbSz3xxDh0R0rEHhOU7ms1Ws5cqDMrJaMNGIhqxdNz5tuF0aTnvof/nGL6D33gc7q2A
         vp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mkpmO1qQZsN2/RGtAnlo+plBWWw+8V2Ohh5xeM8IxFk=;
        b=FQJO7C1HmJV5ZuGIb+l1Gxhv3gqgkX2opAHqBwuh5L69DS2eqotLOe72eq6Yg0j592
         ZM/67SaOOKWk3kq1zEY0hdXNJUnHxlnb9Hw3Kv2wr2gUKSs6IZZvvmgOWwJMW5rGW2Wh
         cwlifWCU7V0oUCEwSOojAYVFV8OOUCW4glS8gwvTI1HRa8liPzoAznDlCNFBikj/vinU
         Fr/O+XtunM4gMosoX/SVE6jnRtH4pdW2P6iGZ0GzKULEu/TR/VKKHpM8sKCG4229O0Pp
         zl2DzYzLGHPlrPeI2ZV7WKm1r5IfOeRFrnuIpHveFi2biZuKhVt4IuPHC0GuYkitK0t5
         ENPw==
X-Gm-Message-State: AOAM532jzPxK4Q5pD0seFTsjplrE8JmyKCG9lRUmD0fHd61G6ssnUwQJ
	hJOvKLa6ey0WDYd5oLz8VTjxDLKSrHnKLsTVJJE=
X-Google-Smtp-Source: ABdhPJx1u8eFJ2478cxu1gCgCeU4D38YE6zHEWdH4eF6p7eRrmsU/XP44SbTO71bj592q3oC+DBH9XFr4KYzbSI8ZSU=
X-Received: by 2002:a17:906:1497:: with SMTP id x23mr1405541ejc.453.1604569925699;
 Thu, 05 Nov 2020 01:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
 <CANPvuRmmZoqHZP7pbNqHtPBqBo0VqTrftmBhh+nK7iTE_gF=wA@mail.gmail.com>
 <b72d77dbd65970a8aa40798545eed309957b121f.camel@linuxfoundation.org> <CA+chaQd5LzwrHzcKVEPhD-PVXgp=9ZRGmGbJXyupfmsY5x_Ndw@mail.gmail.com>
In-Reply-To: <CA+chaQd5LzwrHzcKVEPhD-PVXgp=9ZRGmGbJXyupfmsY5x_Ndw@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 5 Nov 2020 09:51:54 +0000
Message-ID: <CANPvuRmQHT4PSSSnFfOG7F5S7FG+odPyTXkeOKUC9cZip+-t2Q@mail.gmail.com>
Subject: Re: [OE-core] [gastesgarth][PATCH 01/12] gstreamer1.0: Fix reproducibility issue around libcap
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Martin Jansa <martin.jansa@gmail.com> escreveu no dia segunda,
2/11/2020 =C3=A0(s) 11:47:
>
> FWIW: I've sent this 1.16.3 upgrade for gatesgarth only because it was re=
cently merged to dunfell and going backwards for something as significant a=
s gstreamer might be complicated, even when we should probably start gettin=
g used to this as dunfell is LTS and will receive minor upgrades long after=
 gatesgarth is dead completely.
>
> After updating some patches to apply on 1.16.3 and disabling hls support =
in plugins-bad (because it now requires GPLv3 nette >=3D 3 after https://gi=
tlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/a9c115adebeaa4f35f2=
7953b1cb94881912e5c00 ) I just didn't want to undo these 2 changes in gates=
garth branch.
>
> I'm fine with 1.16 in oe-core, people who need 1.18 in gatesgarth (or eve=
n dunfell) should do it in separate layer like you already prepared in http=
s://github.com/OSSystems/meta-gstreamer1.0/

Thanks for the explanation,
I have nothing against it and I have the same opinion.

>
> On Mon, Nov 2, 2020 at 12:16 PM Richard Purdie <richard.purdie@linuxfound=
ation.org> wrote:
>>
>> On Mon, 2020-11-02 at 09:57 +0000, Jose Quaresma wrote:
>> > I think I already know the answer but Is there any possibility to use
>> > gstreamer 1.18 on gastesgarth ?
>>
>> Not really, we can't do version upgrades on releases in their
>> maintenance cycle unless there is a really pressing reasons to take
>> those risks. gatesgarth whilst not released yet, is imminently due to
>> release (I hope!).

Thanks for the explanation,
This was the answer I expected. I understand the risk involved in an
update of this type.

>>
>> Cheers,
>>
>> Richard
>>


--=20
best regards,
Jos=C3=A9 Quaresma
