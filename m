Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5B97D58A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 02:46:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c6so33224569ioo.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 19:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=t/odgW5uO5VVsyrbdAKasmQtVvWSSbF2TZUf24Ooag8=;
	b=QkPmQ2yXYdamA7FXEPv7enbPJ4nXLOUIkwd5nDzYfNuEi1Y9JbdptOY2ZaX8jycpzA
	EynBMcRGH09bptitAHy2RaUegvTOxBewF4xo21XtRS6Ii4mSrTIZyy8MbvzIq2bLE+t6
	qYSHQudAgKBsIDJnAAf5VKXcjVHBOCEuvMRqmFMZxLd1XzGZg7ywQY7z0aQKFsSmqgql
	NYnATFVU9fycmP54wkWLpyQ+G6qTq5GwQIkxTnTBIALk/0TgOC8iYF0IkKGRq5StwJpz
	Rg1mbWzj4NWyjtKV9PZ852N5QbLuqQsBQ/aolHy/SqEg422115ZDZNYbdDCzWj9tTLNN
	DmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=t/odgW5uO5VVsyrbdAKasmQtVvWSSbF2TZUf24Ooag8=;
	b=Y0IVA5c3gtWR8+cbWbspj0F8l0vKEp2tnMlltxnsVFKjR/BRvliG5OLTT0K4JQ2OjN
	nwINJBj3tBHcBcTxH2FQuG0pHCDSzEkp+TG5Ur083xBlNRROZfaNj1+6n0nx4UCQXdR6
	mdaoODKaxX4if4sr7jpllEMoNH9a+Bq01SzxapEaMMwK6rvrkMH0CRThQQxD4Wpmdplk
	yL2agfJCCoqadRTbC0c1QVZcuG7lVbTauOyrL3MsYre2+0Xr3vCAJ/8oO0mHSaZ2hO0I
	bUW+a55OuoT9zJhRXRkezFRuagTmW/MTnjmUQD99NgkG54qNnIAJpcmODTUCtml99LZQ
	BxbQ==
X-Gm-Message-State: APjAAAUzYAEyVWeMRcjwUP03+5ypxassHbtm08o9fHodOIrFCXx3dmTx
	c83Wr5u6aOr8Cvi3bNrJg2sds+l3K8SMYJnT+3BvO6CghjMXuQ==
X-Google-Smtp-Source: APXvYqyalnrh89gnuoUAlvMC4LkReC9TwsEw/RcGR6NrgK399S/Qskma/blq/RegoLKgDBN/rjB8jyD4dZnBKWgHeQo=
X-Received: by 2002:a02:a617:: with SMTP id c23mr28881093jam.14.1570502768086; 
	Mon, 07 Oct 2019 19:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191002205227.16149-1-maxime.roussinbelanger@gmail.com>
	<3547886f-9101-7c00-938c-f2da9a639f06@windriver.com>
In-Reply-To: <3547886f-9101-7c00-938c-f2da9a639f06@windriver.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Mon, 7 Oct 2019 22:45:41 -0400
Message-ID: <CAE=T-s6Lse5Rj3WZLaZE+qYam95AFg=GnYc5ZbBNT99WLmADTQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: add missing some description in devtools
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
X-List-Received-Date: Tue, 08 Oct 2019 02:46:07 -0000
Content-Type: multipart/alternative; boundary="0000000000009c57da05945d2b45"

--0000000000009c57da05945d2b45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review!

