Return-Path: <mickael.delanoe@aquassay.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A19AC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:35:02 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web09.9930.1638527700373411559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 02:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aquassay-com.20210112.gappssmtp.com header.s=20210112
 header.b=YerD8b+q;
 spf=softfail (domain: aquassay.com, ip: 209.85.219.178,
 mailfrom: mickael.delanoe@aquassay.com)
Received: by mail-yb1-f178.google.com with SMTP id f9so7930568ybq.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 02:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aquassay-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ug8Sxb6sQUpY90UiWY+39KV5X6QEsm6ici/g5Euyk8c=;
        b=YerD8b+q/Dqltw2VdZ2RLHF6zweYPCuEbNYQIlej5faD1qEiYBoEn2B2mJOUq5Magu
         oQ/HbQLIbjigXBWpXHPNDhFeUbTD7kWo8fAkrbUEOIKyGuZVzivDWbRd7alCXpSOzBdz
         PjqL4J503/8wzQmDM3l4aFlSDh4nFQujiZ+DPt1APOCv8laRUYmRzdf6BrwNwsSHMJL6
         SJ4nqvdShdIAiLfk3EslSesnm7cd8zEC8EkonYGj0LSaHER+zv/GLhazk7/BFXfzdMtf
         b96C8HsHUEzQ4LNyKB+WzbF6F5lyM76KCgBb5SLlugxf7HvcDJg0deD9iOmhqTJAUfBr
         h+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ug8Sxb6sQUpY90UiWY+39KV5X6QEsm6ici/g5Euyk8c=;
        b=xRjg3HRZo/eg3hlI++MZjJBSB8r4DAi57K6OS8zHJBVqPX7GzykZ/1tS6Ynv52MCGl
         Z0qUIJkTeD94oJ6RydUwkRcz/pCuiVeIIBD12rBHYc85U4xMaTX3fwJOpy43vu65M4Zv
         +tn1SwnGTrWMlZTe3K0ecJw7glwnqv+M0IXvSxpRvHBDQwHB2pdSXeEDn/dwPBrmaqHa
         GFzl5oOMgyCQO3GOAK4YRdjjQ419ATznOIxhCiUWnp+/ggypfX1ahz43ahitWBCqoPCy
         QFK8Dg3wjF4BlEgDwS4wEP+Nq7vakR9smCNCAJPOqtqInlz232/3l9GdmmxliS3A+OfE
         kKAA==
X-Gm-Message-State: AOAM531JUe2wcLZILPJuC3Cj5ndMovOEftoddCB7D3uJwjlKBDBUd3d/
	D2Z8x5TxS2ncAnwvz6sITTQz2mFCbxosFSU71YD1lRPGaSQBalBu
X-Google-Smtp-Source: 
 ABdhPJy3BCYib37yPpzFyCG9uT8eBdP9gna520bZMcYx1ujpBGDKU4oePlg7+ac9WdCsRsElYvqEJ01VM1YK8EqJ2fY=
X-Received: by 2002:a25:b3c2:: with SMTP id x2mr20904698ybf.565.1638527699470;
 Fri, 03 Dec 2021 02:34:59 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWlja2HDq2wgRGVsYW5vw6s=?= <mickael.delanoe@aquassay.com>
Date: Fri, 3 Dec 2021 11:34:48 +0100
Message-ID: 
 <CA+3qsbMgZ=t1LDFB-ya6t87PPpPHOB0kzNMGRNcaun4hxaccTQ@mail.gmail.com>
Subject: [Isar] bbclass for Debian
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007b60a005d23b75df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 10:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159114

--0000000000007b60a005d23b75df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I try to adapt my personal Yocto meta to Isar Project.

Currently, I try to add "minimalmodbus" recipie, and for this, I need
"python-pyserial".
And for "python-pyserial" I need "setutools3"
inherit setuptools3

So I added "setuptools3.bbclass" on my project. But after this, I need
other and other classes...

And I asked myself if I use the right ".bbclass" from the right
"openembedded-core" branch.

