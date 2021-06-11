Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.179.1623454205520529520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 16:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RYLM+/2Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id j20so10887809lfe.8
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 16:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqeMlc1o4NarW+9dANJeDmwz9NoEBEJQ+lBgeANjNXw=;
        b=RYLM+/2ZF6eCUjd7wID6xU7Ca+8itlwcl5AkbKqVf0lm+VedcIUkeGm8fx8bix7Ru4
         2B4Ulm6bSDgmKxDdCH4/wfvI5tXRSB9J96KCzWpaq+zat/qZHJmDhZVEhFLiZQYXCdyn
         aU0Q7WOIcbnt1cUjabkL72ifHR5OgwHyPM9BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqeMlc1o4NarW+9dANJeDmwz9NoEBEJQ+lBgeANjNXw=;
        b=M9IFtfcdHGrRjG2hJEzwCcPMUwbdBzLXqdBOPooaH1qAjcEjhkPnNJygNOLboCXTQH
         6jazdAr7pIw6CpGrZSz0+c+xg6abEUgXK505Vl5ioX9Fy4JK3UdZ3K+sYu582ir+4dYo
         9FiteOrOpc3k/WU9nZ5JLBucPvgTotMlFdTVeQqqBdkbqRSv46w8tU4cPQ6yB5F8yBUH
         n5Fd2MR2GDJqA3qPFGe06UXCnF2lAjIA2jjEsg9KKRLdKHv+scuyMkFo1KB00nm8dSCi
         5Dy1K/QAZHEbOfv1IEhmdMDTe7H2oy7Q2+/oJK6iSH7jpiyhmPmYx6uICES9MevHe2u2
         n3sg==
X-Gm-Message-State: AOAM530FIxyZ19wX7F1eJsadINDVMYjqBvnfc3Vq+NJcjI1V3YkOoc/z
	G3DK2acylDeHKw6QS6jDWz8Nr40GPHhaNhZJrHmsqw==
X-Google-Smtp-Source: ABdhPJwsYFOPxd/AewG1ynbSMCdcK6nXh6wXkqg9lWwMGSlamhjqyh4htX8k4mmAJC6gS6sPwOIHLA3yE7Nd3KjQ3G0=
X-Received: by 2002:ac2:42c2:: with SMTP id n2mr4176103lfl.0.1623454203352;
 Fri, 11 Jun 2021 16:30:03 -0700 (PDT)
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
 <CANNYZj90+Ykt=4-ap+sRWfo7N0x6EwDSevXRWojWyG9N8agt4w@mail.gmail.com>
 <CADfgfob1aHH-kqMss84YfrQ7YrpZsDPd32XoX17wJLoJ0yka3A@mail.gmail.com> <CANNYZj-Q=kpNCFM-Q5iPK5j0vciaUCcFBYEzWDRYpArUm6jmVg@mail.gmail.com>
In-Reply-To: <CANNYZj-Q=kpNCFM-Q5iPK5j0vciaUCcFBYEzWDRYpArUm6jmVg@mail.gmail.com>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Fri, 11 Jun 2021 16:29:51 -0700
Message-ID: <CADfgfoZrpC7RFc0H8xXU8mK2myXT+O9L_kKJUQraK94E__k4Vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019af8605c485e32e"

--00000000000019af8605c485e32e
Content-Type: text/plain; charset="UTF-8"

Thanks Alex,
The issue persists with the newest CentOS8 Stream kernel. Time to file a
bug with RedHat I suppose.

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3535/steps/12/logs/stdio

On Fri, Jun 11, 2021 at 3:18 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think the easiest is to run the genericx86 job on the worker. If the
> problem exists, you'll see a failure like this one:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3523/steps/12/logs/stdio
>
> Alex
>
> On Fri, 11 Jun 2021 at 23:56, Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
>> I've switched centos8-ty-2.yocto.io over to Stream and it's now running
>> kernel 4.18.0-310.el8.x86_64. I'm not sure how to test if the problem
>> still exists but I don't see a related entry in the changelog so I expect
>> it does.
>>
>> Alex, can you check or send me a bit more info about how to check myself?
>>
>> On Wed, Jun 9, 2021 at 7:07 AM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> On Wed, 9 Jun 2021 at 13:37, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>
>>>> Thanks Michael and Alex. We can therefore pretty safely say that
>>>> something was
>>>> broken between the 240 and 305 of the centos8 kernel for the 32 bit
>>>> syscall
>>>> utimensat syscalls.
>>>>
>>>> I did poke around https://github.com/kernelim/linux/tree/centos8 which
>>>> does
>>>> have a kernel diff but it is huge and you have to clone the repo to get
>>>> it.
>>>>
>>>> git show a3342908613ba72a84f652ca7a56c3e2113bda12 | grep sys_utimensat
>>>> -C 40
>>>>
>>>> shows they did add the syscalls in that kernel.
>>>>
>>>> So this does look to be a RedHat issue. Not sure if we want to report it
>>>> to them? Can we run the autobuilders on the older kernel for now until
>>>> they hopefully fix it?
>>>>
>>>
>>> Centos 8 will be discontinued in just over 6 months  (
>>> https://www.centos.org/centos-linux/)
>>> so I think at least one of the centos 8 workers should be updated to
>>> centos stream 8
>>> (https://www.centos.org/centos-stream/ - includes instructions) and
>>> take it from there.
>>>
>>> Alex
>>>
>>
>>
>> --
>> Michael Halstead
>> Linux Foundation / Yocto Project
>> Systems Operations Engineer
>>
>

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--00000000000019af8605c485e32e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Alex,=C2=A0<div>The issue persists with the newest =
CentOS8 Stream kernel. Time to file a bug with RedHat I suppose.=C2=A0</div=
><div><br></div><div><a href=3D"https://autobuilder.yoctoproject.org/typhoo=
n/#/builders/48/builds/3535/steps/12/logs/stdio">https://autobuilder.yoctop=
roject.org/typhoon/#/builders/48/builds/3535/steps/12/logs/stdio</a><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Jun 11, 2021 at 3:18 PM Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div class=3D"gmail_attr">I think the easiest is to run th=
e genericx86 job on the worker. If the problem exists, you&#39;ll see a fai=
lure like this one:</div><div class=3D"gmail_attr"><br></div><div class=3D"=
gmail_attr"><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/build=
ers/48/builds/3523/steps/12/logs/stdio" target=3D"_blank">https://autobuild=
er.yoctoproject.org/typhoon/#/builders/48/builds/3523/steps/12/logs/stdio</=
a></div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Alex<=
br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, 11 Jun 2021 at 23:56, Michael Halstead &lt;<a h=
ref=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mhalstead@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">I&#39;ve switched <a href=3D"http://cento=
s8-ty-2.yocto.io" target=3D"_blank">centos8-ty-2.yocto.io</a> over to Strea=
m and it&#39;s now running kernel 4.18.0-310.el8.x86_64. I&#39;m not sure h=
ow to test if the problem still=C2=A0exists but I don&#39;t see a related e=
ntry in the changelog so I expect it does.<br><div><br></div><div>Alex, can=
 you check or send me a bit more info about how to check myself?</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Jun 9, 2021 at 7:07 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 9 Jun=
 2021 at 13:37, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks Mi=
chael and Alex. We can therefore pretty safely say that something was=C2=A0=
<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--00000000000019af8605c485e32e--
