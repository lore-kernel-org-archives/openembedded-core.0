Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sun6Q-0000Yi-6p
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 18:09:22 +0200
Received: by ggnp4 with SMTP id p4so3034769ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=A4uDlGstN5z+LhIK867lenm2DJH2r0JrubXfWSFwwb4=;
	b=ZDbNZTZfx1vGCI8HJvc8AJxPJFj0LZ5eKcIfFoAw5xPlmtHnWkMVOiA5G3Q8n6Oy9z
	tqGtju0agvUhM1xHnh377yB+6nk76ifc/2EHhsLUpHPZ+kpE80okZsZ/FeRpcEg7g2WE
	cl15S5ZHISUr64NUeWg5bXEzTdjN6YwGZkYAyRnElKLKyxQDbjVlafrPWQuhzvygsMhA
	jcPubd5jho2FiKap8nG3IzoOKmmJ9mwH89puaQ63P5iVPCnrKtbp3TbYpnxgcqj3g4wg
	BD3go+98BV2kMiUCm/pAwyLsNzKGR1MH5C00jtNjTcGBOg8EeESGvrORQRpE2zeyEAdg
	8WnA==
MIME-Version: 1.0
Received: by 10.50.170.39 with SMTP id aj7mr5165555igc.32.1343404669068; Fri,
	27 Jul 2012 08:57:49 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Fri, 27 Jul 2012 08:57:49 -0700 (PDT)
In-Reply-To: <1343394922.9574.135.camel@ted>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
	<1343388304.9574.118.camel@ted>
	<alpine.DEB.2.02.1207270801210.14507@oneiric>
	<CAAQYJAvVkEcV=Bjfwp7JZWeXcrss6vUC3Amts5GGzdUrRBWwEw@mail.gmail.com>
	<1343394922.9574.135.camel@ted>
Date: Fri, 27 Jul 2012 17:57:49 +0200
Message-ID: <CAAQYJAvXzxviPMxLJPe84K=6gAOPhjQ18JTaY6rzazJfe1vsQw@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jul 2012 16:09:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f23541116e60604c5d1c62c

--e89a8f23541116e60604c5d1c62c
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 27, 2012 at 3:15 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2012-07-27 at 14:53 +0200, Andrea Adami wrote:
>
> >
> > By the way,
> >
> > we have followed pedissequally and re-introduced 'export
> > IMAGE_BASENAME' [1] when we adapted our initramfs image for oe-core,
> > even though we had built whitout until then, both in oe-classic and in
> > oe-core.
> >
> > Regards
> >
> > Andrea
> >
> > [1]
> >
> http://cgit.openembedded.org/meta-handheld/commit/?id=3021e1fc380067666a63fa5b2bdfc5fd16282973
>
> At this point I don't know if this is necessary or not. It might be
> unnecessary but we would need someone to confirm that before we remove
> it.
>
> Cheers,
>
> Richard
>
>
>
I see in bitbake.conf   IMAGE_BASENAME = "${PN}"

This is enough in the default case.

Cheers
Andrea



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f23541116e60604c5d1c62c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jul 27, 2012 at 3:15 PM, Richard Purdie =
<span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin-top:0px;margin-right:=
0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">On Fri, 2012-07-27 at 14:53 +0200, Andrea Adami wrote:<br=
>
<br>
&gt;<br>
&gt; By the way,<br>
&gt;<br>
&gt; we have followed pedissequally and re-introduced &#39;export<br>
&gt; IMAGE_BASENAME&#39; [1] when we adapted our initramfs image for oe-cor=
e,<br>
&gt; even though we had built whitout until then, both in oe-classic and in=
<br>
&gt; oe-core.<br>
&gt;<br>
&gt; Regards<br>
&gt;<br>
&gt; Andrea<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"http://cgit.openembedded.org/meta-handheld/commit/?id=3D302=
1e1fc380067666a63fa5b2bdfc5fd16282973" target=3D"_blank">http://cgit.openem=
bedded.org/meta-handheld/commit/?id=3D3021e1fc380067666a63fa5b2bdfc5fd16282=
973</a><br>

<br>
</div>At this point I don&#39;t know if this is necessary or not. It might =
be<br>
unnecessary but we would need someone to confirm that before we remove<br>
it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br></div></div></blockquote><div><br></div><div>I see in bitbake.conf =A0=
=A0IMAGE_BASENAME =3D &quot;${PN}&quot;</div><div><br></div><div>This is en=
ough in the default case.</div><div><br></div><div>Cheers</div><div>Andrea<=
/div>
<div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--e89a8f23541116e60604c5d1c62c--
