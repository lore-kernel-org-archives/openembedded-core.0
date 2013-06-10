Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 68BC46A5DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:07:21 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so9956467obq.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 06:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=h3aQx0Dr1JxkeWIDZ8i4977H6KlfftkCPkSztuNBVrQ=;
	b=TC4JUx6JYyZUXwskgbGjhI6OaIEhVw/Y2Qi6nhc46FahzBTUZBfRNxPy0TBletzvmK
	Rb0DYPaROCnHcpqWiCzuDP3O1dey8E7D/pv4dbMgxAwkyROCTB1k5ocNlftFjTXj/B9B
	ttvP6gWi8nxcZ9A+gbq4P0LwbTU+z4952zjam/jw4muSDSzSr3zsiQMi8d1z5B/UcP9g
	T/zmLlWSK+yEABW4CtdRZGTaDPgCcGOauJs7aERculXlANHs7Kz/HWjNMQz3UEmCidTf
	CLcrQ7Lw24RLHRg2xq9jtY0GV0XckVam9MX6P3NcluxEX6QDPFb3wJ/OQYYF73OJkdqm
	WYbQ==
X-Received: by 10.60.117.170 with SMTP id kf10mr3802027oeb.44.1370869641998;
	Mon, 10 Jun 2013 06:07:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Mon, 10 Jun 2013 06:07:01 -0700 (PDT)
In-Reply-To: <20130610145952.779c05a0@e6520eb>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<2326207.iuBVrRrsbt@helios>
	<CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
	<CAP71WjxSiWcGu98VTY2z_Dsf+WgSEMKnCoPkoWUfrR7ch321dQ@mail.gmail.com>
	<20130610145952.779c05a0@e6520eb>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 10 Jun 2013 15:07:01 +0200
Message-ID: <CAP71WjxNCrqyvu03V+qQY15y=2X7y_2m4Z9HOXFOJiH_VfbaJg@mail.gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQl+/ff9MLLzZFfjxFi9CDwo7oeyFKgW5z1EFOOPHY3Z/Om9r2AjJRUyTpNGs00w8dKUgK91
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 13:07:22 -0000
Content-Type: multipart/alternative; boundary=047d7b4143780b8a8204decc7634

--047d7b4143780b8a8204decc7634
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2013 at 2:59 PM, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi Nicolas,
>
> Le Mon, 10 Jun 2013 14:10:15 +0200,
> Nicolas Dechesne <nicolas.dechesne@linaro.org> a =E9crit :
>
> > On Mon, Jun 10, 2013 at 1:19 PM, John Stirling
> > <ap.john.stirling@gmail.com>wrote:
> >
> > > You suggest just cutting it down to
> > >
> > > IMAGE_INSTALL +=3D " \
> > > qtui \
> > > "
> > > and it should work itself out ?
> > >
>
> this will work but if you need plugins they will be missing as only the
> linked libraries will be automatically integrated.
>
> >
> > hi, i have observed the same issue, and I used the following
> 'workaround':
> >
> > BAD_RECOMMENDATIONS =3D " \
> >     qt4-embedded-demos \
> >     qt4-embedded-examples \
> >     qt4-embedded-demos-doc \
> >     qt4-embedded-tools \
> >     qt4-embedded-assistant \
> >     "
> > which I added in my image recipe, that would ensure that the packages
> which
> > are RECOMMENDS don't get installed in the final image.
> >
> > I would be happy to use another (nicer?) method, too.
>
>
> check packagegroup-core-qt4e.bb and remove :
>         qt4-embedded-demos \
>         qt4-embedded-examples \
>         qt-demo-init \
>         qt4-embedded-assistant \
>
> (and also the plugins & libs you may not need)
>
> FWIW I'm using this to build a quite full featured qt4e base image :
> RDEPENDS_append +=3D " \
>         qt4-embedded \
>         "
>
> QT_INSTALL =3D " \
>         libqt-embedded3support4 \
>         libqt-embeddedclucene4 \
>         libqt-embeddedcore4 \
>         libqt-embeddedgui4 \
>         libqt-embeddednetwork4 \
>         libqt-embeddedsvg4 \
>         libqt-embeddedsql4 \
>         libqt-embeddedxml4 \
>         libqt-embeddedxmlpatterns4 \
>         libqt-embeddedwebkit4 \
>         libqt-embeddedscripttools4 \
>         libqt-embeddedtest4 \
>         libqt-embeddedmultimedia4 \
>         libqt-embeddedhelp4 \
>         libqt-embeddeddeclarative4 \
>         libqt-embeddeddbus4 \
>         libqt-embeddedphonon4 \
>         \
>         qt4-embedded-fonts-ttf-vera \
>         qt4-embedded-fonts-ttf-dejavu \
>         qt4-embedded-plugin-mousedriver-tslib \
>         qt4-embedded-plugin-sqldriver-sqlite2 \
>         qt4-embedded-plugin-sqldriver-sqlite \
>         qt4-embedded-plugin-phonon-backend-gstreamer \
>         qt4-embedded-plugin-iconengine-svgicon \
>         qt4-embedded-plugin-imageformat-gif \
>         qt4-embedded-plugin-imageformat-ico \
>         qt4-embedded-plugin-imageformat-jpeg \
>         qt4-embedded-plugin-imageformat-mng \
>         qt4-embedded-plugin-imageformat-svg \
>         qt4-embedded-plugin-imageformat-tiff \
>         sqlite3 \
> "
>
> QWT_INSTALL =3D " \
>         qwt-e \
> "
>
> IMAGE_INSTALL +=3D "\
>         ${QT_INSTALL} \
>         ${QWT_INSTALL} \
> "
>
> and I add this when I want the examples :
> IMAGE_INSTALL +=3D "\
>         qt4-embedded-demos qt4-embedded-examples qt-demo-init \
>         qwt-e-examples \
> "
> (qt-demo-init is a homemade init script).
>

