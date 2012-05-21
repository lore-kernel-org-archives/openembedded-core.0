Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWTsT-0005SH-P5
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 16:46:29 +0200
Received: by eekd49 with SMTP id d49so1562662eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/0DI6VG5UcZG5N/lYXMt4WNEYtDFnXC/h/pS0fuLdAY=;
	b=R5wqGLJpnMs6O061Cqs3hLpMFAgWFBy995ylnaYy2lIGOL20q0miqoYc48k2sPoOWj
	kkASMJKc6yYPqEOMLKrU2cyTZQS1cvhmTpkcz5DeFdIiIJs7H6218ks1yVaHsgNtwpuo
	EqmWAo/PsJ+cQz0a1JZm2Y/YZc7h4DKYGOaUi4FvkorC3Zj1TDs3qy80oo6/g+te2tbJ
	bh9pXKJyddMTglPn2EjuoS+beInn9V3DilsbtFz00ib8hs4NpfdU5v7CAMlbZOHTfVjE
	rB4GizmGnck987IgXYMfXJkUR7vYz3XTLVCZBX8NhbPdIehmEmd6uIHBzAU4ZncPiZxX
	qfkQ==
MIME-Version: 1.0
Received: by 10.213.110.20 with SMTP id l20mr2976617ebp.117.1337610982137;
	Mon, 21 May 2012 07:36:22 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Mon, 21 May 2012 07:36:22 -0700 (PDT)
In-Reply-To: <1337588501.11345.605.camel@ted>
References: <cover.1337570904.git.raj.khem@gmail.com>
	<1337588501.11345.605.camel@ted>
Date: Mon, 21 May 2012 07:36:22 -0700
Message-ID: <CAMKF1srbfPT2wmLRbCaxfHRyquALprO1cLV+FncHQDWh6Owr=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 00/14] mips64 support and sh4 support
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
X-List-Received-Date: Mon, 21 May 2012 14:46:29 -0000
Content-Type: multipart/alternative; boundary=0015174412fa701eec04c08cd3fd

--0015174412fa701eec04c08cd3fd
Content-Type: text/plain; charset=UTF-8

On Monday, May 21, 2012, Richard Purdie wrote:

> On Sun, 2012-05-20 at 20:35 -0700, Khem Raj wrote:
> > This patchset adds required bits into metadata for having
> > mips64/n64 support. I have tested the core-image-sato and
> core-image-minimal
> > builds and boots on qemumips64 and runs gcc regression testsuite.
> > It needs linux-yocto-dev kernel for now which can be obtained from
> > poky-extra repo. Additionally systemd-image on angstrom-next builds and
> boots
> > fine on qemumips64 as well.
> >
> > Additionally it also adds bits to have SH4 root file systems to be
> > able to built and again core-image-sato builds for sh4 however qemu
> > machine support is not yet done but root file sytem boots fine on
> > real hardware.
> >
> > The images are tested on both eglibc and uclibc.
> >
> > Any help in providing feedback or testing these patches is welcome.
> >
> > I have tested them enough for over a month now.
> >
> > The following changes since commit
> 326563d5a897ae2dba7cfd8d73579d3d979d72c8:
> >
> >   sstate.bbclass: Make sure we don't have an empty fixmepath file
> (2012-05-18 15:24:45 +0100)
> >
> > are available in the git repository at:
> >   git://git.openembedded.org/openembedded-core-contrib kraj/mips64
> >
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/mips64
> >
> > Khem Raj (14):
> >   insane.bbclass: Add mips64{el} to known machines
> >   site: Add mips64 eglibc and uclibc site files
> >   gcc-4.6, gcc-4.7: Add support for building mips64 cross compiler
> >   binutils: Default to n64 when configured for mips64
> >   kernel-arch.bbclass: Map mips64{el} to mips KARCH
> >   eglibc-2.15: Support mips64
> >   libc-package: Add sh4 and mips64 to arch options
> >   runqemu: Add qemush4 and qemumips64 knowledge
> >   netbase: Add interface files for qemumips64 and qemush4
> >   site/sh-common: Add missing caches variables to build glib-2.32
> >   xserver-xorg: Fix build for mips64
> >   tune-mips64.inc: Add new tune file for mips64 big-endian
> >   qemumips64.conf: Add machine configuration for mips64(eb)
> >   qemush4.conf: Add machine configuration for qemush4
>
>
> We need to figure out what it means to add new qemu machines like this
> to OE-Core. I'm not against it however I can't offer the Yocto Project's
> resources to test them at this point as we're haven't budgeted for it.


