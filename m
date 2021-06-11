Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web09.272.1623449902211758048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 15:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ewZ4LGz0;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id j19so2858996vkj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXWEtcZKjPtuz79yyccNcG19ldWMPEXgZVExj+3aN3k=;
        b=ewZ4LGz0IZ9TU8Q7wiYb7ku60Y/6ErVID4o83mzwuEA7aYDBO5Gm0tY0T0KCuMVBrh
         EJK09RhRoI8EcSgMdyVZAlWuY63zEm6Pd44i9FYpW8Hc+lkQh9G3fm91Er4bbAQarg0/
         1WIeKNfFvAjKBKC0QagQ2JW+1Cl6HtMfwC+l9F4ciAw5vyiwqXAotCV+HF1a3tCJs3NO
         poCkMzsBdouP/bxAJyue6KMjHnN+S+ND2yZF2/xscvq7qXXhR/YqIi2MSxiWva7Lp3pj
         xO+TOnYd4V5SvGRvxiHi0uIqsSYeauUvL+zLTXt0gZ1+F+A/wUpE2O0gkQy8n5WNa38y
         6rxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXWEtcZKjPtuz79yyccNcG19ldWMPEXgZVExj+3aN3k=;
        b=Ik4wZBqjLKlXdJofM6Sq1Q7BKgukITEaOJ50yCdyvaPF9DPMUdGSSKQYd8fKxhyoo2
         D+0Ic0A3XmyhmAZglpiQuVOTMmRcPXxfmngCEMjvLqhduY/2pKjFQ0RI2Y6FU9BZFmsV
         E9VC9uL63LYqR0kqZfQ9FxY49+3rWj4cC+UTst54q7VQXRf5PZfQQaeWN1WKfaSiBcNv
         uahPi3vX8gaMg/NO3ZVAzJ/UNPhUVpDK49tbrCQS4TIzm7/C8qHcvM8GlL8UBurA7Rbm
         EjayfM9Cb1rNUK7Xieq0+XTgyFmLjPQ1y8xw0tAHQLGL2+vw56Yxyc8WXdK/kueWADpu
         xeuA==
X-Gm-Message-State: AOAM531l2He6FoxCnRQ0+9iC7U7Ac8QA2tqAYeYpRb1WxvJ4x4bSLX6d
	scLMXTap8wRiwCB6HdnJGNPt9bBJoJGD6WhAdWQ=
X-Google-Smtp-Source: ABdhPJxV/z0qlzAy3BWw4fwdFIHsqXrDSpwDoz2rqChmLkg1csNO6EmlVPmdvTBcG561XyPzo8nGicdespOMbn3KZrc=
X-Received: by 2002:a1f:1d4a:: with SMTP id d71mr11219925vkd.0.1623449901306;
 Fri, 11 Jun 2021 15:18:21 -0700 (PDT)
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
 <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
 <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com>
 <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com>
 <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com>
 <CANNYZj-1D7M6ggXiaGZX7PnkmENqK_8wgHpR06W9AWp==kwbUQ@mail.gmail.com>
 <CADfgfoaUpky3zgsU=q90nQdbuPWa63VxQSKQCc=r1YahwKw5oQ@mail.gmail.com>
 <CANNYZj9wKQv+YMgCN98R1fEiCaruFTiK_MHXt+aNPVLOYBBS2w@mail.gmail.com>
 <ffe15158da239184a7eef20767652cda2b9f272a.camel@linuxfoundation.org>
 <CANNYZj90+Ykt=4-ap+sRWfo7N0x6EwDSevXRWojWyG9N8agt4w@mail.gmail.com> <CADfgfob1aHH-kqMss84YfrQ7YrpZsDPd32XoX17wJLoJ0yka3A@mail.gmail.com>
In-Reply-To: <CADfgfob1aHH-kqMss84YfrQ7YrpZsDPd32XoX17wJLoJ0yka3A@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 12 Jun 2021 00:18:09 +0200
Message-ID: <CANNYZj-Q=kpNCFM-Q5iPK5j0vciaUCcFBYEzWDRYpArUm6jmVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ad988405c484e266"

--000000000000ad988405c484e266
Content-Type: text/plain; charset="UTF-8"

I think the easiest is to run the genericx86 job on the worker. If the
problem exists, you'll see a failure like this one:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3523/steps/12/logs/stdio

