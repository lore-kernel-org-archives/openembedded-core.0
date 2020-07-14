Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.15647.1594715746346421458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 01:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uRyPLd+H;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id j186so8087888vsd.10
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8OkyDOmZbhU/utWM+t8QS49Y5V7VLaZZt68EoLqBFY=;
        b=uRyPLd+Hj4TRum9JlKSEoU4OxF1Ra55+uoP3bmz12CBZL8mX42S1IO+wunmOex5/5k
         d/5xZP4KQi4p491bUQIx1ji/yLuPNLxqJyGa1pK8Pz7ztgKC39PCYrFO/C9V9f8Rd7rf
         j5qaXCc5OBwUrxNEqY6ui884ex7Uv8iQrXtr7KTU1cEOatftdm+3XDQdXAVSz/pe+8Dx
         dxTf+AzvORvgKVWwXvd9MF5aXOcQVvqjKppJP8L2NjRya4BLHua1QClMOu++KZKC5FVp
         pYc16WhZ9+Q4y3tGgICH85lhWjZts4qzfEgzTD+QXxXX/WbYarzr1MX5gotckYC+0rFy
         P/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8OkyDOmZbhU/utWM+t8QS49Y5V7VLaZZt68EoLqBFY=;
        b=r7zPnO6+nB0c6PBkH4kzX5HVWM7bUA769src7BFeTgtxblhbPrmhDA+HlAgkqawRhd
         7sZ7EyGOrhaWPdzPd/7xCzsOsZp2cN5cFmkiGEKp4hDalBI27eBmATqtnfi5lWXM48xW
         wfsHW5feLcNyEUD/0jFa+jBEl7OjRZkWqlGz22G7Edb4QhLtGkiQ/a0iFTHvXMRx0aHl
         ayY7rZWdchuGUd4w1ywWe0LW/RfxNfKd3mGX0/mleH/hT145Ctow7tF9lmNOSZJGjUqW
         dCsS/u0V0CQEc4/LS5Mm5y6ihRTUhEvt2p5Z7qOmXDoKbPhmY8W3sfEb9guK42ZfQMtL
         G7Mg==
X-Gm-Message-State: AOAM533l1IRatP+/a6fjCbWpQVySNntmyghGQWcqIIp6J2tQkW+s9S+T
	mAyta3CudQEYx49dAm5VJ/GVbdrCf2VOX6SJRCk=
X-Google-Smtp-Source: ABdhPJxsSADBZSv+z6mYwYw9dx+dhCV1Rrv+oRU7pLxY5JmYcGs6Jv+LOPbbEBDthZ/G3s8C1eZjdr6x1w38Q18So3I=
X-Received: by 2002:a67:2d8d:: with SMTP id t135mr2520371vst.23.1594715745578;
 Tue, 14 Jul 2020 01:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200710190810.1967868-1-takondra@cisco.com> <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
 <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
 <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com>
 <ebe4c112aa8fcd03e5b6a5bea8b33b0e6c5dc5c8.camel@cisco.com>
 <CANNYZj-7w-JCgXmtmPVc0RhO6vcfGDHAY=qV6sQv1dkU3dpB5w@mail.gmail.com> <b22431239872ad61559edd53514b9be488fbfce5.camel@cisco.com>
In-Reply-To: <b22431239872ad61559edd53514b9be488fbfce5.camel@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 14 Jul 2020 10:35:13 +0200
Message-ID: <CANNYZj_gBwUh0E1YerW+RRUptFi+-TPn=jzFEfyMOPxA=dxKpA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"chris_larson@mentor.com" <chris_larson@mentor.com>, "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="00000000000088742e05aa62b1fe"

--00000000000088742e05aa62b1fe
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2020 at 03:47, Taras Kondratiuk (takondra) <
takondra@cisco.com> wrote:

> 2. If a recipe needs python3-native only, then it inherits
> python3native which exports _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata.
> This doesn't work, because python3-native will fail to
> find _sysconfigdata.py in recipe-sysroot (because there is no python3
> in DEPENDS). As a workaround several recipes started to unset
> _PYTHON_SYSCONFIGDATA_NAME (glib [1], mesa [2], scons class [3]).
>

This is not the case. There are plenty of recipes which inherit
python3native, and do not need to unset anything.
The reason glib or mesa have to do it is that they use meson build system
to find the python3 binary (only to run
some scripts; target configuration is not used), and meson always probes
into target config, even when that config is
simply thrown away. Adding target python3 to DEPENDS is undesirable as that
will lengthen the build dependency chain
without any actual need for the target python3.

Chris' approach [6] would address case #3, but not #2. I'm not sure yet
> what is the best way to address #2. Maybe export
> _PYTHON_SYSCONFIGDATA_NAME only if DEPENDS has python3?
>

I am not sure either. I do not have a clear idea how to sort this mess.
Maybe we should talk to python upstream and ask
how cross-compilation is supposed to work.

Alex

--00000000000088742e05aa62b1fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 14 Jul 2020 at 03:47, Taras Kondr=
atiuk (takondra) &lt;<a href=3D"mailto:takondra@cisco.com">takondra@cisco.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
2. If a recipe needs python3-native only, then it inherits<br>
python3native which exports _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata.<br=
>
This doesn&#39;t work, because python3-native will fail to<br>
find _sysconfigdata.py in recipe-sysroot (because there is no python3<br>
in DEPENDS). As a workaround several recipes started to unset<br>
_PYTHON_SYSCONFIGDATA_NAME (glib [1], mesa [2], scons class [3]).<br></bloc=
kquote><div><br></div><div>This is not the case. There are plenty of recipe=
s which inherit python3native, and do not need to unset anything.</div><div=
>The reason glib or mesa have to do it is that they use meson build system =
to find the python3 binary (only to run</div><div>some scripts; target conf=
iguration is not used), and meson always probes into target config, even wh=
en that config is</div><div>simply thrown away. Adding target python3 to DE=
PENDS is undesirable as that will lengthen the build dependency chain</div>=
<div>without any actual need for the target python3.<br></div><br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Chris&#39; approach [6] would address case #3, but not #2. I&#39;m not sure=
 yet<br>
what is the best way to address #2. Maybe export<br>
_PYTHON_SYSCONFIGDATA_NAME only if DEPENDS has python3?<br></blockquote><di=
v><br></div><div>I am not sure either. I do not have a clear idea how to so=
rt this mess. Maybe we should talk to python upstream and ask</div><div>how=
 cross-compilation is supposed to work.<br></div><div>=C2=A0</div><div>Alex=
<br></div></div></div>

--00000000000088742e05aa62b1fe--