Yes absolutely, in another version Actually I have these machines in a
separate later
Called meta-qemuextra may be such a layer would make sense ?


>
> The above patches make sense regardless so I've merged them except the
> final two machine files. I'd like to hold off adding those until the
> system builds and runs with our default kernel and qemu recipes.
> Hopefully this lets you develop without having a huge queue of patches.
>
> In the meantime we need to figure out the resource concern for testing.
> Is there a commercial interest in these new machines from anyone who
> could perhaps help with the resource issue?
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--0015174412fa701eec04c08cd3fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, May 21, 2012, Richard Purdie  wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Sun, 2012-05-20 at 20:35 -0700, Khem Raj wrote:<br>
&gt; This patchset adds required bits into metadata for having<br>
&gt; mips64/n64 support. I have tested the core-image-sato and core-image-m=
inimal<br>
&gt; builds and boots on qemumips64 and runs gcc regression testsuite.<br>
&gt; It needs linux-yocto-dev kernel for now which can be obtained from<br>
&gt; poky-extra repo. Additionally systemd-image on angstrom-next builds an=
d boots<br>
&gt; fine on qemumips64 as well.<br>
&gt;<br>
&gt; Additionally it also adds bits to have SH4 root file systems to be<br>
&gt; able to built and again core-image-sato builds for sh4 however qemu<br=
>
&gt; machine support is not yet done but root file sytem boots fine on<br>
&gt; real hardware.<br>
&gt;<br>
&gt; The images are tested on both eglibc and uclibc.<br>
&gt;<br>
&gt; Any help in providing feedback or testing these patches is welcome.<br=
>
&gt;<br>
&gt; I have tested them enough for over a month now.<br>
&gt;<br>
&gt; The following changes since commit 326563d5a897ae2dba7cfd8d73579d3d979=
d72c8:<br>
&gt;<br>
&gt; =C2=A0 sstate.bbclass: Make sure we don&#39;t have an empty fixmepath =
file (2012-05-18 15:24:45 +0100)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt; =C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-=
contrib" target=3D"_blank">git.openembedded.org/openembedded-core-contrib</=
a> kraj/mips64<br>
&gt; =C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-c=
ore-contrib/log/?h=3Dkraj/mips64" target=3D"_blank">http://cgit.openembedde=
d.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkraj/mips64</a><br>
&gt;<br>
&gt; Khem Raj (14):<br>
&gt; =C2=A0 insane.bbclass: Add mips64{el} to known machines<br>
&gt; =C2=A0 site: Add mips64 eglibc and uclibc site files<br>
&gt; =C2=A0 gcc-4.6, gcc-4.7: Add support for building mips64 cross compile=
r<br>
&gt; =C2=A0 binutils: Default to n64 when configured for mips64<br>
&gt; =C2=A0 kernel-arch.bbclass: Map mips64{el} to mips KARCH<br>
&gt; =C2=A0 eglibc-2.15: Support mips64<br>
&gt; =C2=A0 libc-package: Add sh4 and mips64 to arch options<br>
&gt; =C2=A0 runqemu: Add qemush4 and qemumips64 knowledge<br>
&gt; =C2=A0 netbase: Add interface files for qemumips64 and qemush4<br>
&gt; =C2=A0 site/sh-common: Add missing caches variables to build glib-2.32=
<br>
&gt; =C2=A0 xserver-xorg: Fix build for mips64<br>
&gt; =C2=A0 tune-mips64.inc: Add new tune file for mips64 big-endian<br>
&gt; =C2=A0 qemumips64.conf: Add machine configuration for mips64(eb)<br>
&gt; =C2=A0 qemush4.conf: Add machine configuration for qemush4<br>
<br>
<br>
We need to figure out what it means to add new qemu machines like this<br>
to OE-Core. I&#39;m not against it however I can&#39;t offer the Yocto Proj=
ect&#39;s<br>
resources to test them at this point as we&#39;re haven&#39;t budgeted for =
it.</blockquote><div><br></div><div>Yes absolutely, in another version Actu=
ally I have these machines in a separate later</div><div>Called meta-qemuex=
tra may be such a layer would make sense ?<span></span></div>
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The above patches make sense regardless so I&#39;ve merged them except the<=
br>
final two machine files. I&#39;d like to hold off adding those until the<br=
>
system builds and runs with our default kernel and qemu recipes.<br>
Hopefully this lets you develop without having a huge queue of patches.<br>
<br>
In the meantime we need to figure out the resource concern for testing.<br>
Is there a commercial interest in these new machines from anyone who<br>
could perhaps help with the resource issue?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote>

--0015174412fa701eec04c08cd3fd--
