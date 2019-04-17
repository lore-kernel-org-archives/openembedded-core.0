Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB7EA7C7A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 10:56:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g3so31310054wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 03:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UD5VklYSUsjiKz/8maCSKpK4Tm9IrfvmAu0Mj3VC4ro=;
	b=A7bbCOYbAJnEsT1HYB/hIYv95KCH9tV1odsKIAOK0R9JahOEZqVJXZ/XNqAsE/T7qJ
	7GenX/Y4VO3hTUWyXhSjJnuWI28UwD3DxqISClpYmr/aUOJ7rUYhegRCZd4fWRrze8Rz
	9Y1T+/ieSkyZeOkwa5M2ulOJ5hmeWIAoOuiN7wP8rQ5ZOJrGM2XNurHsmQWTL3dllZmy
	NNMaQZcapsOV07wbrc7ki7/HlV/uIxV2guTudbvvJU+lWv14RFAXyoq4t0Wh7hFlv+Ie
	/34oANRlV5bvgC+VRUW18vZQ+dxg7+YT26c5f2yMO1lQe9Ggj92dI8B8qTYuJJLwZM6/
	xgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UD5VklYSUsjiKz/8maCSKpK4Tm9IrfvmAu0Mj3VC4ro=;
	b=nUe6ainNaLt220W2X+Q7fNUVR+hPlV8ULd+H/ktqEPFXJbNp2ZsD+3fzdkyI86nODU
	DvIaI+MzJTw47ocNHtGKE+xu4ATeeoeJrwhS9lZGQmnJVFmJGvON5NVB5N5nQRazImYL
	38Kz3vf61Nyo+I57uSbfIr02u0H0Al273vjrRjPHCsCKbE+3m7qLhZt9N6WGYS0NZTQZ
	KDE888NQpyphNd/eBmBYjREzLArLTGh+IFreMOSR7RsExBeTJYuQlGRjBFCofjPWGqUJ
	Gk0sWoCGifPw5CzEuEMgC5m1EYPRB1HyAJ3JxRSBGey3rdykKx21r6kypzZZU4eC0r3s
	iiEg==
X-Gm-Message-State: APjAAAVgxSDMgDl3CvQFMyG0L1T9u30uKCVkUKYNzXqF5JXyV5Jr4YRe
	FnkqhvF/hMqJo1jp1OlE808B6iVcALo8I9UKXMc=
X-Google-Smtp-Source: APXvYqy6/gGEpwZz3g5kPshqXhYq8KG8cNtHfu5N1KuKaL0Val9S3OiL9sH8vdTVY6OePfUKOB68oMieMDTw6c6e/EI=
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr20519794wrw.22.1555498574616; 
	Wed, 17 Apr 2019 03:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
	<eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
	<20190417093520.GA895@localhost>
	<fdc87321d0cba27741ae1b9e1dde703e42683fa2.camel@linuxfoundation.org>
	<20190417095029.GB895@localhost>
	<355BE46A91031048906B695426A8D8E62EA3AE12@DENBGAT9EL2MSX.ww902.siemens.net>
	<20190417102507.GA3148@localhost>
In-Reply-To: <20190417102507.GA3148@localhost>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Apr 2019 12:56:02 +0200
Message-ID: <CA+chaQeFcuUvG6R5Y0UkQmiFKvF6Q8kjSN7CXTHQ=KB+zzj4jA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 10:56:15 -0000
Content-Type: multipart/alternative; boundary="000000000000fd1d2d0586b7bb9e"

--000000000000fd1d2d0586b7bb9e
Content-Type: text/plain; charset="UTF-8"

Would it make sense to at least as temporary work around add a flag saying
that git-lfs does or doesn't exist in HOSTTOOLS after it being added
to HOSTTOOLS_NONFATAL and then let those few recipes which already use
git-lfs to check this flag and fail early with meaningful error message
about git-lfs? It can be in a bbclass so that all recipes can easily share
it and it can be later changed to add dependency on git-lfs-native (if
there is one later).

