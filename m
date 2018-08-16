Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id EBDC47909B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 08:05:05 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id t5-v6so4285175qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=icjt2YV5Drp+QE4VhdSxXB//zmbMjVwcK1gAm6RZwfk=;
	b=fYe1UfKaP2kSWL44ZCrQ+V8gC5LP4O6dxbB68BC0XsJPLEfdM+LmEKND5xy+JBCjy6
	wAQRjpKP2Dnqe+IE/qHMf0OpJvraG20jG/VO8aB7JZJIwr1e03y5oMA8/iRbXeWpVTBD
	PGZBh+I9LFf+wDiUT0JpJx/Bg1TjV6eK6n/bpV7oq5dPUK90lb0IwZ9PqFoBxTTT5q1f
	m7fGWl7kgqTyH+XGcVdJ7ShX9TFREwA/Eqtt5ZUIN0lx0TqyVDRTiMQhOx5FGJN9uDQb
	44FMa2VCla/MbNL3ImNJshhngcBuU8uF2A61N6M/YS94xEeidwRbBo7dAWnDisiO++sb
	9tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=icjt2YV5Drp+QE4VhdSxXB//zmbMjVwcK1gAm6RZwfk=;
	b=DZXUKuZSlQnJi3kfLljPm12bdplbVPSYI+O7O9kxRtMYOFhkl9XgPMtQVdHvE93WiS
	YtSohY1f6tHqdqM3/cLLH/6hctVVwdNcQMjl7Osd11GGEaW8DTChtiYPRVMRUXs0uaJA
	Em+GEtOH4RNwwrnabRQT+NS0W+34VUbPWFcFJ0jWlnS+PKKOfxXzYPIVFZjGI09Atoct
	TWLXo3iCU0LbAIlmilPUveUalLEM9H+c1Hl+lpkF70L90ft4i2EsjwgBQc9W9wO6qPS3
	iGgSUNgedvaZI5ElUedLpTxhEiangzInDBI+NomO78/WuAEE6rHYgUI85WjhorV/b2Dr
	A2hw==
X-Gm-Message-State: AOUpUlE6Kr8LqK6VJy+N/GKRnj2r1pUcnluPJdPdMp6PqQk8RVi5zRmN
	NmUOWdaEi0+n+hpytP0P+VMgZhhHIzDSfUPGcnE3Qg==
X-Google-Smtp-Source: AA+uWPz9fEU90EYacOi8LUiASSLoZmG9/lRJksQX9o0aEj+eZMVsfUuPoexF/gzyaKHsd8ZjUwJJsnK9lxC8wh3qhsc=
X-Received: by 2002:ac8:43cb:: with SMTP id
	w11-v6mr28690869qtn.371.1534406706786; 
	Thu, 16 Aug 2018 01:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNQnjVfwZi71npxavTHPLbxRi04DsLB-SK+kNr5ovEYe_A@mail.gmail.com>
	<20180816021332.GY19965@denix.org>
In-Reply-To: <20180816021332.GY19965@denix.org>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 16 Aug 2018 10:04:55 +0200
Message-ID: <CAGCTLNSxjR4Ka2L6O8mD73PFrYQ5pofbR0oba5dNVJEnvghV1A@mail.gmail.com>
To: denis@denix.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: running qt5 apps on wayland image without x11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 08:05:06 -0000
Content-Type: multipart/alternative; boundary="000000000000b2f4e3057388e635"

--000000000000b2f4e3057388e635
Content-Type: text/plain; charset="UTF-8"

these two lines were typed in local.conf file already

On Thu, Aug 16, 2018 at 4:13 AM Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Aug 15, 2018 at 05:20:01PM +0200, Mohamed Dawod wrote:
> > Hi,
> >
> > I am trying to run qt5 application "Qt5-cinematicexperience" on my custom
> > image
> > I faced the following error :
> > ----------
> > This application failed to start because it couldnt find or load the
> > Qt pltform plugin "xcb".
> > Available platform plugins are : eglfs, minimal, minimalegl, offscreen.
> > ----------
> > I removed x11 from the image and added wayland & weston instead.
> > I found that "xcb" is one of the features that should be added to
> > PACKAGESCONFIG in case of using x11.
> > so the Error is logical but how I makes qt5 app work with wayland ?
>
> DISTRO_FEATURES_remove = "x11"
> DISTRO_FEATURES_append = " wayland"
>
>
> >
> > Thank you,
> > --
> >
> > Mohamed Dawod
> > Computer Engineering Department
> > Faculty of Engineering
> > Cairo University
>
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--000000000000b2f4e3057388e635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">these two lines were typed in local.conf file already<br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Aug 16, 2018 a=
t 4:13 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@de=
nix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Aug =
15, 2018 at 05:20:01PM +0200, Mohamed Dawod wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I am trying to run qt5 application &quot;Qt5-cinematicexperience&quot;=
 on my custom<br>
&gt; image<br>
&gt; I faced the following error :<br>
&gt; ----------<br>
&gt; This application failed to start because it couldnt find or load the<b=
r>
&gt; Qt pltform plugin &quot;xcb&quot;.<br>
&gt; Available platform plugins are : eglfs, minimal, minimalegl, offscreen=
.<br>
&gt; ----------<br>
&gt; I removed x11 from the image and added wayland &amp; weston instead.<b=
r>
&gt; I found that &quot;xcb&quot; is one of the features that should be add=
ed to<br>
&gt; PACKAGESCONFIG in case of using x11.<br>
&gt; so the Error is logical but how I makes qt5 app work with wayland ?<br=
>
<br>
DISTRO_FEATURES_remove =3D &quot;x11&quot;<br>
DISTRO_FEATURES_append =3D &quot; wayland&quot;<br>
<br>
<br>
&gt; <br>
&gt; Thank you,<br>
&gt; -- <br>
&gt; <br>
&gt; Mohamed Dawod<br>
&gt; Computer Engineering Department<br>
&gt; Faculty of Engineering<br>
&gt; Cairo University<br>
<br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div>

--000000000000b2f4e3057388e635--
