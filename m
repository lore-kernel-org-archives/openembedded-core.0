Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED4BC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 18:24:40 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.1018.1668795878004754220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 10:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lmlUkbWR;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ud5so15065026ejc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqwx2D9yKhjTkf6/9wibzskGQ112Tt2XIcewfKhvBmw=;
        b=lmlUkbWRs+AU34042uzOVysOe9V68fHs3RFYUVJIJKbtut0iWV3EqLm1Ghzxk1a+iU
         ovUlD66aBBvi679gogRvHdk4baGRpr2QNvegduzzfqbJDcA1019T/N3wmCcFthmjFEm0
         LjeK0YxsLwMsnfV483/Xqsp5LmbguMlFkVR7UfOFzNkrOimJSmdfrgZCzzveObBrp+Eh
         Qw+gqo9EreNhT2O9F+cQXUWvx7DPRXRwDdHzBoWilNBzhR0N+Z4cjgdi6zQtRq3XGvwc
         qOCeEdnFtTwN5p8vRvU09ORSh6iDk4ORYvShNQktPCyMdzzjJsCI3Ddddz94hU1oO0FJ
         svXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nqwx2D9yKhjTkf6/9wibzskGQ112Tt2XIcewfKhvBmw=;
        b=i2sgCMHBReWpXFgO03GfZXRLA7CdZ8idnD/HwJmcSOHGsz5OjlSdOiINiY0ihAzPoc
         pW+6CpF5CXGNCXUzsoz7n6We1TOvev5CFhnrpBAo9YxVtk0ECj6jcJjoCDb66835Jk8C
         2R68JlJiW8gWZ+7BRyz8zwzEiX7o4Awd5IZOaczd4rm+XT5iW7j3g+JclnTZ/BKr3Cu5
         ehQevA1rTu2D42RQQG51P7a2ApXB13zBYzDv/U0H/Yyg8tsUdETsUPjSJkj9LNbUsNsl
         BysmRuyfW02C9gLH5bJqS/IXDDvrQymGUg6uk6xdb2BB5LgziH34WLao5UvRxJ7Pvlz8
         J5PQ==
X-Gm-Message-State: ANoB5pkf3tgE0xZGmike5vcTJpWZLV4gGxXkraEka9kTw9m50M3d9J92
	/oWnEkBN1Q29LuIPlpEFtuQvxKW5JADTZUGEoN0=
X-Google-Smtp-Source: AA0mqf5XVZBJQHmV2VXNZzbFj4qkVR3PxKTnkiOrB12/BuriuZaJjn+foi8qSSS+2FxFVuSZoKHfbyLm+vwA5nPYW9A=
X-Received: by 2002:a17:906:6d7:b0:781:951:2fb with SMTP id
 v23-20020a17090606d700b00781095102fbmr6976909ejb.64.1668795876167; Fri, 18
 Nov 2022 10:24:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668793524.git.tim.orling@konsulko.com> <CANNYZj-YNwTDML-t_X-6VBC1YhyDSGg9Z7WK7H=yX=MgXNkSbA@mail.gmail.com>
In-Reply-To: <CANNYZj-YNwTDML-t_X-6VBC1YhyDSGg9Z7WK7H=yX=MgXNkSbA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 18 Nov 2022 10:24:25 -0800
Message-ID: <CANx9H-AmzbTyy2-++YwKz8qYXabsYQDRV98+VTU4NKhbmTMonA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] liburi-perl upgrade
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000066d5a805edc2d19d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 18:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173489

--00000000000066d5a805edc2d19d
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 9:59 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I trust all of the affected recipes still pass 'devtool
> check-upgrade-status'? AUH won't work if that is broken.
>
> It doesn't matter when the author changes and CPAN changes the URL out
from under us. Unless we figure out a different URL to use for the AUH
query.
liburi-perl was happily reporting no change for a long time.


