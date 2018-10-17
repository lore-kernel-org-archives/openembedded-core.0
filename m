Return-Path: <yann.dirson@blade-group.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 68A8A78EFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:14:21 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c23so25898120otl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s8R+Vp2oPMCZcynpM+xU9guDlSKXVTmrMJXJTShG6oM=;
	b=gFynPDE+HM8GQtICHutSLksv100eMsPUfOxHT6rnxWKLfJxNQJXN2wiSFT5Pdunrn/
	/T0Ov1ZhAzCSR+/OsgMw+v3M6HEy7soJrx6YUaSUj6zZskpmcR3g8zrUyALkhquZ6MC9
	x9h7up42WijKHFyN0glvZ9jsBW0H1yMbErmdMexgCpAmYQ06bZngNSmlKEGLZFMtuFqU
	6N8BHGZhutYfG5+5z8j+QDTbQEQRgecKE3/2Y/MgR1TbSxIjaMQqsHlnLHXzYzSsXE7u
	/ynBUyaLDz+FZE+Rle+zW2xshCFFky0N3Re7gTAabGRlEnQxVOLSHI0Q+t+FvDA485yk
	yfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s8R+Vp2oPMCZcynpM+xU9guDlSKXVTmrMJXJTShG6oM=;
	b=GU59D/ZrpYd0Dj9SHD0LJKlRzD9jiJSerE3DHJTviKqmnVg9Cwi+Bs209k8Hyzhc6j
	b+Caht34ncOoSO+Uk63ZBG0sxEus4RhhkragsmRuQpRaj4YTR3m7zhwPWVxnQqJlkuNK
	1oPKcajRy5GID0gLhuFf/ItTlIaRtTz19V1pJGK2eevx9cj/uVX0LyB/vKEyiUFpdSgM
	qraPZFazgrJoPAYvTq3Ak7JYDYLhpwvWCs2NZn3Y+lntS3u2O2vyweViOLSJGlvOVF1c
	F4PdCCoBCMQq2jkDDHUEY4KwQUePe2hHbo/+p8kxlrUNOiW4nj/NYShkNk380JKaeF2r
	02Og==
X-Gm-Message-State: ABuFfogycgRemxnKz4KXdaTX1JfJ7kPoIbUoJlDYm1ZdRiXS5nWf75G/
	k38Am9rGnZc5/pUOSaZmMcLSfG8j+qdYTfu0n3KJVA==
X-Google-Smtp-Source: ACcGV61dpiFma6mPvGvWan6O5Xn+ZKT8CyWkIhK+kyS/0WWGvMUh8zRE2wWaQ3cXcFH903UA1IbiudXCjP0tZbbxf2I=
X-Received: by 2002:a9d:6509:: with SMTP id i9mr1670233otl.338.1539810862280; 
	Wed, 17 Oct 2018 14:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
	<CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
	<333ac1ec-594d-ebc8-4855-af533f1b016c@windriver.com>
	<20181017185216.GA1375@jama>
In-Reply-To: <20181017185216.GA1375@jama>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 23:14:10 +0200
Message-ID: <CA+4=imZR4VUGgWyrYr7szeSvQRgF-3vocqcGQ__3C5TpqLbt9w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 21:14:21 -0000
Content-Type: multipart/alternative; boundary="00000000000077cc5e0578732760"

--00000000000077cc5e0578732760
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sent v3 to -devel - that does not supercede the original series on patwork,
though.

