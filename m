Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.475.1620253307639494949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RyVMUilI;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id t4so5334809ejo.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1SpHDRZj+PMj2r4byjGc9f/u4ZdIFJNllQIEw5ZAuko=;
        b=RyVMUilI7aI/tXlgkrOLyXLzOu4pOsx12KwPdtCbWxHUuvbpxiSWUXMBOob1Qcd4bq
         1sJ+Kd8ko7+gNEkLmTJwneJiGvHAwAWWIamMfAU0GHUjPMgSZ1nOZEAgJ5AUICXxH8GZ
         LaZOipck74Eb4H4U/0gbA/tNQgrv1rjCMQwPwYcqiE0G3N5QOHCBVHqdugw0t0s0z3A+
         iadOGlDVX0bnEivWGhWSVh7rHemAqXMraTb1SxJuL8oy1fx95mNJhPTElqc7pqoUgSjX
         +zPHDji00qOtqiKd2deOUFfDh/2ycb6nLWzhZwPT3TBTyJThplIGWRdW61JtNljDTQ+k
         sAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1SpHDRZj+PMj2r4byjGc9f/u4ZdIFJNllQIEw5ZAuko=;
        b=SPEr10HB8/9HhCYlf/DYaJ02nM2lrk2jMGQ/zX+zQ0pSi+DUPMlABWpUxQlt140xk3
         c/8CXcUkeeWQwK1zJkf6mlTVpmXzwyrnzFauuCVJ3KwTh9JPhWeYLmvPS3bZ0qABT5DK
         PaXcwgFJbkfdWUJtEKJqR1rLkAVBEao7fSSRIHgSMYqLzmKT4R4lKzE44oSBlvc6kcjj
         odPUIGseQXpEbR1WEtxQZe5eaQU0JSAm92rqZZ2yDqXdQfP1i/rZaWy/05+0K2GuRJzL
         UnP9q11FceUmEPA9r4RnY0yI6ALHOFtiSSSiJKxukemu/9pskpANay5X6id1HAlqIdec
         gF0Q==
X-Gm-Message-State: AOAM533+jSvmqF35gEaiSdQPQMW2iaVw46/g6uJGUjWc9Uf6hWxxTyvC
	rebNI86ZpaJKx5cpwICP3SPX29jPvsZv3ci2rQY=
X-Google-Smtp-Source: ABdhPJx5pLauTA6Tl++N17VoCW892lWJ/zoX6NTwEo3A94OrJHScMhDf3wFP+6va48R9moPmSyD2ChrC912MyBlUt28=
X-Received: by 2002:a17:906:53d1:: with SMTP id p17mr961907ejo.470.1620253306095;
 Wed, 05 May 2021 15:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-10-alex.kanavin@gmail.com> <CAMKF1sr=EyGjLS3U0VfujRXsmOGQzuLC56foz-TpFnWnRD5WVg@mail.gmail.com>
 <CAP9ODKon3P5TQn7rKC4ifXePWpE5Rie4z+pO4pxdWPruUn71zQ@mail.gmail.com>
In-Reply-To: <CAP9ODKon3P5TQn7rKC4ifXePWpE5Rie4z+pO4pxdWPruUn71zQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 6 May 2021 00:21:34 +0200
Message-ID: <CA+chaQf4Q23PDeZ2KoFohtgdc-GUXFK=t7NFptxw-jcOJ9z1Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/61] cmake: update 3.19.5 -> 3.20.1
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c18b7905c19c9eae"

--000000000000c18b7905c19c9eae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's actually from 2013, see:
https://github.com/meta-qt5/meta-qt5/commit/671313d0b5e09e0b49a90ed944cd33=
fb3d6457b0

it had couple iterations in meta-qt5 before it was moved to oe-core in:
https://github.com/meta-qt5/meta-qt5/commit/17f240df
http://git.openembedded.org/openembedded-core/commit/?h=3Ddaisy&id=3D4f2de=
e0d8c2c3f60cb8f8021343e973cae31fc50
as bunch of sed calls which were later changed to a .patch in 2018
http://git.openembedded.org/openembedded-core/commit/?id=3D9e58926f1cea9d5=
cb18cb923855d1ae98f88a8ac

