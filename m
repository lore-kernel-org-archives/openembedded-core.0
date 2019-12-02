Return-Path: <alex.kanavin@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2747F230
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:24:59 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id u17so33778707ilq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gnSEAXDq3pyrcoaPrOizsVtlDgskwdaULjn26235Rvc=;
	b=K1TBa+QjqdXMODx4hiv6NWq06d2joBLB2jABLgZkSIp4ashY/p9Ywml2r8SLQS8yj8
	+TWnPJCiWU2lJLo0u5DO1bZzpUVpHTQVt43xq8QDC5R2VunKmGMiaDTqizxKVHS4n0Eo
	/S+hJH5AFYujzeKWP4GffJCNBID8NxcUhBSDAPZ44h1YWp+aWbydGRgQ0ekAgzZ0hIEj
	o+aclDYGb+BHJUuvk+rz7kBp3Lhr2l4Z6MULK//lMtO042kGXWQ13yW7y6XBRq7K0Oca
	Gr/4w3pcDwoKN7OjXbMIUFlipM5D5uY2mWic/QLSglg2vg5fJprJH4ExjbgjhmggA4uf
	Vhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gnSEAXDq3pyrcoaPrOizsVtlDgskwdaULjn26235Rvc=;
	b=SxuIJii3MVisCiWt5ZbkFo5FpUDfURdjquJojDoXBynf9aRDyJXI6HlucMAHi80Eq8
	N897WSI74ogaA+Np2BWCVUiHcdi6CwF4vORQ800JDMLaMCIopIgKwjatEUEV55vyh8Ch
	/m+Vn4kDiVINMB8Ru+OLAzDh+UDssNwgERFjZUNNLpvLI86inU+cvrFwzPqX3DDp8vT2
	QVeBWTgyg1iqQTbETu2p0AUmqSDabID7USYKm35i5ev8ulDt8Vq8r/jO844/bCpqXrKE
	Y/hNh/zy4jMRpwfVerCk7+pa7I5ImmMO+PFGgv96ZVSMhmCjoOur7GgpUtt6hgaXMCkL
	HUUg==
X-Gm-Message-State: APjAAAXPCxcfazSDl6QOTzqSI1uEg7nrCmwM8aufkPi02Tswxortgpbi
	rFXqpLLypNq+9m5Tuwc6CFy1GW6oLtA3mlK2XQU=
X-Google-Smtp-Source: APXvYqyg7lTXg30E+4YAaE3ktTR3sBaw5oVwUcn+RT9uxAHxtQQg6m0kkQylrzKWluqy6Ac8/g6kOw6l+n3p5MBt2xg=
X-Received: by 2002:a92:290a:: with SMTP id l10mr20524275ilg.151.1575300300477;
	Mon, 02 Dec 2019 07:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
	<33182b29-de6e-f918-2915-df016b854e81@intel.com>
	<20191202151051.GC1581@localhost>
In-Reply-To: <20191202151051.GC1581@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2019 16:24:49 +0100
Message-ID: <CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Mon, 02 Dec 2019 15:24:59 -0000
Content-Type: multipart/alternative; boundary="000000000000d31ae20598ba2e8a"

--000000000000d31ae20598ba2e8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's using -std=3Dc++11. I'm not sure if switching to gnu flavour would hav=
e
made a difference with gcc 4.8 provided in centos 7 and gcc 4.9 from Debian
8 - is it worth trying? Newer gcc versions don't complain and build this
without error while still using -std=3Dc++11.

I'm leaning towards taking out the dnf/libdnf updates until these distros
are retired from the supported distro list.

Alex

On Mon, 2 Dec 2019 at 16:10, Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Dec 02, 2019 at 02:55:06PM +0000, Ross Burton wrote:
> > FAILED: libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o
> >
> /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux=
/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2618:8:
> > error: =E2=80=98atomic_flag=E2=80=99 in namespace =E2=80=98std=E2=80=99=
 does not name a type
> >  static std::atomic_flag cfgMainLoaded =3D ATOMIC_FLAG_INIT;
> >         ^
> >
> /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux=
/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:
> > In function =E2=80=98libdnf::ConfigMain& libdnf::getGlobalMainConfig()=
=E2=80=99:
> >
> /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux=
/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2622:10:
> > error: =E2=80=98cfgMainLoaded=E2=80=99 was not declared in this scope
> >      if (!cfgMainLoaded.test_and_set()) {
> >           ^
> > This was on a Centos 7 worker...
>
> The build should also fail on Ubuntu 16.04.
>
> Building with -std=3Dgnu++11 should fix it (untested).
>
> > Ross
>
> cu
> Adrian
>

--000000000000d31ae20598ba2e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s using -std=3Dc++11. I&#39;m not sure if swit=
ching to gnu flavour would have made a difference with gcc 4.8 provided in =
centos 7 and gcc 4.9 from Debian 8 - is it worth trying? Newer gcc versions=
 don&#39;t complain and build this without error while still using -std=3Dc=
++11.</div><div><br></div><div>I&#39;m leaning towards taking out the dnf/l=
ibdnf updates until these distros are retired from the supported distro lis=
t.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2 Dec 2019 at 16:10, Adri=
an Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Dec 02,=
 2019 at 02:55:06PM +0000, Ross Burton wrote:<br>
&gt; FAILED: libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o<br>
&gt; /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2618:8:<br>
&gt; error: =E2=80=98atomic_flag=E2=80=99 in namespace =E2=80=98std=E2=80=
=99 does not name a type<br>
&gt;=C2=A0 static std::atomic_flag cfgMainLoaded =3D ATOMIC_FLAG_INIT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:<br>
&gt; In function =E2=80=98libdnf::ConfigMain&amp; libdnf::getGlobalMainConf=
ig()=E2=80=99:<br>
&gt; /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2622:10:<br>
&gt; error: =E2=80=98cfgMainLoaded=E2=80=99 was not declared in this scope<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!cfgMainLoaded.test_and_set()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; This was on a Centos 7 worker...<br>
<br>
The build should also fail on Ubuntu 16.04.<br>
<br>
Building with -std=3Dgnu++11 should fix it (untested).<br>
<br>
&gt; Ross<br>
<br>
cu<br>
Adrian<br>
</blockquote></div>

--000000000000d31ae20598ba2e8a--
