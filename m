Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 799F360125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 01:23:04 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v2so1223321iob.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 18:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=1PGVtH59Mgs+j1IvbhBpHDbRQ8vHZERIrRHieSUplwg=;
	b=ZvLJjEJLTAc+rzNtap64VgR4FrbmEPw+qMiQyS38IvTZiyE3mihC1R10IjicyEPUw/
	f/dNtN1BmJdap+cRifDzJcjmWKGLaObtTkEyN5q2LncR4MjxTf+u6z50jLTMhy/iFYoJ
	V0VLiEOR+bDStZiFzoTMGiz+wJ8xGPfkz4iYrdNceZ2Hmm6TKaJmJdm50Ie1qH7frqFn
	ULWpYMuaRfqPwl4XoqgkylUcpYhJ/H0k9YASJPqGuVpAmuIaiAYH1Ff8nS/PSQ9mH2rV
	lB6rLgxBUUUCRhIOT0svZJ3ki3iLIkE0XEgPL4y+x81EhSQQXhEictL0RA6LAkvBFPs3
	YnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1PGVtH59Mgs+j1IvbhBpHDbRQ8vHZERIrRHieSUplwg=;
	b=YBpDzQlwL4PYYekjm57sDGDC/lXR01S+G23SIY+p0JJU6AC8KpiYIEvU2jIFu7Jrmy
	BK0PYzqqomGCH3FKa0BeKcxdH2GNvXZsVPSVC3gIysMDK07WXdyEMDTRN198m7TuzO7T
	7nu/DEi7mpIxp57coZGnbspOQKkpv9XYWIkClKfbx3EWQD1bH/ipeos1nDwObFsynB8v
	OylEAbJrEoJEHjUVgaWQ3UvFWYMMJFsQK6bn0jwsduvAO+Ke9HrI37xDgTyQA6LakX2W
	ITBMThmU5le/EY40LHT5isgd4PCZD3PbtgjbZSy691pRuIFFiKCdCEKW9CJ29vZqkh0w
	WUbg==
X-Gm-Message-State: APjAAAVp94NdXV+Zsxn8t5UN00Oq1kZmga+er3bioWK8hayZC3XIg/gN
	gznjKold9EfQBdbvy/1XyMwdynDdeADoEbCF8IM=
X-Google-Smtp-Source: APXvYqy176hC0SuwbCzG6ZJYtIMh6C2q8IJG3QNhcnPVIHnyykkBoikNFcEzb6NUKw23VuTCvKCpOO9sY3Rmlf7qg2U=
X-Received: by 2002:a92:1948:: with SMTP id e8mr783544ilm.292.1570584185223;
	Tue, 08 Oct 2019 18:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191002205227.16149-1-maxime.roussinbelanger@gmail.com>
	<3547886f-9101-7c00-938c-f2da9a639f06@windriver.com>
	<CAE=T-s6Lse5Rj3WZLaZE+qYam95AFg=GnYc5ZbBNT99WLmADTQ@mail.gmail.com>
	<4fa7febe-c3dc-b821-4426-ddc087e09e28@windriver.com>
In-Reply-To: <4fa7febe-c3dc-b821-4426-ddc087e09e28@windriver.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Tue, 8 Oct 2019 21:22:39 -0400
Message-ID: <CAE=T-s5GJXrM3TOboUBuVE99tcKAr1Cd1T422BzJe+6Qg9Zxwg@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Oct 2019 01:23:04 -0000
Content-Type: multipart/alternative; boundary="00000000000073425505947020f9"

--00000000000073425505947020f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like Richard has already merged the changes.

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D02afd606b53501=
bead3b387a66bf050f10d94683

There is not much I can't do here right? I can create another patchset
to remove the unnecessary descriptions, or it's a bit late for that?

I should probably focus on the next recipes.

Max.