Alex

On Fri, 11 Jun 2021 at 23:56, Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> I've switched centos8-ty-2.yocto.io over to Stream and it's now running
> kernel 4.18.0-310.el8.x86_64. I'm not sure how to test if the problem
> still exists but I don't see a related entry in the changelog so I expect
> it does.
>
> Alex, can you check or send me a bit more info about how to check myself?
>
> On Wed, Jun 9, 2021 at 7:07 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Wed, 9 Jun 2021 at 13:37, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> Thanks Michael and Alex. We can therefore pretty safely say that
>>> something was
>>> broken between the 240 and 305 of the centos8 kernel for the 32 bit
>>> syscall
>>> utimensat syscalls.
>>>
>>> I did poke around https://github.com/kernelim/linux/tree/centos8 which
>>> does
>>> have a kernel diff but it is huge and you have to clone the repo to get
>>> it.
>>>
>>> git show a3342908613ba72a84f652ca7a56c3e2113bda12 | grep sys_utimensat
>>> -C 40
>>>
>>> shows they did add the syscalls in that kernel.
>>>
>>> So this does look to be a RedHat issue. Not sure if we want to report it
>>> to them? Can we run the autobuilders on the older kernel for now until
>>> they hopefully fix it?
>>>
>>
>> Centos 8 will be discontinued in just over 6 months  (
>> https://www.centos.org/centos-linux/)
>> so I think at least one of the centos 8 workers should be updated to
>> centos stream 8
>> (https://www.centos.org/centos-stream/ - includes instructions) and take
>> it from there.
>>
>> Alex
>>
>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>

--000000000000ad988405c484e266
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_attr">I thi=
nk the easiest is to run the genericx86 job on the worker. If the problem e=
xists, you&#39;ll see a failure like this one:</div><div class=3D"gmail_att=
r"><br></div><div class=3D"gmail_attr"><a href=3D"https://autobuilder.yocto=
project.org/typhoon/#/builders/48/builds/3523/steps/12/logs/stdio">https://=
autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3523/steps/12/log=
s/stdio</a></div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_at=
tr">Alex<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 11 Jun 2021 at 23:56, Michael Halstea=
d &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org">mhalstead@linuxfound=
ation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">I&#39;ve switched <a href=3D"http://centos8-ty-=
2.yocto.io" target=3D"_blank">centos8-ty-2.yocto.io</a> over to Stream and =
it&#39;s now running kernel 4.18.0-310.el8.x86_64. I&#39;m not sure how to =
test if the problem still=C2=A0exists but I don&#39;t see a related entry i=
n the changelog so I expect it does.<br><div><br></div><div>Alex, can you c=
heck or send me a bit more info about how to check myself?</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun=
 9, 2021 at 7:07 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 9 Jun 2021 =
at 13:37, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks Michael =
and Alex. We can therefore pretty safely say that something was=C2=A0<br>
broken between the 240 and 305 of the centos8 kernel for the 32 bit syscall=
<br>
utimensat syscalls.<br>
<br>
I did poke around <a href=3D"https://github.com/kernelim/linux/tree/centos8=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/kernelim/linux/tr=
ee/centos8</a> which does<br>
have a kernel diff but it is huge and you have to clone the repo to get it.=
<br>
<br>
git show a3342908613ba72a84f652ca7a56c3e2113bda12 | grep sys_utimensat -C 4=
0<br>
<br>
shows they did add the syscalls in that kernel.<br>
<br>
So this does look to be a RedHat issue. Not sure if we want to report it<br=
>
to them? Can we run the autobuilders on the older kernel for now until<br>
they hopefully fix it?<br>
</blockquote><div><br></div><div>Centos 8 will be discontinued in just over=
 6 months=C2=A0 (<a href=3D"https://www.centos.org/centos-linux/" target=3D=
"_blank">https://www.centos.org/centos-linux/</a>)</div><div>so I think at =
least one of the centos 8 workers should be updated to centos stream 8 <br>=
</div><div>(<a href=3D"https://www.centos.org/centos-stream/" target=3D"_bl=
ank">https://www.centos.org/centos-stream/</a> - includes instructions) and=
 take it from there.</div><div><br></div><div>Alex<br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</di=
v><div>Systems Operations Engineer</div></div></div>
</blockquote></div></div>

--000000000000ad988405c484e266--
