Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC98C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 13:33:11 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.15129.1670419985955332638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 05:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jG4k/YNM;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id e189so11773068iof.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8iAfij92Tbvx3at0vGPZ6BwjeGB2U1Teytcy2AzFfM0=;
        b=jG4k/YNMimb1yeq58xNbwXeiTppTP8KfoHa0o2xUwfIaGMxOKiZs5Gryunm/EIv82t
         NDKJDoLxiJYmnf/vcUO8AhRX0Td4CrD7dlk7XSct2TeVwKDh1iftFHtcmLwJ0gZ9Yz7W
         onUUDtjaYrXH9vdzKlysuEFDcQhKt226M+C8G4zk+Famat1iRHjZRISuq3VflNP7AItO
         T8wlvgDJiw55Ewi1qRvj5SQLI6bp+Q6tr8yB88wGmkroxv16e9+5HgNM8NnIlbvBfecS
         5xu4/mohDTqIyJsJcQpuzJCBSo0b9su8FFOG1MCBBzUvORM8+WeXZEbJ1tpzQccRlEZD
         FigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iAfij92Tbvx3at0vGPZ6BwjeGB2U1Teytcy2AzFfM0=;
        b=a01tP62QR2RGl2qBhdGkHil00YutRDwmcjg72F3U5nUKseEZEdcTKJEiEBcyX3wtIn
         VlHVA56vEzW9R/f3FG6u+lt00z4T4fa2FcsJaNl5H8xycdqdfqfitutnQ4FYNeUfuP2g
         7zxUwcNr90VOyT5aOn5iZsKDX3FqBJQ9QvR5fQfVwT1u7cg+UaorxOAogND9PnalYEpR
         BNSH9XNi3gkZPLwR+DBCe70ObCQOLJk+6szbjRaORDoKBt54WEaVednp41Zgy5op1eUK
         DdZCq3ZDtTyWFEjNPctt+vWKQxLJcsLvtRJitM2O1Gduy0N/lLrLZypmsvlWfgmFI6Ch
         +laA==
X-Gm-Message-State: ANoB5plReKq/u+zTAki8Svcub8U/Fm3NW9FmmG07oXTU+HDF6pldrGsO
	Lj0ZzZ+21Hf6sphQ0vETNIqYYY+FACePgtfRJVY=
X-Google-Smtp-Source: AA0mqf5Q9rXkPmyS8SGe+2oLafDOM6+dc/4A4iyuXEoupbWBxgY1sXfCmPrDDtiYOpVL6nr+BRCpyu89lghs4JI+uz0=
X-Received: by 2002:a05:6638:4103:b0:375:1a70:9c5c with SMTP id
 ay3-20020a056638410300b003751a709c5cmr38549528jab.129.1670419983758; Wed, 07
 Dec 2022 05:33:03 -0800 (PST)
MIME-Version: 1.0
References: <4793800.31r3eYUQgx@n95hx1g2>
In-Reply-To: <4793800.31r3eYUQgx@n95hx1g2>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Dec 2022 08:32:52 -0500
Message-ID: <CADkTA4PbZStKMiD1wJoxQ0at4Og-fJmDi1am7xozp4gqp_xdJw@mail.gmail.com>
Subject: Re: kernel: export native PKGCONFIG variables
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/related; boundary="000000000000c22ed705ef3cf536"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 13:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174353

--000000000000c22ed705ef3cf536
Content-Type: multipart/alternative; boundary="000000000000c22ed705ef3cf535"

--000000000000c22ed705ef3cf535
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2022 at 2:45 AM Christian Eggers <ceggers@arri.de> wrote:

> Hi Bruce,
>
> on 2021-11-23, you added the following patch:
>
> > 9172d61c57e23682c3d2c25701cbd53c84d01a27
> >
> > kernel: export native PKGCONFIG variables
> >
> > In a similar manner to cml1.bbclass, we export the pkg-config
> > variables to allow a direct call to pkg-config access to the
> > native sysroot versus the target sysroot.
> >
> > The kernel doesn't use pkg-config for target configuration,
> I found some calls in the tools/ directory of the kernel.
> Isn't this related to target configuration?
>

