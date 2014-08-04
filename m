Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3332665CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 09:04:07 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so6890177igd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NPJA6iMmcF1Cy5rnV3cf+SiEYOGAdkbRXRY+kz90srE=;
	b=Z61TkBtEviIW83YRJyNXXbyxc2etYeR44SHAmOu/GUgWj/pMfR18KbSCQi0cTgHJrn
	IRUqAM0yNUdEKVhd1upCZDamGivJVrjcuA5pl032QfJAww/6vZ+gS7Ox2aNT5+aSd3pI
	0Mw287WM+7vLpqTUy6zcjm1Ro1SXJVPD8QSGyh97ACZUqLwv9vyIx4NFlm4vJ03MrHsr
	B97zpCFWSeao7VP/3cn3OnL/BH0zesCvVsX44NJPzMfNnUTJClo/r/V/aMd5hNpI6d8j
	3gVZGp74huNXJYDGfAdgcXaS8E4eJqhJZ8MXeAd35gq4J2SMtylL5XCI9IaeY2hSoK0s
	gAdA==
MIME-Version: 1.0
X-Received: by 10.50.32.10 with SMTP id e10mr34768627igi.7.1407143049055; Mon,
	04 Aug 2014 02:04:09 -0700 (PDT)
Received: by 10.50.13.10 with HTTP; Mon, 4 Aug 2014 02:04:09 -0700 (PDT)
In-Reply-To: <1407142460.6981.47.camel@ted>
References: <1406900794-19878-1-git-send-email-bobadeshrikant@gmail.com>
	<1407142460.6981.47.camel@ted>
Date: Mon, 4 Aug 2014 14:34:09 +0530
Message-ID: <CALwQErq1M+CfcUBXuX4uJaWD7An6v1U81uDH5udhMrK9ZMVd1A@mail.gmail.com>
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dnsmasq: fix parallel make failure
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
X-List-Received-Date: Mon, 04 Aug 2014 09:04:08 -0000
Content-Type: multipart/alternative; boundary=047d7b11198f96540404ffca0560

--047d7b11198f96540404ffca0560
Content-Type: text/plain; charset=UTF-8

Thanks Richard,

Pushing it to oe-devel list..

Thanks
Shrikant


On Mon, Aug 4, 2014 at 2:24 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2014-08-01 at 19:16 +0530, Shrikant Bobade wrote:
> > From: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> >
> > The dnsmasq target depends on .configured and $(objs). .configured does
> an rm
> > -f *.o. Yet the only thing telling make to build the .configured target
> before
> > the $(objs) target was the order of the dependencies of the dnsmasq
> target. We
> > can't rely on that order when doing a paralllel make build, so add an
> explicit
> > rule to enforce that order.
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> > ---
> >  .../recipes-support/dnsmasq/dnsmasq.inc            |    1 +
> >  .../dnsmasq/files/parallel-make.patch              |   18
> ++++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
>
>
> Should be to the oe-devel list, not oe-core...
>
> Cheers,
>
> Richard
>
>

--047d7b11198f96540404ffca0560
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thanks Richard, <br><br></div>Pushing it to=
 oe-devel list.. <br><br></div>Thanks<br></div>Shrikant<br><div><div><div><=
div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, A=
ug 4, 2014 at 2:24 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@lin=
uxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"">On Fri, 2=
014-08-01 at 19:16 +0530, Shrikant Bobade wrote:<br>
&gt; From: Shrikant Bobade &lt;<a href=3D"mailto:Shrikant_Bobade@mentor.com=
">Shrikant_Bobade@mentor.com</a>&gt;<br>
&gt;<br>
&gt; The dnsmasq target depends on .configured and $(objs). .configured doe=
s an rm<br>
&gt; -f *.o. Yet the only thing telling make to build the .configured targe=
t before<br>
&gt; the $(objs) target was the order of the dependencies of the dnsmasq ta=
rget. We<br>
&gt; can&#39;t rely on that order when doing a paralllel make build, so add=
 an explicit<br>
&gt; rule to enforce that order.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Shrikant Bobade &lt;<a href=3D"mailto:Shrikant_Bobade@m=
entor.com">Shrikant_Bobade@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../recipes-support/dnsmasq/dnsmasq.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +<br>
&gt; =C2=A0.../dnsmasq/files/parallel-make.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 18 ++++++++++++++++++<br>
&gt; =C2=A02 files changed, 19 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files=
/parallel-make.patch<br>
<br>
<br>
</div>Should be to the oe-devel list, not oe-core...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div></div></div></div></div></div>

--047d7b11198f96540404ffca0560--
