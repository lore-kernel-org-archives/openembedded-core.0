Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5568AC6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 13:33:56 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.66550.1680010426981966174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 06:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gtotr92r;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id l18so8909156oic.13
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680010426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CnaRZjD02bLhmL7f9Q66XP3XgkelQd6jUZ/+c0s7nnc=;
        b=Gtotr92rwIJKfLhfxAWC/sO9v9R8sKDODDb/czXMidVdTBLEWdxD4o7/6z1LfH7s/j
         bpkZseKHuv17CnMUdaOA3aYuwydJbgyj7Sky1vU+k1FZidJcF2Is+1kDIqePziM5erHd
         HKj97N3rvFBJ7EzhFfJdJJL0Dueo9nEzVkwgUiV5TWkyHXuCKPF1cboczizBRDQo8tlF
         /mplPd8SC68XmhgAPwIg4VrCerQbIwTMvE3gw/Y1PPN0iMIyRmj6Zq31MurCekQmENgU
         3zLgjVKcT54zWaxOOhbcdJOuqfovZdNTBj4LikGqLUJ6YXYgN7amV4sSImKmyjfJpqFo
         K6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnaRZjD02bLhmL7f9Q66XP3XgkelQd6jUZ/+c0s7nnc=;
        b=rgLGKtsmVzYNyA4iHPn5Rv64HCKeuzi6pCqOlMxs3zV2tm6Z6ys4EB3rpQOLpKuSZ4
         XwpAZqUl4UOjTVGo4Ge0NDJG0nMHaXXkDZpH7y+A1saxy3ETYNs/txrhb55aIrIiw3GN
         tUFKDjYrVO2t0KBn55OneVNThFUcpaDjABehcmqmpbO6LFWqdVhi6b2DXzGqf1zldDEJ
         3aVnJjbegBj7kgxrZ96q8o9gIyQRD7Cj5c0DSLy6+PD3hnUPZttVT6odxHDJheHOGovg
         7M0a6L5ZDt9A4wsUBq9dMycxVN9k0AGeGBvHF4REUCZtLbxp5QkDk9NtWrrT8VWLZQl7
         YaqA==
X-Gm-Message-State: AAQBX9cLJGBHLJTETw3wIjY0zRfrqct5WwoGh2Yq7Nq51/JjBNEKNvd7
	ux11QUJXUBX17Fp2uFOL0qpFnyR390EDtsakOa0=
X-Google-Smtp-Source: AKy350bcH+CjSj5irYeRicerCmMf26xFZ4/KatKWHYsb8WUeOTLz51BcBAG7k+UQXZfOpG/xcaznC6i7X9Q8rXBUjZA=
X-Received: by 2002:aca:2813:0:b0:389:1274:be51 with SMTP id
 19-20020aca2813000000b003891274be51mr2764937oix.4.1680010426062; Tue, 28 Mar
 2023 06:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230325004818.2784943-1-f_l_k@t-online.de> <20230325004818.2784943-6-f_l_k@t-online.de>
 <2023032714382786bc343b@mail.local> <dd874e52-dc20-813c-3211-62b70c1d210c@t-online.de>
 <CANNYZj_x0esv-NGjaP4+7q=hjKy9sW8cQZA6BOSg87Vdmt_-oQ@mail.gmail.com>
In-Reply-To: <CANNYZj_x0esv-NGjaP4+7q=hjKy9sW8cQZA6BOSg87Vdmt_-oQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Mar 2023 06:33:35 -0700
Message-ID: <CAMKF1sq2Zc0jCbaA1_R6WX_-N_LP0EOC0ZOVbB7zP5jcnMbscg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 6/7] epiphany: update 43.1 -> 44.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aa1cb405f7f5e829"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179235

--000000000000aa1cb405f7f5e829
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 28, 2023 at 1:27 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> We do want a real browser application in oe-core, and there's no
> better choice than epiphany, even though it tends to pull in hard
> dependencies that are sometimes questionable from 'lean build'
> perspective.


There is mini-browser option in WebKit who I might be interesting though I
have never used it myself there is also surf recipe in meta-gnome which
could be a good replacement

>
>
> If webkitgtk itself has an alternative in-tree, then epiphany can move
> to meta-gnome.
>
> Alex
>
> On Tue, 28 Mar 2023 at 02:54, Markus Volk <f_l_k@t-online.de> wrote:
> >
> > libadwaita is a hard dependency for epiphany so it would be needed to
> > import it from meta-gnome or to move  epiphany to meta-gnome
> >
> > https://gitlab.gnome.org/GNOME/epiphany/-/blob/44.0/meson.build#L78
> >
> >
> > Am 27.03.23 um 16:38 schrieb Alexandre Belloni:
> > > ERROR: Nothing PROVIDES 'libadwaita' (but
> /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-gnome/epiphany/
> epiphany_44.0.bb DEPENDS on or otherwise requires it). Close matches:
> > >    libedit
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179210):
> https://lists.openembedded.org/g/openembedded-core/message/179210
> Mute This Topic: https://lists.openembedded.org/mt/97836713/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000aa1cb405f7f5e829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 28, 2023 at 1:27 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">We do want a real browser application in oe-core,=
 and there&#39;s no<br>
better choice than epiphany, even though it tends to pull in hard<br>
dependencies that are sometimes questionable from &#39;lean build&#39;<br>
perspective.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ther=
e is mini-browser option in WebKit who I might be interesting though I have=
 never used it myself there is also surf recipe in meta-gnome which could b=
e a good replacement=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
If webkitgtk itself has an alternative in-tree, then epiphany can move<br>
to meta-gnome.<br>
<br>
Alex<br>
<br>
On Tue, 28 Mar 2023 at 02:54, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onl=
ine.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br>
&gt;<br>
&gt; libadwaita is a hard dependency for epiphany so it would be needed to<=
br>
&gt; import it from meta-gnome or to move=C2=A0 epiphany to meta-gnome<br>
&gt;<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/epiphany/-/blob/44.0/meson.b=
uild#L78" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNO=
ME/epiphany/-/blob/44.0/meson.build#L78</a><br>
&gt;<br>
&gt;<br>
&gt; Am 27.03.23 um 16:38 schrieb Alexandre Belloni:<br>
&gt; &gt; ERROR: Nothing PROVIDES &#39;libadwaita&#39; (but /home/pokybuild=
/yocto-worker/reproducible/build/meta/recipes-gnome/epiphany/<a href=3D"htt=
p://epiphany_44.0.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_44.0.bb=
</a> DEPENDS on or otherwise requires it). Close matches:<br>
&gt; &gt;=C2=A0 =C2=A0 libedit<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179210): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179210" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179210</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97836713/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97836713/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000aa1cb405f7f5e829--

