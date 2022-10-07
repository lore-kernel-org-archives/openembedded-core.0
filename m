Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48133C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 07:54:43 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web09.1931.1665129279010767096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 00:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L3S5FKUL;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-35711e5a5ceso37835867b3.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 00:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1vqasEDBTfU4bB0Amfvv8iZ2cJ8OpIZdY4lzk3XCmI=;
        b=L3S5FKULrcQDH9RJSVjUH1u+CtrXzSSwbH86m/Ua98dfKGkE9NLMrQ3+eftaHA+0zO
         HpEyBBYzt31woxtVXD1RiSFCL7slz6tZcnv9RHEt7Mwza8RXFbC2nxEYy3qQw9X7kScp
         wmUqYRJbXjeqMIoERY8UmO4J9tWa+XyaoXXgHsLbEWLtGU/1VVlc69leF9WjeEQQ5JM3
         /uFK30rdg2bC9BAfpD46d0lRHSXR7VACdSirZFaOu/uyWyOph09VgkLhtQzNqODtZy+m
         275KvY0pzYQUaDCvUDZ7gFlQpkF/71LL+1uaCu681LcHRy/KQgeeeWSyicngSMxcljqe
         TkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1vqasEDBTfU4bB0Amfvv8iZ2cJ8OpIZdY4lzk3XCmI=;
        b=PjUBH26yG3exCONC+fhTdsOG8ZIkI/avqulvbCA7D/u9OXdHaHOiRkGAKRl03xm+7q
         7udFJCMIbupvniNUCRVlwyTZh/TbNwAKNmB7et622GhADhiKPc+xFlO71DrJHVEsyPEs
         LXjcWzkvc63gDyRkhERQJ0Ob3HhTmiA3J3zhztFxK+yrD/M1PjWEOIlMCvaFfGD1oSxY
         4EklfY4F2FUMr9W339nt6xbRqACbk+Wpxk+rHLiajP7tSKIPv3mwvxYUP5cqwUSS2MTe
         CSPCnmFR7sygu8OOTIUHXyke2INZ6Uqv5XIz5tjh21lqQer+BlAEz1QNe3lvvT3i0BdG
         DkkQ==
X-Gm-Message-State: ACrzQf0yrFToIEXMYMpbeumC8RsVJpgw8RAbrqTsiEHksi55Wp97d6qH
	MrKlN/3qryMfAOAlBFuhKP//Kyygwhmq4LPP3dQ=
X-Google-Smtp-Source: 
 AMsMyM5ib5rpsVv8UD8dvbGU7TuyXajlgTTVyQ3ECxumrGE0KOGCvvj9ovoqqOMlqXoPBDoLq0NzozOhyNQs8fuXZfM=
X-Received: by 2002:a81:7d42:0:b0:35c:12db:ac4c with SMTP id
 y63-20020a817d42000000b0035c12dbac4cmr3275428ywc.313.1665129277991; Fri, 07
 Oct 2022 00:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221006112712.23062-1-liu.ming50@gmail.com>
 <20221006112712.23062-2-liu.ming50@gmail.com>
 <370BAEFD-0766-4316-A271-CF60F61D8DF4@arm.com>
In-Reply-To: <370BAEFD-0766-4316-A271-CF60F61D8DF4@arm.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 7 Oct 2022 09:54:27 +0200
Message-ID: 
 <CALatG=4g2UsGv=T9jGyPwqnrXR2TLKat+uSuPejQGaxx+DwwNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 1/2] bluez5: change configuration directory
 mode
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001eae1905ea6d1f15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 07:54:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171517

--0000000000001eae1905ea6d1f15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross:

I think it applies for both systemd and sysvinit, it's bluez5's requirement
that /etc/bluetooth should be read-only.

//Ming Liu

Ross Burton <Ross.Burton@arm.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=886=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:19=E5=AF=AB=E9=81=93=EF=BC=9A

> Is this in a build with systemd or sysvinit?  Looking at the referenced
> commit, that=E2=80=99s when running in a systemd-managed contained enviro=
nment.  In
> sysv that isn=E2=80=99t the case, so I=E2=80=99m not convinced this is th=
e correct solution.
>
> Ross
>
> > On 6 Oct 2022, at 12:27, Ming Liu via lists.openembedded.org
> <liu.ming50=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Change configuration directory mode from 0755 to 0555, this fixes a
> > following warning when bluetoothd starts:
> > | ConfigurationDirectory 'bluetooth' already exists but the mode is
> different.
> > | (File system: 755 ConfigurationDirectoryMode: 555)
> >
> > Reference:
> >
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=3D00cfb36e2=
0e3c35db2150e7d0351ad7b8442e2d8
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> > meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> > index 79d4645ca8..9f5c78b81e 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> > @@ -82,7 +82,7 @@ do_install:append() {
> >       install -d ${D}${INIT_D_DIR}
> >       install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
> >
> > -     install -d ${D}${sysconfdir}/bluetooth/
> > +     install -m 0555 -d ${D}${sysconfdir}/bluetooth/
> >       if [ -f ${S}/profiles/network/network.conf ]; then
> >               install -m 0644 ${S}/profiles/network/network.conf
> ${D}/${sysconfdir}/bluetooth/
> >       fi
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171494):
> https://lists.openembedded.org/g/openembedded-core/message/171494
> > Mute This Topic: https://lists.openembedded.org/mt/94155398/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000001eae1905ea6d1f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ross:<div><br></div><div>I think it applies for both s=
ystemd and sysvinit, it&#39;s bluez5&#39;s requirement that /etc/bluetooth =
should be read-only.</div><div><br></div><div>//Ming Liu</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &=
lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; =E6=
=96=BC 2022=E5=B9=B410=E6=9C=886=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=
=8D=882:19=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Is this in a build with systemd or sysvinit?=C2=A0 Lo=
oking at the referenced commit, that=E2=80=99s when running in a systemd-ma=
naged contained environment.=C2=A0 In sysv that isn=E2=80=99t the case, so =
I=E2=80=99m not convinced this is the correct solution.<br>
<br>
Ross<br>
<br>
&gt; On 6 Oct 2022, at 12:27, Ming Liu via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &=
lt;liu.ming50=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Change configuration directory mode from 0755 to 0555, this fixes a<br=
>
&gt; following warning when bluetoothd starts:<br>
&gt; | ConfigurationDirectory &#39;bluetooth&#39; already exists but the mo=
de is different.<br>
&gt; | (File system: 755 ConfigurationDirectoryMode: 555)<br>
&gt; <br>
&gt; Reference:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?=
id=3D00cfb36e20e3c35db2150e7d0351ad7b8442e2d8" rel=3D"noreferrer" target=3D=
"_blank">https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=3D00=
cfb36e20e3c35db2150e7d0351ad7b8442e2d8</a><br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipe=
s-connectivity/bluez5/bluez5.inc<br>
&gt; index 79d4645ca8..9f5c78b81e 100644<br>
&gt; --- a/meta/recipes-connectivity/bluez5/bluez5.inc<br>
&gt; +++ b/meta/recipes-connectivity/bluez5/bluez5.inc<br>
&gt; @@ -82,7 +82,7 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${INIT_D_DIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/init ${D}${INIT_D=
_DIR}/bluetooth<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/bluetooth/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install -m 0555 -d ${D}${sysconfdir}/bluetooth/<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f ${S}/profiles/network/network.conf ]=
; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 =
${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#171494): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/171494" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/171494</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94155398=
/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94155398/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000001eae1905ea6d1f15--

