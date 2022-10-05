Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEA5C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:24:25 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web09.25089.1664983462544328396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cRNG0PXm;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-3573ed7cc15so121926507b3.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hNoE0tuOP7C3Zb418H4NOfQYw5/4+b6uFNpeYl5ERlg=;
        b=cRNG0PXm46J80uDYcMYRCVxnS2uPQNRJIlvecagSsYgT0HomeTYmq0pXirO5ckisXN
         ipufYEna5yQkFUDbG5XVdJrpDt/2k9qKA7ipO/4tp3x7ZU3yR4WmqbYos2K3PF0JM2bt
         t1kpVYJeBS+GDPG2BCb4PtHFABVHHUEvLvn8JY9VhyvABa3yMv43IabtjfLIAhtbyZJZ
         YWQWwmlkMqFwjQWjSUY5fdCM3tkevEWKbRTTd+zI6uYlwZnrO9RQEkqdavAf64dz6Vm1
         8JQuajsHjcDrxgGbk/40sXl/RlZuVVbMivpppFR/8O/30+F12B/VzX8CUOTM43wIxVNq
         GOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hNoE0tuOP7C3Zb418H4NOfQYw5/4+b6uFNpeYl5ERlg=;
        b=pCJIsIHstOM+vJqRo5LBCJEyo2VlMNiKyHFU99n6cprw0TjhX5rKHEKLMcLRhN49S1
         gWoILv07qOpJfkq5eVaUeoWbh2SO7D7ZWgjqaH+Bu3UWaDT8XTSC+M/4kdXGCcdUVlZ+
         anlwrDRuz1viwe+rJFhCCTp6rQW7ff/47FPdazdxVqflbe8Qk44cwRp9daSB90DBKdm1
         Njy5KLWY73ZGimbwdrkhq27Qbkheg4BIViRmcYSY5vHMgbEPzvblti8W5vu7Wxpe/qla
         UX9oPNvKU9dPz0XF3ln8wLvlUEpHVv3h4ucY9vVObvVOdb+KQTG893/GiJcMR5qDOris
         QI8g==
X-Gm-Message-State: ACrzQf2IUBRXegueFw9eza/xPo4B83FvBj5l1VqwEyOSki2OURLxvcOj
	3itP8z0rIez7LQh8qmlY6fEdudz4b5wo8hEOG+8=
X-Google-Smtp-Source: 
 AMsMyM6iG2nW11emAMvzW1XfYtjvo6CfatUqwIS/oe4Cj/JK6UQIzGk8kKvKSQC3uX/gvXiUMEXwutB8FvzQoAY8n2U=
X-Received: by 2002:a81:1456:0:b0:35c:b824:38f1 with SMTP id
 83-20020a811456000000b0035cb82438f1mr219227ywu.399.1664983461662; Wed, 05 Oct
 2022 08:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221005135921.4167614-1-liu.ming50@gmail.com>
 <7825e5af50d04c1c92ebdfb813ba32dd@axis.com>
In-Reply-To: <7825e5af50d04c1c92ebdfb813ba32dd@axis.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 5 Oct 2022 17:24:10 +0200
Message-ID: 
 <CALatG=5iYJFC-xAJjOw+1aXTuoS=UtR_vHZKf7-4m2VQoWocqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] bluez5: change configuration directory mode
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca140505ea4b2b15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 15:24:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171464

--000000000000ca140505ea4b2b15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Peter:

You are absolutely right, I also noticed that, it=E2=80=99s a typo, it shou=
ld be
0555, will send a V3 soon.

//Ming Liu

> -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Ming Liu
> > Sent: den 5 oktober 2022 15:59
> > To: openembedded-core@lists.openembedded.org
> > Cc: Ming Liu <liu.ming50@gmail.com>
> > Subject: [OE-core] [PATCH V2] bluez5: change configuration directory mo=
de
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Change configuration directory mode from 0755 to 0555, this fixes a
> > following warning when bluetoothd starts:
> > | ConfigurationDirectory 'bluetooth' already exists but the mode is
> different.
> > | (File system: 755 ConfigurationDirectoryMode: 555)
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> > index 79d4645ca8..48b8bcbe75 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> > @@ -82,7 +82,7 @@ do_install:append() {
> >       install -d ${D}${INIT_D_DIR}
> >       install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
> >
> > -     install -d ${D}${sysconfdir}/bluetooth/
> > +     install -m 0755 -d ${D}${sysconfdir}/bluetooth/
>
> The default mode used by `install` if not specified is 0755.
> The above change should not make any difference...
>
> >       if [ -f ${S}/profiles/network/network.conf ]; then
> >               install -m 0644 ${S}/profiles/network/network.conf
> ${D}/${sysconfdir}/bluetooth/
> >       fi
> > --
> > 2.25.1
>
> //Peter
>
>

--000000000000ca140505ea4b2b15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi, Peter:</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">You are absolutely right, I also noticed that, it=E2=80=99s a typo, it=
 should be 0555, will send a V3 soon.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">//Ming Liu</div><div><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; ---=
--Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Ming Liu<br>
&gt; Sent: den 5 oktober 2022 15:59<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_bl=
ank">liu.ming50@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH V2] bluez5: change configuration directory m=
ode<br>
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
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipe=
s-connectivity/bluez5/bluez5.inc<br>
&gt; index 79d4645ca8..48b8bcbe75 100644<br>
&gt; --- a/meta/recipes-connectivity/bluez5/bluez5.inc<br>
&gt; +++ b/meta/recipes-connectivity/bluez5/bluez5.inc<br>
&gt; @@ -82,7 +82,7 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${INIT_D_DIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/init ${D}${INIT_D=
_DIR}/bluetooth<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/bluetooth/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install -m 0755 -d ${D}${sysconfdir}/bluetooth/<b=
r>
<br>
The default mode used by `install` if not specified is 0755. <br>
The above change should not make any difference...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f ${S}/profiles/network/network.conf ]=
; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 =
${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
//Peter<br>
<br>
</blockquote></div></div>

--000000000000ca140505ea4b2b15--

