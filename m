Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C92C636F9
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.19948.1650123483356016169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 08:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B5lIkIqa;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id bn33so12376917ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hGCSyt+q/9vLknFmBpEiXI9A0LR7yPPdjlujNS8mm8o=;
        b=B5lIkIqaH6jpFcLgN8yLeD9SXXyCfaht4mg1zAP2FBk+5w7tZVsuLZWbbnY8Z4gxj/
         L4IEYe6ySiUhJkFpIZAWkPeD+LbWx0DKXI/FLDG2OEm312f3Jfy7geEwbcnqlOfu36tO
         /Mc9TooP+siTpv4ZzV/8nMKLbcF2hFy1mSTG6gFlEsEK5igilHZzBNvLBQdwIRJICmHM
         PGA8Iq2Zr7lyRtExagjcEX19GWfHPRXF9kqNvyAY27xxGDmImFm32r50aU96kg5CdsVq
         D+3jxa0q8of3pGsU7qKoM+8vLUvGK4eB0M5Ph33ti+VxwnE2EGAHBg4k3xvupDwCxR7F
         9pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hGCSyt+q/9vLknFmBpEiXI9A0LR7yPPdjlujNS8mm8o=;
        b=dDilwoaZnhBtJtkYpOfbp7hiDA17NnPdARJ7p2ZbLQ/+2qEP/7XJZdmTHBx1zltOX6
         gPwgcbnHQd1mliL4awpsaf1hi/Zi5ajMS6A0AiTIMhDMmmskDVG/ZogntajDDq9gzd+o
         a1TbzaXcvm69hgRpHFGUbMzHhRJv9SKwIww1B1xEKkJpndNtZH9DbguoAC2Lu/TBoKHu
         zmN5FlFxe08nEictAR/DMUWqGKZvWjSva3ZnpD2qdGSdFmIH4SVUqWziTv/rm474FK7b
         rAqUqsdVSdFFe/Gmq95+lYsYeNhn/NEhv6PPvTHFTKPnQTbQ0zbOlTeuzhy5ca+hjdpo
         YrTw==
X-Gm-Message-State: AOAM530DwYdm0/9nRMHR/qV2VNzOUNFQ9w8xr3gzj7NXfjdjH9+bONVA
	m2KTbUQT9UnlBzIRguO1b0gNo8SZPdEHXC9fw6g=
X-Google-Smtp-Source: 
 ABdhPJxQQUbAovpELVr3eaiVnebcq4n8XI2O5i2wPThX5uJuIkQRENmCmQu98uYhihepYKnsr8oR58u3HUKC9aSgB1E=
X-Received: by 2002:a05:651c:32e:b0:24a:fc18:723d with SMTP id
 b14-20020a05651c032e00b0024afc18723dmr2283013ljp.216.1650123481532; Sat, 16
 Apr 2022 08:38:01 -0700 (PDT)
MIME-Version: 1.0
References: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
In-Reply-To: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sat, 16 Apr 2022 16:37:49 +0100
Message-ID: 
 <CANPvuR=k=B9GeVwSWjs+z=P2aYE_h=aVSWEEbD0uDK5N8xf5ug@mail.gmail.com>
Subject: Re: [OE-core] Intermittent failure issue summary
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f3caf305dcc74f27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164545

--000000000000f3caf305dcc74f27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia s=C3=A1=
bado,
16/04/2022 =C3=A0(s) 11:26:

> I'm guessing a lot of people don't follow the intermittent issues. I
> therefore
> thought I'd share a summary of some of them along with some random
> thoughts on
> them. There is a mix of different things here, each needing different
> skills.
>
> Systemd daemon-reload unit restart failures:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14787
> AlexK has got part way in figuring out the circumstances of this, any
> systemd
> experts able to spot what I think is a service file dependency issue?
>
> EFI Boot Failure:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14018
> "oe-selftest - efibootpartition.GenericEFITest.test_boot_efi selftest"
> Does anyone know the EFI boot process and know what logging we might add
> to the
> system so we gain more insight when this happens?
>
> Bitbake parsing error:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14665
> "Parsing recipes...ERROR: ParseError in None: Not all recipes parsed,
> parser
> thread killed/died? Exiting" - I just can't spot the logic bug causing th=
is
> error (and some similar variants), maybe someone else can?
>
> sstate files not found:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
> For this one I think we need to write a standalone replica of the tests
> against
> an sstate mirror that sstate.bbclass runs to check if sstate objects
> exist. That
> way we could try different load levels against the project server and see
> whether it is the sstate/fetcher code (which does weird things with
> threads and
> concurrent connections) or if it is the server side of things that has so=
me
> limit we can't spot.
>

Will it be a good idea to raise a warning and do another try for such cases=
?

A timeout on socket seems to me that is server related and the last server
infrastructure migration this timeout issue improves a lot.
Before that last migration I can workaround this timeout issue setting
BB_NUMBER_THREADS=3D1 that will do one connection at a time.
Ding this BB_NUMBER_THREADS=3D1 makes me think that this can be
some race condition with the oe.utils.ThreadedPool that afaik
is only used on the sstate.bbclass.

