Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.129.1623084069402856415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 09:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dt/ABTb/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.181, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f181.google.com with SMTP id d2so18945839ljj.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctYb6aGFTzn9/59r57KlwFpzSp4GZvHAu7wWOJW8utk=;
        b=Dt/ABTb/xpmoMUa0NSw/ko//Jvg/ItfDC54oD2o7gLzslNQBYPnPzl5wwlrhAt7bT/
         gt7cJozUAcqbdBNb9wOstC0OscMmv0vKAWKkv2qIaBPIovhgsgxAJYBCKoRF9Wy4akFQ
         KeeWIJ2Xgnok8+VgSX1blo2JZCaanpEaLC/H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctYb6aGFTzn9/59r57KlwFpzSp4GZvHAu7wWOJW8utk=;
        b=JffCSoAPmipUl4r0OUrHTGek38cDnDGIImoTt05EpU8Cs0YWshCmOr/+2UZvuNdqMT
         goyzXI95yNbfrFhidOuU7UVqFQUQb2yYn4USMjTu9mse/r1EwgllcAVTlOc/Fcm2Oeaa
         k5PgSGa0L4yx89mbZDroJPd/hrOGr0aGxVGQy/UjiRF3Wh28pcSTsDDdxjPTNdghn6KK
         EYrQ154YNS0XERFZ6o2qRuvGyZI6mhNws+F/YSILWgLYqEob/mlM/yUxXT5JeI7ymjdG
         HP3rMSM00of1FzkcHq6C2xIVxs0kbrhjYk3+dNYW2XcX29wT3SoKuqDwZ49XosMcZY//
         VvHA==
X-Gm-Message-State: AOAM532p60UAKVU4//Cy8JgZrQyrC3OfE/8B8Kt6ll9+Wh9WYJH1nPbk
	lFNoi/TZGDt29LyR1ucqC97Dvi5ePSLcf2iRtl0x5A==
X-Google-Smtp-Source: ABdhPJy9AHHDVwqtNoiQVcoP9UmYHtxJbj/9ytytXyTbtGML4MbSUbDfz2O4Z6hSycvNTAOUbLNRWK4ogRUwcU6lb5U=
X-Received: by 2002:a2e:bb81:: with SMTP id y1mr5507591lje.501.1623084067108;
 Mon, 07 Jun 2021 09:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
 <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
 <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
 <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com> <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com>
In-Reply-To: <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Mon, 7 Jun 2021 09:40:56 -0700
Message-ID: <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000042d97e05c42fb5bc"

--00000000000042d97e05c42fb5bc
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 8:10 AM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Mon, Jun 7, 2021 at 3:20 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Mon, 7 Jun 2021 at 00:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> here is a small testcase to excercise utimensat_time64
>>>
>>> https://raw.githubusercontent.com/xantares/test-seccomp-time64/master/test-time64.c
>>>
>>> gcc -m32 test-time64.c
>>>
>>> it will be good to check how the resulting binary behaves with centos
>>> provided libc and sdk provided one.
>>>
>>
>> Yes, testing the issue without involving the sdk would be good, but I
>> can't build it in the host environment, and don't have rights to install
>> missing 32 bit support packages (not sure what that would be):
>>
>> /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file
>> or directory
>>  # include <gnu/stubs-32.h>
>>
>
> Yeah it needs 32bit development libc and compiler installed
>


I added the needed packages to the CentOS workers. The compiled binary
prints "rc=0" on the three CentOS workers.

Is reverting to an older kernel in order yet?


>
>
>>            ^~~~~~~~~~~~~~~~
>>
>> Alex
>>
>

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--00000000000042d97e05c42fb5bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 7, 2021 at 8:10 AM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Jun 7, 2021 at 3:20 AM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, 7 Jun 2021 at 00:19, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">here is a small testcase to excercise ut=
imensat_time64<br>
<a href=3D"https://raw.githubusercontent.com/xantares/test-seccomp-time64/m=
aster/test-time64.c" rel=3D"noreferrer" target=3D"_blank">https://raw.githu=
busercontent.com/xantares/test-seccomp-time64/master/test-time64.c</a><br>
<br>
gcc -m32 test-time64.c<br>
<br>
it will be good to check how the resulting binary behaves with centos<br>
provided libc and sdk provided one.<br></blockquote><div><br></div><div>Yes=
, testing the issue without involving the sdk would be good, but I can&#39;=
t build it in the host environment, and don&#39;t have rights to install mi=
ssing 32 bit support packages (not sure what that would be):</div><div><br>=
</div><div>/usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No s=
uch file or directory<br>=C2=A0# include &lt;gnu/stubs-32.h&gt;</div></div>=
</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah it ne=
eds 32bit development libc and compiler installed=C2=A0</div></div></div></=
blockquote><div><br></div><div><br></div><div>I added the needed packages=
=C2=A0to the CentOS workers. The compiled binary prints &quot;rc=3D0&quot; =
on the three CentOS workers.</div><div><br></div><div>Is reverting to an ol=
der kernel in order yet?</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div class=3D"gmail_quote"><div dir=3D"auto"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~</div><div><br></div><div>Alex<br> </div></di=
v></div>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv></div>

--00000000000042d97e05c42fb5bc--
