Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CA7C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 22:46:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.16775.1651272355368679916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 15:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PpxrQ4TU;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id a22so3893269qkl.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6eJNp3YnGwOCjMMBMAKDeEVEiDjezE3IFuLoEULsVPs=;
        b=PpxrQ4TU4ZgvuXu9UBOtys5Aain8s8qc1K6XctXHG94sA3JT1lTCM0jZA/7KD48rLI
         QMCuqonBsgdFqYmHHDqgGRl/AIcGi+x1yN5FqXgroFw70CwtXgEVAWF3w/0a5ORtQtVD
         jkp5yktXd4uCp23xx685gO//ynLGp1bJKoY0Km848b7rkoOPSigBjgfu6Ew0MN0K+wwy
         MwFEjGHHsnr5/Dcoibm839zAdlLNOwpo13l+MSw3OIrbA0hZj/FVYPxFflqNbXqR/wzV
         HsjGs0JtKiy18S0gHtTtEimavisPylSZ4azKUC+uT4D5tk5wjtLJx8fcboxIGROm6qsy
         wJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6eJNp3YnGwOCjMMBMAKDeEVEiDjezE3IFuLoEULsVPs=;
        b=AkwV6P6TnXeEAVjU9nLoPScoZrYaKkpgj/3OI0Xw6Yalwf2O7wd8Q67gJ7JHpgMf68
         X6QDsH7Kk2ywVczxzRhqnwV5GgrSFmcbB7z+yeqhTyzYrYFfp90KkbkJ7YPzoXcGL2rb
         I3NBsM4glKMHkgqiTwQDAldHpuZNTAD6bboT6lQN9/FLOL9YDD31J6bytt2DOTUxtIDO
         dOntih/aqFBCWBMcQHLXmyL+swvJ/Y8nKnueDlvN1Sx1sxgupSikeZ1xFXounWWk/rr+
         ZDD0y3xepWOYfVn5it0+PIqr6EPr7f/6f0w+sOnNjhtK5aTjVSqeqUHki2AAEMHfIVRF
         EhYg==
X-Gm-Message-State: AOAM533YUMBEYkmjeAVxeiSACrA9+7oiTbGa0cjqEaP3Xx4B9LSPwAMp
	3ftaZSgs1iYRC0XXYJSph6Ss3G/xpIvbBt9ygX8=
X-Google-Smtp-Source: 
 ABdhPJzoFuWIfysdVramlNWLWAhSGYUGtjt3IfMoCJPxQmE7ftLyApW4JDA0taGiY8Om/prUcKq4hFeQ5VOxDL90Qtk=
X-Received: by 2002:a05:620a:170f:b0:69f:bfbe:9095 with SMTP id
 az15-20020a05620a170f00b0069fbfbe9095mr1054043qkb.149.1651272354431; Fri, 29
 Apr 2022 15:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220429073440.136829-1-stephensportia@gmail.com>
 <20220429073440.136829-2-stephensportia@gmail.com>
 <285f86a8-64f3-516c-32f1-6dcf497c6289@gmail.com>
 <CACYNXwJcHGPUDnHGA6=Ei8sbvwZKxc8SO_oCh3o9Mz03WC4tUA@mail.gmail.com>
In-Reply-To: 
 <CACYNXwJcHGPUDnHGA6=Ei8sbvwZKxc8SO_oCh3o9Mz03WC4tUA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2022 15:45:43 -0700
Message-ID: 
 <CAMKF1spqf5BG974EnyqR3fDb3-w2O79iBgXJ6O4B+836J3cRkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] volatile-binds: Remove TimeoutSec and allow
 DefaultTimeoutSec to be used
To: Portia Stephens <stephensportia@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001d06a705ddd2cec6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 22:46:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165060

--0000000000001d06a705ddd2cec6
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 3:17 PM Portia Stephens <stephensportia@gmail.com>
wrote:

> On Sat, Apr 30, 2022 at 1:39 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 4/29/22 12:34 AM, Portia wrote:
> > > Remove setting TimeoutSec and allow the DefaultTimeSec to be set for
> the
> > > volatile-binds services.
> > >
> >
> > Whats the default value? I hope it does not go into infinite loop in
> > case the service gets stuck
> >
>
> Timeout=0 sets the Timeout to infinity, so the current behavior is
> that if the service gets stuck
> it never gets killed. DefaultTimeout will depend on what is set in the
> /etc/systemd/system.conf.


