Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4D49E7C860
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 00:50:19 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id k8so893290lja.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hQRQeMBaeYdoBrHFcke3bz7mZAP7fTk9vbWoFuPnQXM=;
	b=BjUfjx276wURNuuxUuT6PNzTfTayQWWscs69KS45XpCFBT8rC+sN6bItoQ/L8fIDC8
	/6Fmf9rRw+rmtTcjCMvDJ0WPE2bcF2BeeGfB39VtA41RIfCtIb/QoQIJNiLVlKmv8PYA
	/zuj0MY1xyojzQ+qWG2r+ED43o7xtYYweDDPN6NDsqXAU6Hu0eE/aWcoN7FaSOQSoGWc
	UoU5CGLfTpjGcqHEQ1rvyyovQTaHuKFAaoJxi59GuFQAVaXMDoEzKaVogz/h7E4TK5vm
	SJLwKo/SAcNRlyJPEThmngz1JuoJzDwBSIxxZrbLTAUbbQ6fJMxxoTwES6e19ca42mt6
	LlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hQRQeMBaeYdoBrHFcke3bz7mZAP7fTk9vbWoFuPnQXM=;
	b=VTSmYWH1NniWAweeYVGQdodPH605nCtg8klRbAinmg7fDbyQPsc2c3/BcdjFPdvy5J
	JXPniE03V8xD1UcmNcbOngrwJGKE0GlN9YAPFbaiBlOig21dORFhRiNF54M/gex9F5Er
	QxBLt4DoXCSwFbtA68VxHQThj+H3Ck5cyTBpeQDENcJ9RdIs9bqDNSmXDxIs9/nXcE5t
	4yw25xKrumTRmXLRHYR8ginhz/1u5YR2u5QZXXn+B+zaDz9ivbAwkXHNePJKW/RUYA+k
	YaIILt4a3tm2JPQc/214I133GBJ9bEMbMa7nWbj5cVZmTgzgUrMR3/Eqv7+9hlWoP/v3
	CZlg==
X-Gm-Message-State: APjAAAWAyvAAKeeZ11Vu8sw9voH6v6Rkqt7ATCGORPoklif5hRvM3lmZ
	7yd601OL8IDMqpHrB38OwBqfwEzqjPyQeepbI3ujhMiQ
X-Google-Smtp-Source: APXvYqxNUaL76rcywKU534aU2ce2rUM8NTUmX3XyC2FsS8Nq4NxTKTwXHhREaXav1+nDMw8VvZWgr5ZIUvqaiVRX7D0=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr20300538ljy.109.1557881419688;
	Tue, 14 May 2019 17:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <4ac2274b49372290718a2b59175407bc736118ff.camel@andred.net>
	<d5bed9dff4f06727fe947fa8516d1b8e537c159e.camel@andred.net>
In-Reply-To: <d5bed9dff4f06727fe947fa8516d1b8e537c159e.camel@andred.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 May 2019 20:50:08 -0400
Message-ID: <CADkTA4PNCf7+vw8i89R0OaZb_Swkp1tn6as557pHFRR7WbE+Yg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RDEPENDS kernel-image-zimage & kernel.bbclass PKG name
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
X-List-Received-Date: Wed, 15 May 2019 00:50:20 -0000
Content-Type: multipart/alternative; boundary="0000000000009f70b10588e2884b"

--0000000000009f70b10588e2884b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 12:32 PM Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Tue, 2019-05-14 at 14:35 +0100, Andr=C3=A9 Draszik wrote:
> > Hi,
> >
> > As part of the build, kernel packages are renamed, e.g.
> > kernel-image-zimage basically becomes
> > kernel-image-zimage-${KERNEL_VERSION}
> >
> > When a package created by recipe B RDEPENDS on kernel-image-zimage,
> > the ipk generated ultimately depends on
> > kernel-image-zimage-${KERNEL_VERSION} (not kernel-image-zimage).
> > Once the kernel is updated, it appears as though recipe B is not
> > repackaged, so the package still runtime depends on the original
> > kernel, which doesn't exist anymore, and thus building the image
> > fails.
> >
> > Specifically, I have
> > MACHINE_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
> > in my BSP, and hence packagegroup-machine-base runtime depends on
> > kernel-image-zimage-4.9.11-cl-som-imx7-5.1+gc27010d99a3d.
> > Updating the kernel doesn't trigger a rebuild of
> packagegroup-machine-base,
> > so things fail for me.
> >
> >
> > Am I missing something in my BSP? I could probably do a bbappend
> > on packagegroup-base.bb and add something like
> > do_packagedata[depends] +=3D "virtual/kernel:do_packagedata"
>
> BTW, I've tried the following packagegroup-base.bbappend to no avail:
>
> python do_get_kernel_zimage_name() {
>     new_dep =3D get_package_mapping('kernel-image-zimage',
> 'packagegroup-machine-base', d)
>     d.appendVarFlag('do_package_write_ipk', 'vardeps', new_dep)
> }
> addtask get_kernel_zimage_name after do_package before do_package_write_i=
pk
> do_get_kernel_zimage_name[depends] +=3D "virtual/kernel:do_packagedata"
>
>

