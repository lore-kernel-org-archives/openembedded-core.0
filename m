Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SujPh-00041h-Ec
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:13:01 +0200
Received: by ghbz2 with SMTP id z2so2793536ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pqmzno2+Mi6YV5bYqcDbOTKpGthaf2bW+nd7nGXoezY=;
	b=D3yBJSB3GpHv2Fkcv5p7IRPV70F14tLMaF5OKhyFWJen7K4ZX/YtQHvKs45AVhc5IM
	O4B5vm8Avw8eNCqSUi4T+LUe8nqn/MxoVItcPqrx2hcVUzj3+E3rIQ1SU1rwPIC5OZDO
	3tHVr/hVXQKUka5aS006nhKYgGYTgADjt0rQ2QS8fTM3LS3jXubb6nx1Hx6AhSerouU9
	9b2P2D7s8x8VDUze6leHh6Ybh5EpPgx3ZRzoSJLQ4e8xR8a5T94izXpKUF2QGE1zLvwU
	87VyIP0WRNCJmep8t2mDl24cMEua0IbNYO/1N3Wj1S0IOinrfaQGPLrlqsP1t07B+Shp
	Gv2w==
MIME-Version: 1.0
Received: by 10.50.189.134 with SMTP id gi6mr4360183igc.55.1343390488921; Fri,
	27 Jul 2012 05:01:28 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Fri, 27 Jul 2012 05:01:28 -0700 (PDT)
In-Reply-To: <1343388304.9574.118.camel@ted>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
	<1343388304.9574.118.camel@ted>
Date: Fri, 27 Jul 2012 14:01:28 +0200
Message-ID: <CAAQYJAuYJNWV8EqvZx2=TWP1G8f0Uh-Uoub75DoGzwixCji05Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: image.bbclass: Update outdated reference to "export IMAGE_BASENAME"
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
X-List-Received-Date: Fri, 27 Jul 2012 12:13:01 -0000
Content-Type: multipart/alternative; boundary=14dae9340a1be305b904c5ce7810

--14dae9340a1be305b904c5ce7810
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 27, 2012 at 1:25 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2012-07-26 at 19:06 -0400, Robert P. J. Day wrote:
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >   does this look about right?
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 1799bf1..b0b476f 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -58,10 +58,9 @@ PACKAGE_GROUP_dev-pkgs[optional] = "1"
> >  PACKAGE_GROUP_doc-pkgs = "${@' '.join('%s-doc' % pkg for pkg in
> normal_pkgs_to_install(d))}"
> >  PACKAGE_GROUP_doc-pkgs[optional] = "1"
> >
> > -# "export IMAGE_BASENAME" not supported at this time
> >  IMAGE_INSTALL ?= ""
> >  IMAGE_INSTALL[type] = "list"
> > -IMAGE_BASENAME[export] = "1"
> > +export IMAGE_BASENAME
> >  export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}
> ${FEATURE_INSTALL}"
> >  PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
> >
> > diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bbb/meta/recipes-core/images/
> core-image-minimal-initramfs.bb
> > index 7f6826c..ddc2142 100644
> > --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > @@ -8,7 +8,6 @@ IMAGE_INSTALL = "initramfs-live-boot
> initramfs-live-install initramfs-live-insta
> >  # Do not pollute the initrd image with rootfs features
> >  IMAGE_FEATURES = ""
> >
> > -export IMAGE_BASENAME = "core-image-minimal-initramfs"
> >  IMAGE_LINGUAS = ""
>
> I meant just to remove the export flag here, so:
>
> -export IMAGE_BASENAME = "core-image-minimal-initramfs"
> +IMAGE_BASENAME = "core-image-minimal-initramfs"
>

Why is this finally needed?
I'd redefine IMAGE_BASENAME only to change from its default value (PN)

Cheers

Andrea


> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340a1be305b904c5ce7810
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jul 27, 2012 at 1:25 PM, Richard Purdie =
<span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Thu, 2012-07-26 at 19:06 -0400, =
Robert P. J. Day wrote:<br>
&gt; Signed-off-by: Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcour=
se.ca">rpjday@crashcourse.ca</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; =A0 does this look about right?<br>
&gt;<br>
&gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<b=
r>
&gt; index 1799bf1..b0b476f 100644<br>
&gt; --- a/meta/classes/image.bbclass<br>
&gt; +++ b/meta/classes/image.bbclass<br>
&gt; @@ -58,10 +58,9 @@ PACKAGE_GROUP_dev-pkgs[optional] =3D &quot;1&quot;<=
br>
&gt; =A0PACKAGE_GROUP_doc-pkgs =3D &quot;${@&#39; &#39;.join(&#39;%s-doc&#3=
9; % pkg for pkg in normal_pkgs_to_install(d))}&quot;<br>
&gt; =A0PACKAGE_GROUP_doc-pkgs[optional] =3D &quot;1&quot;<br>
&gt;<br>
&gt; -# &quot;export IMAGE_BASENAME&quot; not supported at this time<br>
&gt; =A0IMAGE_INSTALL ?=3D &quot;&quot;<br>
&gt; =A0IMAGE_INSTALL[type] =3D &quot;list&quot;<br>
&gt; -IMAGE_BASENAME[export] =3D &quot;1&quot;<br>
&gt; +export IMAGE_BASENAME<br>
&gt; =A0export PACKAGE_INSTALL ?=3D &quot;${IMAGE_INSTALL} ${ROOTFS_BOOTSTR=
AP_INSTALL} ${FEATURE_INSTALL}&quot;<br>
&gt; =A0PACKAGE_INSTALL_ATTEMPTONLY ?=3D &quot;${FEATURE_INSTALL_OPTIONAL}&=
quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/images/<a href=3D"http://core-image-min=
imal-initramfs.bb" target=3D"_blank">core-image-minimal-initramfs.bb</a> b/=
meta/recipes-core/images/<a href=3D"http://core-image-minimal-initramfs.bb"=
 target=3D"_blank">core-image-minimal-initramfs.bb</a><br>

&gt; index 7f6826c..ddc2142 100644<br>
&gt; --- a/meta/recipes-core/images/<a href=3D"http://core-image-minimal-in=
itramfs.bb" target=3D"_blank">core-image-minimal-initramfs.bb</a><br>
&gt; +++ b/meta/recipes-core/images/<a href=3D"http://core-image-minimal-in=
itramfs.bb" target=3D"_blank">core-image-minimal-initramfs.bb</a><br>
&gt; @@ -8,7 +8,6 @@ IMAGE_INSTALL =3D &quot;initramfs-live-boot initramfs-=
live-install initramfs-live-insta<br>
&gt; =A0# Do not pollute the initrd image with rootfs features<br>
&gt; =A0IMAGE_FEATURES =3D &quot;&quot;<br>
&gt;<br>
&gt; -export IMAGE_BASENAME =3D &quot;core-image-minimal-initramfs&quot;<br=
>
&gt; =A0IMAGE_LINGUAS =3D &quot;&quot;<br>
<br>
</div></div>I meant just to remove the export flag here, so:<br>
<br>
-export IMAGE_BASENAME =3D &quot;core-image-minimal-initramfs&quot;<br>
+IMAGE_BASENAME =3D &quot;core-image-minimal-initramfs&quot;<br></blockquot=
e><div><br>Why is this finally needed?<br>I&#39;d redefine IMAGE_BASENAME o=
nly to change from its default value (PN)<br><br>Cheers <br><br>Andrea<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--14dae9340a1be305b904c5ce7810--
