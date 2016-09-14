Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CAD7E76FF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 21:23:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so4329068wma.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bofvErXf19r0iDN8iWTAbowHgoFK+trkRLOCWnW8VYA=;
	b=gUkF+Xy82jn15HHgjZylWAy+OR2vk95VyFMkg8btVN79uFzket+ohyKW58j7B/dQvK
	aqHNxoxt23yNFeSnHxuaBkxu5/ZH/4hzgC2dVE2tKQAsBg6qiEi6ecvg/CX8sac6Dul1
	rJQ3Fex3zpFmlZY5QOq4aSWmF7N94DpxJ9MgJ013BJPeibfQPhwAChEiy/2y05G4JkKs
	sL7IyuE7KkZ7wVZLieWQpOPmnJaE10mdho6AD9y1XSukhReBNNZPfva6z2A9GMQ9jsou
	Yh++MBRPJI5Y+yaSmr0dP08y3nJfyle2yqLTNRgTOhuJZU3E843DZ2P07+4mBUGFmjMa
	BGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bofvErXf19r0iDN8iWTAbowHgoFK+trkRLOCWnW8VYA=;
	b=QCNYatYAm9lfnOkRF2yQWIBElhagIVgrKWXK5posLgJGctuEoqKp0ly2RATFyMmG5y
	eNQZ/EUIVqZWvLQF9nCK95ZgUswhcPb5rSQGl2Z4bTx5yxj8CD8ey2uzZ83+vkwMoxlz
	gjuU2Vy4Wwy8neNXdbmALTcsDz+TBkZKWdU49ePg78O7UzZ/wzutKisgLZyNj5xPpFcC
	XQCbNk6lnzKed3KXjByD/q8GimVjN8akoTtEo8qbtrWsHjBN0W+1Soag7kkjuQoXxw3u
	L6Adkh5MrukuaTtUrYacfpFOGU1lKAN/opwvcIRNKReA/KOlkOfTzWCXBk4hO68qtjL0
	oOSw==
X-Gm-Message-State: AE9vXwPayj/GTrT4g/u26fCgMoBeQPELYu8Xy7e5EzXrPDgFa1rk7+oA6VuSHPVK/kURE1Qj50o9bfAQ7eJybQ==
X-Received: by 10.28.156.144 with SMTP id f138mr13371441wme.86.1473888228926; 
	Wed, 14 Sep 2016 14:23:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.154.225 with HTTP; Wed, 14 Sep 2016 14:23:47 -0700 (PDT)
In-Reply-To: <CAKUP++va+C=1wLQPMdb+=Pd-CLGigC=RREQb0OfnFnwh5fzJJA@mail.gmail.com>
References: <20160914162519.16212-1-patrick@stwcx.xyz>
	<CAKUP++va+C=1wLQPMdb+=Pd-CLGigC=RREQb0OfnFnwh5fzJJA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Sep 2016 23:23:47 +0200
Message-ID: <CA+chaQfb_L2VZUXiK07rd4aBUn508CjtWp1R1R8weYHUaJHRSg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: configure with enable-symlink
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
X-List-Received-Date: Wed, 14 Sep 2016 21:23:49 -0000
Content-Type: multipart/alternative; boundary=001a114b31c852ed94053c7e583e

--001a114b31c852ed94053c7e583e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It was also proposed and discussed some 15 months ago and it was packaging
issue not handling hardlinks correctly:
http://lists.openembedded.org/pipermail/openembedded-core/2015-April/103939=
.html

I believe this was fixed then, but maybe it got broken again?