Hi Andre,

I chased (And fixed) something very similar to this with postinst scripts
and kernel-image that showed a similar symptom (you couldn't add a postinst
to kernel-image-<type> without throwing an error since the PKG_ variables
change the package name to kernel-image-<type>-version).

My fix was specific to the postinst, but I bet this would be a similar fix.

I don't suppose you have a sample set of layers and a build config that I
could kick off here ? That would make it a lot easier to test my theory.

Bruce



>
> I suspect adding the varflag happens too late in this case, as the packag=
e
> still isn't rebuilt on kernel updates.
>
> >
> > This doesn't seem right, though.
>
> A.
>
> >
> >
> > Any ideas or thoughts?
> >
> >
> > Cheers,
> > Andre'
> >
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009f70b10588e2884b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 14, 2019 at 12:32 PM Andr=C3=A9 Draszik=
 &lt;<a href=3D"mailto:git@andred.net">git@andred.net</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2019-05-14 at =
14:35 +0100, Andr=C3=A9 Draszik wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; As part of the build, kernel packages are renamed, e.g.<br>
&gt; kernel-image-zimage basically becomes<br>
&gt; kernel-image-zimage-${KERNEL_VERSION}<br>
&gt; <br>
&gt; When a package created by recipe B RDEPENDS on kernel-image-zimage,<br=
>
&gt; the ipk generated ultimately depends on<br>
&gt; kernel-image-zimage-${KERNEL_VERSION} (not kernel-image-zimage).<br>
&gt; Once the kernel is updated, it appears as though recipe B is not<br>
&gt; repackaged, so the package still runtime depends on the original<br>
&gt; kernel, which doesn&#39;t exist anymore, and thus building the image<b=
r>
&gt; fails.<br>
&gt; <br>
&gt; Specifically, I have<br>
&gt; MACHINE_EXTRA_RDEPENDS +=3D &quot;kernel-image-zimage&quot;<br>
&gt; in my BSP, and hence packagegroup-machine-base runtime depends on<br>
&gt; kernel-image-zimage-4.9.11-cl-som-imx7-5.1+gc27010d99a3d.<br>
&gt; Updating the kernel doesn&#39;t trigger a rebuild of packagegroup-mach=
ine-base,<br>
&gt; so things fail for me.<br>
&gt; <br>
&gt; <br>
&gt; Am I missing something in my BSP? I could probably do a bbappend<br>
&gt; on <a href=3D"http://packagegroup-base.bb" rel=3D"noreferrer" target=
=3D"_blank">packagegroup-base.bb</a> and add something like<br>
&gt; do_packagedata[depends] +=3D &quot;virtual/kernel:do_packagedata&quot;=
<br>
<br>
BTW, I&#39;ve tried the following packagegroup-base.bbappend to no avail:<b=
r>
<br>
python do_get_kernel_zimage_name() {<br>
=C2=A0 =C2=A0 new_dep =3D get_package_mapping(&#39;kernel-image-zimage&#39;=
, &#39;packagegroup-machine-base&#39;, d)<br>
=C2=A0 =C2=A0 d.appendVarFlag(&#39;do_package_write_ipk&#39;, &#39;vardeps&=
#39;, new_dep)<br>
}<br>
addtask get_kernel_zimage_name after do_package before do_package_write_ipk=
<br>
do_get_kernel_zimage_name[depends] +=3D &quot;virtual/kernel:do_packagedata=
&quot;<br>
<br></blockquote><div><br></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Hi Andre,</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">I chased (And fixed) something very similar to this with p=
ostinst scripts and kernel-image that showed a similar symptom (you couldn&=
#39;t add a postinst to kernel-image-&lt;type&gt; without throwing an error=
 since the PKG_ variables change the package name to kernel-image-&lt;type&=
gt;-version).</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">My fix was =
specific to the postinst, but I bet this would be a similar fix.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">I don&#39;t suppose you have a samp=
le set of layers and a build config that I could kick off here ? That would=
 make it a lot easier to test my theory.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
I suspect adding the varflag happens too late in this case, as the package<=
br>
still isn&#39;t rebuilt on kernel updates.<br>
<br>
&gt; <br>
&gt; This doesn&#39;t seem right, though.<br>
<br>
A.<br>
<br>
&gt; <br>
&gt; <br>
&gt; Any ideas or thoughts?<br>
&gt; <br>
&gt; <br>
&gt; Cheers,<br>
&gt; Andre&#39;<br>
&gt; <br>
&gt; <br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000009f70b10588e2884b--
