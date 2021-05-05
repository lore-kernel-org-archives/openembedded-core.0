Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.727.1620254448040530513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MDyAzBg7;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id g17so2135882qvl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uozF9RzKd25Xyy91cnUQPs1t8xyzOgmxXR7k0zmb7Lk=;
        b=MDyAzBg7Irmc29hLGWkWHTo/crGzAfOLR4RVz8fS2qDEOaSLC88ttetNYgps2wUPpR
         ukcXldbyDHkHsWLpKKYH0ymMEJYbehjVI6fdY1sATXDBypouiBVst2ca1cpWRMVk3kx1
         CYHsQl+H7AE/nSAcT6GWbpDWoqgp8I/82PlEQ404xCdBp9NuByXdJ0mdoi4p+4d3RhZM
         VJeprCE82hNABtn28HDw7urayFQZ45V8rghQHRtnXrf3s0Mg5qP6FsQ/JZmZx8HM/3ln
         fYaY0UTS0mMvw+Th+9wM+yODOFx+xAWxdREggXPVcUmgnABBaNBICBbfskivwMcPgj0R
         tRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uozF9RzKd25Xyy91cnUQPs1t8xyzOgmxXR7k0zmb7Lk=;
        b=R9vk9nySei5AY1vfQVE03G3U/qurVXWIX6BBgbser6unDKsNDK6f3UaruWtxsxpdOP
         5p01OiyVN/HB0iZaWEnqCtb4ofTYSvpjvdtfRRfnCwqaV/mKUfK8JTTUshHaQB3mydEF
         /uXceXDJmxXIC/oqDQoNXH1l422HkQm9LAUgsDsiH7Sk4F0IlZo3WrID8+LoaOu4WujO
         L//ZbhpKwSdyJ5akqC24EoC/1N4zNwxTVFCnYpZx9W7gHGPTD9v/sgen0XeZS5uDXcRF
         fGp4ANEYiuzCua11AlAPm7orPF+gBnlm1YOOkpqvWyuQIW3AtbmYqM3r9/8m5nCt0kwi
         R7ow==
X-Gm-Message-State: AOAM532fMHzqU4hUJNV2bi3qtCjoDC4XSD3a56G4qBg15j0Cr+vWZ2gM
	Si2ItcJftcLzPja98TC2lEB21yf2voEK6h5f0+k=
X-Google-Smtp-Source: ABdhPJztqC2iXcajOiVUnNN1HEzjYtxm0JPW07nYVQT4UaWHKcfEJFi6Obgt3pjxXFEh1ukob79ZbqrhWptF91gT14E=
X-Received: by 2002:a0c:b218:: with SMTP id x24mr1056993qvd.55.1620254447136;
 Wed, 05 May 2021 15:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-10-alex.kanavin@gmail.com> <CAMKF1sr=EyGjLS3U0VfujRXsmOGQzuLC56foz-TpFnWnRD5WVg@mail.gmail.com>
 <CAP9ODKon3P5TQn7rKC4ifXePWpE5Rie4z+pO4pxdWPruUn71zQ@mail.gmail.com> <CA+chaQf4Q23PDeZ2KoFohtgdc-GUXFK=t7NFptxw-jcOJ9z1Tw@mail.gmail.com>
In-Reply-To: <CA+chaQf4Q23PDeZ2KoFohtgdc-GUXFK=t7NFptxw-jcOJ9z1Tw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 15:40:36 -0700
Message-ID: <CAMKF1sq+OgXo2qUEkos3CyrN09LXaP9KQ0ddE2Zcyd2zv2MShg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/61] cmake: update 3.19.5 -> 3.20.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c4741b05c19ce2e0"