On Tue, Oct 8, 2019 at 8:16 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 10/7/19 10:45 PM, Maxime Roussin-B=C3=A9langer wrote:
> ...
> >      > -                RPM_NO_CHROOT_FOR_SCRIPTS=3D1
> >      > +                RPM_NO_CHROOT_FOR_SCRIPTS=3D1
> >     Whitespace only? Ah, you removed a trailing space.
> >     Please add:
> >         Remove trailing space in dnf recipe.
> >     in the log to prevent OCDers from wondering if there was a typo.
> >
> >
> > I was not intending to submit this change.
> >
> > Your comment means to submit a 2 part patch with this change right?
>
> Ideally but for a one space removal I'd just add a comment.
>
> Btw, it's a convention to add your signature immediately after
> your last comment so that the readers know that they can ignore
> any remaining text. Like this:
>
> ../Randy
>
> >
> >      >   }
> >      >
> >      >   SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service
> >     dnf-makecache.timer \
> >      > diff --git a/meta/recipes-devtools/meson/meson.inc
> >     b/meta/recipes-devtools/meson/meson.inc
> >      > index 6de109de7f..2958a2a8de 100644
> >      > --- a/meta/recipes-devtools/meson/meson.inc
> >      > +++ b/meta/recipes-devtools/meson/meson.inc
> >      > @@ -1,5 +1,8 @@
> >      >   HOMEPAGE =3D "http://mesonbuild.com"
> >      >   SUMMARY =3D "A high performance build system"
> >      > +DESCRIPTION =3D "Meson is a build system designed to increase
> >     programmer \
> >      > +productivity. It does this by providing a fast, simple and easy
> >     to use \
> >      > +interface for modern software development tools and practices."
> >      >
> >      >   LICENSE =3D "Apache-2.0"
> >      >   LIC_FILES_CHKSUM =3D
> >     "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> >      > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> >     b/meta/recipes-devtools/qemu/qemu.inc
> >      > index de21d30732..11783eaca5 100644
> >      > --- a/meta/recipes-devtools/qemu/qemu.inc
> >      > +++ b/meta/recipes-devtools/qemu/qemu.inc
> >      > @@ -1,4 +1,8 @@
> >      >   SUMMARY =3D "Fast open source processor emulator"
> >      > +DESCRIPTION =3D "QEMU is a hosted virtual machine monitor: it
> >     emulates the \
> >      > +machine's processor through dynamic binary translation and
> >     provides a set \
> >      > +of different hardware and device models for the machine,
> >     enabling it to run \
> >      > +a variety of guest operating systems"
> >      >   HOMEPAGE =3D "http://qemu.org"
> >      >   LICENSE =3D "GPLv2 & LGPLv2.1"
> >      >
> >      > diff --git a/meta/recipes-devtools/quilt/quilt.inc
> >     b/meta/recipes-devtools/quilt/quilt.inc
> >      > index 433e9b40b7..61e1c93605 100644
> >      > --- a/meta/recipes-devtools/quilt/quilt.inc
> >      > +++ b/meta/recipes-devtools/quilt/quilt.inc
> >      > @@ -1,4 +1,8 @@
> >      >   SUMMARY =3D "Tool for working with series of patches"
> >      > +DESCRIPTION =3D "Quilt is a tool to manage large sets of patche=
s
> >     by keeping \
> >      > +track of the changes each patch makes. Patches can be applied,
> >     un-applied,\
> >      > +refreshed, etc.
> >     End here as is done:
> >     http://savannah.nongnu.org/projects/quilt/
> >      > The key philosophical concept is that your primary output \
> >      > +is patches."
> >
> >
> >     Thanks again for the updates.
> >     ../Randy
> >
> >      >   HOMEPAGE =3D "http://savannah.nongnu.org/projects/quilt/"
> >      >   SECTION =3D "devel"
> >      >   LICENSE =3D "GPLv2"
> >      > diff --git a/meta/recipes-devtools/swig/swig.inc
> >     b/meta/recipes-devtools/swig/swig.inc
> >      > index 00b9c5b605..e62718c508 100644
> >      > --- a/meta/recipes-devtools/swig/swig.inc
> >      > +++ b/meta/recipes-devtools/swig/swig.inc
> >      > @@ -1,4 +1,7 @@
> >      >   SUMMARY =3D "SWIG - Simplified Wrapper and Interface Generator=
"
> >      > +DESCRIPTION =3D "SWIG is a compiler that makes it easy to
> >     integrate C and C++ \
> >      > +code with other languages including Perl, Tcl, Ruby, Python,
> >     Java, Guile, \
> >      > +Mzscheme, Chicken, OCaml, Pike, and C#."
> >      >   HOMEPAGE =3D "http://swig.sourceforge.net/"
> >      >   LICENSE =3D "BSD & GPLv3"
> >      >   LIC_FILES_CHKSUM =3D
> >     "file://LICENSE;md5=3De7807a6282784a7dde4c846626b08fc6 \
> >      > diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb
> >     <http://unfs3_git.bb> b/meta/recipes-devtools/unfs3/unfs3_git.bb
> >     <http://unfs3_git.bb>
> >      > index a4ac46c68e..79d09788d3 100644
> >      > --- a/meta/recipes-devtools/unfs3/unfs3_git.bb <
> http://unfs3_git.bb>
> >      > +++ b/meta/recipes-devtools/unfs3/unfs3_git.bb <
> http://unfs3_git.bb>
> >      > @@ -1,4 +1,7 @@
> >      >   SUMMARY =3D "Userspace NFS server v3 protocol"
> >      > +DESCRIPTION =3D "UNFS3 is a user-space implementation of the NF=
Sv3
> >     server \
> >      > +specification. It provides a daemon for the MOUNT and NFS
> >     protocols, which \
> >      > +are used by NFS clients for accessing files on the server."
> >      >   SECTION =3D "console/network"
> >      >   LICENSE =3D "unfs3"
> >      >   LIC_FILES_CHKSUM =3D
> >     "file://LICENSE;md5=3D9475885294e17c0cc0067820d042792e"
> >      >
> >
> >
> >     --
> >     # Randy MacLeod
> >     # Wind River Linux
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--00000000000073425505947020f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">It looks like Richard ha=
s already merged the changes.<div><br></div><div><a href=3D"https://git.yoc=
toproject.org/cgit/cgit.cgi/poky/commit/?id=3D02afd606b53501bead3b387a66bf0=
50f10d94683">https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D0=
2afd606b53501bead3b387a66bf050f10d94683</a><br></div><div><br></div><div>Th=
ere is not much I can&#39;t do here right? I can create another patchset=C2=
=A0</div><div>to remove the unnecessary descriptions, or it&#39;s a bit lat=
e for that?</div><div><br></div><div>I should probably focus on the next re=
cipes.</div><div><br></div><div>Max.</div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 8, 2019 at 8:16=
 PM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.=
