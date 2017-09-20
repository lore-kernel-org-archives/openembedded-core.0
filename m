Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 18C4871ABD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 13:43:26 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id z187so4058617ioz.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Iqjyk5HIprqSRp3CXnQT5ThqjjXoQ0KXvw4OOB2UeOU=;
	b=bzG5UV7ZBvjYA3dzQKk1+cdBmeMD3WI8lQTuo53X7wm0cicKQtey4N3VEOk15D590P
	liUJIXEQKdXaBTAfQ1tddOvvA4Ey276dKLDWzH5JluvD8/gQu7NSuipK0L+NfZpk1XSO
	Ps+CtaKcDGKSDSElAUhawt8G8Wu8Q9QaMl3WDbGPLldkFd5cYAJCnMF0+L5Vb5geRDmz
	F4RerLCtbnGEeheaaRu/cjhB+Ta8pWh/yBkGfqJBweiO5qqS6Kd4chxdUVIRoJxos4ae
	sZVgQ4eJ/yuYMq85ctsq/iSfAXlwjY0LWUbKejL6LOLb8UqBM4wMgZCWKXHpb6O/kiL8
	NIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Iqjyk5HIprqSRp3CXnQT5ThqjjXoQ0KXvw4OOB2UeOU=;
	b=It3I2yqM14NjhJbowiaweDe50H098R9nxwEQpBsGlG6amx2gGrXSGYVOFEoylsUXJb
	9AOaCHDFjXshDvNnPDmzK6VDLxMBrwgoG4GaY3HD9MT3T1htmS2wUnDDt6BDPvOdpm0x
	ITIZJhbt/QSDYQ9B4jsI+QbEx6GLgam7KAY2B4nPzT4mklRIGyH7CiSoxbY55D8lxNKq
	BlbfbVoNkJLm8uDblsklzYhaYBfYfKOwjQkOhTGYWwVbqMjgLQ1HW/3Oh5FM1/uHbvaP
	bs744MyQ4UKglji1kZP7bjk03kEbv6Q4ENtVY/2Ah7vUMz0HLXrYeAhoW1bo1vg/zrnj
	MECA==
X-Gm-Message-State: AHPjjUhk3v8Yjq70W4Ovjlo2SDQC6lNx6O9herxYg3MROL46l7Y1EIU6
	GYnfAx50iO97JwKulFa1iWkouqoDztsKh2hN83TCCQ==
X-Google-Smtp-Source: AOwi7QARJPS0hRK1bYdrauCPapHrOOJPuus7ZbjWEK4KdJka4gyfZZUGZTcp0MqP6l9aRTV8k13/aSrW4ECZ4T0ddy0=
X-Received: by 10.107.164.28 with SMTP id n28mr6441408ioe.175.1505915008175;
	Wed, 20 Sep 2017 06:43:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 20 Sep 2017 06:43:07 -0700 (PDT)
In-Reply-To: <1505899714.19222.9.camel@andred.net>
References: <20170904093726.11472-1-git@andred.net>
	<101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
	<1504597240.29140.10.camel@andred.net>
	<1505899714.19222.9.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Sep 2017 14:43:07 +0100
Message-ID: <CAJTo0LYQS_edVzVR5zSwAJ6O-WNzVzfHTjv8cGGYB3bx=sD4hw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd-staticids: don't create username-group if gid is specified
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
X-List-Received-Date: Wed, 20 Sep 2017 13:43:27 -0000
Content-Type: multipart/alternative; boundary="001a114223ac1fe90605599f29a4"

--001a114223ac1fe90605599f29a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, in mut now.

Ross

On 20 September 2017 at 10:28, Andr=C3=A9 Draszik <git@andred.net> wrote:

> ping
>
> On Tue, 2017-09-05 at 08:40 +0100, Andr=C3=A9 Draszik wrote:
> > On Mon, 2017-09-04 at 10:22 +0000, Peter Kjellerstedt wrote:
> > > >
> >
> > [...]
> > > > diff --git a/meta/classes/useradd-staticids.bbclass
> > > > b/meta/classes/useradd-staticids.bbclass
> > > > index ce4ac62ab5..1b61a8bf9b 100644
> > > > --- a/meta/classes/useradd-staticids.bbclass
> > > > +++ b/meta/classes/useradd-staticids.bbclass
> > > > @@ -102,7 +102,7 @@ def update_useradd_static_config(d):
> > > >              # So if the implicit username-group creation is on, th=
en
> > > > the implicit groupname (LOGIN)
> > > >              # is used, and we disable the user_group option.
> > > >              #
> > > > -            user_group =3D uaargs.user_group is None or
> > > > uaargs.user_group
> > > > is True
> > > > +            user_group =3D uaargs.gid is None or uaargs.user_group=
 is
> > > > True
> > >
> > > Hmm, I believe that should be:
> > >
> > >             user_group =3D uaargs.gid is None and uaargs.user_group i=
s
> > > None
> > > or uaargs.user_group is True
> > >
> > > I.e., if neither --gid nor --user-group is specified, then it should
> > > treat it as if --user-group was specified.
> >
> > Hm, isn't this still the same as
> >
> > user_group =3D uaargs.gid is None or uaargs.user_group is True
> >
> > ? If neither --gid nor --user-group is specified, then gid is None, so =
it
> > will do what you want already. IOW, unless the group name (gid) is
> > specified, a username-group is being created.
> >
> >
> > Cheers,
> > Andre'
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114223ac1fe90605599f29a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, in mut now.<div><br></div><div>Ross</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 20 September 2017 =
at 10:28, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@an=
dred.net" target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">ping<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Tue, 2017-09-05 at 08:40 +0100, Andr=C3=A9 Draszik wrote:<br>
&gt; On Mon, 2017-09-04 at 10:22 +0000, Peter Kjellerstedt wrote:<br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; [...]<br>
&gt; &gt; &gt; diff --git a/meta/classes/useradd-<wbr>staticids.bbclass<br>
&gt; &gt; &gt; b/meta/classes/useradd-<wbr>staticids.bbclass<br>
&gt; &gt; &gt; index ce4ac62ab5..1b61a8bf9b 100644<br>
&gt; &gt; &gt; --- a/meta/classes/useradd-<wbr>staticids.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes/useradd-<wbr>staticids.bbclass<br>
&gt; &gt; &gt; @@ -102,7 +102,7 @@ def update_useradd_static_config(<wbr>d)=
:<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0# So if the implicit username-group creation is on, then<=
br>
&gt; &gt; &gt; the implicit groupname (LOGIN)<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0# is used, and we disable the user_group option.<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0#<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0user_group =3D uaargs.user_group is None or<br>
&gt; &gt; &gt; uaargs.user_group<br>
&gt; &gt; &gt; is True<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0user_group =3D uaargs.gid is None or uaargs.user_group is<br=
>
&gt; &gt; &gt; True<br>
&gt; &gt;<br>
&gt; &gt; Hmm, I believe that should be:<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0user_group =3D uaargs.gid is None and uaargs.user_group is<br>
&gt; &gt; None<br>
&gt; &gt; or uaargs.user_group is True<br>
&gt; &gt;<br>
&gt; &gt; I.e., if neither --gid nor --user-group is specified, then it sho=
uld=C2=A0<br>
&gt; &gt; treat it as if --user-group was specified.<br>
&gt;<br>
&gt; Hm, isn&#39;t this still the same as=C2=A0<br>
&gt;<br>
&gt; user_group =3D uaargs.gid is None or uaargs.user_group is True<br>
&gt;<br>
&gt; ? If neither --gid nor --user-group is specified, then gid is None, so=
 it<br>
&gt; will do what you want already. IOW, unless the group name (gid) is<br>
&gt; specified, a username-group is being created.<br>
&gt;<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Andre&#39;<br>
&gt;<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114223ac1fe90605599f29a4--
