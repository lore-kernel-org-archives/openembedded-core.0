Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.8311.1623247666956320766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 07:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqNvzFEd;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id d13so12229805uav.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dSWgXCy6adkhbyGHTrxNjmf5+whcgL8/9tlrhKEMqKU=;
        b=nqNvzFEdwRjp3Y9T0sAWbamducZwmvBp3MiaU95PN0kgVFyweaoT5i5aLpZNH7u1hL
         5VZP3OOsgEe47IUoYFGTlJGsvnkX63Ig4nZPrAnRriJFHNXZARCa5n3VphphC6nIlTKK
         1Pq7hmOJITmcUVC+DyqHWUiItzLioH8w0YU40O4zhvUIIVDvqZm9T1EeT/D8EvzPnzFs
         F00Ix7xrQImP7Q8yCYFvmlthARbwkhD070HDlW2V6wEbdSXxKixqjQTAAYVphNjeD8nx
         hjhSk0rpE9GAR3bWhEQ1TzbLAT+YibNvv1HIEF7i32C1wxnCh2a9UGyCxy0bPvF2i1iM
         6ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dSWgXCy6adkhbyGHTrxNjmf5+whcgL8/9tlrhKEMqKU=;
        b=j/J6rXSlRrHUke810/o1Iq8QWvISqdE+YwZ2Gk7D9JDQuFroXEHIA4altNswyaJ9oD
         yrcynsn7ofx+/ZjdNVdIH+emzwaPp8ZhQjmKg1Xbcmeh2mNEXzduePZZzS/FIYJrW4oO
         YB3KWIyRLkRwJifK1dcSXAJOjNXI5Mq9KO0z9sGMAYEH5PgyqmXA+TsA6J9ekYt6WUPa
         FBw29lvw37LvdgcTV4vgTk3JUgNDuCarDzR1BrsFFVKho8AF2AsgZR/P7UksK2Q9OIb3
         b8TTjxNDj90CC/s35qZgfuHllWNm/CAcirL2rYkBDWPVTs4K7Fc2M2fu070KPOpQeMHm
         RVgw==
X-Gm-Message-State: AOAM532yQ3ckBf4StjurOxJvVnilfHI4m82xeMK1I8Makz8cCk/z+Kng
	CoB8B18oNS0r5PXw4RNSMHbPioNnIEnFO8YYwUc=
X-Google-Smtp-Source: ABdhPJx5Re5hwGOKeFEyvhue2/ME9E+aAEfma7k+E+YjVwm63JjeUuKiIQjQyNwEIS3u30TBMk/lXjAC6XMTSk5BSC8=
X-Received: by 2002:ab0:742:: with SMTP id h60mr17746061uah.89.1623247666145;
 Wed, 09 Jun 2021 07:07:46 -0700 (PDT)
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
 <CANNYZj9wKQv+YMgCN98R1fEiCaruFTiK_MHXt+aNPVLOYBBS2w@mail.gmail.com> <ffe15158da239184a7eef20767652cda2b9f272a.camel@linuxfoundation.org>
In-Reply-To: <ffe15158da239184a7eef20767652cda2b9f272a.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 9 Jun 2021 16:07:34 +0200
Message-ID: <CANNYZj90+Ykt=4-ap+sRWfo7N0x6EwDSevXRWojWyG9N8agt4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000085ec6305c455cc3d"

--00000000000085ec6305c455cc3d
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jun 2021 at 13:37, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Thanks Michael and Alex. We can therefore pretty safely say that something
> was
> broken between the 240 and 305 of the centos8 kernel for the 32 bit syscall
> utimensat syscalls.
>
> I did poke around https://github.com/kernelim/linux/tree/centos8 which
> does
> have a kernel diff but it is huge and you have to clone the repo to get it.
>
> git show a3342908613ba72a84f652ca7a56c3e2113bda12 | grep sys_utimensat -C
> 40
>
> shows they did add the syscalls in that kernel.
>
> So this does look to be a RedHat issue. Not sure if we want to report it
> to them? Can we run the autobuilders on the older kernel for now until
> they hopefully fix it?
>

Centos 8 will be discontinued in just over 6 months  (
https://www.centos.org/centos-linux/)
so I think at least one of the centos 8 workers should be updated to centos
stream 8
(https://www.centos.org/centos-stream/ - includes instructions) and take it
from there.

Alex

--00000000000085ec6305c455cc3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 9 Jun 2021 at 13:37, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks =
Michael and Alex. We can therefore pretty safely say that something was=C2=
=A0<br>
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
 6 months=C2=A0 (<a href=3D"https://www.centos.org/centos-linux/">https://w=
ww.centos.org/centos-linux/</a>)</div><div>so I think at least one of the c=
entos 8 workers should be updated to centos stream 8 <br></div><div>(<a hre=
f=3D"https://www.centos.org/centos-stream/">https://www.centos.org/centos-s=
tream/</a> - includes instructions) and take it from there.</div><div><br><=
/div><div>Alex<br></div></div></div>

--00000000000085ec6305c455cc3d--
