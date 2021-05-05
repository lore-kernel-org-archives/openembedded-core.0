Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.2391.1620245439684204977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 13:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bnjhfqme;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id g24so957452uak.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 13:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6WuQcSgrLQFlFcwKbrgrbk3LE9DCe1R1VFm9LrI46EQ=;
        b=bnjhfqmec5ko/R75R6mg/RwOBF/idIqVnTMR0RB8zaPikqMSmimSp/NeJDk81q49UP
         6c7CoJGNDzgjNsBVzxk0E3eXYLC2XgGYfGch4c16Y/UzLcpdXpNsQ9sVxWJ26vwXybiQ
         lD+cga5zzgYQXJMczcCrtFs0n2fkts2wGwD8JfAnz7QFMnDrbgiFiPSAz9MV/9vuqiWG
         Ugy/N6DJR7nbkYVnR6BNboE3aHMIWQeg0mkpegd54GyZOlv1iv5vjpln7EwITQZq6zNO
         cN2+vKlGVuT7JAxkMDFic9QFc2l4AOialY5NRdooyUGQNhdixiloXEqWgMd+rRTpYCoh
         rhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WuQcSgrLQFlFcwKbrgrbk3LE9DCe1R1VFm9LrI46EQ=;
        b=Ysvt6XCwlhx0R2QHDePg7yn5RlMt9Z5YT3KFqJMKkfySa40dQ62YqQN4ybXGoHxVI9
         rgukb7TfVpqawK/hkkcMZ/ok6O0WXJxt+xym25Ak0ZcvfEypgBH6jjViCngwjt+BxdDU
         Ary1Wx8lUBrhr6EaVyt7Jy2oPFpp1hnRaRsnnpM8RjYfxEjknmZklDjUgWdzn6JDRaBu
         8UUXCtIRz3kgMmnCd21dX4MNLgPXXnAWS/mKud45YciRbphl5cal5CXLYAn8eChCAJrD
         zQ9siJly1kdvS96yvyDVda17EGV+89l4DA+itiGMGfzm3PHnOp9v6miFTkfpvGnDzDwy
         eoiw==
X-Gm-Message-State: AOAM532x8I6mLi2DLp42FJM7uqoLkQWhRYSJZMTHNnUEZkTtEMR1AL7L
	AbksGBzXFZsMPUURh94XMU797fMup3uEUmu+gWs=
X-Google-Smtp-Source: ABdhPJyVLhdZk6slxmuAxmYeNqmuvJox0GUf3Cxqrzv+TuNqLN6YSGLzSIiIgary5XzInbzp/rkWe6TDf2RBt7afrBk=
X-Received: by 2002:ab0:310a:: with SMTP id e10mr903294ual.93.1620245438897;
 Wed, 05 May 2021 13:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com> <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
 <CANNYZj8VfB5sO4O3tjpUDHseBTMwYG-kRGwVUERmAjJSH61=oA@mail.gmail.com>
 <AM9PR09MB464224482626504F72484641A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj9M5Gy34YJacwpYLvbyBREpAdPT5_uszJs5p=LnPXyLHg@mail.gmail.com> <AM9PR09MB46420A8B633050319875E0C8A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB46420A8B633050319875E0C8A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 22:10:27 +0200
Message-ID: <CANNYZj--syg752mKKJVTqhPmo70viw0fEwJVB08GuXRuwbyZ5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d5a34405c19ac918"

--000000000000d5a34405c19ac918
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 21:25, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Agree - looking at
> https://github.com/leohemsted/smartypants.py/compare/v2.0.0...master
> there isn't much of a functional change either.
>
> The status of typogrify isn't also not very convincing - changes from
> 2014 till today haven't been released - so it might be worth a shot to
> open a ticket at gi-docgen and ask about the need for this
> outdated/likely unmaintained dependency
>

This
https://github.com/mintchaos/typogrify/commit/dda5baed03b7948fe101b0c691aaf330157d7f94
is recent enough that I don't think that is necessary yet. Let's see what
they say about smartypants.

Alex

--000000000000d5a34405c19ac918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 21:25, Konrad Weihmann &lt;<a href=3D"mailto:k=
weihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Agree - looking at <br>
<a href=3D"https://github.com/leohemsted/smartypants.py/compare/v2.0.0...ma=
ster" rel=3D"noreferrer" target=3D"_blank">https://github.com/leohemsted/sm=
artypants.py/compare/v2.0.0...master</a> <br>
there isn&#39;t much of a functional change either.<br>
<br>
The status of typogrify isn&#39;t also not very convincing - changes from <=
br>
2014 till today haven&#39;t been released - so it might be worth a shot to =
<br>
open a ticket at gi-docgen and ask about the need for this <br>
outdated/likely unmaintained dependency<br></blockquote><div><br></div><div=
>This</div><div><a href=3D"https://github.com/mintchaos/typogrify/commit/dd=
a5baed03b7948fe101b0c691aaf330157d7f94">https://github.com/mintchaos/typogr=
ify/commit/dda5baed03b7948fe101b0c691aaf330157d7f94</a></div><div>is recent=
 enough that I don&#39;t think that is necessary yet. Let&#39;s see what th=
ey say about smartypants.<br></div><div><br></div><div>Alex<br> </div></div=
></div>

--000000000000d5a34405c19ac918--
