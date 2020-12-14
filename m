Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web08.1471.1607973405239349355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vFCk1UIx;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id h6so9583850vsr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 11:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03zwB0RdAV706j0q+vfLDMnsNsbPozg5Yr3TejUSxrc=;
        b=vFCk1UIxza2djSSyEOhoHyw0X9ZDGc8qdtloUrcyF7pKkziPzqObs4KyjRsblQi9zQ
         U7cv4HRACRNAmtqycnoiL0dnoUvCS8Y4ZsC1wtIO+iF0qosbKyKtShJnSJ+1QWc334a0
         7vzWe/4A7IBr3ApZwa9imrsqcSKaFSLXxLJWp7ev7EdrAVp/UfE1ZaaOmQR+5i7DBzQh
         x91TeaM1XLffRsZjiqodVPXJ0shD/6V0losqwp+pswyrkO0Aq4xfJTOztLkHJzvq30Go
         m0lm9NqCHRS+LrFFec4q7l6PHiLXthHPzDiW4xsCQ6jKCO7oaakQLMY6C3Ybrdz2iI1P
         p/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03zwB0RdAV706j0q+vfLDMnsNsbPozg5Yr3TejUSxrc=;
        b=FVy8GhkM3IoVtbKQrd9WjzzwmpYYdmwnG75nu+A5jHZFIeQXkWsF8xvAuDzyEtMpEe
         FOjHpEd1gm7jmt4U+y1fzcmC2urkLuDaSfKHlfYv2HUm9UQEcnqgXenV1jyiUgkuwB+6
         JAF8r/T5n5Dt4tuyJO5YDh3D2di/MUjN4Z/y8LPWD7nqPN23K/+osuLcqie2L/zelQ1q
         rnRphCNQ0XU9r0+Nitr//BOAazZ/HoZzW3zHbp3Ze/XEHzBBVbPr4OKNDTpY4MqsPyt8
         sRd0BrlBf15kh9PR/mpA9e/hZlmZ8NLkh9AVE2TDQm+lbhfBk1Mz6VzUEYh0yXprqbAH
         IFgg==
X-Gm-Message-State: AOAM531HImi8movYOaeDekStv8SeMoNiUTcmtNBBzXJqLRkfVcrFmbTG
	v5wFWnrcg5Paa9/KCQVJiyakmb0pAZ0DJxxJAlY=
X-Google-Smtp-Source: ABdhPJwqlCcy7XN+p1hmK2epXSqxk30YjeWgU+4FKFhL7oM21BLQXcIM9kcTh6uzw8kf8isSfjvo9HYZe+4AA9TIli0=
X-Received: by 2002:a67:4346:: with SMTP id q67mr8219510vsa.51.1607973404425;
 Mon, 14 Dec 2020 11:16:44 -0800 (PST)
MIME-Version: 1.0
References: <e4085caa6fe95c5d09a23a850fe8748c93323af4.camel@iki.fi>
In-Reply-To: <e4085caa6fe95c5d09a23a850fe8748c93323af4.camel@iki.fi>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 14 Dec 2020 20:16:33 +0100
Message-ID: <CANNYZj_xWix4a3eyFwCC1r8e+NieqJdKF7c184kfBS4RBQND4Q@mail.gmail.com>
Subject: Re: [OE-core] I wish to drop my recipe maintainer duties
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000094426705b6717be8"

--00000000000094426705b6717be8
Content-Type: text/plain; charset="UTF-8"

Unassigned is the way to go, yes. All recipe updates (or failed attempts to
do so) are nowadays posted here, so they can be picked up by anyone
interested.

Thanks for your work (of the highest quality), and totally understandable
that you don't want to spend time on something you do not use.

Alex


On Mon, 14 Dec 2020 at 20:07, Tanu Kaskinen <tanuk@iki.fi> wrote:

> Hello,
>
> I haven't lately had time to do OE work, or maybe the lack of time is
> more rooted in lack of motivation since I don't objectively have a very
> busy life, but in any case, I think it's time for me to step down as a
> recipe maintainer. When in 2015 I transitioned from being paid for the
> work to a volunteer, I had plans to use OE in hobby projects, but those
> projects haven't materialized, so I don't really have any connection to
> OE other than being a recipe maintainer. My experience of the community
> has been very positive, it has always been nice to work with you, thank
> you for that!
>
> Should I post a maintainers.inc patch that changes all my recipes to to
> unassigned, or should they or some of them be directly transferred to
> someone else?
>
> I will still post some patches for pulseaudio that convert the recipe
> from autotools to meson. I've had them ready since the last feature
> freeze, and I intended to submit them today, but I found out (as I read
> the mailing list for the first time in three months) that the recipe
> has had a major version update, so I'll have to redo some tests first.
>
> --
> Tanu
>
>
> 
>
>

--00000000000094426705b6717be8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unassigned is the way to go, yes. All recipe updates =
(or failed attempts to do so) are nowadays posted here, so they can be pick=
ed up by anyone interested.</div><div><br></div><div>Thanks for your work (=
of the highest quality), and totally understandable that you don&#39;t want=
 to spend time on something you do not use.</div><div><br></div><div>Alex<b=
r></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, 14 Dec 2020 at 20:07, Tanu Kaskinen &lt;<a href=3D"mail=
to:tanuk@iki.fi">tanuk@iki.fi</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello,<br>
<br>
I haven&#39;t lately had time to do OE work, or maybe the lack of time is<=
br>
more rooted in lack of motivation since I don&#39;t objectively have a ver=
y<br>
busy life, but in any case, I think it&#39;s time for me to step down as a=
<br>
recipe maintainer. When in 2015 I transitioned from being paid for the<br>
work to a volunteer, I had plans to use OE in hobby projects, but those<br=
>
projects haven&#39;t materialized, so I don&#39;t really have any connecti=
on to<br>
OE other than being a recipe maintainer. My experience of the community<br=
>
has been very positive, it has always been nice to work with you, thank<br=
>
you for that!<br>
<br>
Should I post a maintainers.inc patch that changes all my recipes to to<br=
>
unassigned, or should they or some of them be directly transferred to<br>
someone else?<br>
<br>
I will still post some patches for pulseaudio that convert the recipe<br>
from autotools to meson. I&#39;ve had them ready since the last feature<br=
>
freeze, and I intended to submit them today, but I found out (as I read<br=
>
the mailing list for the first time in three months) that the recipe<br>
has had a major version update, so I&#39;ll have to redo some tests first.=
<br>
<br>
-- <br>
Tanu<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000094426705b6717be8--
