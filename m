Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2555AC6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 05:31:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.1203.1680845495114915194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 22:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NYH2EsBU;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id bd22so468267ljb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 22:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680845493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u8Ha/Rt7vZEvXeq//FKiA4gPLom34w2/RqVS5FdG3E8=;
        b=NYH2EsBU/ixECokYpb5Rp8nj/G330aJ+8Xz3hTQVPvy5glcxWyZfMuXVrn4LVjzpGS
         3Yi9ITTTl8zRmaqqJ87VLARmgTz64ry0IWuf0ge9mORVWUuM3ktnphMhrz3xuDK2L1lL
         /AoqVsjETG9l+DJXjoJCTbeBck/VZCJZ8tC0yF4JQN4dW4vgAE4XBekURgZB5rgxI10p
         ze3NalK1z5ChWgEyocsLbBtYcTp949RFW0URxTLHu9he21eOCX+WODzl/ln6vYU68494
         z4wreCxzp0LfNr2cHJcYVjUgdnsuBC6QkCWL7+ntRjsyK3Lyl44EmLvDOH+g7EafqPc1
         X/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680845493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8Ha/Rt7vZEvXeq//FKiA4gPLom34w2/RqVS5FdG3E8=;
        b=2yz5AKvpdCuvIBCvDGYRjyQ/60+1HAZmNnUgBi8aG9EGh5L4wW9/oO1YIVv4HkV8fK
         J2mB5uDz9AerA/p9RbhMC7yeJB9GPoiwarJtpZchZZgmmJHPsQ7iSEfc5PBYsugpvRJ7
         sZijn8ijCfnqEN5mKnY+z9DwYTZtQeV8Js/Tka4t3VuTXDoK6QuGRhg0Ch5M39q1mtiD
         h4orQW7IEr8rw6RERUEks3gerPgkNAayST0gO4TK5jYbZ5xiz9nCO0GGm8bG4c2Va6PS
         ByEDvoU+4Qg1qRCOLJqkNk5qa2vdlC8UCzKhp4qyTeRGM0Iq5rEnVQJVmR7tn9CM3DLU
         k+yA==
X-Gm-Message-State: AAQBX9f5RpkxrSxEuq3dAvO1eKBx52tPXLMT12SnrznaUrWTyGyMAXHD
	pXOJ2/Jx+IJmnjg1KZ/DGyj8mst1oGXCU9wMtZY=
X-Google-Smtp-Source: AKy350brQFLS+92Pfqi1Xn4ktzPCsZeaPo/uWa66hOAsOrEd2IzRE2bAPqlXLIjlbLLTQWMIcZrAjX2j0ZSq2HgGPx0=
X-Received: by 2002:a2e:8001:0:b0:29a:9053:ed1b with SMTP id
 j1-20020a2e8001000000b0029a9053ed1bmr256034ljg.3.1680845492860; Thu, 06 Apr
 2023 22:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkep4o0Ep2VfZrq0jTn_gXvdBuZ9rYC7OgXMCfCHXBf68rg@mail.gmail.com>
 <710f9e33-42fa-ccd7-7ec1-c8a67c19579e@mvista.com>
In-Reply-To: <710f9e33-42fa-ccd7-7ec1-c8a67c19579e@mvista.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 7 Apr 2023 07:31:21 +0200
Message-ID: <CA+cAkepcY_WBkHiiXKesOvb1C9CcBUBjU2BU+E83Tc1CxBdzZw@mail.gmail.com>
Subject: Re: [OE-core][dunfell] qemu-system-native build failure
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org, 
	"steve@sakoman.com" <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000863c1505f8b85699"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179813

--000000000000863c1505f8b85699
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok great, I'll wait for this one to be included in dunfell then.

Thanks.

