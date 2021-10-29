Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766E2C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 19:28:54 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.10203.1635535732186520440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 12:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HZ6Pt8L8;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id bm16so10353711qkb.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 12:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68JX+VB3BDzvZr9TRD9QgmD7/aGPLa75XWRnB2Igfho=;
        b=HZ6Pt8L8GFzgJQ40NcwP0KfIpsCuhxv+4S+7Y6nGNZzsKHT6cUCNFfPdlNRhY44nqy
         Iw/0RCT/K9AVGmV3fCx0r1cAt2uZc52thi+cjYWRdgJJWPwBEkwEH/n+l+CBaCmhHDKG
         zd1lg6viV8Ybx/0UDyxTc1rZBmT458XQzJtj3ibmOqWAjNBTZ3JMsQq/89NJvmtRyOD9
         zYsi4qffzr+NQYvJM9dkaWpakzwqFrl9/hgBl1U7LTiGQ+jczd2Yk2mBd13tV8tqixuo
         DdUNEjXYrMQnDevNSRSoj/ZaH+DJu1TyvGP9M+MK8adoojHJOC1kHJp/APF0s7Yp7VAr
         Hkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68JX+VB3BDzvZr9TRD9QgmD7/aGPLa75XWRnB2Igfho=;
        b=TGIA+P7Q5Cv7SRN5H/iy5G6MToDQ5wrNq1XMvxtkg4zKnLqDA6bgOZaJbZIDMRMF+V
         cfRqe8s81ezlmvJEWH8CFJy0XXAKt1z4PF2+8AzZzUnlDmFi6i+HSDGX2oAkmrarrxYI
         D5gGyTVqexNxnR8kQPy3+oED/ygim9LzW2MWabfV6rBMkEuy1DCaG2FaoTQjeVNNrFFJ
         ZJM7o9jUmj4xK85UIeSvxxy0l7Ze6A+U9aOuBE+1nIHmkuU7TpTHkd4IeDTE9sywbxrO
         DGTWxZ5evbTe8icO7nl3vx+1JbRqixQHjVo8SZtAOP8W0JnCqoR4Jo0WsQXplq/ilQuI
         70rg==
X-Gm-Message-State: AOAM531++qwwu9K0zWNbWdtljYuiBgvXILxhMFFoyO1JSvaOm7y14Krh
	1SEHWmPT1719IPcoHoSlsC8qq/Mxl1Q/QsNg+fo=
X-Google-Smtp-Source: 
 ABdhPJyTMxYriRPt9sDciRwC23E/Ms4P3isZzihtpyM7jP+MvZPdiukM1Ql0WWD9cX76hJw92NQ00+p/hpRjTsh3SWg=
X-Received: by 2002:ae9:e108:: with SMTP id g8mr10516615qkm.98.1635535731238;
 Fri, 29 Oct 2021 12:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211027090736.2546759-1-alex@linutronix.de>
 <20211027090736.2546759-15-alex@linutronix.de>
 <CAMKF1sqcKQAQpVNf9d08MF-f-HZv57A3nphbZp7G9XOkBdtRQg@mail.gmail.com>
 <CANNYZj8xhgfHnpNtub21YcVWZxRDx0k=PjtFYvdcMxvk3Vt-Uw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8xhgfHnpNtub21YcVWZxRDx0k=PjtFYvdcMxvk3Vt-Uw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Oct 2021 12:28:40 -0700
Message-ID: 
 <CAMKF1so-aw5FsFMcK7Ljp_+oOmUQzFmNacwgR+aYsBZ_+bOpUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/30] wpebackend-fdo: upgrade 1.10.0 -> 1.12.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004729e705cf82d606"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 19:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157636

--0000000000004729e705cf82d606
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 29, 2021 at 11:20 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> LLVM-specific probably?
>

Most likely found with LLVM I have to check details

>
> Alex
>
> On Fri 29. Oct 2021 at 20.04, Khem Raj <raj.khem@gmail.com> wrote:
>
>> seeing https://errors.yoctoproject.org/Errors/Details/615439/
>>
>> On Wed, Oct 27, 2021 at 2:08 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > From: Alexander Kanavin <alex.kanavin@gmail.com>
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  .../{wpebackend-fdo_1.10.0.bb => wpebackend-fdo_1.12.0.bb}      | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >  rename meta/recipes-sato/webkit/{wpebackend-fdo_1.10.0.bb =>
>> wpebackend-fdo_1.12.0.bb} (89%)
>> >
>> > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
>> b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
>> > similarity index 89%
>> > rename from meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
>> > rename to meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
>> > index f2d640f07a..ba6c54412a 100644
>> > --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
>> > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
>> > @@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
>> >  REQUIRED_DISTRO_FEATURES = "opengl"
>> >
>> >  SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>> > -SRC_URI[sha256sum] =
>> "b89dfd3500a4dec711132cd7bff72599e67d56a419d000730e14bb99547509cc"
>> > +SRC_URI[sha256sum] =
>> "6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac"
>> >
>> >  # This is a tweak of upstream-version-is-even needed because
>> >  # ipstream directory contains tarballs for other components as well.
>> > --
>> > 2.20.1
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#157491):
>> https://lists.openembedded.org/g/openembedded-core/message/157491
>> > Mute This Topic: https://lists.openembedded.org/mt/86623392/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >
>>
>

--0000000000004729e705cf82d606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 29, 2021 at 11:20 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">LLVM-specific pr=
obably?</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Mos=
t likely found with LLVM I have to check details=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"auto"></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri 29. Oct 2021 at 20.04, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">seeing <a href=3D"https://errors.yoctoproject.=
org/Errors/Details/615439/" rel=3D"noreferrer" target=3D"_blank">https://er=
rors.yoctoproject.org/Errors/Details/615439/</a><br>
<br>
On Wed, Oct 27, 2021 at 2:08 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://wpebackend-fdo_1.10.0.bb" rel=3D"noreferr=
er" target=3D"_blank">wpebackend-fdo_1.10.0.bb</a> =3D&gt; <a href=3D"http:=
//wpebackend-fdo_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend=
-fdo_1.12.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-sato/webkit/{<a href=3D"http://wpebackend-fd=
o_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.10.0.bb<=
/a> =3D&gt; <a href=3D"http://wpebackend-fdo_1.12.0.bb" rel=3D"noreferrer" =
target=3D"_blank">wpebackend-fdo_1.12.0.bb</a>} (89%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo=
_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.10.0.bb</=
a> b/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.12.0.bb" r=
el=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.12.0.bb</a><br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_=
1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.10.0.bb</a=
><br>
&gt; rename to meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.=
12.0.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.12.0.bb</a><=
br>
&gt; index f2d640f07a..ba6c54412a 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.10.0=
.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.10.0.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.12.0=
.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.12.0.bb</a><br>
&gt; @@ -13,7 +13,7 @@ inherit meson features_check pkgconfig<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://wpewebkit.org/releases/$%7B=
BPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wpewe=
bkit.org/releases/${BPN}-${PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b89dfd3500a4dec711132cd7bff72599e67d56a4=
19d000730e14bb99547509cc&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;6239c9c15523410798d66315de6b491712ab3000=
9ba180f3e0dd076d9b0074ac&quot;<br>
&gt;<br>
&gt;=C2=A0 # This is a tweak of upstream-version-is-even needed because<br>
&gt;=C2=A0 # ipstream directory contains tarballs for other components as w=
ell.<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157491): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157491" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157491</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86623392=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86623392/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000004729e705cf82d606--

