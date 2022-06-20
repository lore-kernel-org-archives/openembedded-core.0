Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF7DC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:15:37 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web09.30193.1655730930468987518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3zniwtj;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: qorin.wu@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2ef5380669cso99841687b3.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQAzWAk74ALahzvDsseLFNBmzm+Evvn+RQOw59Pe4IY=;
        b=p3zniwtjvetWrWr55oIAcl339BPx1EqT7xWheyEsAiVgs5TEdvu+TiNJYiOap0uvhT
         j40OURMLN2tIeLG6tsYEtV1M7CsHMtxuO3OO491aksS+kzyO7KEiER3XfOcTZ0f5O5fl
         RaGXTLudeW985ZJILNdgyjDV8u1oduLAkpEU9AKUiNDMvzJNkEaqFBiLXBMcwDi12+n7
         bWEjcWcxT4H9TGzp+eKN3LompD+VnIM70iO4bC+iKynON+NDd0bv/R5cnjoGfzco3Aox
         fTA/Vhz5IlopHnH2SBzvx32hWIXsZPE+Y2CCEuwAhLnTYUXBsqYTZheWrMp3Y8JZhteJ
         EPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQAzWAk74ALahzvDsseLFNBmzm+Evvn+RQOw59Pe4IY=;
        b=iZFoQeub+8q3sbSbvL0ROJ6p6q0DuwAw8T7JciJhzigxmNND64HN4Ez9zilXAxhu0U
         vVLzZxRg3UrJB1E+IDpNoH+x8wId78s4EjsN1w0YCe2sPBo0qhDyJ2nE/NBo1DunAWGf
         V3dZrUbfYvB6J4gucT8qoTwiEgAJ4TLyleVV3PGUWBq1Qt6d8i1XW1pcY0bEHHU3+6Fi
         xJ/7CfDWW+wu3fIIymgygK86lDFUm4QI9hUtVH7mtMVCcPCbtFikX7vPyv8/6o1osZoc
         IOa0lQwU/z4p013IqLSfdnZCOdgy66FAv+QjqvUYXnJSCCcGIZDBZG1Ym7h1WYA1SZfn
         0Uhw==
X-Gm-Message-State: AJIora+QXNmJ//viQI+updeMMU3efpH9iFBIZIXlV5E8PgzqxZQBO8GR
	Py2c2/W+4DlTb31WbPHCuITSGFiJuQ0z+0O640urBMo=
X-Google-Smtp-Source: 
 AGRyM1si83nRsMMoxpLIXzpOXyYIVG4xsoStydoy0XmfObtG70/zYGjxLbYmjJfpxD3rmC5C2FlhuqTvRmQnTuOMvP4=
X-Received: by 2002:a0d:d742:0:b0:317:9683:c2df with SMTP id
 z63-20020a0dd742000000b003179683c2dfmr13035719ywd.127.1655730929515; Mon, 20
 Jun 2022 06:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220620080820.10211-1-qorin.wu@gmail.com>
 <20220620112027.4ed71759@booty>
 <AM0PR06MB4625172F0F099B35BB980A7BD9B09@AM0PR06MB4625.eurprd06.prod.outlook.com>
 <20220620114955.61d67615@booty> <5a4ce3d633c64756aab5e3987b1668ea@axis.com>
In-Reply-To: <5a4ce3d633c64756aab5e3987b1668ea@axis.com>
From: Qorin Wu <qorin.wu@gmail.com>
Date: Mon, 20 Jun 2022 15:15:18 +0200
Message-ID: 
 <CAB5BoHvf=ip+_1VH0LPx3nxsbdUVkbKF-5JM2EzPsgBdmwwO1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file since it
 has been moved to a separate file since version 1.90
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Qorin Qorinna <qorin.qorinna@nl.abb.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e5bf9605e1e0e54f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167105

--000000000000e5bf9605e1e0e54f
Content-Type: text/plain; charset="UTF-8"

Hi Peter and Luca,

Thanks. I have updated the sed dependency and fixed the commit message.
Ignore the 2nd mail, the 3rd mail was the correct one.

Regards,
Qorin

