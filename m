Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.1941.1614539334575369942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GhaSt8mZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id c44so4885581uad.12
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HfI2TCWp0541j6By2SMmfUmw2xHpqjr1djX4H+ao6cU=;
        b=GhaSt8mZDGY56LxgH/IrCJRa/Bu3GDNnQM28VQ/havEk6fwE9gm/CzZAmYpNUJ29IQ
         vpLlIrZe+EazGGWzoN7BQSmf6j/Cuda/ntLDL2JHmpw+Oe736z9whh0F4gaEdpFMZ8vs
         sTwD84s1jwxQdIiFywfty6XWfemr0AhLapWl1KrF+GRIRGoxMOn4Xft+D9GG8W/4eQ2A
         tLt1ERwxAm2Bo1MlqHJ+62OWR4Q8rJrJGk2qgwigFdH+bmf2E/4ErBJno5Mhq9CcsD19
         7x0aDMRh/gysOXFNMgZXKAewWnQnGvgm+XY7+cjUkpLugA21/STA4e21qaL6SCEnVuYp
         J+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HfI2TCWp0541j6By2SMmfUmw2xHpqjr1djX4H+ao6cU=;
        b=H3GpqhNAXhIIxdy0BYnB/RhU+R/cpQpVmzLfh6J2/QDNu4YCc5ozCUQ2drnrzhgWqj
         dVokPLB4eXM4nR+opDhd4Mw2mYnSoOZR2mIu6CMxYE2710XQIRBH9GusMfEB1mLtTjCr
         FrMNeiuoe14GIUcvbmAFvqJ7ryLN04pDrw9p+ae8DwMp5raVKWlyMUua7XJCCvG+6vB0
         jLdoA3Xo5SaUHl63GjwqjvwD1tN4klA7INxs4an6ttle2VYh9gLXBjzHvPmCxoVbKBsR
         JHeU31AroKhEz4Atb6FCK1uUgUJlNmGDHs8YXcO7UetpVS4L65iClwP9Vb6QUBHsLHsB
         HPCg==
X-Gm-Message-State: AOAM532JI0hz3TyLz40PX5IOxNHaiXID/8I9BZ68IOHchC6g1Kx9MHIO
	ntEJJ2y3yhc1XbLrQq/xjDxzbHVltkZ1pcnYAmw=
X-Google-Smtp-Source: ABdhPJxb07VS8/l7TNFaOs6xCU43PqXYyyBXK+VaYDEQ4+Gdce1cpBej78sEy9Pgcm4tnuP4OOZQiTZHfRDY+dN4ntM=
X-Received: by 2002:a9f:2c0f:: with SMTP id r15mr7049131uaj.93.1614539333594;
 Sun, 28 Feb 2021 11:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-2-alex.kanavin@gmail.com> <23dd5c64-4658-f00b-1775-46de9674a4d5@gmail.com>
In-Reply-To: <23dd5c64-4658-f00b-1775-46de9674a4d5@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Feb 2021 20:08:42 +0100
Message-ID: <CANNYZj8F9j_EEr=Ak0aACDpnpbu8t74haFkjJNRKLtoAbaV0SQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/24] bmap-tools: upgrade 3.5 -> 3.6
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000074731505bc6a3b99"

--00000000000074731505bc6a3b99
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Feb 2021 at 19:35, Khem Raj <raj.khem@gmail.com> wrote:

>
> > -RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
> python3-setuptools python3-fcntl python3-six"
> > +RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
> python3-setuptools python3-fcntl python3-six coreutils"
>
> what needs coreutils at runtime ? and which utilities
>

df, introduced here:
https://github.com/intel/bmap-tools/commit/f1cd6ec8ef29beb556f1b725aaf6916ba29a61fe

Alex

--00000000000074731505bc6a3b99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 28 Feb 2021 at 19:35, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0 <br>
&gt; -RDEPENDS_${PN} =3D &quot;python3-core python3-compression python3-mma=
p python3-setuptools python3-fcntl python3-six&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;python3-core python3-compression python3-mma=
p python3-setuptools python3-fcntl python3-six coreutils&quot;<br>
<br>
what needs coreutils at runtime ? and which utilities<br></blockquote><div>=
<br></div><div>df, introduced here: <a href=3D"https://github.com/intel/bma=
p-tools/commit/f1cd6ec8ef29beb556f1b725aaf6916ba29a61fe">https://github.com=
/intel/bmap-tools/commit/f1cd6ec8ef29beb556f1b725aaf6916ba29a61fe</a></div>=
<div><br></div><div>Alex<br> </div></div></div>

--00000000000074731505bc6a3b99--
