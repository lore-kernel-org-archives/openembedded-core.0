Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SukEG-0005Vn-SZ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 15:05:17 +0200
Received: by ghbz2 with SMTP id z2so2839825ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fFHAHDVvhdPkHOczfgTn7C6naT8PI8S9HGRWOEQkRZ4=;
	b=vlqyC2DWU6Vn+mpZalyxpPnbcrjr7ijHhgsUFmdxVWVthYWGgoENOvPZ4zV3gnHN5R
	kK5mFyOTmCcvMKNdUFIAwe3a7taleP6FAu6hTlTvcO3mCwgZK2RE/BraNVLBAB0PaU9F
	TnJk+cg9K8jcDnIMYtyPtUYDmEP3yrkPAZbqd5XuTSRh3uOpTJtt5hiDibYvRzxthcQ4
	/zQ25eNuzLEdeQW+6XIfftSswDFYrGMfQ3U04DvG8L/YWJthbLLfaEESoypYG+KfUIeP
	z3Uq1TNVHOaalhTJWzcs1EgGI5LUg4ZGqRov2JYEJf1wcdy707bVhoRyTHa+b8sZl19Q
	bHHg==
MIME-Version: 1.0
Received: by 10.50.170.39 with SMTP id aj7mr4509135igc.32.1343393624124; Fri,
	27 Jul 2012 05:53:44 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Fri, 27 Jul 2012 05:53:44 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207270801210.14507@oneiric>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
	<1343388304.9574.118.camel@ted>
	<alpine.DEB.2.02.1207270801210.14507@oneiric>
Date: Fri, 27 Jul 2012 14:53:44 +0200
Message-ID: <CAAQYJAvVkEcV=Bjfwp7JZWeXcrss6vUC3Amts5GGzdUrRBWwEw@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jul 2012 13:05:17 -0000
Content-Type: multipart/alternative; boundary=e89a8f235411c26b6d04c5cf3375

--e89a8f235411c26b6d04c5cf3375
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 27, 2012 at 2:01 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Fri, 27 Jul 2012, Richard Purdie wrote:
>
> > On Thu, 2012-07-26 at 19:06 -0400, Robert P. J. Day wrote:
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >
> > > ---
> > >
> > >   does this look about right?
> > >
> > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > index 1799bf1..b0b476f 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -58,10 +58,9 @@ PACKAGE_GROUP_dev-pkgs[optional] = "1"
> > >  PACKAGE_GROUP_doc-pkgs = "${@' '.join('%s-doc' % pkg for pkg in
> normal_pkgs_to_install(d))}"
> > >  PACKAGE_GROUP_doc-pkgs[optional] = "1"
> > >
> > > -# "export IMAGE_BASENAME" not supported at this time
> > >  IMAGE_INSTALL ?= ""
> > >  IMAGE_INSTALL[type] = "list"
> > > -IMAGE_BASENAME[export] = "1"
> > > +export IMAGE_BASENAME
> > >  export PACKAGE_INSTALL ?= "${IMAGE_INSTALL}
> ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
> > >  PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
> > >
> > > diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bbb/meta/recipes-core/images/
> core-image-minimal-initramfs.bb
> > > index 7f6826c..ddc2142 100644
> > > --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > > +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > > @@ -8,7 +8,6 @@ IMAGE_INSTALL = "initramfs-live-boot
> initramfs-live-install initramfs-live-insta
> > >  # Do not pollute the initrd image with rootfs features
> > >  IMAGE_FEATURES = ""
> > >
> > > -export IMAGE_BASENAME = "core-image-minimal-initramfs"
> > >  IMAGE_LINGUAS = ""
> >
> > I meant just to remove the export flag here, so:
> >
> > -export IMAGE_BASENAME = "core-image-minimal-initramfs"
> > +IMAGE_BASENAME = "core-image-minimal-initramfs"
>
>   ah, all right, then.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

By the way,

we have followed pedissequally and re-introduced 'export IMAGE_BASENAME'
[1] when we adapted our initramfs image for oe-core,  even though we had
built whitout until then, both in oe-classic and in oe-core. **

Regards

Andrea

[1]
http://cgit.openembedded.org/meta-handheld/commit/?id=3021e1fc380067666a63fa5b2bdfc5fd16282973
**

--e89a8f235411c26b6d04c5cf3375
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jul 27, 2012 at 2:01 PM, Robert P. J. Da=
y <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"=
_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Fri, 27 Jul 2012, Richard Purdie=
 wrote:<br>
