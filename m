Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477FFC433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 14:17:54 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.6888.1637590673580216640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iao9exWW;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id p37so36773250uae.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K4gCuewAUoAfd0D05ZmAxxMMO43592JNlwnFAYkDlzo=;
        b=Iao9exWW6iUpe5PgtEIFLtMxp574WB5CKGG85ST9u/TRfvAvIu2yMc7gBJUVmcFQtf
         7Xm90PN2q0m5T/AXNFLNgYFkhX0fqEBqDiK8z79LY/60MRulnqbyUxCyt6PS0t6rtlE+
         gpyp/wxji47l7Dl+yPp7fV+IjUmEkRy6wtYk+7xdOHfdC/e2QEs7LsZGKv4Yg0+Tv8RM
         d2sAdleMbrmT96ER60tIcPkjkV1S/7swbuPlQBmdGrB9XUtZHA1DI2UZVHWbD0NfZLtV
         paas3QH8mSQKiAtQM3LISZF1Ns5gNyDO9O+bp2IxC1B37wHZxFgf/rImiPm44Us4xT1o
         Sygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K4gCuewAUoAfd0D05ZmAxxMMO43592JNlwnFAYkDlzo=;
        b=PEBBamkR0oEAe20Ap0B7JU5iH7GCbwjTZOY+CaxJ0DDXwy8SBAGQEWQ9xjCBCGHeqy
         o+KmW+ZVvTlV6W4DKCpzKdJ3chTvjVABbKwgiOytTqVyQwVxxym9asek2C7rugRVzBGF
         2j8HK0n4+sC3646mJj+Aq4h3PZU2LoLEGyanregu5L8XX2QyaGbpAfdHfliHPbguP1Ve
         x6qH6i/fkZxb3PeAN8HaldqaDqj3nj+PLU35uabhSs37uuph15hQIEPHOQCy+Xjxh3MY
         aGSWccZlOZfbgZJ4w0MKyEVampA0BcfzB1jqRrA/JPCibu0RYsdYjdxXCIsrLgqI0tsV
         eLIg==
X-Gm-Message-State: AOAM530Bd+/wFd0ugC10J5upOWJGKKIsepCXS3iYYNuKBcl9ZmP5LtAd
	aHrGrLPSj8shz5wYmBFKMlnp9QTcxYK4/0UI8hE=
X-Google-Smtp-Source: 
 ABdhPJxvyW7cCoV8lVgOui0iiyqrg5sVc/BuCnpclfwsA25y0udgCkhQdJyVP5x4j8z1AxsPuWF9dUWATDYoy4NTEak=
X-Received: by 2002:a05:6102:b13:: with SMTP id
 b19mr133041289vst.1.1637590672715;
 Mon, 22 Nov 2021 06:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Nov 2021 15:17:41 +0100
Message-ID: 
 <CANNYZj_TvYaEx5Gv7e-xYY9SpRY-VNcLttkzNQLhauOMUAK9fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/7] systemd: skip chown when building for
 nativesdk
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Luca Bocassi <luca.boccassi@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com
Content-Type: multipart/alternative; boundary="00000000000055b3fc05d1614a40"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158570

--00000000000055b3fc05d1614a40
Content-Type: text/plain; charset="UTF-8"

Indeed; in the absence of tests that exercise this functionality - either
SDK tests, or direct bitbake tests - it's hard to say if
this is an experiment that may not be sustainable long term, or something
systemd upstream is actually committed to.

Alex

On Mon, 22 Nov 2021 at 14:57, Konrad Weihmann <kweihmann@outlook.com> wrote:

> I have sort of a general question regarding this patch series.
>
> Last time I checked (and yeah it's been a while back) systemd-analyze
> wasn't self-containing, meaning it would have to have a running systemd
> process and at least a running dbus iirc.
>
> Is that still the case?
> If yes, how should that work here?
> Do we want to spawn a systemd per workspace/SDK?
> What about the weird setting that systemd somehow requires us to assign
> PID 1 to it?
> What about systems that have already a systemd instance running - and
> what about the systems that don't?
>
> And if not (and all of sudden systemd project finally decided to
> recognize the cross-compile use case), does this only apply to
> systemd-analyze?
>
> I would be happy if you could shed some light on these questions. Thx
>
> On 19.11.21 12:34, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > The useradd class is a no-op in the nativesdk case, so chown will fail.
> > Skip them.
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: use "${PN}" = "${BPN}" as suggested by reviewers
> >
> >   meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> b/meta/recipes-core/systemd/systemd_249.5.bb
> > index 8bdc0ca028..2df2de0cf3 100644
> > --- a/meta/recipes-core/systemd/systemd_249.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> > @@ -275,7 +275,10 @@ do_install() {
> >               # which is expected to be empty.
> >               rm -rf ${D}${localstatedir}/log
> >       else
> > -             chown root:systemd-journal ${D}${localstatedir}/log/journal
> > +             # The useradd class is a no-op in the nativesdk case, so
> chown will fail
> > +             if [ "${PN}" = "${BPN}" ]; then
> > +                     chown root:systemd-journal
> ${D}${localstatedir}/log/journal
> > +             fi
> >
> >               # journal-remote creates this at start
> >               rm -rf ${D}${localstatedir}/log/journal/remote
> > @@ -319,7 +322,10 @@ do_install() {
> >       if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true',
> 'false', d)}; then
> >               if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
> >                       chmod 700 ${D}${datadir}/polkit-1/rules.d
> > -                     chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> > +                     # The useradd class is a no-op in the nativesdk
> case, so chown will fail
> > +                     if [ "${PN}" = "${BPN}" ]; then
> > +                             chown polkitd:root
> ${D}${datadir}/polkit-1/rules.d
> > +                     fi
> >               fi
> >       fi
> >
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158569):
> https://lists.openembedded.org/g/openembedded-core/message/158569
> Mute This Topic: https://lists.openembedded.org/mt/87165491/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000055b3fc05d1614a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Indeed; in the absence of tests that exercise this fu=
nctionality - either SDK tests, or direct bitbake tests - it&#39;s hard to =
say if</div><div>this is an experiment that may not be sustainable long ter=
m, or something systemd upstream is actually committed to.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 22 Nov 2021 at 14:57, Konrad Weihmann &lt;<a=
 href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I have sort of =
a general question regarding this patch series.<br>
<br>
Last time I checked (and yeah it&#39;s been a while back) systemd-analyze <=
br>
wasn&#39;t self-containing, meaning it would have to have a running systemd=
 <br>
process and at least a running dbus iirc.<br>
<br>
Is that still the case?<br>
If yes, how should that work here?<br>
Do we want to spawn a systemd per workspace/SDK?<br>
What about the weird setting that systemd somehow requires us to assign <br=
>
PID 1 to it?<br>
What about systems that have already a systemd instance running - and <br>
what about the systems that don&#39;t?<br>
<br>
And if not (and all of sudden systemd project finally decided to <br>
recognize the cross-compile use case), does this only apply to <br>
systemd-analyze?<br>
<br>
I would be happy if you could shed some light on these questions. Thx<br>
<br>
On 19.11.21 12:34, Luca Bocassi wrote:<br>
&gt; From: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.com"=
 target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
&gt; <br>
&gt; The useradd class is a no-op in the nativesdk case, so chown will fail=
.<br>
&gt; Skip them.<br>
&gt; <br>
&gt; Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@micro=
soft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: use &quot;${PN}&quot; =3D &quot;${BPN}&quot; as suggested by revie=
wers<br>
&gt; <br>
&gt;=C2=A0 =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a> | 10 ++++++++=
--<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a> b/meta/recip=
es-core/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">systemd_249.5.bb</a><br>
&gt; index 8bdc0ca028..2df2de0cf3 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a><br>
&gt; @@ -275,7 +275,10 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# which is expec=
ted to be empty.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${loc=
alstatedir}/log<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown root:systemd-jo=
urnal ${D}${localstatedir}/log/journal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The useradd class i=
s a no-op in the nativesdk case, so chown will fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${PN}&quot=
; =3D &quot;${BPN}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0chown root:systemd-journal ${D}${localstatedir}/log/journal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# journal-remote=
 creates this at start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${loc=
alstatedir}/log/journal/remote<br>
&gt; @@ -319,7 +322,10 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#=
39;, &#39;polkit&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${da=
tadir}/polkit-1/rules.d ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0chmod 700 ${D}${datadir}/polkit-1/rules.d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0chown polkitd:root ${D}${datadir}/polkit-1/rules.d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# The useradd class is a no-op in the nativesdk case, so chown will =
fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if [ &quot;${PN}&quot; =3D &quot;${BPN}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown polkitd:root ${D}${datadir}/polkit=
-1/rules.d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158569): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158569" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158569</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87165491/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87165491/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000055b3fc05d1614a40--

