Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoA5j-00048E-BE
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:17:15 +0200
Received: by ghbz2 with SMTP id z2so9166026ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=uTB+1ryDVqlhTvnEutUxCLEjMVE0zMA+lE9+Oph9MKQ=;
	b=LnpDUv0Le24740sMVpjAFNa0ycyUrY2VDmvJ+2qrOynaL0E0R/focAb56d1nxWuGTn
	JaKQySgw4VYY6MlAFLAy52KEMq6/ssANhMWn4e6zk6WLsKRmX0bNNtnd1Xz60/LNbXw0
	DMvKVclJCB/2YcGDw5Er1fcuIApKkPCUPksMYJ63PZUXxXu/HFDAb4aV+U88as/ry/WA
	CMHuFuX892lRazHMGo/EB1K043Wmz/Z8gVTCraa/OAhpS7wedrHQpP4vMkEBCw25PLRP
	TSrNR4OgOEEvyo/YX9QoPCthD0L0Ui52nMHV/hfx6o+uwIZ+vke9ut2lv/tsC+KWIDX8
	H5aQ==
Received: by 10.50.189.135 with SMTP id gi7mr7717280igc.8.1341824765570; Mon,
	09 Jul 2012 02:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 02:05:45 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <alpine.DEB.2.02.1207081227430.27741@oneiric>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 12:05:45 +0300
Message-ID: <CAK18fxFD1X6tPLsXG-vwRFu-EeEZDTdeKoTKRYAvYrKJfd-_mQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl6Jshxz4+bTV9s3p/hqpoVSs1UTAhmBOGdTlU6NrisYb+C6zv1Lt1Tc47kDD9ytj4FG226
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 09:17:15 -0000
Content-Type: multipart/alternative; boundary=14dae934040b80acb104c461ec8e

--14dae934040b80acb104c461ec8e
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 8, 2012 at 8:59 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>   (most of this is sort of self-evident but it's not documented as
> well as it could be so i just want to make sure i have it exactly
> right.)
>
>   snippets of some layer.conf files:
>
> oe-core:
>
> BBPATH .= ":${LAYERDIR}"
> BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
>
> meta-hob:
>
> BBPATH := "${BBPATH}:${LAYERDIR}"
> BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
>
> meta-yocto:
>
> BBPATH := "${LAYERDIR}:${BBPATH}"
> BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
>             ${LAYERDIR}/recipes-*/*/*.bbappend"
>
>   note how meta-hob *appends* itself to BBPATH, while meta-yocto
> *prepends* itself.  is there no possibility that this will cause some
> confusion based on how BBPATH is used to resolve the location of class
> or conf files?  i realize you should try to avoid that sort of
> conflict but it still seems possible that someone might choose the
> names of some files badly and the unpredictable ordering in BBPATH
> will cause grief, no?
>
>
I don't think this can cause any problems. It's all about the order the
files are searched. As long as you have proper priority set nothing can go
wrong.

@g

--14dae934040b80acb104c461ec8e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Sun, Jul 8, 2012 at 8:59 PM, Robert P. J.=
 Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=
=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">

<br>
=A0 (most of this is sort of self-evident but it&#39;s not documented as<br=
>
well as it could be so i just want to make sure i have it exactly<br>
right.)<br>
<br>
=A0 snippets of some layer.conf files:<br>
<br>
oe-core:<br>
<br>
BBPATH .=3D &quot;:${LAYERDIR}&quot;<br>
BBFILES +=3D &quot;${LAYERDIR}/recipes-*/*/*.bb&quot;<br>
<br>
meta-hob:<br>
<br>
BBPATH :=3D &quot;${BBPATH}:${LAYERDIR}&quot;<br>
BBFILES :=3D &quot;${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb&quot;<br>
<br>
meta-yocto:<br>
<br>
BBPATH :=3D &quot;${LAYERDIR}:${BBPATH}&quot;<br>
BBFILES :=3D &quot;${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \<br>
=A0 =A0 =A0 =A0 =A0 =A0 ${LAYERDIR}/recipes-*/*/*.bbappend&quot;<br>
<br>
=A0 note how meta-hob *appends* itself to BBPATH, while meta-yocto<br>
*prepends* itself. =A0is there no possibility that this will cause some<br>
confusion based on how BBPATH is used to resolve the location of class<br>
or conf files? =A0i realize you should try to avoid that sort of<br>
conflict but it still seems possible that someone might choose the<br>
names of some files badly and the unpredictable ordering in BBPATH<br>
will cause grief, no?<br><br></blockquote><div><br></div><div>I don&#39;t t=
hink this can cause any problems. It&#39;s all about the order the files ar=
e searched. As long as you have proper priority set nothing can go wrong.=
=A0</div>

<div><br></div><div>@g</div></div><br>

--14dae934040b80acb104c461ec8e--
