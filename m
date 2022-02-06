Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E333C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 10:13:40 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.7275.1644142418963165591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 02:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q3mY7aBy;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id 103so4685188uag.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 02:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zfIcoNVTotxwKkjmKxGxpWkIKwytub8v5yOAn1/rHAo=;
        b=Q3mY7aByqiQGCXilbL9GjZYjqHschu37S2Z8Jeh15B26ZNWvOPidl6nY39RbNIqk+6
         0+mv0YQ9thc5oelGeTkk9oSfEfWch/pdN47R8eHM2s6tlu25VF2a/Wr3KD1tplHpLCoH
         Dqz/k1LkHHfh2dB9iFWaYhGe27plZAWZPJYUu47fhsvrLi6uwRY8jQtwxg0tuXHV8wU/
         ytFrD3Lglhk5vH72hbbdjP1Ft06AWBSaZoOZPrdWnu3qrxS3Ai0WNmEw4qA/caW91Gjj
         GJ/FGug+Sl+vNHQg4pU99kuHIkxIDAGDoSizo0vZakkpSejyt7UARELmAteZMD01jMLt
         tWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfIcoNVTotxwKkjmKxGxpWkIKwytub8v5yOAn1/rHAo=;
        b=woEpa77LB9Mb8qlTwihi+HwwvyiKrDy927xOunU+C5lSU6ZhVZEtiZrJfQA9LcEIYu
         INy7wZZN8JQkoSs+6C2XWS0QcP32dty+JGvJK7jq3yLIgS21eDErQV//N9T+GaCZiyIu
         wwM7jmiLL8eliFCs0lFRiUc5rg4K9/tA6GrQ4/vkyLtNCSiU0MwmA6xQ6RxeIUeXhT3r
         zY/iiPil8GgLh/HofzyruAeYFCNf2IGkUn2QPHH2uACl8mFiZfl+gHOlf1U+4DAJHNjY
         QJq1oVMt8aMB6hRVVQZWqOrRoA+v1RR8985uSjElYTxcNgnXUdkyp5sHovW1zjwYNJ8f
         AaCA==
X-Gm-Message-State: AOAM5310xS4JZ096tuifrFC97CTPR3dFIsGka/SI2X/5ErauVl5rKLmX
	fg872CYTkCOQXC83+g5/gDotQEyfJhckYATmoRM=
X-Google-Smtp-Source: 
 ABdhPJywEcQsR/1LQJV2mdonLkImbTX1AK9GuUhg6bHCDYpflq6gj1pENwemngEjRONOSmWjUbbHZKkIwWd3rx7UHsE=
X-Received: by 2002:a67:b241:: with SMTP id s1mr2981762vsh.73.1644142418024;
 Sun, 06 Feb 2022 02:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de>
 <16D0E3273582D58F.23031@lists.openembedded.org>
 <16D1299F302D38AC.20549@lists.openembedded.org>
 <6110e21a41185f05294c84f402725062ac6a66cb.camel@linuxfoundation.org>
In-Reply-To: 
 <6110e21a41185f05294c84f402725062ac6a66cb.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 6 Feb 2022 11:13:26 +0100
Message-ID: 
 <CANNYZj9uOhSu06Did2=e_NfT-Gx+JnOgTKO9nw20m_V+117-Pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000c95aef05d756bc83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 10:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161397

--000000000000c95aef05d756bc83
Content-Type: text/plain; charset="UTF-8"

There's also an issue with the wrapper script run by host bash for
qemu-system that breaks with uninative, so just hold it off until I get it
all confirmed as working :)

Alex

On Sun, 6 Feb 2022 at 10:57, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2022-02-06 at 09:51 +0000, Richard Purdie via
> lists.openembedded.org
> wrote:
> > On Sat, 2022-02-05 at 12:20 +0000, Richard Purdie via
> lists.openembedded.org
> > wrote:
> > > On Fri, 2022-02-04 at 21:40 +0100, Alexander Kanavin wrote:
> > > > Some of the host distributions build the drivers in a way
> (RPATH/RUNPATH)
> > > > that tricks uninative loader into loading pieces of the host libc, if
> > > > the same pieces haven't been previously loaded by native binaries.
> Mixing
> > > > the two libc versions leads to failures.
> > > >
> > > > This change ensures that the correct (uninative) versions are always
> in use.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta/classes/qemuboot.bbclass | 2 +-
> > > >  scripts/runqemu               | 4 ++++
> > > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/qemuboot.bbclass
> b/meta/classes/qemuboot.bbclass
> > > > index cc1cbce69d..229bd88527 100644
> > > > --- a/meta/classes/qemuboot.bbclass
> > > > +++ b/meta/classes/qemuboot.bbclass
> > > > @@ -109,7 +109,7 @@ def qemuboot_vars(d):
> > > >      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> > > >                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> > > >                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> > > > -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> > > > +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES',
> 'UNINATIVE_LOADER']
> > > >      return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> > > >
> > > >  do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> > > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > > index 4e05c1bb15..7d1f85f357 100755
> > > > --- a/scripts/runqemu
> > > > +++ b/scripts/runqemu
> > > > @@ -460,6 +460,10 @@ class BaseConfig(object):
> > > >          except subprocess.CalledProcessError as e:
> > > >              raise RunQemuError("Could not determine the path to dri
> drivers on the host via pkg-config.\nPlease install Mesa development files
> (particularly, dri.pc) on the host machine.")
> > > >          os.environ['LIBGL_DRIVERS_PATH'] =
> dripath.decode('utf-8').strip()
> > > > +        uninative_path =
> os.path.dirname(self.get("UNINATIVE_LOADER"))
> > > > +        preload_items = ['libdl.so.2', 'librt.so.1',
> 'libpthread.so.0']
> > > > +        preload_paths = [os.path.join(uninative_path, i) for i in
> preload_items]
> > > > +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
> > > >
> > >
> > > This looks like a good way to work around this corner case and I don't
> see any
> > > other alternative. Can I ask that:
> > >
> > > a) we put some comment into the code so we can understand this in a
> couple of
> > > years time as it is a rather weird corner case
> > >
> > > b) we put some "if os.path.exists()" in there, maybe even just on the
> uninnative
> > > loader direction so that in the non-uninative case we don't throw
> warnings?
> >
> > I've added a tweak doing this into master-next.
>
> Although I see one in your branch too, should have checked that first :/
>
> Cheers,
>
> Richard
>
>