macleod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">On 10/7/19 1=
0:45 PM, Maxime Roussin-B=C3=A9langer wrote:<br>
...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 RPM_NO_CHROOT_FOR_SCRIPTS=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 RPM_NO_CHROOT_FOR_SCRIPTS=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0Whitespace only? Ah, you removed a trailing space.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0Please add:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Remove trailing space in dnf recipe.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0in the log to prevent OCDers from wondering if ther=
e was a typo.<br>
&gt; <br>
&gt; <br>
&gt; I was not intending to submit this change.<br>
&gt; <br>
&gt; Your comment means to submit a 2 part patch with this change right?<br=
>
<br>
Ideally but for a one space removal I&#39;d just add a comment.<br>
<br>
Btw, it&#39;s a convention to add your signature immediately after<br>
your last comment so that the readers know that they can ignore<br>
any remaining text. Like this:<br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SYSTEMD_SERVICE_${PN} =3D &quot;d=
nf-makecache.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0dnf-makecache.timer \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-devtools/meson/meso=
n.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/meson/meson.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 6de109de7f..2958a2a8de 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-devtools/meson/meson.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-devtools/meson/meson.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,5 +1,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"htt=
p://mesonbuild.com" rel=3D"noreferrer" target=3D"_blank">http://mesonbuild.=
com</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SUMMARY =3D &quot;A high performa=
nce build system&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &quot;Meson is a build syste=
m designed to increase<br>
&gt;=C2=A0 =C2=A0 =C2=A0programmer \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +productivity. It does this by providing a fa=
st, simple and easy<br>
&gt;=C2=A0 =C2=A0 =C2=A0to use \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +interface for modern software development to=
ols and practices.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LICENSE =3D &quot;Apache-2.0&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-devtools/qemu/qemu.=
inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index de21d30732..11783eaca5 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Fast open sourc=
e processor emulator&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &quot;QEMU is a hosted virtu=
al machine monitor: it<br>
&gt;=C2=A0 =C2=A0 =C2=A0emulates the \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +machine&#39;s processor through dynamic bina=
ry translation and<br>
&gt;=C2=A0 =C2=A0 =C2=A0provides a set \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +of different hardware and device models for =
the machine,<br>
&gt;=C2=A0 =C2=A0 =C2=A0enabling it to run \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +a variety of guest operating systems&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"htt=
p://qemu.org" rel=3D"noreferrer" target=3D"_blank">http://qemu.org</a>&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2 &amp; LGP=
Lv2.1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-devtools/quilt/quil=
t.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/quilt/quilt.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 433e9b40b7..61e1c93605 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-devtools/quilt/quilt.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-devtools/quilt/quilt.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Tool for workin=
g with series of patches&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &quot;Quilt is a tool to man=
age large sets of patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0by keeping \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +track of the changes each patch makes. Patch=
es can be applied,<br>
&gt;=C2=A0 =C2=A0 =C2=A0un-applied,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +refreshed, etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0End here as is done:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://savannah.nongnu.org/projects/quil=
t/" rel=3D"noreferrer" target=3D"_blank">http://savannah.nongnu.org/project=
s/quilt/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The key philosophical concept is that your pr=
imary output \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +is patches.&quot; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks again for the updates.<br>
&gt;=C2=A0 =C2=A0 =C2=A0../Randy<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"htt=
p://savannah.nongnu.org/projects/quilt/" rel=3D"noreferrer" target=3D"_blan=
k">http://savannah.nongnu.org/projects/quilt/</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SECTION =3D &quot;devel&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-devtools/swig/swig.=
inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/swig/swig.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 00b9c5b605..e62718c508 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-devtools/swig/swig.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-devtools/swig/swig.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SUMMARY =3D &quot;SWIG - Simplifi=
ed Wrapper and Interface Generator&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &quot;SWIG is a compiler tha=
t makes it easy to<br>
&gt;=C2=A0 =C2=A0 =C2=A0integrate C and C++ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +code with other languages including Perl, Tc=
l, Ruby, Python,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Java, Guile, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Mzscheme, Chicken, OCaml, Pike, and C#.&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"htt=
p://swig.sourceforge.net/" rel=3D"noreferrer" target=3D"_blank">http://swig=
.sourceforge.net/</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LICENSE =3D &quot;BSD &amp; GPLv3=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=3De7807a6282784a7dde4c8466=
26b08fc6 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-devtools/unfs3/<a h=
ref=3D"http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_blank">unfs3_git.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://unfs3_git.bb" rel=3D"noreferr=
er" target=3D"_blank">http://unfs3_git.bb</a>&gt; b/meta/recipes-devtools/u=
nfs3/<a href=3D"http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_blank">u=
nfs3_git.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://unfs3_git.bb" rel=3D"noreferr=
er" target=3D"_blank">http://unfs3_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index a4ac46c68e..79d09788d3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-devtools/unfs3/<a href=3D"=
http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_blank">unfs3_git.bb</a> =
&lt;<a href=3D"http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://unfs3_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-devtools/unfs3/<a href=3D"=
http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_blank">unfs3_git.bb</a> =
&lt;<a href=3D"http://unfs3_git.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://unfs3_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SUMMARY =3D &quot;Userspace NFS s=
erver v3 protocol&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &quot;UNFS3 is a user-space =
implementation of the NFSv3<br>
&gt;=C2=A0 =C2=A0 =C2=A0server \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +specification. It provides a daemon for the =
MOUNT and NFS<br>
&gt;=C2=A0 =C2=A0 =C2=A0protocols, which \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +are used by NFS clients for accessing files =
on the server.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SECTION =3D &quot;console/network=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LICENSE =3D &quot;unfs3&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=3D9475885294e17c0cc0067820=
d042792e&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0# Randy MacLeod<br>
&gt;=C2=A0 =C2=A0 =C2=A0# Wind River Linux<br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div></div>

--00000000000073425505947020f9--