On Wed, Sep 14, 2016 at 9:50 PM, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On 14 Sep 2016 5:40 p.m., "Patrick Williams" <patrick@stwcx.xyz> wrote:
> >
> > The /sbin/fsck.ext[234] programs currently installed are all
> > the same binary as e2fsck.  The package provides an option to
> > have fsck.ext[234] be symlinked to /sbin/e2fsck instead.  This
> > reduces the uncompressed footprint of this package by ~1MB on ARM.
>
> They were all hardlinks last time I checked not long ago. Why do hardlink=
s
> increase the footprint?
>
> A.
>
> >
> > Add --enable-symlink-install to EXTRA_OECONF to enable.
> >
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> > index f4855bc..d6db612 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> > @@ -18,7 +18,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D
> "v(?P<pver>\d+\.\d+(\.\d+)*)$"
> >
> >  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindi=
r} \
> >                  --enable-elf-shlibs --disable-libuuid --disable-uuidd =
\
> > -                --disable-libblkid --enable-verbose-makecmds"
> > +                --disable-libblkid --enable-verbose-makecmds \
> > +                --enable-symlink-install"
> >
> >  EXTRA_OECONF_darwin =3D "--libdir=3D${base_libdir}
> --sbindir=3D${base_sbindir} --enable-bsd-shlibs"
> >
> > --
> > 2.9.0
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114b31c852ed94053c7e583e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was also proposed and discussed some 15 months ago and =
it was packaging issue not handling hardlinks correctly:<div><a href=3D"htt=
p://lists.openembedded.org/pipermail/openembedded-core/2015-April/103939.ht=
ml">http://lists.openembedded.org/pipermail/openembedded-core/2015-April/10=
3939.html</a><br></div><div><br></div><div>I believe this was fixed then, b=
ut maybe it got broken again?</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Wed, Sep 14, 2016 at 9:50 PM, Andr=C3=A9 Draszik=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.net" target=3D"_blank">=
git@andred.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D""><p dir=3D"ltr">On 14 Sep 2016 5:40 p.m., &quot;Patrick William=
s&quot; &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@=
stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; The /sbin/fsck.ext[234] programs currently installed are all<br>
&gt; the same binary as e2fsck.=C2=A0 The package provides an option to<br>
&gt; have fsck.ext[234] be symlinked to /sbin/e2fsck instead.=C2=A0 This<br=
>
&gt; reduces the uncompressed footprint of this package by ~1MB on ARM.</p>
</span><p dir=3D"ltr">They were all hardlinks last time I checked not long =
ago. Why do hardlinks increase the footprint?</p><span class=3D"HOEnZb"><fo=
nt color=3D"#888888">
<p dir=3D"ltr">A.</p></font></span><div class=3D"HOEnZb"><div class=3D"h5">
<p dir=3D"ltr">&gt;<br>
&gt; Add --enable-symlink-install to EXTRA_OECONF to enable.<br>
&gt;<br>
&gt; Signed-off-by: Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xy=
z" target=3D"_blank">patrick@stwcx.xyz</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs=
_1.43.bb" target=3D"_blank">e2fsprogs_1.43.bb</a> | 3 ++-<br>
&gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2=
fsprogs_1.43.bb" target=3D"_blank">e2fsprogs_1.43.bb</a> b/meta/recipes-dev=
tools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43.bb" target=3D"_blank"=
>e2fsprogs_1.43.bb</a><br>
&gt; index f4855bc..d6db612 100644<br>
&gt; --- a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs=
_1.43.bb" target=3D"_blank">e2fsprogs_1.43.bb</a><br>
&gt; +++ b/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs=
_1.43.bb" target=3D"_blank">e2fsprogs_1.43.bb</a><br>
&gt; @@ -18,7 +18,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt=
;\d+\.\d+(\.\d+)*)$&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF +=3D &quot;--libdir=3D${base_libdir} --sbindir=3D${=
base_sbindir} \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable=
-elf-shlibs --disable-libuuid --disable-uuidd \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-lib=
blkid --enable-verbose-makecmds&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-lib=
blkid --enable-verbose-makecmds \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-syml=
ink-install&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF_darwin =3D &quot;--libdir=3D${base_libdir} --sbindi=
r=3D${base_sbindir} --enable-bsd-shlibs&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.9.0<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinf=
o/openembedded-<wbr>core</a><br></p>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114b31c852ed94053c7e583e--
