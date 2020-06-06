Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.7126.1591436129002479172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2020 02:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Yr4uKSQr;
 spf=pass (domain: blade-group.com, ip: 209.85.210.45, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f45.google.com with SMTP id s13so9654872otd.7
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2020 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YxCPWD7UYYZwIFCai3JaAszycKJ+DpdIH0r3SGYtyks=;
        b=Yr4uKSQrgXecQ3wCRgnAkia67pRzosbRXGlTXaPq2KzXFjG0oReZD93ScBh/bv4PWS
         gKfo5REG0RmUsMxp0Bp9pPbRy7kdzchwIu48yEXCieW84wkB9amI44jjoM0mESSto3GF
         QI9H2QJtcMzG4y7RxzP6yg7K/lrlgXJL+C6zY2WmdcUfSdv22TjTnN+AqpL8r8uYFDfH
         vP0Jo9SWdFJs2ZPbDyBm2stOjcNS7ZQdQEwUKpwdCUEhQgTJF06mDklvRBsAHQypFQGE
         hhG3MnqLaMGau4JpR4baGjVQRbp2Chu0WPb2vaIDRJ+XvuHS361P3c9ajjUFiZBMbdML
         OMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YxCPWD7UYYZwIFCai3JaAszycKJ+DpdIH0r3SGYtyks=;
        b=dg8C2VXIbJnUollkLpqgu4Wxg4FldBsT8gu/10WOxFfVvX579LJGrUIdQl87fN3DOs
         0eR6EbwV80wR61FRDgGNd/iepgbxmlGYvncjAr5K2zvUdbAsVLwYGf9uJU6AL1jTcDYR
         ExQsHf4S0CGAhK8UPaWjkMpJrc87fHW6f78cQq8wGxN5FJ223dZfZRnndVc94RFGkSVU
         0RlVnr063vnW8y1OHpPL77ofqRmA88N5h5z/byow3vTZEbby2LAg0J1Ywr5bx2XKZZIU
         4AnF4bYzoQx0+eXUEcc+i9iPRhs0g+hein4aX1TCWbi1ExZb0NGj+lVqEboA06zSdBNN
         W0vw==
X-Gm-Message-State: AOAM531t/dPGYg2yd88RhO/awDwq7WS8Tpmf83lf0W4As33ZwRVDaC3g
	5cQbUEINY9J9/VhE7yDU9o8bPlHo5YEB43P4UbDoJg==
X-Google-Smtp-Source: ABdhPJw6PjBcjBVR90R5NjSWR8G3b+RcnT0kFAPDVsAHcPIr0BEDrRt9G/0Nygl6d7/IIwi8zYzbzAhjkxvT5tEIfnw=
X-Received: by 2002:a05:6830:17c8:: with SMTP id p8mr10491537ota.336.1591436128345;
 Sat, 06 Jun 2020 02:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+4=imbTdacbhmydbXLTMQm8jvNoZJfzt17Y0ZcR2gRAC7LQSg@mail.gmail.com>
 <b5226094-b53d-e9b2-d23b-224bdb305dd7@gmail.com>
In-Reply-To: <b5226094-b53d-e9b2-d23b-224bdb305dd7@gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Sat, 6 Jun 2020 11:35:16 +0200
Message-ID: <CA+4=imYx=qB5bV8Y3L7zZUSqUoc58nzv9ZJyfLbaJ3s-KYO_sg@mail.gmail.com>
Subject: Re: [OE-core] Status of support for recent host glibc
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001d01e605a76719d9"

--0000000000001d01e605a76719d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 5 juin 2020 =C3=A0 21:28, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

>
>
> On 6/5/20 6:10 AM, Yann Dirson wrote:
> > I just got hit by the following dunfell build issue on my debian/testin=
g
> > dev box:
> >
> >   argp-fmtstream.c:(.text+0x4ca): undefined reference to `_IO_fwide'
> >
>  /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld:
> argp-fmtstream.c:(.text+0x51d): undefined reference to `_IO_fwide'
> >
>  /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld:
> argp-help.o: in function `argp_failure':
> >   argp-help.c:(.text+0x1fb1): undefined reference to `_IO_fwide'
> >   collect2: error: ld returned 1 exit status
> >   make: *** [Makefile:60: localedef] Error 1
> >
> > After some digging I found
> > https://patchwork.openembedded.org/series/20136 whose patch 4
> > addresses this very problem.
> >
>
> Please send a backport request if its not already done so and Cc Steve
> Sakoman ( dunfell maintainer ), also  check the supported hosts list for
> dunfell
>
>
> https://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#detailed=
-supported-distros
>
> this case is not seen on commonly supported distros hence no request to
> backport perhaps. Debian testing is rolling distibution and its hard to
> support time based releases on top of rolling host distributions.
>

Well, since those days I'm working on migrating away from sumo, I'll avoid
diverting
other's efforts there, since building in a chroot is pretty fine.


> > I could not find any discussion about those patches (it's hard to be
> > sure though, I found the
> > new mail archive quite impractical).
> >
> > Are there any reasons why this 2019-09 series is still NEW ?
>
> I know its confusing but
> For OE-core and bitbake too, patchwork is not primary tool for
> cherry-picking patches from mailing list, its email based, since its
> primarily driven by maintainer's convenience more than anything else. so
> dont read into status of the patchwork series status.
>
>
OK. But then it looks like the mail archive ought to make it easier to
navigate threads - I spent quite
some time trying to figure out if there had been any followup to this
series, and I'm still usure of the
answer.  It seems quite surprising there would be no thread view in this
software ?

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--0000000000001d01e605a76719d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 5 juin 2020 =C3=A0=C2=A0=
21:28, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
<br>
On 6/5/20 6:10 AM, Yann Dirson wrote:<br>
&gt; I just got hit by the following dunfell build issue on my debian/testi=
ng <br>
&gt; dev box:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0argp-fmtstream.c:(.text+0x4ca): undefined reference to `_I=
O_fwide&#39;<br>
&gt;=C2=A0 =C2=A0/home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp=
/hosttools/ld: argp-fmtstream.c:(.text+0x51d): undefined reference to `_IO_=
fwide&#39;<br>
&gt;=C2=A0 =C2=A0/home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp=
/hosttools/ld: argp-help.o: in function `argp_failure&#39;:<br>
&gt;=C2=A0 =C2=A0argp-help.c:(.text+0x1fb1): undefined reference to `_IO_fw=
ide&#39;<br>
&gt;=C2=A0 =C2=A0collect2: error: ld returned 1 exit status<br>
&gt;=C2=A0 =C2=A0make: *** [Makefile:60: localedef] Error 1<br>
&gt; <br>
&gt; After some digging I found <br>
&gt; <a href=3D"https://patchwork.openembedded.org/series/20136" rel=3D"nor=
eferrer" target=3D"_blank">https://patchwork.openembedded.org/series/20136<=
/a> whose patch 4<br>
&gt; addresses this very problem.<br>
&gt; <br>
<br>
Please send a backport request if its not already done so and Cc Steve <br>
Sakoman ( dunfell maintainer ), also=C2=A0 check the supported hosts list f=
or <br>
dunfell<br>
<br>
<a href=3D"https://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html=
#detailed-supported-distros" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#detailed-supported-=
distros</a><br>
<br>
this case is not seen on commonly supported distros hence no request to <br=
>
backport perhaps. Debian testing is rolling distibution and its hard to <br=
>
support time based releases on top of rolling host distributions.<br></bloc=
kquote><div><br></div><div>Well, since those days I&#39;m working on migrat=
ing away from sumo, I&#39;ll avoid diverting</div><div>other&#39;s efforts =
there, since building in a chroot is pretty fine.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I could not find any discussion about those patches (it&#39;s hard to =
be <br>
&gt; sure though, I found the<br>
&gt; new mail archive quite impractical).<br>
&gt; <br>
&gt; Are there any reasons why this 2019-09 series is still NEW ?<br>
<br>
I know its confusing but<br>
For OE-core and bitbake too, patchwork is not primary tool for <br>
cherry-picking patches from mailing list, its email based, since its <br>
primarily driven by maintainer&#39;s convenience more than anything else. s=
o <br>
dont read into status of the patchwork series status.<br>
<br>
</blockquote></div><div><br></div><div>OK. But then it looks like the mail =
archive ought to make it easier to navigate threads - I spent quite</div><d=
iv>some time trying to figure out if there had been any followup to this se=
ries, and I&#39;m still usure of the</div><div>answer.=C2=A0 It seems quite=
 surprising there would be no thread view in this software ?<br></div><br>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Yann Dirson &lt;<a href=3D=
"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt=
;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" target=3D"_blank">htt=
p://shadow.tech</a><br><br></div></div>

--0000000000001d01e605a76719d9--