On Mon, Oct 7, 2019 at 2:12 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 10/2/19 4:52 PM, Maxime Roussin-B=C3=A9langer wrote:
> > Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gma=
il.com
> >
> > ---
> >   meta/recipes-devtools/apt/apt.inc              | 3 +++
> >   meta/recipes-devtools/cmake/cmake.inc          | 6 ++++++
> >   meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 2 ++
> >   meta/recipes-devtools/dnf/dnf_4.2.2.bb         | 5 ++++-
> >   meta/recipes-devtools/meson/meson.inc          | 3 +++
> >   meta/recipes-devtools/qemu/qemu.inc            | 4 ++++
> >   meta/recipes-devtools/quilt/quilt.inc          | 4 ++++
> >   meta/recipes-devtools/swig/swig.inc            | 3 +++
> >   meta/recipes-devtools/unfs3/unfs3_git.bb       | 3 +++
> >   9 files changed, 32 insertions(+), 1 deletion(-)
>
> Thanks for the updates Maxime. I have a few minor fixes/questions.
> >
> > diff --git a/meta/recipes-devtools/apt/apt.inc
> b/meta/recipes-devtools/apt/apt.inc
> > index b855099e52..6883ac865a 100644
> > --- a/meta/recipes-devtools/apt/apt.inc
> > +++ b/meta/recipes-devtools/apt/apt.inc
> > @@ -1,4 +1,7 @@
> >   SUMMARY =3D "Advanced front-end for dpkg"
> > +DESCRIPTION =3D "Provides commandline tools for searching and managing=
 as
> well \
> s/commandline/command-line/
> according to:
>     https://en.wikipedia.org/wiki/Command-line_interface
>     https://wiki.debian.org/Apt
>
> > +as querying information about packages as a low-level access to all
> features \
> > +of the libapt-pkg library."
> >   LICENSE =3D "GPLv2.0+"
> >   SECTION =3D "base"
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake.inc
> b/meta/recipes-devtools/cmake/cmake.inc
> > index 3711f18db6..35d78eea17 100644
> > --- a/meta/recipes-devtools/cmake/cmake.inc
> > +++ b/meta/recipes-devtools/cmake/cmake.inc
> > @@ -2,6 +2,12 @@
> >   # Released under the MIT license (see packages/COPYING)
> >
> >   SUMMARY =3D "Cross-platform, open-source make system"
> > +DESCRIPTION =3D "CMake is used to control the software compilation
> process \
> > +using simple platform and compiler independent configuration files.
> CMake \
> > +generates native makefiles and workspaces that can be used in the
> compiler \
> > +environment of your choice.
> Should we cut off the text here?
>

Probably... after rereading I feel this is extra text and it doesn't add
much.