hi Eric,

thanks for your answer. so, yes I kind of figured out I could do that. But
in fact I was hoping that re-using the existing packagegroup from oe-core
*should* be the right thing to do, instead of re-implementing another one.
and perhaps the packagegroup being called core-qt4e should be restricted to
'core' components, and we could have 1 (or more) additional packagegroups
that could be pulled into images, instead? otherwise what's the point of
having a 'core QT4e packagegroup' if it's not suitable for any real usage?

now, given the current QT4/QT5 stuff, i don't know how relevant this
discussion is.. but i wanted to point out that as a newcomer to this area,
that has been quite confusing!



>
> Eric
>

--047d7b4143780b8a8204decc7634
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 2:59 PM, Eric B=E9nard <span dir=3D"ltr">&l=
t;<a href=3D"mailto:eric@eukrea.com" target=3D"_blank">eric@eukrea.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Nicolas,<br>
<br>
Le Mon, 10 Jun 2013 14:10:15 +0200,<br>
Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas=
.dechesne@linaro.org</a>&gt; a =E9crit :<br>
<div class=3D"im"><br>
&gt; On Mon, Jun 10, 2013 at 1:19 PM, John Stirling<br>
&gt; &lt;<a href=3D"mailto:ap.john.stirling@gmail.com">ap.john.stirling@gma=
il.com</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; You suggest just cutting it down to<br>
&gt; &gt;<br>
&gt; &gt; IMAGE_INSTALL +=3D &quot; \<br>
&gt; &gt; qtui \<br>
&gt; &gt; &quot;<br>
&gt; &gt; and it should work itself out ?<br>
&gt; &gt;<br>
<br>
</div>this will work but if you need plugins they will be missing as only t=
he<br>
linked libraries will be automatically integrated.<br>
<div class=3D"im"><br>
&gt;<br>
&gt; hi, i have observed the same issue, and I used the following &#39;work=
around&#39;:<br>
&gt;<br>
&gt; BAD_RECOMMENDATIONS =3D &quot; \<br>
&gt; =A0 =A0 qt4-embedded-demos \<br>
&gt; =A0 =A0 qt4-embedded-examples \<br>
&gt; =A0 =A0 qt4-embedded-demos-doc \<br>
&gt; =A0 =A0 qt4-embedded-tools \<br>
&gt; =A0 =A0 qt4-embedded-assistant \<br>
&gt; =A0 =A0 &quot;<br>
&gt; which I added in my image recipe, that would ensure that the packages =
which<br>
&gt; are RECOMMENDS don&#39;t get installed in the final image.<br>
&gt;<br>
&gt; I would be happy to use another (nicer?) method, too.<br>
<br>
<br>
</div>check <a href=3D"http://packagegroup-core-qt4e.bb" target=3D"_blank">=
packagegroup-core-qt4e.bb</a> and remove :<br>
=A0 =A0 =A0 =A0 qt4-embedded-demos \<br>
=A0 =A0 =A0 =A0 qt4-embedded-examples \<br>
=A0 =A0 =A0 =A0 qt-demo-init \<br>
=A0 =A0 =A0 =A0 qt4-embedded-assistant \<br>
<br>
(and also the plugins &amp; libs you may not need)<br>
<br>
FWIW I&#39;m using this to build a quite full featured qt4e base image :<br=
>
RDEPENDS_append +=3D &quot; \<br>
=A0 =A0 =A0 =A0 qt4-embedded \<br>
=A0 =A0 =A0 =A0 &quot;<br>
<br>
QT_INSTALL =3D &quot; \<br>
=A0 =A0 =A0 =A0 libqt-embedded3support4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedclucene4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedcore4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedgui4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddednetwork4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedsvg4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedsql4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedxml4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedxmlpatterns4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedwebkit4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedscripttools4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedtest4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedmultimedia4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedhelp4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddeddeclarative4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddeddbus4 \<br>
=A0 =A0 =A0 =A0 libqt-embeddedphonon4 \<br>
=A0 =A0 =A0 =A0 \<br>
=A0 =A0 =A0 =A0 qt4-embedded-fonts-ttf-vera \<br>
=A0 =A0 =A0 =A0 qt4-embedded-fonts-ttf-dejavu \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-mousedriver-tslib \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-sqldriver-sqlite2 \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-sqldriver-sqlite \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-phonon-backend-gstreamer \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-iconengine-svgicon \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-imageformat-gif \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-imageformat-ico \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-imageformat-jpeg \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-imageformat-mng \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-imageformat-svg \<br>
=A0 =A0 =A0 =A0 qt4-embedded-plugin-imageformat-tiff \<br>
=A0 =A0 =A0 =A0 sqlite3 \<br>
&quot;<br>
<br>
QWT_INSTALL =3D &quot; \<br>
=A0 =A0 =A0 =A0 qwt-e \<br>
&quot;<br>
<br>
IMAGE_INSTALL +=3D &quot;\<br>
=A0 =A0 =A0 =A0 ${QT_INSTALL} \<br>
=A0 =A0 =A0 =A0 ${QWT_INSTALL} \<br>
&quot;<br>
<br>
and I add this when I want the examples :<br>
IMAGE_INSTALL +=3D &quot;\<br>
=A0 =A0 =A0 =A0 qt4-embedded-demos qt4-embedded-examples qt-demo-init \<br>
=A0 =A0 =A0 =A0 qwt-e-examples \<br>
&quot;<br>
(qt-demo-init is a homemade init script).<br></blockquote><div><br></div><d=
iv style>hi Eric,</div><div style><br></div><div style>thanks for your answ=
er. so, yes I kind of figured out I could do that. But in fact I was hoping=
 that re-using the existing packagegroup from oe-core *should* be the right=
 thing to do, instead of re-implementing another one. and perhaps the packa=
gegroup being called core-qt4e should be restricted to &#39;core&#39; compo=
nents, and we could have 1 (or more) additional packagegroups that could be=
 pulled into images, instead? otherwise what&#39;s the point of having a &#=
39;core QT4e packagegroup&#39; if it&#39;s not suitable for any real usage?=
=A0</div>

<div style><br></div><div style>now, given the current QT4/QT5 stuff, i don=
&#39;t know how relevant this discussion is.. but i wanted to point out tha=
t as a newcomer to this area, that has been quite confusing!</div><div styl=
e>

<br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Eric<br>
</font></span></blockquote></div><br></div></div>

--047d7b4143780b8a8204decc7634--
