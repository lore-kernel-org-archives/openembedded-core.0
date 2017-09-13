Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA8A782D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:42:30 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id k101so8268248iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BJRc+7P9Jt5UP/Q+vVqO90ZRJLPYvEcrpoDFeE5ooTM=;
	b=Lwjnh6O87YVC/fV4RZA+e4eqeAbTyIzr0AVQoZ4cX04RuLysY4qD8rsbzkjWhLtS6I
	nbZfnL8AxHfrwsAS2PARVyFo2opkIiHMiimou2iFYejr9PZ5BRi0JipUPYe9ihhbq0oJ
	sL2+zSi9LVrqlrFoXHV/mD7oTk8tuytaTbVIzTjbxvEU0UTOtsNYOi47bQxrL9nexZO0
	3dOJfDk2DUoPwuDYzclGmOo24+lPVy1GnT3Ygk92bU/gU8k5u6vmivpho2bdQB4lmOG0
	g1F/jtUCZEs1xU3BUAPe84bj91/7TH1h5syc0WSL2eL88pQpOHn34TFLxR59+3JK5kxM
	mUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BJRc+7P9Jt5UP/Q+vVqO90ZRJLPYvEcrpoDFeE5ooTM=;
	b=uFKhHhoYmxDC1CIxynBAx+KWHjIyjyr6mQf7Oxjtpzh+fPQqNWqMBe+n1O0VSuIQLf
	Lgd8sYOk3BvUmJg4W4dMstqpRkkYoVgyKNhomf17fL0UfE+DFSPKL35bA32brFXy69pI
	FzSjtH1poScy8A26LfrKct2xsiJsWCCFudnQueHG0gPOgu6JaoRrUWq2oWuEY0bR8bcm
	G0uYcuquDWXm3IdyUxU4RIDBxVGmuiuC3K/cFSuSlXB4Ag+Dd0aLBkuMUWSJGL6oCIE0
	RHyzvC76RVS/wYl0HeBIIj4RdQIv8rPiyXpTPYpFuMYBe4qQjZ8uXEyXyJTd6TnI5LwC
	E8Pg==
X-Gm-Message-State: AHPjjUjko2GbIaZYvgbKiAi1h6MHDIVcIvj00J9D5qcNFmgQSzA9tvIQ
	YE1f3g1pWdIKLHLb7JURLWq5GrnME3p2knVc1lBK7A==
X-Google-Smtp-Source: AOwi7QCFN/znrYvqR/Q0JhJey3EmyFmGqWh+olNeCiBLeSiEvK8V2nWabn5Ssu4nX2TFVrw8VMUV1L8nvbJ5rwTRXSM=
X-Received: by 10.107.32.70 with SMTP id g67mr19759268iog.77.1505335351572;
	Wed, 13 Sep 2017 13:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 13 Sep 2017 13:42:10 -0700 (PDT)
In-Reply-To: <CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
References: <20170905150847.32681-1-ross.burton@intel.com>
	<CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Sep 2017 21:42:10 +0100
Message-ID: <CAJTo0LbmEOd=9_W4ru7=1VUY1c0eyOmEzr3rFvwsXnC_ftA1-w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: recommend shared-mime-info
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
X-List-Received-Date: Wed, 13 Sep 2017 20:42:30 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2ce61278055918323c"

--001a1140ae2ce61278055918323c
Content-Type: text/plain; charset="UTF-8"

Can you share a log showing that?

On 13 September 2017 at 21:07, Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Sep 5, 2017 at 8:08 AM, Ross Burton <ross.burton@intel.com> wrote:
> > Large portions of GIO are not that useful without the MIME database.
> Add a
> > recommends to shared-mime-info so that GIO works out of the box, but can
> be
> > removed (using BAD_RECOMMENDATIONS) if shared-mime-info is too large and
> isn't
> > required.
> >
> > [ YOCTO #11792 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> This patch breaks openSSL compilation when cross compiling with MinGW.
>
> Investigating the issue more at the moment.
>
> Thanks,
> Alistair
>
> > ---
> >  meta/recipes-core/glib-2.0/glib.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> > index d6ef4dfc0b0..ce15ccefc39 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -73,6 +73,8 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py
> \
> >                         ${bindir}/gdbus-codegen"
> >  FILES_${PN}-utils = "${bindir}/*"
> >
> > +RRECOMMENDS_${PN} += "shared-mime-info"
> > +
> >  ARM_INSTRUCTION_SET_armv4 = "arm"
> >  ARM_INSTRUCTION_SET_armv5 = "arm"
> >  # Valgrind runtime detection works using hand-written assembly, which
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140ae2ce61278055918323c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you share a log showing that?</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 13 September 2017 at 21:07, Alist=
air Francis <span dir=3D"ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" t=
arget=3D"_blank">alistair23@gmail.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">On Tue, Sep 5, 2017 at 8:08 AM, Ross Bu=
rton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>=
&gt; wrote:<br>
&gt; Large portions of GIO are not that useful without the MIME database.=
=C2=A0 Add a<br>
&gt; recommends to shared-mime-info so that GIO works out of the box, but c=
an be<br>
&gt; removed (using BAD_RECOMMENDATIONS) if shared-mime-info is too large a=
nd isn&#39;t<br>
&gt; required.<br>
&gt;<br>
&gt; [ YOCTO #11792 ]<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
<br>
</span>This patch breaks openSSL compilation when cross compiling with MinG=
W.<br>
<br>
Investigating the issue more at the moment.<br>
<br>
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/glib-2.0/<wbr>glib.inc | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/<wbr>glib.inc b/meta/recipes-c=
ore/glib-2.0/<wbr>glib.inc<br>
&gt; index d6ef4dfc0b0..ce15ccefc39 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/<wbr>glib.inc<br>
&gt; +++ b/meta/recipes-core/glib-2.0/<wbr>glib.inc<br>
&gt; @@ -73,6 +73,8 @@ FILES_${PN}-codegen =3D &quot;${datadir}/glib-2.0/co=
degen/*<wbr>.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0${bindir}/gdbus-codegen&quot;<br>
&gt;=C2=A0 FILES_${PN}-utils =3D &quot;${bindir}/*&quot;<br>
&gt;<br>
&gt; +RRECOMMENDS_${PN} +=3D &quot;shared-mime-info&quot;<br>
&gt; +<br>
&gt;=C2=A0 ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt;=C2=A0 ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt;=C2=A0 # Valgrind runtime detection works using hand-written assembly, =
which<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1140ae2ce61278055918323c--