On Fri, 7 Apr 2023 at 07:26, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> There is already a patch in dunfell-next to resolve the issue..
>
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/dunfell-nut&id=3Dd17f4c741c66268ce54ff89be2be9b0402c98df2
>
> On 4/6/2023 10:16 PM, Frederic Martinsons wrote:
> > Hello,
> >
> > I came across a build issue for qemu-system-native on dunfell branch
> > when using spice PACKAGECONFIG.
> > I found that the culprit is the CVE-2022-4144.patch introduced
> > mid-march and that was merged in upstream
> > end of november 2022:
> >
> https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65=
bd6f3d1e1f622
> >
> > because it misses a variable declaration:
> >
> > |   CC      hw/dma/xlnx-zynq-devcfg.o
> > |   CC      hw/dma/xlnx-zdma.o
> > |   CC      hw/dma/bcm2835_dma.o
> > |   CC      hw/gpio/max7310.o
> > |   CC      hw/gpio/pl061.o
> > | /home/test/qemu-4.2.0/hw/display/qxl.c: In function =E2=80=98qxl_phys=
2virt=E2=80=99:
> > | /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: error: =E2=80=98size=
=E2=80=99
> > undeclared (first use in this function); did you mean =E2=80=98gsize=E2=
=80=99?
> > |  1508 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot,
> > &offset, size)) {
> > |           |                                             ^~~~
> > |           |                                             gsize
> > | /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: note: each
> > undeclared identifier is reported only once for each function it
> > appears in
> > | make: *** [/home/test/qemu-4.2.0/rules.mak:69: hw/display/qxl.o] Erro=
r
> 1
> > | make: *** Waiting for unfinished jobs....
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> >
> > Looking more to the qemu git, I think the backported CVE is not an
> > atomic commit one
> > and is a part of larger patches series, it needs at least this one:
> >
> https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a=
35806ece9b39f
> > to be able to build.
> >
> > Moreover, I saw 5 commits that were merged by the same issuer and that
> > seems to
> > be related to the same code path.
> >
> > Can someone who knows qemu give advice on what to do ?
> > Modify the single CVE patch ? take the other commit which corrects the
> > mistake ? take the whole 5 commits ?
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179811):
> https://lists.openembedded.org/g/openembedded-core/message/179811
> > Mute This Topic: https://lists.openembedded.org/mt/98120051/2167262
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jpuhlman@mvista.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000863c1505f8b85699
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok great, I&#39;ll wait for this one to be included in dun=
fell then.<div><br></div><div>Thanks.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 7 Apr 2023 at 07:26, Jer=
emy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com">jpuhlman@mvista.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
here is already a patch in dunfell-next to resolve the issue..<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dstable/dunfell-nut&amp;id=3Dd17f4c741c66268ce54ff89be2be9b0402c98df2" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core-contrib/commit/?h=3Dstable/dunfell-nut&amp;id=3Dd17f4c741c66268ce54f=
f89be2be9b0402c98df2</a><br>
<br>
On 4/6/2023 10:16 PM, Frederic Martinsons wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I came across=C2=A0a build issue for qemu-system-native on dunfell bra=
nch <br>
&gt; when using spice PACKAGECONFIG.<br>
&gt; I found that the culprit is the=C2=A0CVE-2022-4144.patch introduced <b=
r>
&gt; mid-march and that was merged in upstream<br>
&gt; end of=C2=A0november 2022:<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6=
f1b7d8a3251a65bd6f3d1e1f622" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f6=
22</a><br>
&gt;<br>
&gt; because it misses a variable declaration:<br>
&gt;<br>
&gt; | =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/dma/xlnx-zynq-devcfg.o<br>
&gt; | =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/dma/xlnx-zdma.o<br>
&gt; | =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/dma/bcm2835_dma.o<br>
&gt; | =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/gpio/max7310.o<br>
&gt; | =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/gpio/pl061.o<br>
&gt; | /home/test/qemu-4.2.0/hw/display/qxl.c: In function =E2=80=98qxl_phy=
s2virt=E2=80=99:<br>
&gt; | /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: error: =E2=80=98size=
=E2=80=99 <br>
&gt; undeclared (first use in this function); did you mean =E2=80=98gsize=
=E2=80=99?<br>
&gt; | =C2=A01508 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_check_slot_off=
set(qxl, pqxl, &amp;slot, <br>
&gt; &amp;offset, size)) {<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gsize<br>
&gt; | /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: note: each <br>
&gt; undeclared identifier is reported only once for each function it <br>
&gt; appears in<br>
&gt; | make: *** [/home/test/qemu-4.2.0/rules.mak:69: hw/display/qxl.o] Err=
or 1<br>
&gt; | make: *** Waiting for unfinished jobs....<br>
&gt; | ERROR: oe_runmake failed<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt; Looking more to the qemu git, I think the backported CVE is not an <br=
>
&gt; atomic commit one<br>
&gt; and is a part of larger patches series, it needs at least this one:<br=
>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1=
e75a7ebf6e325a35806ece9b39f" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b3=
9f</a><br>
&gt; to be able to build.<br>
&gt;<br>
&gt; Moreover, I saw 5 commits that were merged by the same issuer and that=
 <br>
&gt; seems to<br>
&gt; be related to the same code path.<br>
&gt;<br>
&gt; Can someone who knows qemu give advice on what to do ?<br>
&gt; Modify the single CVE patch ? take the other commit which corrects the=
 <br>
&gt; mistake ? take the whole 5 commits ?<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179811): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179811" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/179811</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98120051=
/2167262" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98120051/2167262</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:jpuhlman@mvista.com" =
target=3D"_blank">jpuhlman@mvista.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000863c1505f8b85699--