> > CMake is quite sophisticated: it is possible to \
> > +support complex environments requiring system configuration,
> pre-processor \
> > +generation, code generation, and template instantiation."
> >   HOMEPAGE =3D "http://www.cmake.org/"
> >   BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
> >   SECTION =3D "console/utils"
> > diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
> b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
> > index 7dc4e417f6..10220ebc91 100644
> > --- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
> > +++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
> > @@ -1,4 +1,6 @@
> >   SUMMARY =3D "GNU unit testing framework, written in Expect and Tcl"
> > +DESCRIPTION =3D "DejaGnu is a framework for testing other programs. It=
s
> purpose \
> > +is to provide a single front end for all tests."
> >   LICENSE =3D "GPLv2"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >   SECTION =3D "devel"
> > diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> > index c77773332c..f38167f1ad 100644
> > --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> > +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> > @@ -1,4 +1,7 @@
> >   SUMMARY =3D "Package manager forked from Yum, using libsolv as a
> dependency resolver"
> > +DESCRIPTION =3D "Software package manager that installs, updates, and
> removes \
> > +packages on RPM-based Linux distributions. It automatically computes \
> > +dependencies and determines the actions required to install packages."
> >   LICENSE =3D "GPLv2"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >
>  file://PACKAGE-LICENSING;md5=3D4a0548e303dbc77f067335b4d688e745 \
> > @@ -71,7 +74,7 @@ do_install_append_class-native() {
> >   do_install_append_class-nativesdk() {
> >           create_wrapper ${D}/${bindir}/dnf \
> >                   RPM_CONFIGDIR=3D${SDKPATHNATIVE}${libdir_nativesdk}/r=
pm \
> > -                RPM_NO_CHROOT_FOR_SCRIPTS=3D1
> > +                RPM_NO_CHROOT_FOR_SCRIPTS=3D1
> Whitespace only? Ah, you removed a trailing space.
> Please add:
>    Remove trailing space in dnf recipe.
> in the log to prevent OCDers from wondering if there was a typo.
>

I was not intending to submit this change.

Your comment means to submit a 2 part patch with this change right?


> >   }
> >
> >   SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service dnf-makecache.timer =
\
> > diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> > index 6de109de7f..2958a2a8de 100644
> > --- a/meta/recipes-devtools/meson/meson.inc
> > +++ b/meta/recipes-devtools/meson/meson.inc
> > @@ -1,5 +1,8 @@
> >   HOMEPAGE =3D "http://mesonbuild.com"
> >   SUMMARY =3D "A high performance build system"
> > +DESCRIPTION =3D "Meson is a build system designed to increase programm=
er \
> > +productivity. It does this by providing a fast, simple and easy to use=
 \
> > +interface for modern software development tools and practices."
> >
> >   LICENSE =3D "Apache-2.0"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> > index de21d30732..11783eaca5 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -1,4 +1,8 @@
> >   SUMMARY =3D "Fast open source processor emulator"
> > +DESCRIPTION =3D "QEMU is a hosted virtual machine monitor: it emulates
> the \
> > +machine's processor through dynamic binary translation and provides a
> set \
> > +of different hardware and device models for the machine, enabling it t=
o
> run \
> > +a variety of guest operating systems"
> >   HOMEPAGE =3D "http://qemu.org"
> >   LICENSE =3D "GPLv2 & LGPLv2.1"
> >
> > diff --git a/meta/recipes-devtools/quilt/quilt.inc
> b/meta/recipes-devtools/quilt/quilt.inc
> > index 433e9b40b7..61e1c93605 100644
> > --- a/meta/recipes-devtools/quilt/quilt.inc
> > +++ b/meta/recipes-devtools/quilt/quilt.inc
> > @@ -1,4 +1,8 @@
> >   SUMMARY =3D "Tool for working with series of patches"
> > +DESCRIPTION =3D "Quilt is a tool to manage large sets of patches by
> keeping \
> > +track of the changes each patch makes. Patches can be applied,
> un-applied,\
> > +refreshed, etc.
> End here as is done:
>     http://savannah.nongnu.org/projects/quilt/
> > The key philosophical concept is that your primary output \
> > +is patches."


> Thanks again for the updates.
> ../Randy
>
> >   HOMEPAGE =3D "http://savannah.nongnu.org/projects/quilt/"
> >   SECTION =3D "devel"
> >   LICENSE =3D "GPLv2"
> > diff --git a/meta/recipes-devtools/swig/swig.inc
> b/meta/recipes-devtools/swig/swig.inc
> > index 00b9c5b605..e62718c508 100644
> > --- a/meta/recipes-devtools/swig/swig.inc
> > +++ b/meta/recipes-devtools/swig/swig.inc
> > @@ -1,4 +1,7 @@
> >   SUMMARY =3D "SWIG - Simplified Wrapper and Interface Generator"
> > +DESCRIPTION =3D "SWIG is a compiler that makes it easy to integrate C =
and
> C++ \
> > +code with other languages including Perl, Tcl, Ruby, Python, Java,
> Guile, \
> > +Mzscheme, Chicken, OCaml, Pike, and C#."
> >   HOMEPAGE =3D "http://swig.sourceforge.net/"
> >   LICENSE =3D "BSD & GPLv3"
> >   LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De7807a6282784a7dde4c846626b08fc6 \
> > diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb
> b/meta/recipes-devtools/unfs3/unfs3_git.bb
> > index a4ac46c68e..79d09788d3 100644
> > --- a/meta/recipes-devtools/unfs3/unfs3_git.bb
> > +++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
> > @@ -1,4 +1,7 @@
> >   SUMMARY =3D "Userspace NFS server v3 protocol"
> > +DESCRIPTION =3D "UNFS3 is a user-space implementation of the NFSv3 ser=
ver
> \
> > +specification. It provides a daemon for the MOUNT and NFS protocols,
> which \
> > +are used by NFS clients for accessing files on the server."
> >   SECTION =3D "console/network"
> >   LICENSE =3D "unfs3"
> >   LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D9475885294e17c0cc0067820d042792e"
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--0000000000009c57da05945d2b45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the review!</div><div><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 7, 2019 =
at 2:12 PM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com"=
>randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On 10/2/19 4:52 PM, Maxime Roussin-B=C3=A9lange=
r wrote:<br>
&gt; Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxi=
me.roussinbelanger@gmail.com" target=3D"_blank">maxime.roussinbelanger@gmai=
l.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/apt/apt.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/cmake/cmake.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 6 ++++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/dejagnu/<a href=3D"http://dejagnu_1.=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">dejagnu_1.6.2.bb</a> | 2 ++<br=
>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" =
rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 5 ++++-<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/quilt/quilt.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 4 ++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/swig/swig.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/unfs3/<a href=3D"http://unfs3_git.bb=
" rel=3D"noreferrer" target=3D"_blank">unfs3_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 3 +++<br>
&gt;=C2=A0 =C2=A09 files changed, 32 insertions(+), 1 deletion(-)<br>
<br>
Thanks for the updates Maxime. I have a few minor fixes/questions.<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools=
/apt/apt.inc<br>
&gt; index b855099e52..6883ac865a 100644<br>
&gt; --- a/meta/recipes-devtools/apt/apt.inc<br>
&gt; +++ b/meta/recipes-devtools/apt/apt.inc<br>
&gt; @@ -1,4 +1,7 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Advanced front-end for dpkg&quot;<br>
&gt; +DESCRIPTION =3D &quot;Provides commandline tools for searching and ma=
naging as well \<br>
s/commandline/command-line/<br>
according to:<br>
=C2=A0 =C2=A0 <a href=3D"https://en.wikipedia.org/wiki/Command-line_interfa=
ce" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/wiki/Comm=
and-line_interface</a><br>
=C2=A0 =C2=A0 <a href=3D"https://wiki.debian.org/Apt" rel=3D"noreferrer" ta=
rget=3D"_blank">https://wiki.debian.org/Apt</a><br>
<br>
&gt; +as querying information about packages as a low-level access to all f=
eatures \<br>
&gt; +of the libapt-pkg library.&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2.0+&quot;<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;base&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devt=
ools/cmake/cmake.inc<br>
&gt; index 3711f18db6..35d78eea17 100644<br>
&gt; --- a/meta/recipes-devtools/cmake/cmake.inc<br>
&gt; +++ b/meta/recipes-devtools/cmake/cmake.inc<br>
&gt; @@ -2,6 +2,12 @@<br>
&gt;=C2=A0 =C2=A0# Released under the MIT license (see packages/COPYING)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Cross-platform, open-source make system&=
quot;<br>
&gt; +DESCRIPTION =3D &quot;CMake is used to control the software compilati=
on process \<br>
&gt; +using simple platform and compiler independent configuration files. C=
Make \<br>
&gt; +generates native makefiles and workspaces that can be used in the com=
piler \<br>
&gt; +environment of your choice. <br>
Should we cut off the text here?<br></blockquote><div><br></div><div>Probab=
ly... after rereading I feel this is extra text and it doesn&#39;t add much=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; CMake is quite sophisticated: it is possible to \<br>
&gt; +support complex environments requiring system configuration, pre-proc=
essor \<br>
&gt; +generation, code generation, and template instantiation.&quot;<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.cmake.org/" rel=
=3D"noreferrer" target=3D"_blank">http://www.cmake.org/</a>&quot;<br>
&gt;=C2=A0 =C2=A0BUGTRACKER =3D &quot;<a href=3D"http://public.kitware.com/=
Bug/my_view_page.php" rel=3D"noreferrer" target=3D"_blank">http://public.ki=
tware.com/Bug/my_view_page.php</a>&quot;<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;console/utils&quot;<br>
&gt; diff --git a/meta/recipes-devtools/dejagnu/<a href=3D"http://dejagnu_1=
.6.2.bb" rel=3D"noreferrer" target=3D"_blank">dejagnu_1.6.2.bb</a> b/meta/r=
ecipes-devtools/dejagnu/<a href=3D"http://dejagnu_1.6.2.bb" rel=3D"noreferr=
er" target=3D"_blank">dejagnu_1.6.2.bb</a><br>
&gt; index 7dc4e417f6..10220ebc91 100644<br>
&gt; --- a/meta/recipes-devtools/dejagnu/<a href=3D"http://dejagnu_1.6.2.bb=
" rel=3D"noreferrer" target=3D"_blank">dejagnu_1.6.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/dejagnu/<a href=3D"http://dejagnu_1.6.2.bb=
" rel=3D"noreferrer" target=3D"_blank">dejagnu_1.6.2.bb</a><br>
&gt; @@ -1,4 +1,6 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;GNU unit testing framework, written in E=
xpect and Tcl&quot;<br>
&gt; +DESCRIPTION =3D &quot;DejaGnu is a framework for testing other progra=
ms. Its purpose \<br>
&gt; +is to provide a single front end for all tests.&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb6=
73463ab874e80d47fae504&quot;<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;devel&quot;<br>
&gt; diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-devto=
ols/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank=
">dnf_4.2.2.bb</a><br>
&gt; index c77773332c..f38167f1ad 100644<br>
&gt; --- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt; @@ -1,4 +1,7 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Package manager forked from Yum, using l=
ibsolv as a dependency resolver&quot;<br>
&gt; +DESCRIPTION =3D &quot;Software package manager that installs, updates=
, and removes \<br>
&gt; +packages on RPM-based Linux distributions. It automatically computes =
\<br>
&gt; +dependencies and determines the actions required to install packages.=
&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://PACKAGE-LICENSING;md5=3D4a0548e303dbc77f067335b4d688e74=
5 \<br>
&gt; @@ -71,7 +74,7 @@ do_install_append_class-native() {<br>
&gt;=C2=A0 =C2=A0do_install_append_class-nativesdk() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}/${bindir}/=
dnf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP=
M_CONFIGDIR=3D${SDKPATHNATIVE}${libdir_nativesdk}/rpm \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPM_NO_CHROOT=
_FOR_SCRIPTS=3D1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPM_NO_CHROOT=
_FOR_SCRIPTS=3D1<br>
Whitespace only? Ah, you removed a trailing space.<br>
Please add:<br>
=C2=A0 =C2=A0Remove trailing space in dnf recipe.<br>
in the log to prevent OCDers from wondering if there was a typo.<br></block=
quote><div><br></div><div>I was not intending to submit this change.</div><=
div><br></div><div>Your comment means to submit a 2 part patch with this ch=
ange right?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.service dnf-=
makecache.timer \<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devt=
ools/meson/meson.inc<br>
&gt; index 6de109de7f..2958a2a8de 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; @@ -1,5 +1,8 @@<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://mesonbuild.com" rel=
=3D"noreferrer" target=3D"_blank">http://mesonbuild.com</a>&quot;<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;A high performance build system&quot;<br=
>
&gt; +DESCRIPTION =3D &quot;Meson is a build system designed to increase pr=
ogrammer \<br>
&gt; +productivity. It does this by providing a fast, simple and easy to us=
e \<br>
&gt; +interface for modern software development tools and practices.&quot;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57&quot;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc<br>
&gt; index de21d30732..11783eaca5 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; @@ -1,4 +1,8 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Fast open source processor emulator&quot=
;<br>
&gt; +DESCRIPTION =3D &quot;QEMU is a hosted virtual machine monitor: it em=
ulates the \<br>
&gt; +machine&#39;s processor through dynamic binary translation and provid=
es a set \<br>
&gt; +of different hardware and device models for the machine, enabling it =
to run \<br>
&gt; +a variety of guest operating systems&quot;<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://qemu.org" rel=3D"nore=
ferrer" target=3D"_blank">http://qemu.org</a>&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devt=
ools/quilt/quilt.inc<br>
&gt; index 433e9b40b7..61e1c93605 100644<br>
&gt; --- a/meta/recipes-devtools/quilt/quilt.inc<br>
&gt; +++ b/meta/recipes-devtools/quilt/quilt.inc<br>
&gt; @@ -1,4 +1,8 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Tool for working with series of patches&=
quot;<br>
&gt; +DESCRIPTION =3D &quot;Quilt is a tool to manage large sets of patches=
 by keeping \<br>
&gt; +track of the changes each patch makes. Patches can be applied, un-app=
lied,\<br>
&gt; +refreshed, etc. <br>
End here as is done:<br>
=C2=A0 =C2=A0 <a href=3D"http://savannah.nongnu.org/projects/quilt/" rel=3D=
"noreferrer" target=3D"_blank">http://savannah.nongnu.org/projects/quilt/</=
a><br>
&gt; The key philosophical concept is that your primary output \<br>
&gt; +is patches.&quot;=C2=A0</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Thanks again for the updates.<br>
../Randy<br>
<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://savannah.nongnu.org/p=
rojects/quilt/" rel=3D"noreferrer" target=3D"_blank">http://savannah.nongnu=
.org/projects/quilt/</a>&quot;<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;devel&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt; diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtoo=
ls/swig/swig.inc<br>
&gt; index 00b9c5b605..e62718c508 100644<br>
&gt; --- a/meta/recipes-devtools/swig/swig.inc<br>
&gt; +++ b/meta/recipes-devtools/swig/swig.inc<br>
&gt; @@ -1,4 +1,7 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;SWIG - Simplified Wrapper and Interface =
Generator&quot;<br>
&gt; +DESCRIPTION =3D &quot;SWIG is a compiler that makes it easy to integr=
ate C and C++ \<br>
&gt; +code with other languages including Perl, Tcl, Ruby, Python, Java, Gu=
ile, \<br>
&gt; +Mzscheme, Chicken, OCaml, Pike, and C#.&quot;<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://swig.sourceforge.net/=
" rel=3D"noreferrer" target=3D"_blank">http://swig.sourceforge.net/</a>&quo=
t;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;BSD &amp; GPLv3&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De7807a6282=
784a7dde4c846626b08fc6 \<br>
&gt; diff --git a/meta/recipes-devtools/unfs3/<a href=3D"http://unfs3_git.b=
b" rel=3D"noreferrer" target=3D"_blank">unfs3_git.bb</a> b/meta/recipes-dev=
tools/unfs3/<a href=3D"http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">unfs3_git.bb</a><br>
&gt; index a4ac46c68e..79d09788d3 100644<br>
&gt; --- a/meta/recipes-devtools/unfs3/<a href=3D"http://unfs3_git.bb" rel=
=3D"noreferrer" target=3D"_blank">unfs3_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/unfs3/<a href=3D"http://unfs3_git.bb" rel=
=3D"noreferrer" target=3D"_blank">unfs3_git.bb</a><br>
&gt; @@ -1,4 +1,7 @@<br>
&gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Userspace NFS server v3 protocol&quot;<b=
r>
&gt; +DESCRIPTION =3D &quot;UNFS3 is a user-space implementation of the NFS=
v3 server \<br>
&gt; +specification. It provides a daemon for the MOUNT and NFS protocols, =
which \<br>
&gt; +are used by NFS clients for accessing files on the server.&quot;<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;console/network&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;unfs3&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9475885294=
e17c0cc0067820d042792e&quot;<br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div></div>

--0000000000009c57da05945d2b45--
