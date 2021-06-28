Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.995.1624916426820577967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 14:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmwWHhJ4;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id f20so13833899qtk.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n1P+D3mXoahZiT2Ju2yWKbZVguSgfG05JCO8FwXFbIQ=;
        b=lmwWHhJ4haHJ3uKcfFT8uTo7WM042dQ5YxiH3vzbYwWXoymXdSzBvg3xTyvjYOIyT0
         ERRuzw0TnKNgzFbMiLznCJMW3G4GoY5o/tq9ksuOSEoa6S0/6snbyyZq1d6PAeC2iVyJ
         /H51wQXcKGHs7rt6FFhX6OIwADMSPS9lVvVG6VHt0XbuofQY5Yj22cDTc1fOolUJngZk
         Gq9K+CNfQFqvlow6Jw5kyUTKLanXAqFR4NY5Yp3w0buxFFahMD0EY718n5n2RbsGSfKx
         dZs86ac57618GBDBgKMRQdaL811FyyX6Q4G0jzl0xvvIFU4ykcXxjAkj593hgj2cj5cZ
         k2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n1P+D3mXoahZiT2Ju2yWKbZVguSgfG05JCO8FwXFbIQ=;
        b=Kw5GlEdG9bpvaSOV0pZjHYHT0dLJqvwz0l7L9MBpNYbyWy7/2sHbo3mUz7398w5qv0
         gU1pdxbVhi7wFvfTsKAUvoAhjaw7tKt5Y1Oh2RnRexL15co0qtWU2N9BiA+2HKdEKkho
         4PYZBjyk9tYzv8t5/11woPpbOSpKIXZbKD/91Z9jI9bq8WM7PVvMaDchuOZ8ugKwm+lT
         S+ON4hQfC6AD6d9vuiqgnisHI2iH5f4n51VrX5J9pIJ9KkFdFF03/uJ72dpyhhSmnRYK
         aoHKzJHngBB5wvEXgf4ejjaTU/BeRjN1VjoKqx417JzZ47DUgWrP8NbQmGKC8dwS9wBk
         Ge6w==
X-Gm-Message-State: AOAM531h4CaGitjfhsuRBnmWks/7MtOAoUiuiSKYzJXwS2PeEQix+Z4S
	083XAnGfXLC7Ftfpr+b808B/v93au4NshxRAkTQ=
X-Google-Smtp-Source: ABdhPJyDWB4oIi+xYWH5Q8eYpouzYP86oKdQ2bF1L41ccnhLzD5DIqLIne8vWWA+edkql/a3HvHlbQm5xNTojoAu1BU=
X-Received: by 2002:ac8:5716:: with SMTP id 22mr23415923qtw.82.1624916425915;
 Mon, 28 Jun 2021 14:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com> <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
 <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com> <20210628191055.GF5525@pbcl.net>
 <CAMKF1sr1mXehpm31m_ByS8ytGmQ--Zf42qst+SqPQK1w53f_Sw@mail.gmail.com>
 <20210628195238.GG5525@pbcl.net> <f66a6a00-1a98-f8dd-e5d0-2c445147d5a7@gmail.com>
 <20210628212107.GH5525@pbcl.net>
In-Reply-To: <20210628212107.GH5525@pbcl.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Jun 2021 14:40:14 -0700
Message-ID: <CAMKF1sp7ewaMNko1AXo_md_ccAPLNXD5eknzuFiyu0JFSXSYtQ@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Phil Blundell <pb@pbcl.net>
Cc: Andrea Adami <andrea.adami@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b425105c5da562d"

--0000000000005b425105c5da562d
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 2:21 PM Phil Blundell <pb@pbcl.net> wrote:

> On Mon, Jun 28, 2021 at 02:10:39PM -0700, Khem Raj wrote:
> > well, if we can beat the compiler to not complain about using neon on a
> > non-neon system then yes, but changing float ABI to make compiler happy
> > seems a bit iffy, since compiler will generate code expecting VFP and
> that
> > could trip the system.
>
> Right, that's a separate issue.  I'm not 100% clear what you mean by "trip
> the system" but I think it's probably reasonable to say that no ABI ought
> to be changing here.  I think that's orthogonal, though, to the question of
> whether Meson ought to be detecting NEON at compile time.


Yes they are orthogonal although both are needed for what Andrea is looking
for

>
>
> p.
>
>

--0000000000005b425105c5da562d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 28, 2021 at 2:21 PM Phil Blundell &lt;<a href=
=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Mon, Jun 28, 2021 at 02:10:39PM -0700, Khem Raj wrote:<b=
r>
&gt; well, if we can beat the compiler to not complain about using neon on =
a<br>
&gt; non-neon system then yes, but changing float ABI to make compiler happ=
y<br>
&gt; seems a bit iffy, since compiler will generate code expecting VFP and =
that<br>
&gt; could trip the system.<br>
<br>
Right, that&#39;s a separate issue.=C2=A0 I&#39;m not 100% clear what you m=
ean by &quot;trip<br>
the system&quot; but I think it&#39;s probably reasonable to say that no AB=
I ought<br>
to be changing here.=C2=A0 I think that&#39;s orthogonal, though, to the qu=
estion of<br>
whether Meson ought to be detecting NEON at compile time.</blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">Yes they are orthogonal although b=
oth are needed for what Andrea is looking for=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
<br>
p.<br>
<br>
</blockquote></div></div>

--0000000000005b425105c5da562d--
