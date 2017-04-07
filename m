Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8565B77D83
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 13:06:52 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id d191so34172487ywe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HHvTfyajWshlrXFNBYX8lDnjnBMIcSkwMbGM/o76OYw=;
	b=sSwg10liGwwtyl5PDqRUIJVaaGy99zhkpW020IVGH0de2VOwjg/gp1tNj+Mp3xcV3P
	y8KKNvyAN4FjxQyfjIl7qvSF/c1b5S5MGwPdlsWQUSXqpD/hYF+COEYjRdIOiPSvWyni
	Mu4Zsgc/8JiysUSfrDq7gk76mZr9wpbPU9KGQjMQMLdQPWiXQphcfNg7H+tUfOPRSVN2
	gNJUjNN5ojPlZGhtPrG1KXlfCisMl3pNZWVPV22VJsgYJUn7+B0ApvPbXvI42beVKCjO
	q8TNg8r9ykNdP6rwId8dRSwZbPdRic2YC7DiHo4qzsoif8cbfmC1l4LKAU3Y88/0oBQD
	ERSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HHvTfyajWshlrXFNBYX8lDnjnBMIcSkwMbGM/o76OYw=;
	b=HJtZFFrCJAO8TPNgFsI5R3RPENUYLxOTVvRvQ6D+PHSKEen+IUj7y9Nwo5zcAogpKC
	dbaXULFftW0NF6DtgjTUElCj5rYFC02uhuHzck9HD8QuVE9FNh7zd5h+vbSIg4YE7HVv
	B5SyV83CiCk6sCFvvdsCNq78O8dZno7zCT55UzMh+RZ1+fYeXmvf+RaHgOFKobrv7mX0
	IiqTbpu54ust1ELqrY4bfyfjqm6rkYfp9pLj1yC7dGt5GabxVCXG/PtiYWhQcNdMoO0y
	tVHyMt5Q9QwzZUT4rZ+EnVRAgyX/MAdFcb+2y8orYfMzoX8lkAHW6Tji23pUldrN3OdS
	73Ew==
X-Gm-Message-State: AFeK/H2+iL0uzKxley9BsXukJr63QrYLpgPk+HbSblS1H2zPsyHA5rksTRQbp6ODFPIfljmMXL0PhCxv0VF43h1g
X-Received: by 10.129.182.101 with SMTP id h37mr25631550ywk.177.1491570413868; 
	Fri, 07 Apr 2017 06:06:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Fri, 7 Apr 2017 06:06:23 -0700 (PDT)
In-Reply-To: <1491567211.17200.93.camel@linuxfoundation.org>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
	<d071facbbdbb48f34e0f0d9500872349c1130a9a.1491483222.git.jussi.kukkonen@intel.com>
	<1491553733.17200.89.camel@linuxfoundation.org>
	<CAHiDW_FHTmqsBjCpUR7m0JMh6+iyPO=Gbh8eLcoy5YLgCO+dvQ@mail.gmail.com>
	<1491567211.17200.93.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 7 Apr 2017 16:06:23 +0300
Message-ID: <CAHiDW_ErPqGxdAu3bwc-ymXnYYcihHYA2qv0SKzoT=CKrZOx1g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] native.bbclass: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Fri, 07 Apr 2017 13:06:54 -0000
Content-Type: multipart/alternative; boundary=f403045d20caad2eb2054c934c5b

--f403045d20caad2eb2054c934c5b
Content-Type: text/plain; charset=UTF-8

On 7 April 2017 at 15:13, Richard Purdie <richard.purdie@linuxfoundation.org>
wrote:
> > > Also, one question. Does this have any effect on qemu-native? Does
> > > qemu-native need/use x11 today?
> > qemu itself does not use anything x11 since last year and the default
> > native packageconfig is already not
> > dependent on distro features.
> >
> > Now that you mentioned I had a closer look at qemu & SDL:
> >  * qemu-native doesn't build with "sdl" by default, but someone might
> > change that of course
> >  * If that happens (and libsdl-native is not in ASSUME_PROVIDED),
> > libsdl is built and by default depends on libx11
> > I completely expected this to fail now (without x11 in distro
> > features) but it actually builds just fine. It turns out that a
> > clever Burton has tweaked
> > REQUIRED_DISTRO_FEATURES_class-native for some X libraries for
> > exactly this purpose already.
>
> Right, we actually have a commented section for sdl and qemu in our
> local.conf.sample so we do need to test and figure this piece out.
>
> Would we want to put x11 in the default native distro flags to avoid
> some of the other issues above?


I don't see issues that need fixing right now: libx11-native and some other
native X libraries build just fine without "x11" feature because of the
tweaks I mentioned. So building libsdl-native with "x11" packageconfig
works.

Did I miss something else?

Jussi

--f403045d20caad2eb2054c934c5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 April 2017 at 15:13, Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; wrote:<br>&gt; &gt; &gt; Also, one question. Does this have any ef=
fect on qemu-native? Does<br>&gt; &gt; &gt; qemu-native need/use x11 today?=
<br>&gt; &gt; qemu itself does not use anything x11 since last year and the=
 default<br>&gt; &gt; native packageconfig is already not<br>&gt; &gt; depe=
ndent on distro features.<br>&gt; &gt;<br>&gt; &gt; Now that you mentioned =
I had a closer look at qemu &amp; SDL:<br>&gt; &gt; =C2=A0* qemu-native doe=
sn&#39;t build with &quot;sdl&quot; by default, but someone might<br>&gt; &=
gt; change that of course <br>&gt; &gt; =C2=A0* If that happens (and libsdl=
-native is not in ASSUME_PROVIDED),<br>&gt; &gt; libsdl is built and by def=
ault depends on libx11<br>&gt; &gt; I completely expected this to fail now =
(without x11 in distro<br>&gt; &gt; features) but it actually builds just f=
ine. It turns out that a<br>&gt; &gt; clever Burton has tweaked <br>&gt; &g=
t; REQUIRED_DISTRO_FEATURES_class-native for some X libraries for<br>&gt; &=
gt; exactly this purpose already.<br>&gt;<br>&gt; Right, we actually have a=
 commented section for sdl and qemu in our<br>&gt; local.conf.sample so we =
do need to test and figure this piece out.<br>&gt;<br>&gt; Would we want to=
 put x11 in the default native distro flags to avoid<br>&gt; some of the ot=
her issues above?<br><br><br><div>I don&#39;t see issues that need fixing r=
ight now: libx11-native and some other native X libraries build just fine w=
ithout &quot;x11&quot; feature because of the tweaks I mentioned. So buildi=
ng libsdl-native with &quot;x11&quot; packageconfig works.<br><br>Did I mis=
s something else?<br><br>Jussi</div></div>

--f403045d20caad2eb2054c934c5b--
