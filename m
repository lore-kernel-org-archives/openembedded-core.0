Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EEEB170200;
	Wed, 16 Jul 2014 20:19:26 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so1433978iec.19
	for <multiple recipients>; Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FiCdEQ83LSlXAzxpPq55V51FD187k9JGXpfqCS8HFWY=;
	b=bKdGvwTlko6i1Qwk5OcYuUrrD7Zj12RK8QGEmMNCS/GfSibr43MduvOyaGD62lANUO
	xyUWJvxjEZJ6yWdefcWTs7sZYLWFrA5djW57KSBg5OmslozWw5jD9D4ArgOB0CF8MBIF
	+WW5299/mjm0vY8AEdcDs8butoSjNSZ+4bauTKQfpUd+7kAhF+JWPzuGY1Ej6jKTiinp
	vy7daxvsBfaUrqOT4Su5G68RrPjgoShEVKbkxSyZQondrZPoh5YvNYohwRu1LFvjslxM
	S7qDeDBVScj4d0+IGWBLtuB/kEt4HmSC8RI77Px/V98Ee3F3xIMPZppbes8tG3RJoRrf
	ieVQ==
MIME-Version: 1.0
X-Received: by 10.43.53.199 with SMTP id vr7mr22098554icb.70.1405541967220;
	Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407120436510.28008@localhost>
References: <alpine.LFD.2.11.1407111821080.6262@localhost>
	<CAP9ODKqwOXV+GxNhoPFXJWcjLipD1P176Qcy0bBNMuzF9=Bhng@mail.gmail.com>
	<CAMKF1spgCphqN7PVskjP_bHd2CfsBRi52y=KJ2fWyjwQxw0cYw@mail.gmail.com>
	<alpine.LFD.2.11.1407120436510.28008@localhost>
Date: Wed, 16 Jul 2014 13:19:27 -0700
Message-ID: <CAMKF1soB6boe8Echqswu64ptz2PBh_VWF_8aK5WooPcwMYeyGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH] core-image.bbclass: Reformat definition of CORE_IMAGE_BASE_INSTALL
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
X-List-Received-Date: Wed, 16 Jul 2014 20:19:28 -0000
Content-Type: multipart/alternative; boundary=bcaec51b1ad9ac571c04fe553dad

--bcaec51b1ad9ac571c04fe553dad
Content-Type: text/plain; charset=UTF-8

On Jul 12, 2014 1:41 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
> On Fri, 11 Jul 2014, Khem Raj wrote:
>
> > On Fri, Jul 11, 2014 at 4:41 PM, Otavio Salvador
> > <otavio@ossystems.com.br> wrote:
> > > Hello,
> > >
> > > +OE-Core
> > >
> > > On Fri, Jul 11, 2014 at 7:23 PM, Robert P. J. Day <
rpjday@crashcourse.ca> wrote:
> > >>
> > >> Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be more
> > >> intuitively obvious.
> > >>
> > >> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >>
> > >> ---
> > >>
> > >>   compile and run-time tested, building a core-image-minimal for
> > >> qemuarm.
> > >>
> > >> diff --git a/meta/classes/core-image.bbclass
b/meta/classes/core-image.bbclass
> > >> index 1b36cba..d2b9d69 100644
> > >> --- a/meta/classes/core-image.bbclass
> > >> +++ b/meta/classes/core-image.bbclass
> > >> @@ -59,13 +59,11 @@ MACHINE_HWCODECS ??= ""
> > >>  CORE_IMAGE_BASE_INSTALL = '\
> > >>      packagegroup-core-boot \
> > >>      packagegroup-base-extended \
> > >> -    \
> > >> -    ${CORE_IMAGE_EXTRA_INSTALL} \
> > >>      '
> > >>
> > >>  CORE_IMAGE_EXTRA_INSTALL ?= ""
> > >>
> > >> -IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> > >> +IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}
${CORE_IMAGE_EXTRA_INSTALL}"
> > >
> > > For me, more intuitively would be:
> > >
> > > CORE_IMAGE_BASE_INSTALL ?= ...
> >
> > weak assignment here would mean overridable base install which is
> > not the intention. we want a working base image when inheriting
> > core-image
>
>   except that that argument doesn't really hold water given how one
> can inherit core-image, then (as i pointed out) immediately wipe out
> that supposedly inviolable definition of CORE_IMAGE_BASE_INSTALL by
> simply reassigning to IMAGE_INSTALL.