In fact, as I worked with Krogoth distrimution to my previous Yocto
Project, I used bbclass from this branch too for my new Isar Project. But
Isar is based to Debian so it's maybe not the right way...

Do you know which branch I should used for compatible with Debian
distribution ?

Best Regards,
--=20
Micka=C3=ABl Delano=C3=AB
Ing=C3=A9nieur d'=C3=A9tudes | Design Engineer
T. +33 (0)5 87 03 80 58
E. mickael.delanoe@aquassay.com
A. 31 rue du Ch=C3=A2tenet 87410 Le Palais-sur-Vienne

https://aquassay.com/partnership-nestle-waters-aquassay/?lang=3Den

--0000000000007b60a005d23b75df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I try to adapt my per=
sonal Yocto meta to Isar Project.</div><div><br></div><div>Currently, I try=
 to add &quot;minimalmodbus&quot; recipie, and for this, I need &quot;pytho=
n-pyserial&quot;.</div><div>And for &quot;python-pyserial&quot; I need &quo=
t;setutools3&quot;<br><div style=3D"color:rgb(212,212,212);background-color=
:rgb(30,30,30);font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;f=
ont-weight:normal;font-size:12px;line-height:18px;white-space:pre-wrap"><di=
v><span style=3D"color:rgb(197,134,192)">inherit</span><span style=3D"color=
:rgb(212,212,212)"> setuptools3</span></div></div></div><div><div><div dir=
=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"color:rgb(159,197,232=
)"></span><span style=3D"color:rgb(0,0,0)"><br></span></div><div><span styl=
e=3D"color:rgb(0,0,0)">So I added &quot;setuptools3.bbclass&quot; on my pro=
ject. But after this, I need other and other classes...</span></div><div><s=
pan style=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:r=
gb(0,0,0)">And I asked myself if I use the right &quot;.bbclass&quot; from =
the right &quot;openembedded-core&quot; branch.</span></div><div><span styl=
e=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:rgb(0,0,0=
)">In
 fact, as I worked with Krogoth distrimution to my previous Yocto=20
Project, I used bbclass from this branch too for my new Isar Project.=20
But Isar is based to Debian so it&#39;s maybe not the right way...</span></=
div><div><span style=3D"color:rgb(0,0,0)"><br></span></div>Do you know whic=
h branch I should used for compatible with Debian distribution ?<div><span =
style=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:rgb(0=
,0,0)">Best Regards,<font color=3D"#888888"><br></font></span></div></div><=
/div></div></div></div></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div></div><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<span style=3D"color:rgb(159,197,232)"></span><span style=3D"color:rgb(0,0,=
0)">-- </span><br><span style=3D"color:rgb(0,0,0)"></span><div><div dir=3D"=
ltr"><div><div dir=3D"ltr"><span style=3D"font-family:&quot;Rubik&quot;,Ari=
al;color:rgb(38,138,212);font-weight:bold;font-size:18px">Micka=C3=ABl Dela=
no=C3=AB</span><br><span style=3D"color:rgb(11,183,236)">Ing=C3=A9nieur d&#=
39;=C3=A9tudes | Design Engineer</span>
<br><span style=3D"color:rgb(38,138,212);font-weight:bold">T.</span><span s=
tyle=3D"color:rgb(102,102,102)"> <span style=3D"color:rgb(153,153,153)">+33=
 (0)5 87 03 80 58</span></span><br><span style=3D"color:rgb(38,138,212);fon=
t-weight:bold">E.</span> <a href=3D"mailto:mickael.delanoe@aquassay.com" ta=
rget=3D"_blank">mickael.delanoe@aquassay.com</a><br><span style=3D"color:rg=
b(38,138,212);font-weight:bold">A.</span> <span style=3D"color:rgb(153,153,=
153)">31 rue du Ch=C3=A2tenet 87410 Le Palais-sur-Vienne</span></div></div>=
</div></div></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><a href=3D"ht=
tps://aquassay.com/partnership-nestle-waters-aquassay/?lang=3Den" target=3D=
"_blank">https://aquassay.com/partnership-nestle-waters-aquassay/?lang=3Den=
</a></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div>

--0000000000007b60a005d23b75df--

