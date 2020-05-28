Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.3587.1590628737315702449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 18:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZzatMnyi;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id 18so26058341iln.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 18:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/2O9QQkp1u18M+sgn06G8ISEE9qaHWJ9nmb3tgMmiQ=;
        b=ZzatMnyi74G9d5jajyfIaBgJIl5DCQAK5PpTMjm2bp1BO4ZBlvSW+hzBe7v9mueoPu
         MT8DCHqwJxrDxnY19T4vi13sQvelp0D7cPX6DvyH5uX2gKoZTESWz+WMaTqj8SvqmWBo
         C2QQl7CgEes9k5o44tWYdiTGrdSCt7n6O0H6Bf22qGp0kcrmUuj4yjfWY+xP5gpUJKer
         HT+03olJV1O4K9gzGF5O5TU4rmtjcCYNOqTBykJjk6plSrSb4rOYwWc+c07Y29j7itBI
         LOHFyMIPXAcEkQNp3Pofh1Yp475/8RMfc8PPFVLAKU1/NIrNtkWDXOyj3VU45XCcPY21
         3BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/2O9QQkp1u18M+sgn06G8ISEE9qaHWJ9nmb3tgMmiQ=;
        b=fClnvl9CxPk5C1K5dUrjBEOCwUFKN3m4nf50sHhysp4lcf7GiBVlwA5kjBu6acleVU
         rfF8EbFzuSaj2j2637b5Z+bRuqoOMIH3HHR4ODMTFQpLmXDfLZNXLUGM33thtsUbeq/j
         mVGtnwjgPjijUSeofjwOrRV2hKZ1hTM3lGAMb9/dXKFD05aPNlAlBx0xC+C/9lrZAXkL
         o/x24T8C75tnvAoMoDZMp0UxM/qfTLhuebuoKAd8gFRo6dWRXM7fHMan4f0QYdpGU9tx
         xEj5D6EEqMEvEVUAHY/MvnqE2H4ycNqm8Y+DLzUOigLlzbiv4VPLIpJK6bypOXkNoB7I
         nHpg==
X-Gm-Message-State: AOAM530rIic3K58B/Vb5Rbegl0QahFez0y+oQ5NgLEoKCnJRsiQ3fUU3
	3ynfIS1tX5oPpOaPqJdO2qwqx+EjevJkkBxZp5o=
X-Google-Smtp-Source: ABdhPJyoXn+wIf/6AeZrhYDuPt0HJ6vX/UTnIy0CxDbD194geMD1eL8CprkSySPR+8F4nA2fUiW3/4bFzaGKCoO/RBg=
X-Received: by 2002:a92:7787:: with SMTP id s129mr844103ilc.297.1590628736620;
 Wed, 27 May 2020 18:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200526051216.14143-1-maxime.roussinbelanger@gmail.com> <b575e6f22a31a360687917d88ba1af929b7c9ab6.camel@linuxfoundation.org>
In-Reply-To: <b575e6f22a31a360687917d88ba1af929b7c9ab6.camel@linuxfoundation.org>
From: =?UTF-8?B?TWF4aW1lIFJvdXNzaW4tQsOpbGFuZ2Vy?= <maxime.roussinbelanger@gmail.com>
Date: Wed, 27 May 2020 21:18:31 -0400
Message-ID: <CAE=T-s4HBUhKGa7SjEeCPNe=ZXVdz_x8tWxmndtU3RUopyt3uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-pathtools: add a recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d0de0305a6ab1ca6"

--000000000000d0de0305a6ab1ca6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Wed, May 27, 2020 at 5:49 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-05-26 at 01:12 -0400, Maxime Roussin-B=C3=A9langer wrote:
> > Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gma=
il.com
>
> > ---
> >  .../python/python3-pathtools_0.1.2.bb               | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/
python3-pathtools_0.1.2.bb
>
> Should these be in OE-Core or meta-python?

I'm always confused by OE-Core, Poky and meta-oe.


I think when you are referring to meta-python you mean the sub-directory
inside meta-oe.
meta-oe might be a better place for them.


Thanks,
Max.

>
> Cheers,
>
> Richard

--000000000000d0de0305a6ab1ca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello!<br><br>On Wed, May 27, 2020 at 5:49 AM Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br>&gt;<br>&gt; On Tue, 2020-05-26 at 0=
1:12 -0400, Maxime Roussin-B=C3=A9langer wrote:<br>&gt; &gt; Signed-off-by:=
 Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.roussinbelanger@=
gmail.com">maxime.roussinbelanger@gmail.com</a>&gt;<br>&gt; &gt; ---<br>&gt=
; &gt; =C2=A0.../python/<a href=3D"http://python3-pathtools_0.1.2.bb">pytho=
n3-pathtools_0.1.2.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 13 +++++++++++++<br>&gt; &gt; =C2=A01 file changed, 13 insertions(+)<br>&=
gt; &gt; =C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"h=
ttp://python3-pathtools_0.1.2.bb">python3-pathtools_0.1.2.bb</a><br>&gt;<br=
>&gt; Should these be in OE-Core or meta-python?<div><br></div><div>I&#39;m=
 always confused by OE-Core, Poky and meta-oe.</div><div><br></div><div><br=
></div><div>I think when you are referring=C2=A0to meta-python you mean the=
 sub-directory inside meta-oe.</div><div>meta-oe might be a better place fo=
r them.</div><div><br></div><div><br></div><div>Thanks,</div><div>Max.</div=
><div><br>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; Richard</div></div>

--000000000000d0de0305a6ab1ca6--
