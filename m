Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F34CC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 10:53:21 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.17860.1707303192175591533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 02:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cVN6yhfn;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: uvv.mail@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-604842b3726so5930257b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707303191; x=1707907991; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6NKqCFbkPvJPgCAkwUHc3KkraCxpooDFbg+KKjAvBcw=;
        b=cVN6yhfnRQ3rZlPXnJfTW3L3aNqjsXG4IwdG/YyUymfmmeHkJS2JWUW7q6libnYkjL
         Ua8CX9Etf7ObwVMqFAQ93ufXzFIf2QFjbD/SH2dlgl9eV+sUj06PCVoacbJMQg1hYcKu
         hvGpQoOw6INLomx7g1xj6OZ6rG00H9vri5vQSZtM0GPJ0d0X1U4PqTi0YvWodhhJOB3h
         FotE8DNHFmAfkfdSMe0vtBq2sKzkQ2hjgI0eMVx86bwMgjwELywP9+QUGYCpH6lIVnTH
         07ToVKQeXdTIsU3pygjkFXX7haeSrCAg29wDYkiyIGz+fdi0Mn8N1Tkc768GJABkApVy
         /4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707303191; x=1707907991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NKqCFbkPvJPgCAkwUHc3KkraCxpooDFbg+KKjAvBcw=;
        b=Xgd03TEQGvAN1FFEeq/aqwj8LYCTBEYGI30iNRh4jLqut6FWBzuAoExLa0AI9f6e5i
         8mAijsq1Z7J9mZ+Oy94iCeA7+6+rLmcHLx0+TXkNf5MLWliO0kiE29QFC/yX5T1GhjOm
         tCnPCSakGyyqyCFwYgL/ffVlL5wTF+tCLPB5+iJpYZZ1CF1ZikWzpEPpu3NlgkaqGdKZ
         mLA2mLUqEzO7Yky+418/blHQlDnNrpJTjTVDo5caXusOULkAH+xpotQE4pJFWXhVV+1J
         3/CVR6o6hk9iHYONUTfG3dy0amqBdhfw1kjE4FI/lPyxN8jDWfdQQBKfmx3PwAz9k75O
         VE3g==
X-Gm-Message-State: AOJu0Ywk9McqgaxwUHadoNuQX9VfFHjIMmno/ks3Fjig5cuekp+6V81E
	/BDKHi1bbpdmt2Pi31djN9k6XPNw9Pc6yfZkwASs3Y/skgX5yFMmTn2SV6sq6gxeLN58Kms1hsX
	1D14NYAB5TgdlERzwpRe2u37e32U4HzxmhFk=
X-Google-Smtp-Source: AGHT+IFykdND+6lZY7lK1Sxf2nZCeJThkt9tUDW75DQkKGUMXIKqvoK+Uz6KH7O6BSGdnAeG0xjPORuPO7dzMCzUHsk=
X-Received: by 2002:a81:b186:0:b0:5ff:55f6:7530 with SMTP id
 p128-20020a81b186000000b005ff55f67530mr4315879ywh.12.1707303191161; Wed, 07
 Feb 2024 02:53:11 -0800 (PST)
MIME-Version: 1.0
References: <87sf24vcxu.fsf@tarshish>
In-Reply-To: <87sf24vcxu.fsf@tarshish>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Wed, 7 Feb 2024 11:53:00 +0100
Message-ID: <CAKHfEagyup7c4ft94-LP5UfCNryn9oNuKCxJdaZ-uf-1kdvNJw@mail.gmail.com>
Subject: Re: overlayfs-etc compatibility with volatile-bind
To: Baruch Siach <baruch@tkos.co.il>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003bafad0610c88029"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 10:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195048

--0000000000003bafad0610c88029
Content-Type: text/plain; charset="UTF-8"

Hi Baruch

> What is the purpose of mounting root rw in 'preinit'?

I guess that was a default, which was not tested with other options
combined.

Do you use read-only-rootfs image feature? I think the script can be
adapted to take that into account.

Thanks,
Slava

On Wed, Feb 7, 2024, 10:30 Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Vyacheslav Yurkov,
>
> overlayfs-etc generates a 'preinit' script that unconditionally remounts
> root to make it writable. Later systemd-fstab-generator generates a
> mount unit (-.mount) that restores read-only as set in /etc/fstab.
>
> I added an entry to VOLATILE_BINDS for the /home directory. The
> volatile-binds
> recipe creates a systemd mount unit with the condition
>
>   ConditionPathIsReadWrite=!/home
>
> The trouble is that there is no dependency between the rootfs mount unit
> and
> the /home unit. When the /home unit runs first, the condition is false, and
> the unit fails. If I later start the /home unit manually, it succeeds,
> because
> rootfs is read-only now.
>
> What is the purpose of mounting root rw in 'preinit'?
>
> Is there any other alternative to make volatile-binds do the right thing?
>
> Thanks,
> baruch
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--0000000000003bafad0610c88029
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi=C2=A0Baruch</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">&gt; What is the purpose of mounting root rw in &#39;preinit&=
#39;?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I guess that was a=
 default, which was not tested with other options combined.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Do you use read-only-rootfs image fea=
ture? I think the script can be adapted to take that into account.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">S=
lava</div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 7, 2024, 10:30 Baruch Siach =
&lt;<a href=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hi Vyacheslav Yurkov,<br>
<br>
overlayfs-etc generates a &#39;preinit&#39; script that unconditionally rem=
ounts<br>
root to make it writable. Later systemd-fstab-generator generates a<br>
mount unit (-.mount) that restores read-only as set in /etc/fstab.<br>
<br>
I added an entry to VOLATILE_BINDS for the /home directory. The volatile-bi=
nds<br>
recipe creates a systemd mount unit with the condition<br>
<br>
=C2=A0 ConditionPathIsReadWrite=3D!/home<br>
<br>
The trouble is that there is no dependency between the rootfs mount unit an=
d<br>
the /home unit. When the /home unit runs first, the condition is false, and=
<br>
the unit fails. If I later start the /home unit manually, it succeeds, beca=
use<br>
rootfs is read-only now.<br>
<br>
What is the purpose of mounting root rw in &#39;preinit&#39;?<br>
<br>
Is there any other alternative to make volatile-binds do the right thing?<b=
r>
<br>
Thanks,<br>
baruch<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank" rel=
=3D"noreferrer">baruch@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"h=
ttp://www.tkos.co.il" rel=3D"noreferrer noreferrer" target=3D"_blank">http:=
//www.tkos.co.il</a> -<br>
</blockquote></div></div></div>

--0000000000003bafad0610c88029--