Le mer. 17 oct. 2018 =C3=A0 20:52, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> On Wed, Oct 17, 2018 at 10:58:49AM -0500, Mark Hatle wrote:
> > On 10/17/18 10:46 AM, Martin Jansa wrote:
> > > well, I realized that this won't work with the BLUEZ intentionally se=
t
> to empty
> > > value and setting BLUEZ to no-bluetooth globally also probably won't
> work for
> > > cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe inline
> python
> > > appending only either bluez4 or bluez5 alternative here?
> >
> > I'm slightly confused.  In the suggestion you made below, ??=3D within =
the
> > specific package, why would 'no-bluetooth' cause a problem.  For all
> other
> > recipes it will remain blank as expected.
>
> Because if you set it to empty, then ??=3D won't be used and we'll be bac=
k
> to RDEPENDS_.
>
> And if you set BLUEZ to no-bluetooth e.g. in your DISTRO config than it
> will break other recipes, e.g.:
>
> meta/recipes-connectivity/ofono/ofono.inc:PACKAGECONFIG[bluez] =3D
> "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}"
> meta/recipes-core/packagegroups/packagegroup-base.bb:    ${BLUEZ} \
> meta/recipes-devtools/python/python3.inc:PACKAGECONFIG[bluetooth] =3D
> ",ac_cv_header_bluetooth_bluetooth_h=3Dno
> ac_cv_header_bluetooth_h=3Dno,${BLUEZ}"
> meta/recipes-devtools/qemu/qemu.inc:PACKAGECONFIG[bluez] =3D
> "--enable-bluez,--disable-bluez,${BLUEZ}"
> meta/recipes-devtools/strace/strace_4.24.bb:PACKAGECONFIG[bluez] =3D
> "ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetoot=
h_h=3Dno,${BLUEZ}"
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bb:PACK=
AGECONFIG[bluez]
>          =3D "--enable-bluez,--disable-bluez,${BLUEZ}"
>
> > --Mark
> >
> > > On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <
> yann.dirson@blade-group.com
> > > <mailto:yann.dirson@blade-group.com>> wrote:
> > >
> > >     Yeah, that looks like a better idea.
> > >
> > >     Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gma=
il.com
> > >     <mailto:martin.jansa@gmail.com>> a =C3=A9crit :
> > >
> > >         What about using some less confusing default BLUEZ value?
> RDEPENDS_
> > >         looks wrong.
> > >
> > >         BLUEZ ??=3D "no-bluetooth"
> > >         RDEPENDS_no-bluetooth =3D ""
> > >
> > >         Might be a bit more clear.
> > >
> > >         On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com
> > >         <mailto:yann.dirson@blade-group.com>> wrote:
> > >
> > >             From: Yann Dirson <yann@blade-group.com <mailto:
> yann@blade-group.com>>
> > >
> > >             Otherwise the build fails with:
> > >
> > >               NOTE: Runtime target '${RDEPENDS_}' is unbuildable,
> removing...
> > >               Missing or unbuildable dependency chain was:
> ['${RDEPENDS_}']
> > >
> > >             This restores some truth in the "Otherwise install
> nothing" comment
> > >             in the recipe.
> > >
> > >             Signed-off-by: Yann Dirson <yann@blade-group.com
> > >             <mailto:yann@blade-group.com>>
> > >             ---
> > >              .../packagegroups/packagegroup-tools-bluetooth.bb
> > >             <http://packagegroup-tools-bluetooth.bb>               |
> 2 ++
> > >              1 file changed, 2 insertions(+)
> > >
> > >             diff --git
> > >             a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > >             <http://packagegroup-tools-bluetooth.bb>
> > >             b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > >             <http://packagegroup-tools-bluetooth.bb>
> > >             index 0ede5e57b..e81516fef 100644
> > >             ---
> > >             a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > >             <http://packagegroup-tools-bluetooth.bb>
> > >             +++
> > >             b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > >             <http://packagegroup-tools-bluetooth.bb>
> > >             @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
> > >                      '', d)} \
> > >              "
> > >
> > >             +RDEPENDS_ =3D ""
> > >             +
> > >              # Install bluez4 tools or bluez5 tools depending on what
> is
> > >             specified in the distro.
> > >              # Otherwise install nothing.
> > >              RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> > >             --
> > >             2.19.1
> > >
> > >             --
> > >             _______________________________________________
> > >             Openembedded-core mailing list
> > >             Openembedded-core@lists.openembedded.org
> > >             <mailto:Openembedded-core@lists.openembedded.org>
> > >
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > >     --
> > >     Yann Dirson <yann@blade-group.com <mailto:yann@blade-group.com>>
> > >     Blade -- 38 rue du Sentier, 75002 Paris
> > >
> > >
> > >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Yann Dirson <yann@blade-group.com>
Blade -- 38 rue du Sentier, 75002 Paris

--00000000000077cc5e0578732760
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sent v3 to -devel - that does not supercede the original s=
eries on patwork, though.<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A020:52, Martin Jansa &lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Oct 17, 2018=
 at 10:58:49AM -0500, Mark Hatle wrote:<br>
