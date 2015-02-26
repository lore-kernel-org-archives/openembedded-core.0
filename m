Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id E6EE960670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 19:03:49 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id v63so11302961oia.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 11:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HusFzelnWglj4XQ6bhtbcjUG7hn4YUjk6MFbDzRNGzM=;
	b=0h7zwNVn3/r9D8QzzBNyvEcFnrpVkf/hybYS4sJqvY+gsu/e285P3gW8Sr2VtHpX5x
	N5MPiM2DoV6pKz8sJUb9XI3fCN7/Wk/tOKSmgGTjOkedPF6+KvJqEMowajfaksRpcW9W
	+Xav8GX4k8fmY8pnSyDF+uv3DHPx/hhb5NtrXvz23uBtfGmMNPb6JTx3yufF00jaRSS8
	89fdbOrcRwMz28tOWNfslnZpEoUUZEZwQZ8VXx6R+OvNu9NsMfvo5wrEzPMGdWBQCmEg
	r0eYTVsSnPfSoOWqlyedNN4Pxw8akLk8giJ0sdr3NxUCMKtjPVs3WJHKwB7T7V8d7lxI
	0H1A==
MIME-Version: 1.0
X-Received: by 10.60.82.194 with SMTP id k2mr7165701oey.65.1424977430394; Thu,
	26 Feb 2015 11:03:50 -0800 (PST)
Received: by 10.182.148.1 with HTTP; Thu, 26 Feb 2015 11:03:50 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1502250340130.25049@localhost>
References: <alpine.LFD.2.11.1502250320080.23957@localhost>
	<1424853407.26813.29.camel@linuxfoundation.org>
	<alpine.LFD.2.11.1502250340130.25049@localhost>
Date: Thu, 26 Feb 2015 11:03:50 -0800
Message-ID: <CAOLEWZUtewq_Z6xjaniVs-ujgmYq-zXc11P8JPL7gj=E=BOYCQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: on current linux distros, what are potential candidates for ASSUME_PROVIDED?
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
X-List-Received-Date: Thu, 26 Feb 2015 19:03:52 -0000
Content-Type: multipart/alternative; boundary=047d7b6729f88d3d980510026958

--047d7b6729f88d3d980510026958
Content-Type: text/plain; charset=UTF-8

I would agree that for classroom purposes, some of the best time savers are
things like pre-fetching downloads to a local machine, pre-cloning kernel
repos, and shared cache.

Also, IIRC several of the course lab examples (in the LF Yocto course)
didn't quite work as expected (mostly kernel variables for some reason).  I
would probably recommend keeping things simple, as in teaching the config
fragment approach (as is done in the kernel lab training thing).  Can't
remember what the all the issues were exactly as I normally build off
master which gives me recurring deja vu, but keeping course materials
current is always an ongoing issue for me...

Just my $.02 ...

Steve

On Wed, Feb 25, 2015 at 12:41 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Wed, 25 Feb 2015, Richard Purdie wrote:
>
> > On Wed, 2015-02-25 at 03:25 -0500, Robert P. J. Day wrote:
> > >   for the sake of reducing build time in the classroom, what are some
> > > of the potential (and relatively safe) candidates to add to
> > > ASSUME_PROVIDED for a build from scratch?
> >
> > This path is fraught with danger to be honest. There are some things
> > which are "safe" like subversion and git but they don't make that much
> > difference to a build and there are not as many as you'd think.
> >
> > The biggest difference you can make is an sstate cache you share amongst
> > the pupils. The time is spent:
> >
> > a) building gcc
> > b) building libc
> > c) building gettext
> > d) building glib
> >
> > each of these is a bottle neck which then opens up a new set of targets
> > as none of them are ASSUME_PROVIDED material.
>
>   ok, fair enough.
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b6729f88d3d980510026958
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>I would agree that for classroom purposes, =
some of the best time savers are things like pre-fetching downloads to a lo=
cal machine, pre-cloning kernel repos, and shared cache.<br><br></div>Also,=
 IIRC several of the course lab examples (in the LF Yocto course) didn&#39;=
t quite work as expected (mostly kernel variables for some reason).=C2=A0 I=
 would probably recommend keeping things simple, as in teaching the config =
fragment approach (as is done in the kernel lab training thing).=C2=A0 Can&=
#39;t remember what the all the issues were exactly as I normally build off=
 master which gives me recurring deja vu, but keeping course materials curr=
ent is always an ongoing issue for me...<br><br></div>Just my $.02 ...<br><=
br></div>Steve<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Wed, Feb 25, 2015 at 12:41 AM, Robert P. J. Day <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@cras=
hcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Wed, 25 Feb 2015, Richard Purdie wrote:<br>
<br>
&gt; On Wed, 2015-02-25 at 03:25 -0500, Robert P. J. Day wrote:<br>
&gt; &gt;=C2=A0 =C2=A0for the sake of reducing build time in the classroom,=
 what are some<br>
&gt; &gt; of the potential (and relatively safe) candidates to add to<br>
&gt; &gt; ASSUME_PROVIDED for a build from scratch?<br>
&gt;<br>
&gt; This path is fraught with danger to be honest. There are some things<b=
r>
&gt; which are &quot;safe&quot; like subversion and git but they don&#39;t =
make that much<br>
&gt; difference to a build and there are not as many as you&#39;d think.<br=
>
&gt;<br>
&gt; The biggest difference you can make is an sstate cache you share among=
st<br>
&gt; the pupils. The time is spent:<br>
&gt;<br>
&gt; a) building gcc<br>
&gt; b) building libc<br>
&gt; c) building gettext<br>
&gt; d) building glib<br>
&gt;<br>
&gt; each of these is a bottle neck which then opens up a new set of target=
s<br>
&gt; as none of them are ASSUME_PROVIDED material.<br>
<br>
</span>=C2=A0 ok, fair enough.<br>
<span class=3D"im HOEnZb"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" target=3D"_blank">http://crash=
course.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" target=3D"_blank">http://twitter.com/rp=
jday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" target=3D"_blank">http://ca.linkedin.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--047d7b6729f88d3d980510026958--
