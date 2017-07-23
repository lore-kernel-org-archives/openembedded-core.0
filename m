Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F36D783EA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 11:58:34 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id w45so7543252uac.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sa7vTm8igO4uWmWxE0HrpRu7jLPeU+nToyBmGeV4sRA=;
	b=RJQCD6614cW08L6CBgKlC5wsPL8lu92cpgstmAo78aYSkXe+ROmq6VlR77o4hwtqdv
	ZhnchtWhMV/Y8JbgORDoOMqYicLIAbjO7zHc+nxBX/5y5WD7W2BMEO81qcs3K50RXOyF
	GVCBgu5cVDT2hqv+DV6xm2N9WDaM3rf2gWR4U0+dds9UfdJ0U3jLLFIp05VAcWKul4zn
	Hh1DgbECexL7J/81/ixOkUE0FvalB3XcV1bNi/zXhK8krc4PYYs4qx3fhU32UtLDX8zx
	uSzyDpCNvXUo8ruBBW4KBALCwO8621zA9l9UaoekzBvGEXytrS8TVdA0/CwwUn47gmeg
	uoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sa7vTm8igO4uWmWxE0HrpRu7jLPeU+nToyBmGeV4sRA=;
	b=h2u1Q7t/UM02HlzoUtdZqYQFxtq2YtROdUqSMkUrx0U/Uf20sqxQNbL3pPu68Ogm2o
	KtRM/QhVDgds15atMo4gR0H62sTGVh1hBNLTMv7E0tgwXO6778px8X5R+JLJxB8PdPpU
	lLyWe+ObZKIMEsWwiM0LpSKO0b3rO3XmEHTogAY4+686g+ZNn7Wj8EoFGwj31qLWAa8J
	xb6YSvvGDkklEHxHQiZoN2ccNwEUw/9mmhOR1qnmlBhxUISifSLCXLesiZ+kmeIJ3TKm
	6M8LXfhHnRCTPHbgTPB/nh6hMG21aUHU4rb1vQvfJkiLKI9TZDSBn6CLcfhAwd9xdp9w
	Ntrw==
X-Gm-Message-State: AIVw110wMq0lOa5y3FXgnf8cqYhTkCv21ttFKsUf+7OvRrPMBSDWLPKc
	oUJcG4BX3IEcyiNQQMoyRw2GDy/hJg==
X-Received: by 10.159.36.38 with SMTP id 35mr8158107uaq.213.1500811115917;
	Sun, 23 Jul 2017 04:58:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Sun, 23 Jul 2017 04:58:35 -0700 (PDT)
In-Reply-To: <CA+aJhH0NRHfeoPG6jwhCqO8idETerLMYoFayQRb8BbYJR_PL9w@mail.gmail.com>
References: <1500804679-8604-1-git-send-email-liu.ming50@gmail.com>
	<CA+aJhH0NRHfeoPG6jwhCqO8idETerLMYoFayQRb8BbYJR_PL9w@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sun, 23 Jul 2017 13:58:35 +0200
Message-ID: <CALatG=61FMhFYCNeg_otee367KoDytAeMs-nmaihWKDk1ft5Rw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-uimage: DEPENDS on u-boot-mkimage-native conditionally
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
X-List-Received-Date: Sun, 23 Jul 2017 11:58:35 -0000
Content-Type: multipart/alternative; boundary="001a113cd6447076710554fad15e"

--001a113cd6447076710554fad15e
Content-Type: text/plain; charset="UTF-8"

Hi, Nathan:

Yes, you are absolutely right, my previous understanding of KEEPUIMAGE was
wrong, thanks for pointing it out, please ignore my patch then.

//Ming Liu

2017-07-23 13:24 GMT+02:00 Nathan Rossi <nathan@nathanrossi.com>:

> On 23 July 2017 at 20:11,  <liu.ming50@gmail.com> wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > do_uboot_mkimage would not run if KEEPUIMAGE not equal to 'yes', so it
> > does not have to DEPENDS on u-boot-mkimage-native in that case.
>
> This change breaks KEEPUIMAGE == yes. Where the kernel built uImage
> make target needs u-boot-mkimage-native. This is a common use case.
>
> |   UIMAGE  arch/arm/boot/uImage
> | "mkimage" command not found - U-Boot images will not be built
> | arch/arm/boot/Makefile:79: recipe for target 'arch/arm/boot/uImage'
> failed
> | make[3]: *** [arch/arm/boot/uImage] Error 1
> | arch/arm/Makefile:329: recipe for target 'uImage' failed
> | make[2]: *** [uImage] Error 2
>
> Regards,
> Nathan
>
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta/classes/kernel-uimage.bbclass | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/kernel-uimage.bbclass
> b/meta/classes/kernel-uimage.bbclass
> > index 7c026ab..94344d9 100644
> > --- a/meta/classes/kernel-uimage.bbclass
> > +++ b/meta/classes/kernel-uimage.bbclass
> > @@ -2,16 +2,16 @@ inherit kernel-uboot
> >
> >  python __anonymous () {
> >      if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
> > -        depends = d.getVar("DEPENDS")
> > -        depends = "%s u-boot-mkimage-native" % depends
> > -        d.setVar("DEPENDS", depends)
> > -
> >          # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> >          # to kernel.bbclass . We override the variable here, since we
> need
> >          # to build uImage using the kernel build system if and only if
> >          # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
> >          # the uImage .
> >          if d.getVar("KEEPUIMAGE") != 'yes':
> > +            depends = d.getVar("DEPENDS")
> > +            depends = "%s u-boot-mkimage-native" % depends
> > +            d.setVar("DEPENDS", depends)
> > +
> >              typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
> >              if "uImage" in typeformake.split():
> >                  d.setVar('KERNEL_IMAGETYPE_FOR_MAKE',
> typeformake.replace('uImage', 'vmlinux'))
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113cd6447076710554fad15e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Nathan:<div><br></div><div>Yes, you are absolutely rig=
ht, my previous understanding of KEEPUIMAGE was wrong, thanks for pointing =
it out, please ignore my patch then.</div><div><br></div><div>//Ming Liu</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-07-=
23 13:24 GMT+02:00 Nathan Rossi <span dir=3D"ltr">&lt;<a href=3D"mailto:nat=
han@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.com</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On 23 July 2017 at 20=
:11,=C2=A0 &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com=
</a>&gt; wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.c=
om">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;<br>
&gt; do_uboot_mkimage would not run if KEEPUIMAGE not equal to &#39;yes&#39=
;, so it<br>
&gt; does not have to DEPENDS on u-boot-mkimage-native in that case.<br>
<br>
</span>This change breaks KEEPUIMAGE =3D=3D yes. Where the kernel built uIm=
age<br>
make target needs u-boot-mkimage-native. This is a common use case.<br>
<br>
|=C2=A0 =C2=A0UIMAGE=C2=A0 arch/arm/boot/uImage<br>
| &quot;mkimage&quot; command not found - U-Boot images will not be built<b=
r>
| arch/arm/boot/Makefile:79: recipe for target &#39;arch/arm/boot/uImage&#3=
9; failed<br>
| make[3]: *** [arch/arm/boot/uImage] Error 1<br>
| arch/arm/Makefile:329: recipe for target &#39;uImage&#39; failed<br>
| make[2]: *** [uImage] Error 2<br>
<br>
Regards,<br>
Nathan<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atl=
ascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-uimage.<wbr>bbclass | 8 ++++----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-uimage.<wbr>bbclass b/meta/classes/ke=
rnel-uimage.<wbr>bbclass<br>
&gt; index 7c026ab..94344d9 100644<br>
&gt; --- a/meta/classes/kernel-uimage.<wbr>bbclass<br>
&gt; +++ b/meta/classes/kernel-uimage.<wbr>bbclass<br>
&gt; @@ -2,16 +2,16 @@ inherit kernel-uboot<br>
&gt;<br>
&gt;=C2=A0 python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if &quot;uImage&quot; in (d.getVar(&#39;KERNEL_IMA=
GETYPES&#39;) or &quot;&quot;).split():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D d.getVar(&quot;DEPENDS&quot;)=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-nativ=
e&quot; % depends<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS&quot;, depends)<br=
>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Override KERNEL_IMAGETYPE_FOR_MAKE=
 variable, which is internal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # to kernel.bbclass . We override th=
e variable here, since we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # to build uImage using the kernel b=
uild system if and only if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # KEEPUIMAGE =3D=3D yes. Otherwise, =
we pack compressed vmlinux into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the uImage .<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;KEEPUIMAGE&quot;) =
!=3D &#39;yes&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D d.getVar(&quot;=
DEPENDS&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot=
-mkimage-native&quot; % depends<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS&quot=
;, depends)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typeformake =3D d.getV=
ar(&quot;KERNEL_IMAGETYPE_<wbr>FOR_MAKE&quot;) or &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;uImage&quot; =
in typeformake.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar=
(&#39;KERNEL_IMAGETYPE_<wbr>FOR_MAKE&#39;, typeformake.replace(&#39;uImage&=
#39;, &#39;vmlinux&#39;))<br>
&gt; --<br>
&gt; 2.7.4<br>
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

--001a113cd6447076710554fad15e--
