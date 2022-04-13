Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A45FC54EFE
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.8029.1649864564723464079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R9TFsWlt;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id l7so4823587ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKor8YeTUoFLmn/LaDsQ8jMWY/HeXR+jZIk4XvNG0d4=;
        b=R9TFsWltTqxMBi96QewoYIvwJg1DSJl+uFUyhavQVLUy2zxkEGnp7Mehzw90HH7VzH
         qMefYfRr0TDsYt7ubLfkVo/JKwtpaxeBDL7zKoCWlZAzwAjUbP+SZ2MYcadmRjuKcKP7
         nfgUOA5gc8Xv0ciOwwGWKzIraJ+DPNuXd3KG0VpyMWLIGBqD33K+S1h1eWJODfSTO2Jq
         +KEpY8AT10sUxa8ggLHYdpWwfvgIPwVNZxzQ1Y/qYEErMGyl0+qXvtI6OgQAS/luUIoz
         4rdvykJAf64IXR/Z6R9+Dcu7SEyTIx4e8jIBZV8X0H1cC7UGb9lAEPHl3vD/fcRpgkzq
         wYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKor8YeTUoFLmn/LaDsQ8jMWY/HeXR+jZIk4XvNG0d4=;
        b=j/PaZ8C9SDlTUe1T6VUb44WxHggdHRJt9ladNJytyXJ48+6T2D9/rExRQKof9+juwO
         ihGWXs2Ql1cyPi0cCFA8fPgtfZycDuS8xnabH/WptgpLAUl7Eu09ao+KO6aJCma9oDke
         t2XNfAhaXRbQL3MfgNWy1tLY5bvpTy/Q+R6GpEh9WM9sbSJymS1DW+4gv+THGXscJG7t
         Kb93CQGqcofGebQGCfq6N5CnjYJTeYzPxclHnO9q6/PIpIxXiHo0XG0OUESYW33JaYwp
         v2HekzIqmpmiMFwQ7nESTZEnX0m7phmxBCEHjlClQh/8njqxSfeYpxTNGP/w46vkU5cZ
         QPEQ==
X-Gm-Message-State: AOAM530oNXyTu/CGrTI9pBTbOaPMQ2+CtMtNiffkUGGOQFHYqmdJAcqa
	Lg3RYmmpGCfQLw2T92yIBO2enJc/hBqli1NtRss=
X-Google-Smtp-Source: 
 ABdhPJxWVjKYLPc1ULSCsiTdO+vIoLOVnJi6ozn2z4SLtEFWzVGfaU5qsb1LYGVZ4AJm5wj86HDS08+0ajfnkc2aEIg=
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr40864748ejc.435.1649864563121; Wed, 13
 Apr 2022 08:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
 <20220413171926.771b4b06@melee>
In-Reply-To: <20220413171926.771b4b06@melee>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Apr 2022 11:42:32 -0400
Message-ID: 
 <CADkTA4OMxv8pkaPo8CV7KprCoS-Oas0d4JFvrbmdDVXzQFOwiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] kernel: consolidated pull request
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000036677505dc8b071e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164336

--00000000000036677505dc8b071e
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 13, 2022 at 11:19 AM Luca Ceresoli <luca.ceresoli@bootlin.com>
wrote:

> Hello Bruce,
>
> Il giorno Tue, 12 Apr 2022 17:45:55 -0400
> "Bruce Ashfield" <bruce.ashfield@gmail.com> ha scritto:
>
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's the collection of -stable, fixes and tweaks that I was talking
> > about during the engineering sync on Tuesday.
> >
> > Feel free to take what you want, or just wait on them all until the
> > release is over.
> >
> > It is worth taking the 5.18 -dev and lttng fixes IMHO, since they do
> > make the release a bit more future proof. Likewise with Jon's -tiny
> > changes.
> >
> > Cheers,
> >
> > Bruce
> >
> > The following changes since commit
> > 632c83ab787211ef927a999f4ecde1d3ce40621d:
> >
> >   license_image.bbclass: close package.manifest file (2022-04-10
> > 08:31:17 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib zedd/kernel
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >
> > Bruce Ashfield (8):
> >   linux-yocto/5.15: arm: poky-tiny cleanup and fixes
> >   linux-yocto/5.15: update to v5.15.33
> >   linux-yocto/5.10: update to v5.10.110
> >   linux-yocto/5.10: base: enable kernel crypto userspace API
> >   linux-yocto/5.15: base: enable kernel crypto userspace API
> >   linux-yocto/5.15: kasan: fix BUG: sleeping function called from
> >     invalid context
> >   lttng-modules: support kernel 5.18+
> >   linux-yocto-dev: update to v5.18+
>
> Sending this series to the autobuilders triggered some errors and
> warnings (see below). Can you check that?
>
>
unfortunately not. I'll wait out the release and re-submit these later.

That being said, I've run similar tests to the errors found on the AB, and
can't reproduce locally, so I have no way to debug.

Cheers,

Bruce



> 1. kernel not booting on qemuppc
>
>   >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>   >> Configuration device id QEMU version 1 machine id 1
>   >> CPUs: 1
>   >> Memory: 256M
>   >> UUID: 00000000-0000-0000-0000-000000000000
>   >> CPU type PowerPC,G4
>   milliseconds isn't unique.
>   >> [ppc] Kernel already loaded (0x01000000 + 0x01394760) (initrd
>   >> 0x00000000 + 0x00000000) [ppc] Kernel command line: root=/dev/vda rw
> mem=256M
>   >> ip=192.168.7.4::192.168.7.3:255.255.255.0::eth0:off:8.8.8.8
> console=ttyS0 console=ttyS1 console=tty console=ttyS0 printk.time=1
>   >> switching to new context:
>
>   ===== end: snippet =====
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5012/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5013/steps/12/logs/stdio
>
> 2. X.org not starting on qemuarm
>
> [    14.037] (EE) No devices detected.
> [    14.039] (EE) Fatal server error:
> [    14.040] (EE) no screens found(EE)
> [    14.041] (EE)
> Please consult the The X.Org Foundation support
>          at http://wiki.x.org
>  for help.
> [    14.042] (EE) Please also check the log file at
> "/var/log/Xorg.0.log" for additional information.
> [    14.046] (EE) Server terminated with error (1). Closing log file.
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5053/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5054/steps/12/logs/stdio
>
> 3. ptest warning
>
> AssertionError: Failed ptests:
> {'strace': ['landlock_create_ruleset-y.gen.test',
>             'landlock_create_ruleset-y.gen']}
>
> This is landlock-related, thus perhaps caused by patch 2/8.
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3117/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3369/steps/12/logs/stdio
>
> Best regards.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000036677505dc8b071e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 13, 2022 at 11:19 AM Luca Ceresoli &lt;=
<a href=3D"mailto:luca.ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello=
 Bruce,<br>
<br>
Il giorno Tue, 12 Apr 2022 17:45:55 -0400<br>
&quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; ha scritto:<br>
<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Richard,<br>
&gt; <br>
&gt; Here&#39;s the collection of -stable, fixes and tweaks that I was talk=
ing<br>
&gt; about during the engineering sync on Tuesday.<br>
&gt; <br>
&gt; Feel free to take what you want, or just wait on them all until the<br=
>
&gt; release is over.<br>
&gt; <br>
&gt; It is worth taking the 5.18 -dev and lttng fixes IMHO, since they do<b=
r>
&gt; make the release a bit more future proof. Likewise with Jon&#39;s -tin=
y<br>
&gt; changes.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; The following changes since commit<br>
&gt; 632c83ab787211ef927a999f4ecde1d3ce40621d:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0license_image.bbclass: close package.manifest file (2022-0=
4-10<br>
&gt; 08:31:17 +0100)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/poky-contrib"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a>=
 zedd/kernel<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contr=
ib/log/?h=3Dzedd/kernel" rel=3D"noreferrer" target=3D"_blank">http://git.yo=
ctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel</a><br>
&gt; <br>
&gt; Bruce Ashfield (8):<br>
&gt;=C2=A0 =C2=A0linux-yocto/5.15: arm: poky-tiny cleanup and fixes<br>
&gt;=C2=A0 =C2=A0linux-yocto/5.15: update to v5.15.33<br>
&gt;=C2=A0 =C2=A0linux-yocto/5.10: update to v5.10.110<br>
&gt;=C2=A0 =C2=A0linux-yocto/5.10: base: enable kernel crypto userspace API=
<br>
&gt;=C2=A0 =C2=A0linux-yocto/5.15: base: enable kernel crypto userspace API=
<br>
&gt;=C2=A0 =C2=A0linux-yocto/5.15: kasan: fix BUG: sleeping function called=
 from<br>
&gt;=C2=A0 =C2=A0 =C2=A0invalid context<br>
&gt;=C2=A0 =C2=A0lttng-modules: support kernel 5.18+<br>
&gt;=C2=A0 =C2=A0linux-yocto-dev: update to v5.18+<br>
<br>
Sending this series to the autobuilders triggered some errors and<br>
warnings (see below). Can you check that?<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">unfortunately not. I&#39;ll wait out the release and re-su=
bmit these later.=C2=A0</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">T=
hat being said, I&#39;ve run similar tests to the errors found on the AB, a=
nd can&#39;t reproduce locally, so I have no way to debug.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
1. kernel not booting on qemuppc<br>
<br>
=C2=A0 &gt;&gt; OpenBIOS 1.1 [Nov 1 2021 20:36]<br>
=C2=A0 &gt;&gt; Configuration device id QEMU version 1 machine id 1<br>
=C2=A0 &gt;&gt; CPUs: 1<br>
=C2=A0 &gt;&gt; Memory: 256M<br>
=C2=A0 &gt;&gt; UUID: 00000000-0000-0000-0000-000000000000<br>
=C2=A0 &gt;&gt; CPU type PowerPC,G4<br>
=C2=A0 milliseconds isn&#39;t unique.<br>
=C2=A0 &gt;&gt; [ppc] Kernel already loaded (0x01000000 + 0x01394760) (init=
rd<br>
=C2=A0 &gt;&gt; 0x00000000 + 0x00000000) [ppc] Kernel command line: root=3D=
/dev/vda rw mem=3D256M <br>
=C2=A0 &gt;&gt; ip=3D<a href=3D"http://192.168.7.4">192.168.7.4</a>::<a hre=
f=3D"http://192.168.7.3" target=3D"_blank">192.168.7.3</a>:255.255.255.0::e=
th0:off:8.8.8.8 console=3DttyS0 console=3DttyS1 console=3Dtty console=3Dtty=
S0 printk.time=3D1 <br>
=C2=A0 &gt;&gt; switching to new context:<br>
<br>
=C2=A0 =3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/5012/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5012/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/5013/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5013/steps/12/logs/=
stdio</a><br>
<br>
2. X.org not starting on qemuarm<br>
<br>
[=C2=A0 =C2=A0 14.037] (EE) No devices detected.<br>
[=C2=A0 =C2=A0 14.039] (EE) Fatal server error:<br>
[=C2=A0 =C2=A0 14.040] (EE) no screens found(EE) <br>
[=C2=A0 =C2=A0 14.041] (EE) <br>
Please consult the The X.Org Foundation support <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at <a href=3D"http://wiki.x.org" rel=3D"n=
oreferrer" target=3D"_blank">http://wiki.x.org</a><br>
=C2=A0for help. <br>
[=C2=A0 =C2=A0 14.042] (EE) Please also check the log file at<br>
&quot;/var/log/Xorg.0.log&quot; for additional information. <br>
[=C2=A0 =C2=A0 14.046] (EE) Server terminated with error (1). Closing log f=
ile.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/build=
s/5053/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5053/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/build=
s/5054/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5054/steps/12/logs/=
stdio</a><br>
<br>
3. ptest warning <br>
<br>
AssertionError: Failed ptests:<br>
{&#39;strace&#39;: [&#39;landlock_create_ruleset-y.gen.test&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;landlock_create_ruleset-y.ge=
n&#39;]}<br>
<br>
This is landlock-related, thus perhaps caused by patch 2/8.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/3117/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3117/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/3369/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3369/steps/12/logs/=
stdio</a><br>
<br>
Best regards.<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000036677505dc8b071e--