Now with RSS this shouldn't be so big issue, that rebuilding cmake-native
after qtbase-native won't suddenly detect Qt support for CMake, but it
should be tested on host with Qt5 installed to make sure it's not detected
from host and stays explicitly disabled (maybe there is a flag for that
nowadays - I didn't check in last 8 years :)).

On Wed, May 5, 2021 at 10:52 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello,
>
> Em qua., 5 de mai. de 2021 =C3=A0s 15:35, Khem Raj <raj.khem@gmail.com>
> escreveu:
> >
> > before we remove it, lets hear a Review from Otavio and perhaps he has
> > better history with this patch
> >
> > On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin <alex.kanavin@gmail.c=
om>
> wrote:
> > >
> > > Remove 0002-cmake-Prevent-the-detection-of-Qt5.patch
> > > (patch purpose and failing scenarios unclear; disabling
> > > is better done through configuration options which
> > > are available for all of these items).
>
> Try build it on a host with Qt to see if it fails. This is what comes
> to my mind. I don't recall the details as it was done in 2018 ...
> gosh, I am getting old.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
>=20
>
>

--000000000000c18b7905c19c9eae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s actually from 2013, see:<div><a href=3D"https://g=
ithub.com/meta-qt5/meta-qt5/commit/671313d0b5e09e0b49a90ed944cd33fb3d6457b0=
">https://github.com/meta-qt5/meta-qt5/commit/671313d0b5e09e0b49a90ed944cd3=
3fb3d6457b0</a><br></div><div><br></div><div>it had couple iterations in me=
ta-qt5 before it was moved to oe-core in:</div><div><a href=3D"https://gith=
ub.com/meta-qt5/meta-qt5/commit/17f240df">https://github.com/meta-qt5/meta-=
qt5/commit/17f240df</a><br></div><div><a href=3D"http://git.openembedded.or=
g/openembedded-core/commit/?h=3Ddaisy&amp;id=3D4f2dee0d8c2c3f60cb8f8021343e=
973cae31fc50">http://git.openembedded.org/openembedded-core/commit/?h=3Ddai=
sy&amp;id=3D4f2dee0d8c2c3f60cb8f8021343e973cae31fc50</a><br></div><div>as b=
unch of sed calls which were later changed to a .patch in 2018</div><div><a=
 href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D9e58926=
f1cea9d5cb18cb923855d1ae98f88a8ac">http://git.openembedded.org/openembedded=
-core/commit/?id=3D9e58926f1cea9d5cb18cb923855d1ae98f88a8ac</a><br></div><d=
iv><br></div><div>Now with RSS this shouldn&#39;t be so big issue, that reb=
uilding cmake-native after qtbase-native won&#39;t suddenly detect Qt suppo=
rt for CMake, but it should be tested on host with Qt5 installed to make su=
re it&#39;s not detected from host and stays explicitly disabled (maybe the=
re is a flag for that nowadays - I didn&#39;t check in last 8 years :)).</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, May 5, 2021 at 10:52 PM Otavio Salvador &lt;<a href=3D"mailto:ot=
avio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Em qua., 5 de mai. de 2021 =C3=A0s 15:35, Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; escreveu:<b=
r>
&gt;<br>
&gt; before we remove it, lets hear a Review from Otavio and perhaps he ha=
s<br>
&gt; better history with this patch<br>
&gt;<br>
&gt; On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; Remove 0002-cmake-Prevent-the-detection-of-Qt5.patch<br>
&gt; &gt; (patch purpose and failing scenarios unclear; disabling<br>
&gt; &gt; is better done through configuration options which<br>
&gt; &gt; are available for all of these items).<br>
<br>
Try build it on a host with Qt to see if it fails. This is what comes<br>
to my mind. I don&#39;t recall the details as it was done in 2018 ...<br>
gosh, I am getting old.<br>
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blan=
k">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"ht=
tp://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://cod=
e.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: +1 =
(347) 903-9750<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c18b7905c19c9eae--