On Mon, Jun 20, 2022 at 12:55 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Luca Ceresoli via
> > lists.openembedded.org
> > Sent: den 20 juni 2022 11:50
> > To: Qorin Qorinna <qorin.qorinna@nl.abb.com>
> > Cc: Qorin Wu <qorin.wu@gmail.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file
> since it has been moved to a separate file since version 1.90
>
> It is expected that the subject line is prefixed with the recipe name.
> It is also a very long subject line. Better would be to move half of
> it to the commit message body, e.g.:
>
> resolvconf: Install missing normalize-resolvconf file
>
> It was moved to a separate file in version 1.90.
>
> > Hi Qorin,
> >
> > On Mon, 20 Jun 2022 09:24:22 +0000
> > Qorin Qorinna <qorin.qorinna@nl.abb.com> wrote:
> >
> > > Hi Luca,
> > >
> > > it's because the normalize-resolvconf requires sed.
> > >
> > > These are the error messages that I got when I built the package w/o
> sed
> > > ERROR: resolvconf-1.91-r0 do_package_qa: QA Issue:
> /lib/resolvconf/normalize-resolvconf contained in package resolvconf
> requires /bin/sed, but no providers found in RDEPENDS:resolvconf?
> [file-rdeps]
> > > ERROR: resolvconf-1.91-r0 do_package_qa: Fatal QA errors were found,
> failing task.
> >
> > I see. In this case it would be nice to add either a line to the commit
> > message or a comment in the .bb file, just to avoid others to wonder
> > why sed is needed.
>
> The problem here is that sed is provided by busybox and in almost all
> cases you do not want an explicit dependency on sed as that instead will
> install the sed program from the sed recipe.
>
> In this case I would recommend to add something like this:
>
> # The normalize-resolvconf sed script uses /bin/sed on the shebang line.
> # Ignore the file-rdeps test to avoid having to add a runtime dependency
> on sed.
> INSANE_SKIP:${PN} += "file-rdeps"
>
> > I added a line to the commit message on my branch that I'm going to
> > test. It would be great if you could do so for future patches. Thanks!
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> //Peter
>
>

--000000000000e5bf9605e1e0e54f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter and Luca,</div><div><br></div><div>Thanks. I=
 have updated the sed dependency and fixed the commit message.</div><div>Ig=
nore the 2nd mail, the 3rd mail was the correct one.</div><div><br></div><d=
iv>Regards,</div><div>Qorin<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 20, 2022 at 12:55 PM Peter=
 Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Luca Ceresoli via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: den 20 juni 2022 11:50<br>
&gt; To: Qorin Qorinna &lt;<a href=3D"mailto:qorin.qorinna@nl.abb.com" targ=
et=3D"_blank">qorin.qorinna@nl.abb.com</a>&gt;<br>
&gt; Cc: Qorin Wu &lt;<a href=3D"mailto:qorin.wu@gmail.com" target=3D"_blan=
k">qorin.wu@gmail.com</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file s=
ince it has been moved to a separate file since version 1.90<br>
<br>
It is expected that the subject line is prefixed with the recipe name.<br>
It is also a very long subject line. Better would be to move half of <br>
it to the commit message body, e.g.:<br>
<br>
resolvconf: Install missing normalize-resolvconf file<br>
<br>
It was moved to a separate file in version 1.90.<br>
<br>
&gt; Hi Qorin,<br>
&gt; <br>
&gt; On Mon, 20 Jun 2022 09:24:22 +0000<br>
&gt; Qorin Qorinna &lt;<a href=3D"mailto:qorin.qorinna@nl.abb.com" target=
=3D"_blank">qorin.qorinna@nl.abb.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi Luca,<br>
&gt; &gt;<br>
&gt; &gt; it&#39;s because the normalize-resolvconf requires sed.<br>
&gt; &gt;<br>
&gt; &gt; These are the error messages that I got when I built the package =
w/o sed<br>
&gt; &gt; ERROR: resolvconf-1.91-r0 do_package_qa: QA Issue: /lib/resolvcon=
f/normalize-resolvconf contained in package resolvconf requires /bin/sed, b=
ut no providers found in RDEPENDS:resolvconf? [file-rdeps]<br>
&gt; &gt; ERROR: resolvconf-1.91-r0 do_package_qa: Fatal QA errors were fou=
nd, failing task.<br>
&gt; <br>
&gt; I see. In this case it would be nice to add either a line to the commi=
t<br>
&gt; message or a comment in the .bb file, just to avoid others to wonder<b=
r>
&gt; why sed is needed.<br>
<br>
The problem here is that sed is provided by busybox and in almost all <br>
cases you do not want an explicit dependency on sed as that instead will <b=
r>
install the sed program from the sed recipe. <br>
<br>
In this case I would recommend to add something like this:<br>
<br>
# The normalize-resolvconf sed script uses /bin/sed on the shebang line.<br=
>
# Ignore the file-rdeps test to avoid having to add a runtime dependency on=
 sed.<br>
INSANE_SKIP:${PN} +=3D &quot;file-rdeps&quot;<br>
<br>
&gt; I added a line to the commit message on my branch that I&#39;m going t=
o<br>
&gt; test. It would be great if you could do so for future patches. Thanks!=
<br>
&gt; <br>
&gt; --<br>
&gt; Luca Ceresoli, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
//Peter<br>
<br>
</blockquote></div>

--000000000000e5bf9605e1e0e54f--