--000000000000c4741b05c19ce2e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 3:21 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> It's actually from 2013, see:
>
> https://github.com/meta-qt5/meta-qt5/commit/671313d0b5e09e0b49a90ed944cd=
33fb3d6457b0
>
> it had couple iterations in meta-qt5 before it was moved to oe-core in:
> https://github.com/meta-qt5/meta-qt5/commit/17f240df
>
> http://git.openembedded.org/openembedded-core/commit/?h=3Ddaisy&id=3D4f2=
dee0d8c2c3f60cb8f8021343e973cae31fc50
> as bunch of sed calls which were later changed to a .patch in 2018
>
> http://git.openembedded.org/openembedded-core/commit/?id=3D9e58926f1cea9=
d5cb18cb923855d1ae98f88a8ac
>
> Now with RSS this shouldn't be so big issue, that rebuilding cmake-nativ=
e
> after qtbase-native won't suddenly detect Qt support for CMake, but it
> should be tested on host with Qt5 installed to make sure it's not detect=
ed
> from host and stays explicitly disabled (maybe there is a flag for that
> nowadays - I didn't check in last 8 years :)).
>

Thanks for the context Martin I think host intrusion is a valid point
although perhaps less of a chance


> On Wed, May 5, 2021 at 10:52 PM Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> Hello,
>>
>> Em qua., 5 de mai. de 2021 =C3=A0s 15:35, Khem Raj <raj.khem@gmail.com>
>> escreveu:
>> >
>> > before we remove it, lets hear a Review from Otavio and perhaps he ha=
s
>> > better history with this patch
>> >
>> > On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin <
>> alex.kanavin@gmail.com> wrote:
>> > >
>> > > Remove 0002-cmake-Prevent-the-detection-of-Qt5.patch
>> > > (patch purpose and failing scenarios unclear; disabling
>> > > is better done through configuration options which
>> > > are available for all of these items).
>>
>> Try build it on a host with Qt to see if it fails. This is what comes
>> to my mind. I don't recall the details as it was done in 2018 ...
>> gosh, I am getting old.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>>
>>=20
>>
>>

--000000000000c4741b05c19ce2e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 5, 2021 at 3:21 PM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">It&#39;s actually from =
2013, see:<div><a href=3D"https://github.com/meta-qt5/meta-qt5/commit/67131=
3d0b5e09e0b49a90ed944cd33fb3d6457b0" target=3D"_blank">https://github.com/m=
eta-qt5/meta-qt5/commit/671313d0b5e09e0b49a90ed944cd33fb3d6457b0</a><br></d=
iv><div><br></div><div>it had couple iterations in meta-qt5 before it was m=
oved to oe-core in:</div><div><a href=3D"https://github.com/meta-qt5/meta-q=
t5/commit/17f240df" target=3D"_blank">https://github.com/meta-qt5/meta-qt5/=
commit/17f240df</a><br></div><div><a href=3D"http://git.openembedded.org/op=
enembedded-core/commit/?h=3Ddaisy&amp;id=3D4f2dee0d8c2c3f60cb8f8021343e973c=
ae31fc50" target=3D"_blank">http://git.openembedded.org/openembedded-core/c=
ommit/?h=3Ddaisy&amp;id=3D4f2dee0d8c2c3f60cb8f8021343e973cae31fc50</a><br><=
/div><div>as bunch of sed calls which were later changed to a .patch in 201=
8</div><div><a href=3D"http://git.openembedded.org/openembedded-core/commit=
/?id=3D9e58926f1cea9d5cb18cb923855d1ae98f88a8ac" target=3D"_blank">http://g=
it.openembedded.org/openembedded-core/commit/?id=3D9e58926f1cea9d5cb18cb923=
855d1ae98f88a8ac</a><br></div><div><br></div><div>Now with RSS this shouldn=
&#39;t be so big issue, that rebuilding cmake-native after qtbase-native wo=
n&#39;t suddenly detect Qt support for CMake, but it should be tested on ho=
st with Qt5 installed to make sure it&#39;s not detected from host and stay=
s explicitly disabled (maybe there is a flag for that nowadays - I didn&#39=
;t check in last 8 years :)).</div></div></blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks for the context Martin I think host intrusi=
on is a valid point although perhaps less of a chance=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><div class=3D"gmail=
_quote"></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, May 5, 2021 at 10:52 PM Otavio Salvador &lt;<a href=3D"mailto:o=
tavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystem=
s.com.br</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"></blockquote></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
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
<br></blockquote></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000c4741b05c19ce2e0--
