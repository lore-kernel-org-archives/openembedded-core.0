Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 25A0F736B6;
	Wed, 26 Aug 2015 01:11:17 +0000 (UTC)
Received: by ykdt205 with SMTP id t205so172670241ykd.1;
	Tue, 25 Aug 2015 18:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=Z4pU/LCsJA2/Xug3JZOXhIZ1DMEI4WzpkLULHv0HcZg=;
	b=w04nc/NQqzJjJf0HgmMGEeIzGhA/Y1zufpO4ptONTa+J3sHiE+9jaZZlhHlit0+R9t
	iyRsNE5XPBouWT2LCg3ahINURMitI6/t7XpMR+izJUp3soh9XcR2BSCLGpemTOxDNEhO
	KUC8Ec9nY2e/q+2F3nnSDbBWLXeDSUrOeSZ1sPHRS1ijsgQHJLMTR2JvCXENPfWavKxq
	RpnZqICTYKDV8KRGIwCE/+Moj/8Fn76JsDI37abwYh8yyt935/kMkE+rF6baFO9//jlJ
	fbgqGZR0eDdDPQ2G/X+ZwJQXpnhd5+Lcb7t/ed0WtNDGTUlCk3Zx/Fqje3WiSosdni8B
	iWPg==
X-Received: by 10.129.111.11 with SMTP id k11mr41165195ywc.114.1440551477711; 
	Tue, 25 Aug 2015 18:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
	<5607133.YNgYITpZsc@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5607133.YNgYITpZsc@peggleto-mobl.ger.corp.intel.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 26 Aug 2015 01:11:08 +0000
Message-ID: <CAFeBWL4as4_aeTWOZox+V=NB_s7LriLof-sYNc04PB6vjDRBnw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Extensible SDK install errors
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
X-List-Received-Date: Wed, 26 Aug 2015 01:11:18 -0000
Content-Type: multipart/alternative; boundary=001a114903781c1a8b051e2c872b

--001a114903781c1a8b051e2c872b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for your comments. I was not running the installer as root.
I tried again and specified the install path in my home directory.
This time it seems to have gone further, but still failed with this:

"error: Can't install packagegroup-core-boot-1.0-r17.0@qemuarm: no package
provides systemd"

Perhaps I need to disable systemd from distro features?

I will also check my user's permission to solve the permission error.

On Mon, Aug 24, 2015 at 4:11 AM Paul Eggleton <paul.eggleton@linux.intel.co=
m>
wrote:

> Hi Adam,
>
> On Friday 21 August 2015 15:06:25 Adam Lee wrote:
> > Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal -=
c
> > populate_sdk_ext).
> >
> > During the installation I get this permission error:
> >
> > $ ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh
> >
> > > Enter target directory for SDK (default: /opt/poky/1.8):
> > > You are about to install the SDK to "/opt/poky/1.8". Proceed[Y/n]?
> > > Extracting SDK...done
> > > Setting it up...
> > > Extracting buildtools...
> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
> line
> > > 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
> Permission
> > > denied
> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
> line
> > > 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
> Permission
> > > denied
> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
> line
> > > 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
> Permission
> > > denied
> > > mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 to
> > > =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=E2=
=80=99: Permission
> > > denied Preparing build system...
> > > sh: 1: cannot create preparing_build_system.log: Permission denied
> > > SDK preparation failed: see /opt/poky/1.8/preparing_build_system.log
> >
> >  It looks like `/opt/poky/1.8/layers/poky` directory belongs to the roo=
t
> > user:
> >
> > $ ls -l /opt/poky/1.8/layers/
> >
> > > total 36
> > > drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome
> > > drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia
> > > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking
> > > drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe
> > > drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python
> > > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby
> > > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd
> > > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce
> > > drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky
> >
> >  I may have missed something obvious. Has anyone seen this?
>
> Basically you shouldn't be installing the extensible SDK as root. We ough=
t
> to
> be telling you about this up front and we should have a more reasonable
> default path - these are open bugs and patches are in review on the list
> to fix
> them.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--001a114903781c1a8b051e2c872b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your comments. I was not running the installer =
as root.<div>I tried again and specified the install path in my home direct=
ory.</div><div>This time it seems to have gone further, but still failed wi=
th this:</div><div><br></div><div>&quot;error: Can&#39;t install packagegro=
up-core-boot-1.0-r17.0@qemuarm: no package provides systemd&quot;</div><div=
><br></div><div>Perhaps I need to disable systemd from distro features?</di=
v><div><br></div><div>I will also check my user&#39;s permission to solve t=
he permission error.</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Mon, Aug 24, 2015 at 4:11 AM Paul Eggleton &lt;<a href=3D"mailto:pa=
ul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hi Adam,<br>
<br>
On Friday 21 August 2015 15:06:25 Adam Lee wrote:<br>
&gt; Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal =
-c<br>
&gt; populate_sdk_ext).<br>
&gt;<br>
&gt; During the installation I get this permission error:<br>
&gt;<br>
&gt; $ ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-tool=
chain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64-co=
re-image-minimal-armv5e-toolchain-ext-1.8.sh</a><br>
&gt;<br>
&gt; &gt; Enter target directory for SDK (default: /opt/poky/1.8):<br>
&gt; &gt; You are about to install the SDK to &quot;/opt/poky/1.8&quot;. Pr=
oceed[Y/n]?<br>
&gt; &gt; Extracting SDK...done<br>
&gt; &gt; Setting it up...<br>
&gt; &gt; Extracting buildtools...<br>
&gt; &gt; ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-t=
oolchain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64=
-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line<br>
&gt; &gt; 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: P=
ermission<br>
&gt; &gt; denied<br>
&gt; &gt; ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-t=
oolchain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64=
-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line<br>
&gt; &gt; 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: P=
ermission<br>
&gt; &gt; denied<br>
&gt; &gt; ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-t=
oolchain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64=
-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line<br>
&gt; &gt; 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: P=
ermission<br>
&gt; &gt; denied<br>
&gt; &gt; mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 t=
o<br>
&gt; &gt; =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=
=E2=80=99: Permission<br>
&gt; &gt; denied Preparing build system...<br>
&gt; &gt; sh: 1: cannot create preparing_build_system.log: Permission denie=
d<br>
&gt; &gt; SDK preparation failed: see /opt/poky/1.8/preparing_build_system.=
log<br>
&gt;<br>
&gt;=C2=A0 It looks like `/opt/poky/1.8/layers/poky` directory belongs to t=
he root<br>
&gt; user:<br>
&gt;<br>
&gt; $ ls -l /opt/poky/1.8/layers/<br>
&gt;<br>
&gt; &gt; total 36<br>
&gt; &gt; drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome<br>
&gt; &gt; drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia<br>
&gt; &gt; drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking<br>
&gt; &gt; drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe<br>
&gt; &gt; drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python<br>
&gt; &gt; drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby<br>
&gt; &gt; drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd<br>
&gt; &gt; drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce<br>
&gt; &gt; drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky<br>
&gt;<br>
&gt;=C2=A0 I may have missed something obvious. Has anyone seen this?<br>
<br>
Basically you shouldn&#39;t be installing the extensible SDK as root. We ou=
ght to<br>
be telling you about this up front and we should have a more reasonable<br>
default path - these are open bugs and patches are in review on the list to=
 fix<br>
them.<br>
<br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</blockquote></div>

--001a114903781c1a8b051e2c872b--