--000000000000c95aef05d756bc83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There&#39;s also an issue with the wrapper script run=
 by host bash for qemu-system that breaks with uninative, so just hold it o=
ff until I get it all confirmed as working :)</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sun, 6 Feb 2022 at 10:57, Richard Purdie &lt;<a href=3D"mailto=
:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On S=
un, 2022-02-06 at 09:51 +0000, Richard Purdie via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a><br>
wrote:<br>
&gt; On Sat, 2022-02-05 at 12:20 +0000, Richard Purdie via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a><br>
&gt; wrote:<br>
&gt; &gt; On Fri, 2022-02-04 at 21:40 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; &gt; Some of the host distributions build the drivers in a way (R=
PATH/RUNPATH)<br>
&gt; &gt; &gt; that tricks uninative loader into loading pieces of the host=
 libc, if<br>
&gt; &gt; &gt; the same pieces haven&#39;t been previously loaded by native=
 binaries. Mixing<br>
&gt; &gt; &gt; the two libc versions leads to failures.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This change ensures that the correct (uninative) versions ar=
e always in use.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@=
linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/classes/qemuboot.bbclass | 2 +-<br>
&gt; &gt; &gt;=C2=A0 scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 5 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qe=
muboot.bbclass<br>
&gt; &gt; &gt; index cc1cbce69d..229bd88527 100644<br>
&gt; &gt; &gt; --- a/meta/classes/qemuboot.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes/qemuboot.bbclass<br>
&gt; &gt; &gt; @@ -109,7 +109,7 @@ def qemuboot_vars(d):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 build_vars =3D [&#39;MACHINE&#39;, &#39;=
TUNE_ARCH&#39;, &#39;DEPLOY_DIR_IMAGE&#39;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;KERNEL_IMAGETYPE&#39;, &#39;IMAGE_NAME&#39;, &#39;IMAGE_LINK_NAME&=
#39;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;STAGING_DIR_NATIVE&#39;, &#39;STAGING_BINDIR_NATIVE&#39;,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#3=
9;STAGING_DIR_HOST&#39;, &#39;SERIAL_CONSOLES&#39;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#3=
9;STAGING_DIR_HOST&#39;, &#39;SERIAL_CONSOLES&#39;, &#39;UNINATIVE_LOADER&#=
39;]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return build_vars + [k for k in d.keys()=
 if k.startswith(&#39;QB_&#39;)]<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 do_write_qemuboot_conf[vardeps] +=3D &quot;${@&#39; &#=
39;.join(qemuboot_vars(d))}&quot;<br>
&gt; &gt; &gt; diff --git a/scripts/runqemu b/scripts/runqemu<br>
&gt; &gt; &gt; index 4e05c1bb15..7d1f85f357 100755<br>
&gt; &gt; &gt; --- a/scripts/runqemu<br>
&gt; &gt; &gt; +++ b/scripts/runqemu<br>
&gt; &gt; &gt; @@ -460,6 +460,10 @@ class BaseConfig(object):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess.CalledPr=
ocessError as e:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise RunQem=
uError(&quot;Could not determine the path to dri drivers on the host via pk=
g-config.\nPlease install Mesa development files (particularly, dri.pc) on =
the host machine.&quot;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;LIBGL_DRIV=
ERS_PATH&#39;] =3D dripath.decode(&#39;utf-8&#39;).strip()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uninative_path =3D os.path.dirn=
ame(self.get(&quot;UNINATIVE_LOADER&quot;))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 preload_items =3D [&#39;libdl.s=
o.2&#39;, &#39;librt.so.1&#39;, &#39;libpthread.so.0&#39;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 preload_paths =3D [os.path.join=
(uninative_path, i) for i in preload_items]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;LD_PRELOAD&#39;=
] =3D &quot; &quot;.join(preload_paths)<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; This looks like a good way to work around this corner case and I =
don&#39;t see any<br>
&gt; &gt; other alternative. Can I ask that:<br>
&gt; &gt; <br>
&gt; &gt; a) we put some comment into the code so we can understand this in=
 a couple of<br>
&gt; &gt; years time as it is a rather weird corner case<br>
&gt; &gt; <br>
&gt; &gt; b) we put some &quot;if os.path.exists()&quot; in there, maybe ev=
en just on the uninnative<br>
&gt; &gt; loader direction so that in the non-uninative case we don&#39;t t=
hrow warnings?<br>
&gt; <br>
&gt; I&#39;ve added a tweak doing this into master-next.<br>
<br>
Although I see one in your branch too, should have checked that first :/<br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000c95aef05d756bc83--