That meant "kernel target configuration", not userspace tools.


>
> > and has many explicit calls to pkg-config, without the
> > possibility of easy override to pkg-config-native.
> I just noticed that this has recently changed:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5
>
> This change is in Linux 6.0, but not in 5.15. Probably it
> could be backported easily.
>

I was aware of that change as well, but what we have works, so there's no
rush to remove that block of code. We support a wide range of kernels and
versions, so it needs to stay in place for some time yet.

Bruce


> >
> > The calls to pkg-config could be made cross friendly via
> > replacement with make variables, but until that effort is
> > undertaken upstream, we need a bridge approach.
> >
> > In particular, this is required for dtschema validation,
> > which is a requirement in kernel 5.16+
>
> regards
> Christian
>
>
>
> _______________________________________________________
> Christian
> Eggers
> Software Engineer
> ARRI
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Arriweg 17 ,
> 83071
> Stephanskirchen
>
>
> *www.arri.com * <http://www.arri.com/>
> *+49 8036 3009-3118* <+49%208036%203009-3118>
> *CEggers@arri.de* <CEggers@arri.de>
>
> [image: Season's Greetings] <https://www.arri.com/en>
> Get all the latest information from *www.arri.com* <https://www.arri.com/=
>
> , *Facebook* <https://www.facebook.com/TeamARRI>, *Twitter*
> <https://twitter.com/ARRIChannel>, *Instagram*
> <https://www.instagram.com/arri/>, *LinkedIn*
> <https://www.linkedin.com/company/arri> and *YouTube*
> <https://www.youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik G=
mbH
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRB 54477
>
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Matthias Erb (Chairman); Dr. Michael Neuh=
=C3=A4user; Stephan Schenk; Walter Trauninger
>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c22ed705ef3cf535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Dec 7, 2022 at 2:45 AM Christian Eggers &lt=
;<a href=3D"mailto:ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Hi Bruce,<br><=
br>on 2021-11-23, you added the following patch:<br><br>&gt; 9172d61c57e236=
82c3d2c25701cbd53c84d01a27<br>&gt;<br>&gt; kernel: export native PKGCONFIG =
variables<br>&gt;<br>&gt; In a similar manner to cml1.bbclass, we export th=
e pkg-config<br>&gt; variables to allow a direct call to pkg-config access =
to the<br>&gt; native sysroot versus the target sysroot.<br>&gt; <br>&gt; T=
he kernel doesn&#39;t use pkg-config for target configuration,<br>I found s=
ome calls in the tools/ directory of the kernel.<br>Isn&#39;t this related =
to target configuration?<br></div></div></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">That meant &quot;kerne=
l target configuration&quot;, not userspace tools.</div></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><br>&gt; an=
d has many explicit calls to pkg-config, without the<br>&gt; possibility of=
 easy override to pkg-config-native.<br>I just noticed that this has recent=
ly changed:<br><br><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5=
" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5</a><br><b=
r>This change is in Linux 6.0, but not in 5.15. Probably it<br>could be bac=
kported easily.<br></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I was aware of that change as =
well, but what we have works, so there&#39;s no rush to remove that block o=
f code. We support a wide range of kernels and versions, so it needs to sta=
y in place for some time yet.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Bruce</div></div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div><div><br>&gt; <br>&gt; The calls to pkg-config could be ma=
de cross friendly via<br>&gt; replacement with make variables, but until th=
at effort is<br>&gt; undertaken upstream, we need a bridge approach.<br>&gt=
; <br>&gt; In particular, this is required for dtschema validation,<br>&gt;=
 which is a requirement in kernel 5.16+<br><br>regards<br>Christian<br><br>=
<br><br></div><div dir=3D"ltr" style=3D"font-size:1px;direction:ltr"><table=
 cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-=
size:1px"><tbody><tr style=3D"font-size:0px"><td align=3D"left" style=3D"ve=
rtical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"font-size:0px"><tbody><tr style=3D"font-size:0px"><td align=3D"left=
" style=3D"padding:0px;vertical-align:top"><table cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" style=3D"width:100%;font-size:0px"><tbody><tr style=
=3D"font-size:14.67px;color:rgb(127,127,127);font-style:normal;font-weight:=
400;white-space:nowrap"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Calibri,Arial,sans-serif">_________________________________________=
______________<span style=3D"font-family:remialcxesans;font-size:1px;color:=
rgb(255,255,255);line-height:1px"></span></td></tr><tr style=3D"font-size:0=
px"><td align=3D"left" style=3D"vertical-align:top"><table cellpadding=3D"0=
" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px"><tbody><tr style=
=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:top"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px;colo=
r:rgb(127,127,127);font-style:normal;font-weight:400;white-space:nowrap"><t=
body><tr style=3D"font-size:14.67px"><td align=3D"left" style=3D"vertical-a=
lign:top;font-family:Calibri,Arial,sans-serif">Christian</td><td align=3D"l=
eft" style=3D"vertical-align:top;color:rgb(0,0,1);font-family:Calibri,Arial=
,sans-serif">=C2=A0<br></td><td align=3D"left" style=3D"vertical-align:top;=
font-family:Calibri,Arial,sans-serif">Eggers</td></tr></tbody></table></td>=
</tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align=
:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font=
-size:0px;color:rgb(127,127,127);font-style:normal;font-weight:400;white-sp=
ace:nowrap"><tbody><tr style=3D"font-size:14.67px"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif">Software=C2=A0=
Engineer</td></tr><tr style=3D"font-size:14.67px;color:rgb(0,0,1)"><td alig=
n=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif=
"></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr style=
=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:top"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px"><tb=
ody><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:=
top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-=
size:0px;color:rgb(14,80,173);font-style:normal;font-weight:400;white-space=
:nowrap"><tbody><tr style=3D"font-size:13.33px"><td align=3D"left" style=3D=
"vertical-align:top;font-family:&quot;Arial Black&quot;">ARRI</td></tr><tr =
style=3D"font-size:10.67px;color:rgb(127,127,127)"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Arial"><span style=3D"font-size:11px">Ar=
nold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&amp;=C2=
=A0Co.=C2=A0Betriebs=C2=A0KG</span>=C2=A0<br></td></tr></tbody></table></td=
></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-alig=
n:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fon=
t-size:0px;color:rgb(127,127,127);font-style:normal;font-weight:400;white-s=
pace:nowrap"><tbody><tr style=3D"font-size:10.67px"><td align=3D"left" styl=
e=3D"vertical-align:top;font-family:Arial">Arriweg=C2=A017</td><td align=3D=
"left" style=3D"vertical-align:top;font-family:Arial">,=C2=A0<br></td><td a=
lign=3D"left" style=3D"vertical-align:middle;font-family:Arial">83071</td><=
td align=3D"left" style=3D"vertical-align:middle;font-family:Arial">=C2=A0<=
br></td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial=
">Stephanskirchen</td></tr></tbody></table></td></tr></tbody></table></td><=
/tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:=
top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-=
size:0px"><tbody><tr style=3D"font-size:0px"><td align=3D"left" style=3D"ve=
rtical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"font-size:0px;color:rgb(21,50,185);font-style:normal;font-weight:40=
0;white-space:nowrap"><tbody><tr style=3D"font-size:11px"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Arial"><span style=3D"text-decora=
tion:underline"><a href=3D"http://www.arri.com/" id=3D"m_-43951952512430160=
20LPlnk689713" style=3D"text-decoration:underline;color:rgb(21,50,185)" tar=
get=3D"_blank"><strong style=3D"font-weight:400">www.arri.com=C2=A0<br><br>=
</strong></a></span></td></tr><tr style=3D"font-size:0px"><td align=3D"left=
" style=3D"vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0px;color:rgb(133,128,128);font-style:normal=
;font-weight:400;line-height:normal;white-space:nowrap"><tbody><tr style=3D=
"font-size:14.67px"><td align=3D"left" style=3D"padding:0px;vertical-align:=
top;font-size:0px"><img src=3D"cid:184ecc70cadd9c7979b1" width=3D"20" borde=
r=3D"0" alt=3D"" style=3D"width: 20px; min-width: 20px; max-width: 20px; fo=
nt-size: 0px;"></td><td align=3D"left" style=3D"padding:0px;vertical-align:=
top;font-family:Calibri,Arial,sans-serif"><a href=3D"tel:+49%208036%203009-=
3118" id=3D"m_-4395195251243016020LPlnk689713" style=3D"text-decoration:non=
e;color:rgb(133,128,128)" target=3D"_blank"><strong style=3D"font-weight:40=
0">+49=C2=A08036=C2=A03009-3118</strong></a></td></tr><tr style=3D"font-siz=
e:0px"><td align=3D"left" style=3D"padding:0px;vertical-align:top"></td><td=
 align=3D"left" style=3D"padding:0px;vertical-align:top"></td></tr><tr styl=
e=3D"font-size:0px"><td align=3D"left" style=3D"padding:0px;vertical-align:=
top"></td><td align=3D"left" style=3D"padding:0px;vertical-align:top"></td>=
</tr><tr style=3D"font-size:14.67px"><td align=3D"left" style=3D"padding:0p=
x;vertical-align:top;font-size:0px"><img src=3D"cid:184ecc70cad4d1ce55c2" w=
idth=3D"20" border=3D"0" alt=3D"" style=3D"width: 20px; min-width: 20px; ma=
x-width: 20px; font-size: 0px;"></td><td align=3D"left" style=3D"padding:0p=
x;vertical-align:top;font-family:Calibri,Arial,sans-serif"><a href=3D"mailt=
o:CEggers@arri.de" id=3D"m_-4395195251243016020LPlnk689713" style=3D"text-d=
ecoration:none;color:rgb(133,128,128)" target=3D"_blank"><strong style=3D"f=
ont-weight:400">CEggers@arri.de</strong></a></td></tr></tbody></table></td>=
</tr></tbody></table></td></tr></tbody></table></td></tr><tr style=3D"font-=
size:14.67px;color:rgb(0,0,1);font-style:normal;font-weight:400;white-space=
:nowrap"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri=
,Arial,sans-serif"><br></td></tr></tbody></table></td></tr><tr style=3D"fon=
t-size:0px;line-height:normal"><td align=3D"left" style=3D"padding:0px;vert=
ical-align:top"><a href=3D"https://www.arri.com/en" id=3D"m_-43951952512430=
16020LPlnk689713" style=3D"text-decoration:none" target=3D"_blank"><img src=
=3D"https://assets.arri.com/media/sign/2022_11-17_E-mail_signature_-_xmas_-=
_Retina__-_02.jpg" width=3D"466" height=3D"205" border=3D"0" title=3D"Seaso=
n&#39;s Greetings" alt=3D"Season&#39;s Greetings" style=3D"width: 466px; mi=
n-width: 466px; max-width: 466px; height: 205px; min-height: 205px; max-hei=
ght: 205px; font-size: 12px;"></a></td></tr><tr style=3D"font-size:13px;col=
or:rgb(127,127,127);font-style:normal;font-weight:400;white-space:nowrap"><=
td align=3D"left" style=3D"padding:0px;vertical-align:top;font-family:Calib=
ri,Arial,sans-serif">Get=C2=A0all=C2=A0the=C2=A0latest=C2=A0information=C2=
=A0from=C2=A0<span style=3D"text-decoration:underline"><a href=3D"https://w=
ww.arri.com/" id=3D"m_-4395195251243016020LPlnk689713" style=3D"text-decora=
tion:underline;color:rgb(127,127,127)" target=3D"_blank"><strong style=3D"f=
ont-weight:400">www.arri.com</strong></a></span>,=C2=A0<span style=3D"text-=
decoration:underline"><a href=3D"https://www.facebook.com/TeamARRI" id=3D"m=
_-4395195251243016020LPlnk689713" style=3D"text-decoration:underline;color:=
rgb(127,127,127)" target=3D"_blank"><strong style=3D"font-weight:400">Faceb=
ook</strong></a></span>,=C2=A0<span style=3D"text-decoration:underline"><a =
href=3D"https://twitter.com/ARRIChannel" id=3D"m_-4395195251243016020LPlnk6=
89713" style=3D"text-decoration:none;color:rgb(127,127,127)" target=3D"_bla=
nk"><strong style=3D"font-weight:400">Twitter</strong></a></span>,=C2=A0<a =
href=3D"https://www.instagram.com/arri/" id=3D"m_-4395195251243016020LPlnk6=
89713" style=3D"text-decoration:none;color:rgb(127,127,127)" target=3D"_bla=
nk"><strong style=3D"font-weight:400"><span style=3D"text-decoration:underl=
ine">Instagram</span></strong></a>,=C2=A0<a href=3D"https://www.linkedin.co=
m/company/arri" id=3D"m_-4395195251243016020LPlnk689713" style=3D"text-deco=
ration:none;color:rgb(127,127,127)" target=3D"_blank"><strong style=3D"font=
-weight:400"><span style=3D"text-decoration:underline">LinkedIn</span></str=
ong></a>=C2=A0and=C2=A0<a href=3D"https://www.youtube.com/user/ARRIChannel"=
 id=3D"m_-4395195251243016020LPlnk689713" style=3D"text-decoration:none;col=
or:rgb(127,127,127)" target=3D"_blank"><strong style=3D"font-weight:400"><s=
pan style=3D"text-decoration:underline">YouTube</span></strong></a>.<br></t=
d></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"padding:0px;=
vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0"=
 style=3D"font-size:0px;color:rgb(106,106,106);font-style:normal;font-weigh=
t:400;white-space:nowrap"><tbody><tr style=3D"font-size:10px"><td align=3D"=
left" style=3D"vertical-align:top;font-family:Arial"><br>Arnold=C2=A0&amp;=
=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&amp;=C2=A0Co.=C2=A0Bet=
riebs=C2=A0KG<br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registergerich=
t:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregisternu=
mmer:=C2=A0HRA=C2=A057918<br>Pers=C3=B6nlich=C2=A0haftender=C2=A0Gesellscha=
fter:=C2=A0Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH<=
br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registergericht:=C2=A0Amtsge=
richt=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregisternummer:=C2=A0HRB=
=C2=A054477<br>Gesch=C3=A4ftsf=C3=BChrer:=C2=A0Dr.=C2=A0Matthias=C2=A0Erb=
=C2=A0(Chairman);=C2=A0Dr.=C2=A0Michael=C2=A0Neuh=C3=A4user;=C2=A0Stephan=
=C2=A0Schenk;=C2=A0Walter=C2=A0Trauninger<br></td></tr><tr style=3D"font-si=
ze:14.67px;color:rgb(0,0,1)"><td align=3D"left" style=3D"vertical-align:top=
;font-family:Calibri,Arial,sans-serif"><br><br></td></tr></tbody></table></=
td></tr></tbody></table></td></tr></tbody></table></div></div></blockquote>=
</div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature">- Thou shalt not follow the NULL pointer, for chaos and madne=
ss await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, St=
ar Trek II<br><br></div></div>

--000000000000c22ed705ef3cf535--

--000000000000c22ed705ef3cf536
Content-Type: image/png; name="image336616.png"
Content-Disposition: inline; filename="image336616.png"
Content-Transfer-Encoding: base64
Content-ID: <184ecc70cadd9c7979b1>
X-Attachment-Id: 184ecc70cadd9c7979b1

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC
--000000000000c22ed705ef3cf536
Content-Type: image/png; name="image460246.png"
Content-Disposition: inline; filename="image460246.png"
Content-Transfer-Encoding: base64
Content-ID: <184ecc70cad4d1ce55c2>
X-Attachment-Id: 184ecc70cad4d1ce55c2

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=
--000000000000c22ed705ef3cf536--

