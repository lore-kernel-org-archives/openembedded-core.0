Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD3C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 23:02:40 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.1533.1635462159357801710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 16:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hKb9hGcj;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id s1so6008503qta.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 16:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Niitu04BcJFyPiZq1NXjmRBUfyjD3hDaH9m2n9kMpcA=;
        b=hKb9hGcjbbipOoO0HPm8ks1C3fft4U4rXbfxw9sCrotlJET6Cv9uRlKZTDa6ZqYLl4
         xF9VnSEPKXPLPe56/kkwoCEi2+jWNpyZeeIFdnoDEU3KLdSGCQ3TANokddklX1q5395u
         wVsjgBwUDhP33mek0HQvVmwWK2tNeDGOChs/AvPIIH9hkjXgV5illVVpwwoEIEbokk+x
         0QkOwJFNPbeAFm4Bf8DzBjcQiWDS+Ab0WcaezgADSO+L4S5xdwv4t3tYQ2PTx3s3de5v
         lRHiyQ7MJXPeof7G5KQikDMEhmASiIrIgZPgk7qvW5WzqlZ7gbEuDu933DrYSiY2uWTl
         B3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Niitu04BcJFyPiZq1NXjmRBUfyjD3hDaH9m2n9kMpcA=;
        b=JW/rD2kKk7+DMKpq/uwiUG3lXCxMRrcMweQWfWk87l2tIjWWg8zZ3LCXTAzG1at81V
         lC8UquS/XibXqO/l7FC3X9qrmlgHf3Fk+IZUmh59aSgP9VdEoesPdeMSH5bNm8t/AEls
         2EWi9t+c7VwrJTECIGSnhZ7eLFwfyC04nNhEtoie+TGRAuzO50mYtcdYwXuIy+ruTfAM
         hym75vU5Eh7ftUtrkSOMmituPD0I4LEt7bGG+LGgwhzSBPmSo74x7G9aGY9wWj1/0raV
         Tc0bPZYqmSCnONt6EITif35MQsBfsJchC3mdjmJ0sAEFvV+syUfwtpFD/1UToZHrGC9A
         Avjw==
X-Gm-Message-State: AOAM530EcORev6C3F8o7X/uLSfmpvkbWgJ2CDWHf+1tnh/bxyYScuJ5S
	XyUfn+DYc9Kj0Z1kthBX/ZzRHqyO9PSsHBsg2EG3EUFR
X-Google-Smtp-Source: 
 ABdhPJxHM1MVAgVvuohScaFK3dpAplRla2NRyg9hvw/TsYOEfCXgMFJnsZStxfrtOJOqFe+I1ThWSenW3Z/jcicrTW0=
X-Received: by 2002:ac8:1e0b:: with SMTP id n11mr7705128qtl.274.1635462158349;
 Thu, 28 Oct 2021 16:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211027185405.3939665-1-raj.khem@gmail.com>
 <YXsYakP5+N8KLUuV@piout.net>
In-Reply-To: <YXsYakP5+N8KLUuV@piout.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2021 16:02:27 -0700
Message-ID: 
 <CAMKF1so90E+1AZgos0avirgn4BKOswGVsmzpV1JuUXTJszkuVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Update to tip of trunk
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fdf83105cf71b4e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 23:02:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157615

--000000000000fdf83105cf71b4e1
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 2:38 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hey Khem,
>
> I believe this is the cause of:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4268/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4266/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4252/steps/13/logs/stdio
>
> [   82.973565] python3[11480]: segfault at 1 ip bfcee8d4 sp bfcee63c error
> 6
> [   82.974156] Code: ce bf e6 08 c9 b6 3c ea ce bf 0f 00 00 00 08 00 00 00
> d4 e8 ce bf 80 04 c9 b6 8c 33 73 b4 01 00 00 00 f0 da ce b6 fc 74 75 b4
> <30> 16 d0 b6 00 00 00 00 c3 17 ed 1f c0 45 7a b4 a6 08 c9 b6 f8 9b
> [   85.101543] traps: python3[11550] trap invalid opcode ip:bfe4fe5c
> sp:bfe4fbfc error:0
> [   86.683349] python3[11620]: segfault at bf95ea71 ip bf953234 sp
> bf952f9c error 6
> [   86.683997] Code: 95 bf e6 98 c6 b6 9c 33 95 bf 02 00 00 00 08 00 00 00
> 34 32 95 bf 80 94 c6 b6 68 9b 81 b4 01 00 00 00 f0 6a cc b6 40 31 77 b4
> <30> a6 cd b6 00 00 00 00 46 59 6a 4e f0 9e 78 b4 a6 98 c6 b6 f8 2b
> [   88.255210] python3[11690]: segfault at bfd95459 ip bfd89c14 sp
> bfd8997c error 6
> [   88.255927] Code: d8 bf e6 78 ce b6 7c 9d d8 bf 02 00 00 00 08 00 00 00
> 14 9c d8 bf 80 74 ce b6 98 7b 89 b4 01 00 00 00 f0 4a d4 b6 10 91 80 b4
> <30> 86 d5 b6 00 00 00 00 ce 99 0a 2d 50 f4 93 b4 a6 78 ce b6 f8 0b
> [   91.137778] traps: python3[11760] general protection fault ip:bfe6b9b8
> sp:bfe6b71c error:4790
>
> Sounds fun :/