Right reading it from system default is fine I guess defaults are perhaps
around 90s which is enough for the service to load normally


>
> > > Signed-off-by: Portia Stephens <stephensportia@gmail.com>
> > > ---
> > >   meta/recipes-core/volatile-binds/files/volatile-binds.service.in |
> 1 -
> > >   1 file changed, 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/volatile-binds/files/
> volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/
> volatile-binds.service.in
> > > index 8fe7d8d4f9..52384c8264 100644
> > > --- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> > > +++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> > > @@ -10,7 +10,6 @@ ConditionPathIsReadWrite=!@where@
> > >   [Service]
> > >   Type=oneshot
> > >   RemainAfterExit=Yes
> > > -TimeoutSec=0
> > >   Environment=MOUNT_COPYBIND_AVOID_OVERLAYFS=@avoid_overlayfs@
> > >   ExecStart=/sbin/mount-copybind @what@ @where@
> > >   ExecStop=/bin/umount @where@
> > >
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#164998):
> https://lists.openembedded.org/g/openembedded-core/message/164998
> > > Mute This Topic: https://lists.openembedded.org/mt/90771601/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

--0000000000001d06a705ddd2cec6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 29, 2022 at 3:17 PM Portia Stephens &lt;<a href=
=3D"mailto:stephensportia@gmail.com">stephensportia@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Sat, Apr 30, 2022 at 1:39 AM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khe=
m@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 4/29/22 12:34 AM, Portia wrote:<br>
&gt; &gt; Remove setting TimeoutSec and allow the DefaultTimeSec to be set =
for the<br>
&gt; &gt; volatile-binds services.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Whats the default value? I hope it does not go into infinite loop in<b=
r>
&gt; case the service gets stuck<br>
&gt;<br>
<br>
Timeout=3D0 sets the Timeout to infinity, so the current behavior is<br>
that if the service gets stuck<br>
it never gets killed. DefaultTimeout will depend on what is set in the<br>
/etc/systemd/system.conf.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Right reading it from system default is fine I guess defaults are=
 perhaps around 90s which is enough for the service to load normally=C2=A0<=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto=
"><br>
<br>
&gt; &gt; Signed-off-by: Portia Stephens &lt;<a href=3D"mailto:stephensport=
ia@gmail.com" target=3D"_blank">stephensportia@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/volatile-binds/files/<a href=3D"htt=
p://volatile-binds.service.in" rel=3D"noreferrer" target=3D"_blank">volatil=
e-binds.service.in</a> | 1 -<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/volatile-binds/files/<a href=3D"ht=
tp://volatile-binds.service.in" rel=3D"noreferrer" target=3D"_blank">volati=
le-binds.service.in</a> b/meta/recipes-core/volatile-binds/files/<a href=3D=
"http://volatile-binds.service.in" rel=3D"noreferrer" target=3D"_blank">vol=
atile-binds.service.in</a><br>
&gt; &gt; index 8fe7d8d4f9..52384c8264 100644<br>
&gt; &gt; --- a/meta/recipes-core/volatile-binds/files/<a href=3D"http://vo=
latile-binds.service.in" rel=3D"noreferrer" target=3D"_blank">volatile-bind=
s.service.in</a><br>
&gt; &gt; +++ b/meta/recipes-core/volatile-binds/files/<a href=3D"http://vo=
latile-binds.service.in" rel=3D"noreferrer" target=3D"_blank">volatile-bind=
s.service.in</a><br>
&gt; &gt; @@ -10,7 +10,6 @@ ConditionPathIsReadWrite=3D!@where@<br>
&gt; &gt;=C2=A0 =C2=A0[Service]<br>
&gt; &gt;=C2=A0 =C2=A0Type=3Doneshot<br>
&gt; &gt;=C2=A0 =C2=A0RemainAfterExit=3DYes<br>
&gt; &gt; -TimeoutSec=3D0<br>
&gt; &gt;=C2=A0 =C2=A0Environment=3DMOUNT_COPYBIND_AVOID_OVERLAYFS=3D@avoid=
_overlayfs@<br>
&gt; &gt;=C2=A0 =C2=A0ExecStart=3D/sbin/mount-copybind @what@ @where@<br>
&gt; &gt;=C2=A0 =C2=A0ExecStop=3D/bin/umount @where@<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#164998): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/164998" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/164998</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/907=
71601/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/90771601/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--0000000000001d06a705ddd2cec6--

