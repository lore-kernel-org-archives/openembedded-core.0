Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.1447.1610046614155710043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 11:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ddtrm95Y;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id e15so4241125vsa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 11:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwWWmuOM3U/dUAWiunhgpvj7G0/U81LHp7B+KQ0/dws=;
        b=Ddtrm95YoZ2ks9tVPfk11YnAsgOeT13wZlhtdHCRCNlY5NvRfhO6TKc6hbBb61vGIi
         d4fmCFC7kt05CmsdENW3A/iO98sBCjSpMUYoLebdf20cOakqJdJ6atMZK6a+0XXQ/XwR
         IjpEgnHtPY5HiMg1FX6bVB9FMuKrcmoM/qYQG2QZSq64/9j/uPFym/gnoUaWO+eO0JTR
         vhjR1WlqMFqrgddGuZbEEIXwxbGMJ6nfGWHmUO1IDrLrRFL/pgFzWQTri71UnMno7jIg
         l7KPZdp6IcVNEYoA5XJ12LkY8WlgzcBjY6dTSrfjnCsn3PiOfUcefnKuMkuTxSm7kGA+
         1nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwWWmuOM3U/dUAWiunhgpvj7G0/U81LHp7B+KQ0/dws=;
        b=LB0ygcb0iMsATwWNQ8tFUqpQmpl3ewKsXL2FoXc6eHHD/z4VSIj7gL1kdOEyrk39Kh
         ThiC5WVk5phJw3EXvsUtYhrywaic20U2K8ZN4Gya3HvmSuG9EmSx2FwKPJmgkBSvaEEN
         GdL8S+QGrIIqgGaKxBT98KDi5K/36dVVDtQgxeWGiauEul03/w2oVA4nbh2r1F4uE7Rp
         g+HytN8o5eLbRu9EDJwNCESEfPViXcXqIebhgpHHpK/NuxyeCyuyGII7hmKh1iOlRGEk
         4xHz5rVPM8c+V1SLMJ5k81gl0ceZOexcTlrAIl7p8pv5QLDSqjxm/b8hNUucBA7xKSXD
         /A4g==
X-Gm-Message-State: AOAM533HI+LB7sPcF/GId4rpJA7bNO8rg1XLpkFQsrmxADdTPOP8CIMI
	smDBUtqdH888IQFnAm+QT3sOcPtPQFZ9bhsp/34=
X-Google-Smtp-Source: ABdhPJzmtYeofDt5i/dB30jkyy9Qt/NmtBbU/ilJAwXXgaTJST6fA/0o4mkWiUHG3nws33I8QdNpg9c5zrk8MUVV/fo=
X-Received: by 2002:a67:6044:: with SMTP id u65mr46138vsb.31.1610046613363;
 Thu, 07 Jan 2021 11:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
 <20201228200436.78130-13-alex.kanavin@gmail.com> <1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org>
 <a75c31fd-9617-1bc0-e895-ac40802245ce@gmail.com> <CAP9ODKp_PCYwf8ghCVRCAPVr20i7AfGECSee5WwHi+VhpUKofQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp_PCYwf8ghCVRCAPVr20i7AfGECSee5WwHi+VhpUKofQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 7 Jan 2021 20:10:02 +0100
Message-ID: <CANNYZj-W87enzshoY_3stbyJ+VZUur51dfF1stMRhJQmNcC_xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/22] bash: update 5.0 -> 5.1
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Joshua Watt <JPEWhacker@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000076223c05b8543007"

--00000000000076223c05b8543007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Jan 2021 at 20:07, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Em qui., 7 de jan. de 2021 =C3=A0s 15:43, Joshua Watt
> <JPEWhacker@gmail.com> escreveu:
> > On 1/7/21 11:57 AM, Richard Purdie wrote:
> > bash 5.1 hasn't merged yet and is in master-next.
>
> Also, 4 patchlevel fixes are available[1]. Might be good to apply them as
> well.
>
> 1. https://ftp.gnu.org/gnu/bash/bash-5.1-patches/
>

:) already taken care of.

Alex

--00000000000076223c05b8543007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 7 Jan 2021 at 20:07, Otavio Salvador &lt;<a href=3D"mailto:o=
tavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Em qui., 7=
 de jan. de 2021 =C3=A0s 15:43, Joshua Watt<br>
&lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gm=
ail.com</a>&gt; escreveu:<br>
&gt; On 1/7/21 11:57 AM, Richard Purdie wrote:<br>
&gt; bash 5.1 hasn&#39;t merged yet and is in master-next.<br>
<br>
Also, 4 patchlevel fixes are available[1]. Might be good to apply them as w=
ell.<br>
<br>
1. <a href=3D"https://ftp.gnu.org/gnu/bash/bash-5.1-patches/" rel=3D"norefe=
rrer" target=3D"_blank">https://ftp.gnu.org/gnu/bash/bash-5.1-patches/</a><=
br></blockquote><div><br></div><div>:) already taken care of.<br></div><div=
><br></div><div>Alex<br></div></div></div>

--00000000000076223c05b8543007--