&gt; On 10/17/18 10:46 AM, Martin Jansa wrote:<br>
&gt; &gt; well, I realized that this won&#39;t work with the BLUEZ intentio=
nally set to empty<br>
&gt; &gt; value and setting BLUEZ to no-bluetooth globally also probably wo=
n&#39;t work for<br>
&gt; &gt; cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe inl=
ine python<br>
&gt; &gt; appending only either bluez4 or bluez5 alternative here?<br>
&gt; <br>
&gt; I&#39;m slightly confused.=C2=A0 In the suggestion you made below, ??=
=3D within the<br>
&gt; specific package, why would &#39;no-bluetooth&#39; cause a problem.=C2=
=A0 For all other<br>
&gt; recipes it will remain blank as expected.<br>
<br>
Because if you set it to empty, then ??=3D won&#39;t be used and we&#39;ll =
be back<br>
to RDEPENDS_.<br>
<br>
And if you set BLUEZ to no-bluetooth e.g. in your DISTRO config than it<br>
will break other recipes, e.g.:<br>
<br>
meta/recipes-connectivity/ofono/ofono.inc:PACKAGECONFIG[bluez] =3D &quot;--=
enable-bluetooth, --disable-bluetooth, ${BLUEZ}&quot;<br>
meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-base.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-base.bb</a>:=C2=A0 =C2=A0 ${=
BLUEZ} \<br>
meta/recipes-devtools/python/python3.inc:PACKAGECONFIG[bluetooth] =3D &quot=
;,ac_cv_header_bluetooth_bluetooth_h=3Dno ac_cv_header_bluetooth_h=3Dno,${B=
LUEZ}&quot;<br>
meta/recipes-devtools/qemu/qemu.inc:PACKAGECONFIG[bluez] =3D &quot;--enable=
-bluez,--disable-bluez,${BLUEZ}&quot;<br>
meta/recipes-devtools/strace/strace_4.24.bb:PACKAGECONFIG[bluez] =3D &quot;=
ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetooth_h=
=3Dno,${BLUEZ}&quot;<br>
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bb:PACKAG=
ECONFIG[bluez]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-b=
luez,--disable-bluez,${BLUEZ}&quot;<br>
<br>
&gt; --Mark<br>
&gt; <br>
&gt; &gt; On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson &lt;<a href=3D"mailto=
:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com=
</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:yann.dirson@blade-group.com" target=
=3D"_blank">yann.dirson@blade-group.com</a>&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Yeah, that looks like a better idea.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A017:27, M=
artin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank"=
>martin.jansa@gmail.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:martin.jansa@gmai=
l.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;&gt; a =C3=A9crit=C2=
=A0:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0What about using some less confu=
sing default BLUEZ value? RDEPENDS_<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0looks wrong.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BLUEZ ??=3D &quot;no-bluetooth&q=
uot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RDEPENDS_no-bluetooth =3D &quot;=
&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Might be a bit more clear.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, Oct 17, 2018 at 5:08 PM =
&lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.d=
irson@blade-group.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:yan=
n.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>=
&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0From: Yann Dirson =
&lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-gr=
oup.com</a> &lt;mailto:<a href=3D"mailto:yann@blade-group.com" target=3D"_b=
lank">yann@blade-group.com</a>&gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Otherwise the buil=
d fails with:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 NOTE: Runti=
me target &#39;${RDEPENDS_}&#39; is unbuildable, removing...<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 Missing or =
unbuildable dependency chain was: [&#39;${RDEPENDS_}&#39;]<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This restores some=
 truth in the &quot;Otherwise install nothing&quot; comment<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in the recipe.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Yan=
n Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann=
@blade-group.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=
=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>=
&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../packageg=
roups/<a href=3D"http://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer"=
 target=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"htt=
p://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://packagegroup-tools-bluetooth.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A01 file chang=
ed, 2 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-=
connectivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"htt=
p://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-=
connectivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"htt=
p://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index 0ede5e57b..e=
81516fef 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-=
connectivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"htt=
p://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-=
connectivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"htt=
p://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -32,6 +32,8 @@ =
RDEPENDS_bluez5 =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&#39;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+RDEPENDS_ =3D &qu=
ot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0# Install bl=
uez4 tools or bluez5 tools depending on what is<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified in the d=
istro.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0# Otherwise =
install nothing.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0RDEPENDS_${P=
N} =3D &quot;${RDEPENDS_${BLUEZ}}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.19.1<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__________________=
_____________________________<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openembedded-core =
mailing list<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:=
Openembedded-core@lists.openembedded.org" target=3D"_blank">Openembedded-co=
re@lists.openembedded.org</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=
=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blank">Open=
embedded-core@lists.openembedded.org</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://=
lists.openembedded.org/mailman/listinfo/openembedded-core" rel=3D"noreferre=
r" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core</a><br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Yann Dirson &lt;<a href=3D"mailto:yann@blade-g=
roup.com" target=3D"_blank">yann@blade-group.com</a> &lt;mailto:<a href=3D"=
mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;=
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Blade -- 38 rue du Sentier, 75002 Paris<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
-- <br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ya=
nn Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yan=
n@blade-group.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 Paris<br></d=
iv></div></div>

--00000000000077cc5e0578732760--