Only issue is that people will forget to inherit this bbclass in their
recipes if it just happen to work.

Adding it to some subdirectory inside HOSTTOOLS which is added to PATH only
when the bbclass is inherited might be a bit too much for just a work
around :/.

Regards,

On Wed, Apr 17, 2019 at 12:25 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Apr 17, 2019 at 09:57:50AM +0000, Bach, Pascal wrote:
> > > > > Your "everyone has to install it" worry misses the much bigger
> > > > > problem that git-lfs is a relatively new tool and not available in
> > > > > distributions like Debian 9 or Ubuntu 16.04.
> > > >
> > > > Someone could certainly write a native recipe for lfs and add that as
> > > > a dependency which would also solve this problem. I'd be quite happy
> > > > to see that and it would neatly solve the problems.
> > >
> > > This was also my first thought.
> > >
> > > It stops being neat once you realize that it requires packaging a 3
> digit
> > > number of Go libraries.
> >
> > I don't think that's how go packaging works. Go usually statically links
> everything at compile time and bundles the sources with modules.
>
> It is not really static linking, it is more like the "libraries" being
> source files instead of compiled code.
>
> > So from a yocto point of view you only need to create one recipe with
> everything inside.
>
> Fetching from 100 different git repositories would be plenty of
> work to setup and to maintain, no matter how many recipes you use.
>
> Certainly not impossible, but I wouldn't call this neat.
>
> >...
> > Pascal
> >...
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fd1d2d0586b7bb9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Would it make sense to at least as tempor=
ary work around add a flag saying that git-lfs does or doesn&#39;t exist in=
 HOSTTOOLS after it being added to=C2=A0HOSTTOOLS_NONFATAL and then let tho=
se few recipes which already use git-lfs to check this flag and fail early =
with meaningful error message about git-lfs? It can be in a bbclass so that=
 all recipes can easily share it and it can be later changed to add depende=
ncy on git-lfs-native (if there is one later).</div><div dir=3D"ltr"><br></=
div><div>Only issue is that people will forget to inherit this bbclass in t=
heir recipes if it just happen to work.</div><div><br></div><div>Adding it =
to some subdirectory inside HOSTTOOLS which is added to PATH only when the =
bbclass is inherited might be a bit too much for just a work around :/.</di=
v><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 17, 2019 at 12:25 PM Adrian=
 Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Apr 17, 2=
019 at 09:57:50AM +0000, Bach, Pascal wrote:<br>
&gt; &gt; &gt; &gt; Your &quot;everyone has to install it&quot; worry misse=
s the much bigger<br>
&gt; &gt; &gt; &gt; problem that git-lfs is a relatively new tool and not a=
vailable in<br>
&gt; &gt; &gt; &gt; distributions like Debian 9 or Ubuntu 16.04.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Someone could certainly write a native recipe for lfs and ad=
d that as<br>
&gt; &gt; &gt; a dependency which would also solve this problem. I&#39;d be=
 quite happy<br>
&gt; &gt; &gt; to see that and it would neatly solve the problems.<br>
&gt; &gt; <br>
&gt; &gt; This was also my first thought.<br>
&gt; &gt; <br>
&gt; &gt; It stops being neat once you realize that it requires packaging a=
 3 digit<br>
&gt; &gt; number of Go libraries.<br>
&gt; <br>
&gt; I don&#39;t think that&#39;s how go packaging works. Go usually static=
ally links everything at compile time and bundles the sources with modules.=
<br>
<br>
It is not really static linking, it is more like the &quot;libraries&quot; =
being <br>
source files instead of compiled code.<br>
<br>
&gt; So from a yocto point of view you only need to create one recipe with =
everything inside.<br>
<br>
Fetching from 100 different git repositories would be plenty of<br>
work to setup and to maintain, no matter how many recipes you use.<br>
<br>
Certainly not impossible, but I wouldn&#39;t call this neat.<br>
<br>
&gt;...<br>
&gt; Pascal<br>
&gt;...<br>
<br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000fd1d2d0586b7bb9e--