these classes are provided as basic working blocks. it would be a bad use
case if one were to override basic constructs inside it completely. some
variables are sort of interfaces some are not. besides your change is ok
its just the preset is not. we should start using the constructs as
intended.
>
>   i *like* the idea of a weak assignment to CORE_IMAGE_BASE INSTALL.
> it's effectively what core-image-minimal is doing anyway, it just
> allows you to do it in a way that's not grotesquely ugly.
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

--bcaec51b1ad9ac571c04fe553dad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 12, 2014 1:41 AM, &quot;Robert P. J. Day&quot; &lt;<a href=3D"mailto=
:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 11 Jul 2014, Khem Raj wrote:<br>
&gt;<br>
&gt; &gt; On Fri, Jul 11, 2014 at 4:41 PM, Otavio Salvador<br>
&gt; &gt; &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.c=
om.br</a>&gt; wrote:<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +OE-Core<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, Jul 11, 2014 at 7:23 PM, Robert P. J. Day &lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be=
 more<br>
&gt; &gt; &gt;&gt; intuitively obvious.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Signed-off-by: Robert P. J. Day &lt;<a href=3D"mailto:rp=
jday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =C2=A0 compile and run-time tested, building a core-imag=
e-minimal for<br>
&gt; &gt; &gt;&gt; qemuarm.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; diff --git a/meta/classes/core-image.bbclass b/meta/clas=
ses/core-image.bbclass<br>
&gt; &gt; &gt;&gt; index 1b36cba..d2b9d69 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/classes/core-image.bbclass<br>
&gt; &gt; &gt;&gt; +++ b/meta/classes/core-image.bbclass<br>
&gt; &gt; &gt;&gt; @@ -59,13 +59,11 @@ MACHINE_HWCODECS ??=3D &quot;&quot;<=
br>
&gt; &gt; &gt;&gt; =C2=A0CORE_IMAGE_BASE_INSTALL =3D &#39;\<br>
&gt; &gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0packagegroup-core-boot \<br>
&gt; &gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0packagegroup-base-extended \<br>
&gt; &gt; &gt;&gt; - =C2=A0 =C2=A0\<br>
&gt; &gt; &gt;&gt; - =C2=A0 =C2=A0${CORE_IMAGE_EXTRA_INSTALL} \<br>
&gt; &gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0&#39;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =C2=A0CORE_IMAGE_EXTRA_INSTALL ?=3D &quot;&quot;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; -IMAGE_INSTALL ?=3D &quot;${CORE_IMAGE_BASE_INSTALL}&quo=
t;<br>
&gt; &gt; &gt;&gt; +IMAGE_INSTALL ?=3D &quot;${CORE_IMAGE_BASE_INSTALL} ${C=
ORE_IMAGE_EXTRA_INSTALL}&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For me, more intuitively would be:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; CORE_IMAGE_BASE_INSTALL ?=3D ...<br>
&gt; &gt;<br>
&gt; &gt; weak assignment here would mean overridable base install which is=
<br>
&gt; &gt; not the intention. we want a working base image when inheriting<b=
r>
&gt; &gt; core-image<br>
&gt;<br>
&gt; =C2=A0 except that that argument doesn&#39;t really hold water given h=
ow one<br>
&gt; can inherit core-image, then (as i pointed out) immediately wipe out<b=
r>
&gt; that supposedly inviolable definition of CORE_IMAGE_BASE_INSTALL by<br=
>
&gt; simply reassigning to IMAGE_INSTALL.</p>
<p dir=3D"ltr">these classes are provided as basic working blocks. it would=
 be a bad use case if one were to override basic constructs inside it compl=
etely. some variables are sort of interfaces some are not. besides your cha=
nge is ok its just the preset is not. we should start using the constructs =
as intended. <br>

&gt;<br>
&gt; =C2=A0 i *like* the idea of a weak assignment to CORE_IMAGE_BASE INSTA=
LL.<br>
&gt; it&#39;s effectively what core-image-minimal is doing anyway, it just<=
br>
&gt; allows you to do it in a way that&#39;s not grotesquely ugly.<br>
&gt;<br>
&gt; rday<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; Robert P. J. Day =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ottawa, Ontario=
, CANADA<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <a href=3D"http://crashcourse.ca">http://crashcourse.ca</a><b=
r>
&gt;<br>
&gt; Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
a href=3D"http://twitter.com/rpjday">http://twitter.com/rpjday</a><br>
&gt; LinkedIn: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://ca.linkedin=
.com/in/rpjday">http://ca.linkedin.com/in/rpjday</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
</p>

--bcaec51b1ad9ac571c04fe553dad--
