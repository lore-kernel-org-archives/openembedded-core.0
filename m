Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web08.166.1614617881456839538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 08:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hF2uENM7;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id v5so3791093uac.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 08:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KngY3uEmyTo10k70R+3PdWQ2uQhltp7//DWE3fYimqI=;
        b=hF2uENM7hwWAFJHJaYdxdqVL9dWyKjtbYKXI/HZhr7swOPm+qY4iNsimYJW82LoyWl
         ig3CxNMfEX/epj+wyjLPz8TGpdhbvR/r9ypjhIc0k85Gd04WUKgXywdjqxFlyBjcl4M4
         Xv/2QADfuzVhaSdUqUJx7jT6aCzsmVJYau3bE8TggOBWMsQGEdYn411emmh7M1DNfyBW
         e508CE0qHpcycLjd1h4NbOJFjcE+aRvALRi3NbgtLz9I7mbvyV58NqFrihDI9Q9LmTO3
         UQjU3R19iA95OA06h4oLG6kYl+QMyoGlW8zifBHR9KyN0PIStSjvwW9zfEnSdDVQvkCw
         jZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KngY3uEmyTo10k70R+3PdWQ2uQhltp7//DWE3fYimqI=;
        b=U6IyXnj7idMhz8AQXkpeNMGVLNipdIYOP+ih5XaBsFv6A5YrsMhzSJotzibn+2q2a4
         URWNRoqWSEUZib0Jgug9MA/xYIgG3fXjOeKQRZF3Am9vC+8/vxFreGkloRYeEgRFsA6i
         bIwSomjmC31rr0yqCIURU1r4N2k4iLzvZ2Gb0OoWtj4HYyec8kBH9QCUfkLWng3vFtjf
         KheugYTL+llfQyQ/zbt4oy5rrQTAsjDMyEZHGX8FRevZ9BG8XM7mo0V9bmM1OQIxtZqH
         6cN+r24iA2unrWF/b3+z0dGcWR2f5hMrjNk5EBWecs1ChfO/F+NrRiAC9ZZHurnjNRLX
         Kylw==
X-Gm-Message-State: AOAM532VNbQUGEmAWrYjJAXNTAO2hBmG6QYg5bzsjA9L0OmMzRAdLycc
	ExCKJtXAv8mjxiodFDwrQwSuG/iWZKoyefi9Das1kU/PehY=
X-Google-Smtp-Source: ABdhPJxxts6t6LL+nEKiBF6Ws8eXHq0ROL08BjD2fUMqszQNsIF8YO+hL9P71uuMwTBX/J+Oiq5LaXzr9VeKii2TDXE=
X-Received: by 2002:ab0:6045:: with SMTP id o5mr7796773ual.100.1614617880508;
 Mon, 01 Mar 2021 08:58:00 -0800 (PST)
MIME-Version: 1.0
References: <f7074841-6830-7090-9808-b7987f5c9587@gmail.com> <4886.1614609131834348150@lists.openembedded.org>
In-Reply-To: <4886.1614609131834348150@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Mar 2021 17:57:49 +0100
Message-ID: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Colin Finck <c.finck@enlyze.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000373b0e05bc7c8540"

--000000000000373b0e05bc7c8540
Content-Type: text/plain; charset="UTF-8"

Can you send a followup patch please, on top of master-next?

Alex

On Mon, 1 Mar 2021 at 15:32, Colin Finck <c.finck@enlyze.com> wrote:

> That comes two days after my patch:
> https://lists.openembedded.org/g/openembedded-core/topic/patch_dosfstools_upgrade/80928608
>
> I would highly recommend the "--without-iconv" option I've added, to
> prevent error messages about non-existing conversion tables followed by
> "Using internal CP850 conversion table" (which it does all the time using
> --without-iconv).
>
> Apart from that, I urge you to backport the fixed version at least down to
> dunfell, maybe even to earlier releases.
> dosfsck 4.2 no longer marks directory entries created by mtools <= 4.0.19
> as bad, which previously rendered lots of FAT boot partitions (Raspberry
> Pi/UEFI) unbootable.
> mtools <= 4.0.19 is part of "warrior" and earlier and used by e.g.
> meta-mender during build. Therefore, many affected FAT partitions can be
> found in the wild.
>
> Best regards,
>
> Colin Finck
>
> 
>
>

--000000000000373b0e05bc7c8540
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you send a followup patch please, on top of maste=
r-next?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1 Mar 2021 at 15:32,=
 Colin Finck &lt;<a href=3D"mailto:c.finck@enlyze.com">c.finck@enlyze.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
at comes two days after my patch: <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/topic/patch_dosfstools_upgrade/80928608" rel=3D"norefe=
rrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/=
topic/patch_dosfstools_upgrade/80928608</a><br>
<br>
I would highly recommend the &quot;--without-iconv&quot; option I&#39;ve a=
dded, to prevent error messages about non-existing conversion tables follow=
ed by &quot;Using internal CP850 conversion table&quot; (which it does all =
the time using --without-iconv).<br>
<br>
Apart from that, I urge you to backport the fixed version at least down to=
 dunfell, maybe even to earlier releases.<br>
dosfsck 4.2 no longer marks directory entries created by mtools &lt;=3D 4.=
0.19 as bad, which previously rendered lots of FAT boot partitions (Raspber=
ry Pi/UEFI) unbootable.<br>
mtools &lt;=3D 4.0.19 is part of &quot;warrior&quot; and earlier and used =
by e.g. meta-mender during build. Therefore, many affected FAT partitions c=
an be found in the wild.<br>
<br>
Best regards,<br>
<br>
Colin Finck<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000373b0e05bc7c8540--