<br>
&gt; On Thu, 2012-07-26 at 19:06 -0400, Robert P. J. Day wrote:<br>
&gt; &gt; Signed-off-by: Robert P. J. Day &lt;<a href=3D"mailto:rpjday@cras=
hcourse.ca">rpjday@crashcourse.ca</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; =A0 does this look about right?<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbcl=
ass<br>
&gt; &gt; index 1799bf1..b0b476f 100644<br>
&gt; &gt; --- a/meta/classes/image.bbclass<br>
&gt; &gt; +++ b/meta/classes/image.bbclass<br>
&gt; &gt; @@ -58,10 +58,9 @@ PACKAGE_GROUP_dev-pkgs[optional] =3D &quot;1&q=
uot;<br>
&gt; &gt; =A0PACKAGE_GROUP_doc-pkgs =3D &quot;${@&#39; &#39;.join(&#39;%s-d=
oc&#39; % pkg for pkg in normal_pkgs_to_install(d))}&quot;<br>
&gt; &gt; =A0PACKAGE_GROUP_doc-pkgs[optional] =3D &quot;1&quot;<br>
&gt; &gt;<br>
&gt; &gt; -# &quot;export IMAGE_BASENAME&quot; not supported at this time<b=
r>
&gt; &gt; =A0IMAGE_INSTALL ?=3D &quot;&quot;<br>
&gt; &gt; =A0IMAGE_INSTALL[type] =3D &quot;list&quot;<br>
&gt; &gt; -IMAGE_BASENAME[export] =3D &quot;1&quot;<br>
&gt; &gt; +export IMAGE_BASENAME<br>
&gt; &gt; =A0export PACKAGE_INSTALL ?=3D &quot;${IMAGE_INSTALL} ${ROOTFS_BO=
OTSTRAP_INSTALL} ${FEATURE_INSTALL}&quot;<br>
&gt; &gt; =A0PACKAGE_INSTALL_ATTEMPTONLY ?=3D &quot;${FEATURE_INSTALL_OPTIO=
NAL}&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/images/<a href=3D"http://core-imag=
e-minimal-initramfs.bb" target=3D"_blank">core-image-minimal-initramfs.bb</=
a> b/meta/recipes-core/images/<a href=3D"http://core-image-minimal-initramf=
s.bb" target=3D"_blank">core-image-minimal-initramfs.bb</a><br>

&gt; &gt; index 7f6826c..ddc2142 100644<br>
&gt; &gt; --- a/meta/recipes-core/images/<a href=3D"http://core-image-minim=
al-initramfs.bb" target=3D"_blank">core-image-minimal-initramfs.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/images/<a href=3D"http://core-image-minim=
al-initramfs.bb" target=3D"_blank">core-image-minimal-initramfs.bb</a><br>
&gt; &gt; @@ -8,7 +8,6 @@ IMAGE_INSTALL =3D &quot;initramfs-live-boot initr=
amfs-live-install initramfs-live-insta<br>
&gt; &gt; =A0# Do not pollute the initrd image with rootfs features<br>
&gt; &gt; =A0IMAGE_FEATURES =3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -export IMAGE_BASENAME =3D &quot;core-image-minimal-initramfs&quo=
t;<br>
&gt; &gt; =A0IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt;<br>
&gt; I meant just to remove the export flag here, so:<br>
&gt;<br>
&gt; -export IMAGE_BASENAME =3D &quot;core-image-minimal-initramfs&quot;<br=
>
&gt; +IMAGE_BASENAME =3D &quot;core-image-minimal-initramfs&quot;<br>
<br>
</div></div>=A0 ah, all right, then.<br>
<div class=3D"im HOEnZb"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 Ottawa, Ontario, CANADA<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a href=3D"http://crashcour=
se.ca" target=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday" target=3D"_blank">http://=
twitter.com/rpjday</a><br>
LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a hr=
ef=3D"http://ca.linkedin.com/in/rpjday" target=3D"_blank">http://ca.linkedi=
n.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">_____________________________=
__________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br></div></div></blockquote><div><br>By the way,<br=
>
<br>we have followed pedissequally and re-introduced &#39;export IMAGE_BASE=
NAME&#39; [1] when we adapted our initramfs image for oe-core,=A0 even thou=
gh we had built whitout until then, both in oe-classic and in oe-core. <spa=
n class=3D"st"><em></em></span><br>
<br>Regards<br><br>Andrea<br><br>[1] <span class=3D"st"><a href=3D"http://c=
git.openembedded.org/meta-handheld/commit/?id=3D3021e1fc380067666a63fa5b2bd=
fc5fd16282973">http://cgit.openembedded.org/meta-handheld/commit/?id=3D3021=
e1fc380067666a63fa5b2bdfc5fd16282973</a><em></em></span></div>
</div>

--e89a8f235411c26b6d04c5cf3375--