> Alex
>
> On Fri, 18 Nov 2022 at 18:52, Tim Orling <ticotimo@gmail.com> wrote:
> >
> > AUH has been missing upgrades to liburi-perl because the author changed
> > back from ETHER to OALDERS, which changes the SRC_URI. In the mean time,
> > the dependencies for -ptest have grown a little bit, so we add two new
> > recipes and import one from meta-perl.
> >
> > While we are at it, correct the redirects in CPAN_MIRROR.
> >
> > The following changes since commit
> 44bb88cc869f3b42440d6f7aad000e706b739a2b:
> >
> >   mesa: do not rely on native llvm-config in target sysroot (2022-11-15
> 09:38:38 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/git/poky-contrib timo/recipe-upgrades
> >
> http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/recipe-upgrades
> >
> > Tim Orling (5):
> >   mirrors.bbclass: update CPAN_MIRROR
> >   libtry-tiny-perl: add recipe for 0.31
> >   libtest-fatal-perl: add recipe for 0.016
> >   libtest-warnings-perl: move from meta-perl
> >   liburi-perl: upgrade 5.08 -> 5.17
> >
> >  meta/classes-global/mirrors.bbclass           |   3 +-
> >  meta/conf/distro/include/maintainers.inc      |   3 +
> >  .../distro/include/ptest-packagelists.inc     |   3 +
> >  .../perl/libtest-fatal-perl_0.016.bb          |  36 ++++++
> >  .../perl/libtest-warnings-perl_0.031.bb       |  39 +++++++
> >  .../perl/libtry-tiny-perl_0.31.bb             |  36 ++++++
> >  .../0001-Skip-TODO-test-cases-that-fail.patch | 110 ++++++++++++++++++
> >  ...iburi-perl_5.08.bb => liburi-perl_5.17.bb} |  34 +++---
> >  8 files changed, 248 insertions(+), 16 deletions(-)
> >  create mode 100644 meta/recipes-devtools/perl/
> libtest-fatal-perl_0.016.bb
> >  create mode 100644 meta/recipes-devtools/perl/
> libtest-warnings-perl_0.031.bb
> >  create mode 100644 meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
> >  create mode 100644
> meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
> >  rename meta/recipes-devtools/perl/{liburi-perl_5.08.bb =>
> liburi-perl_5.17.bb} (65%)
> >
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173482):
> https://lists.openembedded.org/g/openembedded-core/message/173482
> > Mute This Topic: https://lists.openembedded.org/mt/95117529/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000066d5a805edc2d19d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 18, 2022 at 9:59 AM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">I trust all of the affected recipes still pass &#39;devtool<br>
check-upgrade-status&#39;? AUH won&#39;t work if that is broken.<br>
<br></blockquote><div>It doesn&#39;t matter when the author changes and CPA=
N changes the URL out from under us. Unless we figure out a different URL t=
o use for the AUH query.</div><div>liburi-perl was happily reporting no cha=
nge for a long time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Alex<br>
<br>
On Fri, 18 Nov 2022 at 18:52, Tim Orling &lt;<a href=3D"mailto:ticotimo@gma=
il.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; AUH has been missing upgrades to liburi-perl because the author change=
d<br>
&gt; back from ETHER to OALDERS, which changes the SRC_URI. In the mean tim=
e,<br>
&gt; the dependencies for -ptest have grown a little bit, so we add two new=
<br>
&gt; recipes and import one from meta-perl.<br>
&gt;<br>
&gt; While we are at it, correct the redirects in CPAN_MIRROR.<br>
&gt;<br>
&gt; The following changes since commit 44bb88cc869f3b42440d6f7aad000e706b7=
39a2b:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0mesa: do not rely on native llvm-config in target sysroot =
(2022-11-15 09:38:38 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/git/poky-contrib" =
rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/git/poky-=
contrib</a> timo/recipe-upgrades<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/git/poky-c=
ontrib/log/?h=3Dtimo/recipe-upgrades" rel=3D"noreferrer" target=3D"_blank">=
http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/recipe-=
upgrades</a><br>
&gt;<br>
&gt; Tim Orling (5):<br>
&gt;=C2=A0 =C2=A0mirrors.bbclass: update CPAN_MIRROR<br>
&gt;=C2=A0 =C2=A0libtry-tiny-perl: add recipe for 0.31<br>
&gt;=C2=A0 =C2=A0libtest-fatal-perl: add recipe for 0.016<br>
&gt;=C2=A0 =C2=A0libtest-warnings-perl: move from meta-perl<br>
&gt;=C2=A0 =C2=A0liburi-perl: upgrade 5.08 -&gt; 5.17<br>
&gt;<br>
&gt;=C2=A0 meta/classes-global/mirrors.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 .../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 .../perl/<a href=3D"http://libtest-fatal-perl_0.016.bb" rel=3D"n=
oreferrer" target=3D"_blank">libtest-fatal-perl_0.016.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 ++++++<br>
&gt;=C2=A0 .../perl/<a href=3D"http://libtest-warnings-perl_0.031.bb" rel=
=3D"noreferrer" target=3D"_blank">libtest-warnings-perl_0.031.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 39 +++++++<br>
&gt;=C2=A0 .../perl/<a href=3D"http://libtry-tiny-perl_0.31.bb" rel=3D"nore=
ferrer" target=3D"_blank">libtry-tiny-perl_0.31.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 36 ++++++<br>
&gt;=C2=A0 .../0001-Skip-TODO-test-cases-that-fail.patch | 110 ++++++++++++=
++++++<br>
&gt;=C2=A0 ...<a href=3D"http://iburi-perl_5.08.bb" rel=3D"noreferrer" targ=
et=3D"_blank">iburi-perl_5.08.bb</a> =3D&gt; <a href=3D"http://liburi-perl_=
5.17.bb" rel=3D"noreferrer" target=3D"_blank">liburi-perl_5.17.bb</a>} |=C2=
=A0 34 +++---<br>
&gt;=C2=A0 8 files changed, 248 insertions(+), 16 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/perl/<a href=3D"http://=
libtest-fatal-perl_0.016.bb" rel=3D"noreferrer" target=3D"_blank">libtest-f=
atal-perl_0.016.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/perl/<a href=3D"http://=
libtest-warnings-perl_0.031.bb" rel=3D"noreferrer" target=3D"_blank">libtes=
t-warnings-perl_0.031.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/perl/<a href=3D"http://=
libtry-tiny-perl_0.31.bb" rel=3D"noreferrer" target=3D"_blank">libtry-tiny-=
perl_0.31.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/perl/liburi-perl/0001-S=
kip-TODO-test-cases-that-fail.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/perl/{<a href=3D"http://liburi-perl=
_5.08.bb" rel=3D"noreferrer" target=3D"_blank">liburi-perl_5.08.bb</a> =3D&=
gt; <a href=3D"http://liburi-perl_5.17.bb" rel=3D"noreferrer" target=3D"_bl=
ank">liburi-perl_5.17.bb</a>} (65%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#173482): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/173482" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/173482</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95117529=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/95117529/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000066d5a805edc2d19d--

