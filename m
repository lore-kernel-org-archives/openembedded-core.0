Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web08.1717.1610067416855753547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 16:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=lX9TvR4a;
 spf=pass (domain: google.com, ip: 209.85.166.181, mailfrom: gmouse@google.com)
Received: by mail-il1-f181.google.com with SMTP id q1so8659880ilt.6
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 16:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vqpQmD3QcagRdntWsdPfVjXOkqj6oqvkf92Cq4c+ogs=;
        b=lX9TvR4aPg0W5kg6KYxqWn6OC+N7ix8fIKWxeHRM2EH/lJfxMKTQbrwlk2viFnoI2I
         SNFn70+pTG612zbi1u94awIAHUM/oV7fgseqTMBGeF291yKOGolWZZGXRPlDMVGNqfNA
         +mh9bpqrJRGHZwrE+NZaMMtYjA5yziw1ulnq7tO4s0CePRlu3wJMqnRJazxUoqxi3Spj
         spI3OwyOU9ZB6LG2A5HJ+pDrUXm5/bDU6RdnP/6pl1m1yKk3ljokMME86y3nmHVmN25r
         Ssl6YLJPDq6+QzKHUbk15ZXelWbPsxUFdpzNYrWfk4YMVRgZGmAU5Kb2ZzleU8oh5imr
         bwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vqpQmD3QcagRdntWsdPfVjXOkqj6oqvkf92Cq4c+ogs=;
        b=PMX1jiMv7f9w0sqw7fuZoDPmYofypo/DTuSP5gofMFClM/iDtkvBRrPXLYzBObNUKz
         vBsmTYCAXiNMpFew9jabNBtcAjNg6ptlF87/Nh/3HpDaEsn4H2suw1qxYSZHtVUR7boU
         9hNBK9psgdYNny69+gNe5RlZrMdfoSmqhr9N3a3utKNSHxZ33PGLoOglBi8ueM3wfDlO
         iWp76NHC+eKAV48TnzOvO8qJELY04pwUS9H7EbqcW6BgiRHM30BaBmwvdskdbYHVT1X3
         srD+EFfpZ4E0yl0HAzzJi/Bi8+TbeRYS7knvyjwCecTNg58flk2hQTCAfPernFOpQPbL
         kUug==
X-Gm-Message-State: AOAM531DIJeMUcyoQZr2KqmUP0bQwYnZUf7IC4RKjysAeaZAZcVm6O+T
	J8gsL8lAfzlc7lHqXmWujrdFyJHWgr4JQjbQI13FBg==
X-Google-Smtp-Source: ABdhPJyHQoUBuHN6p5nkEG9GdWap6eIadro666x88UUfUHtkmrAlPk3W2M0UaG85ehTDVKptjceGn7XqRPJgYq59h5M=
X-Received: by 2002:a92:c50d:: with SMTP id r13mr1490930ilg.160.1610067416049;
 Thu, 07 Jan 2021 16:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20210107215121.3901938-1-gmouse@google.com> <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com> <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
In-Reply-To: <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
From: "Anton Kachalov" <rnouse@google.com>
Date: Fri, 8 Jan 2021 01:56:44 +0100
Message-ID: <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006634f205b859089d"

--0000000000006634f205b859089d
Content-Type: text/plain; charset="UTF-8"

Hello, Richard.

Yes, for various reasons we can not move out from /usr/local.
Before the change it works smoothly and we didn't notice about any kind of
performance issues.
May be we can explicitly add various standard subdirs under /usr excluding
/usr/local?


On Thu, Jan 7, 2021, 23:16 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-01-07 at 22:58 +0100, Anton Kachalov via
> lists.openembedded.org wrote:
> > Allow the Yocto's building tree to be placed under /usr.
> >
> > Relevant issue: https://github.com/openbmc/openbmc/issues/3724
> >
> > Signed-off-by: Anton D. Kachalov <rnouse@google.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Do you really need to build under /usr? We probably should make this
> more of a hard error if someone attempts it. I commented on the issue,
> could you just remove this from PSEUDO_IGNORE_PATHS locally if you
> really have to use /usr?
>
> Cheers,
>
> Richard
>
>

--0000000000006634f205b859089d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello, Richard.<div dir=3D"auto"><br></div><div dir=3D"au=
to">Yes, for various reasons we can not move out from /usr/local.</div><div=
 dir=3D"auto">Before the change it works smoothly and we didn&#39;t notice =
about any kind of performance issues.</div><div dir=3D"auto">May be we can =
explicitly add various standard subdirs under /usr excluding /usr/local?</d=
iv><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 7, 2021, 23:16 Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Thu, 2021-01-07 at 22:58 +0100, Anton Kacha=
lov via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer norefer=
rer noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; Allow the Yocto&#39;s building tree to be placed under /usr.<br>
&gt; <br>
&gt; Relevant issue: <a href=3D"https://github.com/openbmc/openbmc/issues/3=
724" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
https://github.com/openbmc/openbmc/issues/3724</a><br>
&gt; <br>
&gt; Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:rnouse@google.c=
om" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">rnouse@googl=
e.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/conf/bitbake.conf | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
Do you really need to build under /usr? We probably should make this<br>
more of a hard error if someone attempts it. I commented on the issue,<br>
could you just remove this from PSEUDO_IGNORE_PATHS locally if you<br>
really have to use /usr?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000006634f205b859089d--