Interesting, my tests were with clang and I did not observe this locally I
will try to dig down and see what could be causing it

>
>
> On 27/10/2021 11:54:05-0700, Khem Raj wrote:
> > This brings following fixes
> >
> > * b76f37fd add qsort_r and make qsort a wrapper around it
> > * 7be59733 add SPE FPU support to powerpc-sf
> > * e3e7189c fix undefined behavior in getdelim via null pointer
> arithmetic and memcpy
> > * b713b8b2 fix excessively slow TLS performance on some mips models
> > * 3eed6a6f fix error checking in pthread_getname_np
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> > index 06b0e060d0..82fd9e9079 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV = "3f701faace7addc75d16dea8a6cd769fa5b3f260"
> > +SRCREV = "b76f37fd5625d038141b52184956fb4b7838e9a5"
> >
> >  BASEVER = "1.2.2"
> >
> > --
> > 2.33.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157565):
> https://lists.openembedded.org/g/openembedded-core/message/157565
> > Mute This Topic: https://lists.openembedded.org/mt/86635702/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000fdf83105cf71b4e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 28, 2021 at 2:38 PM Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Khem,<br>
<br>
I believe this is the cause of:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/4268/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4268/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/4266/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4266/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/4252/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4252/steps/13/logs/=
stdio</a><br>
<br>
[=C2=A0 =C2=A082.973565] python3[11480]: segfault at 1 ip bfcee8d4 sp bfcee=
63c error 6<br>
[=C2=A0 =C2=A082.974156] Code: ce bf e6 08 c9 b6 3c ea ce bf 0f 00 00 00 08=
 00 00 00 d4 e8 ce bf 80 04 c9 b6 8c 33 73 b4 01 00 00 00 f0 da ce b6 fc 74=
 75 b4 &lt;30&gt; 16 d0 b6 00 00 00 00 c3 17 ed 1f c0 45 7a b4 a6 08 c9 b6 =
f8 9b<br>
[=C2=A0 =C2=A085.101543] traps: python3[11550] trap invalid opcode ip:bfe4f=
e5c sp:bfe4fbfc error:0<br>
[=C2=A0 =C2=A086.683349] python3[11620]: segfault at bf95ea71 ip bf953234 s=
p bf952f9c error 6<br>
[=C2=A0 =C2=A086.683997] Code: 95 bf e6 98 c6 b6 9c 33 95 bf 02 00 00 00 08=
 00 00 00 34 32 95 bf 80 94 c6 b6 68 9b 81 b4 01 00 00 00 f0 6a cc b6 40 31=
 77 b4 &lt;30&gt; a6 cd b6 00 00 00 00 46 59 6a 4e f0 9e 78 b4 a6 98 c6 b6 =
f8 2b<br>
[=C2=A0 =C2=A088.255210] python3[11690]: segfault at bfd95459 ip bfd89c14 s=
p bfd8997c error 6<br>
[=C2=A0 =C2=A088.255927] Code: d8 bf e6 78 ce b6 7c 9d d8 bf 02 00 00 00 08=
 00 00 00 14 9c d8 bf 80 74 ce b6 98 7b 89 b4 01 00 00 00 f0 4a d4 b6 10 91=
 80 b4 &lt;30&gt; 86 d5 b6 00 00 00 00 ce 99 0a 2d 50 f4 93 b4 a6 78 ce b6 =
f8 0b<br>
[=C2=A0 =C2=A091.137778] traps: python3[11760] general protection fault ip:=
bfe6b9b8 sp:bfe6b71c error:4790<br>
<br>
Sounds fun :/</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Int=
eresting, my tests were with clang and I did not observe this locally I wil=
l try to dig down and see what could be causing it=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex" dir=3D"auto"><br>
<br>
On 27/10/2021 11:54:05-0700, Khem Raj wrote:<br>
&gt; This brings following fixes<br>
&gt; <br>
&gt; * b76f37fd add qsort_r and make qsort a wrapper around it<br>
&gt; * 7be59733 add SPE FPU support to powerpc-sf<br>
&gt; * e3e7189c fix undefined behavior in getdelim via null pointer arithme=
tic and memcpy<br>
&gt; * b713b8b2 fix excessively slow TLS performance on some mips models<br=
>
&gt; * 3eed6a6f fix error checking in pthread_getname_np<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">musl_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=
=3D"noreferrer" target=3D"_blank">musl_git.bb</a> b/meta/recipes-core/musl/=
<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_gi=
t.bb</a><br>
&gt; index 06b0e060d0..82fd9e9079 100644<br>
&gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">musl_git.bb</a><br>
&gt; +++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">musl_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 require musl.inc<br>
&gt;=C2=A0 inherit linuxloader<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;3f701faace7addc75d16dea8a6cd769fa5b3f260&quot;<br>
&gt; +SRCREV =3D &quot;b76f37fd5625d038141b52184956fb4b7838e9a5&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 BASEVER =3D &quot;1.2.2&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.33.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157565): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157565" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157565</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86635702=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86635702/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000fdf83105cf71b4e1--