Jose


> pseudo do_flush_pseudodb task error:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14654
> not sure why this sometimes happens, like need to sport the race in the
> pseudo
> shutdown code.
>
> Memory resident bitbake PR Serv issue:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14786
> This is one of the blocking issues on moving to memory resident bitbake b=
y
> default
>
> x86 boot log serio/CD drive timeout in qemu:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14743
> We've talked about disabling some of the peripherals we don't need/care
> about
> such as psmouse and the CD drive. Anyone fancy digging into this with
> upstream
> qemu? I suspect there are other people who'd like this too.
>
> Bitbake Server timeout:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14201
> This one really needs a rework of bitbake's main loop with a new thread s=
o
> that
> the UI and server can talk even when whatever it is doing (parsing, event
> handlers) is blocked. No takers?! Just thought I'd add to the list! :)
>
>
> These are 8 of the issues and probably the most frequent/annoying or ones
> where
> there is a clearish path forward. The full list of 57:
>
> https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT
>
> (it was over 70 at one point, we've beaten it down a bit)
>
> Cheers,
>
> Richard
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164532):
> https://lists.openembedded.org/g/openembedded-core/message/164532
> Mute This Topic: https://lists.openembedded.org/mt/90503262/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f3caf305dcc74f27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia s=C3=A1bado, 16/04/2022 =C3=A0(s) 11:26:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I&#39;m guessing a lot of peop=
le don&#39;t follow the intermittent issues. I therefore<br>
thought I&#39;d share a summary of some of them along with some random thou=
ghts on<br>
them. There is a mix of different things here, each needing different skill=
s.<br>
<br>
Systemd daemon-reload unit restart failures:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14787" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14787</a><br>
AlexK has got part way in figuring out the circumstances of this, any syste=
md<br>
experts able to spot what I think is a service file dependency issue?<br>
<br>
EFI Boot Failure:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14018" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14018</a><br>
&quot;oe-selftest - efibootpartition.GenericEFITest.test_boot_efi selftest&=
quot;<br>
Does anyone know the EFI boot process and know what logging we might add to=
 the<br>
system so we gain more insight when this happens?<br>
<br>
Bitbake parsing error:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14665" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14665</a><br>
&quot;Parsing recipes...ERROR: ParseError in None: Not all recipes parsed, =
parser<br>
thread killed/died? Exiting&quot; - I just can&#39;t spot the logic bug cau=
sing this<br>
error (and some similar variants), maybe someone else can?<br>
<br>
sstate files not found:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14775</a><br>
For this one I think we need to write a standalone replica of the tests aga=
inst<br>
an sstate mirror that sstate.bbclass runs to check if sstate objects exist.=
 That<br>
way we could try different load levels against the project server and see<b=
r>
whether it is the sstate/fetcher code (which does weird things with threads=
 and<br>
concurrent connections) or if it is the server side of things that has some=
<br>
limit we can&#39;t spot.<br></blockquote><div><br></div><div>Will it be a g=
ood idea to raise a warning and do another try for such cases?</div><div><b=
r></div><div>A timeout on socket seems to me that is server related and the=
 last server</div><div>infrastructure migration this timeout issue improves=
 a lot.</div><div>Before that last migration I can workaround this timeout =
issue setting=C2=A0</div><div>BB_NUMBER_THREADS=3D1 that will do one connec=
tion at a time.</div><div>Ding this BB_NUMBER_THREADS=3D1=C2=A0makes me thi=
nk that this can be</div><div>some race condition=C2=A0with the=C2=A0oe.uti=
ls.ThreadedPool that afaik</div><div>is only used on the sstate.bbclass.</d=
iv><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
pseudo do_flush_pseudodb task error:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14654" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14654</a><br>
not sure why this sometimes happens, like need to sport the race in the pse=
udo<br>
shutdown code.<br>
<br>
Memory resident bitbake PR Serv issue:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14786" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14786</a><br>
This is one of the blocking issues on moving to memory resident bitbake by<=
br>
default<br>
<br>
x86 boot log serio/CD drive timeout in qemu:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14743" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14743</a><br>
We&#39;ve talked about disabling some of the peripherals we don&#39;t need/=
care about<br>
such as psmouse and the CD drive. Anyone fancy digging into this with upstr=
eam<br>
qemu? I suspect there are other people who&#39;d like this too.<br>
<br>
Bitbake Server timeout:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14201" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14201</a><br>
This one really needs a rework of bitbake&#39;s main loop with a new thread=
 so that<br>
the UI and server can talk even when whatever it is doing (parsing, event<b=
r>
handlers) is blocked. No takers?! Just thought I&#39;d add to the list! :)<=
br>
<br>
<br>
These are 8 of the issues and probably the most frequent/annoying or ones w=
here<br>
there is a clearish path forward. The full list of 57:<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-I=
NT" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/=
buglist.cgi?quicksearch=3DAB-INT</a><br>
<br>
(it was over 70 at one point, we&#39;ve beaten it down a bit)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164532): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164532" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164532</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90503262/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90503262/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000f3caf305dcc74f27--

