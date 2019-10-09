Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84BA67F3DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 01:44:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x991iGOA011478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2019 18:44:16 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 8 Oct 2019 18:44:15 -0700
To: =?UTF-8?Q?Maxime_Roussin-B=c3=a9langer?=
	<maxime.roussinbelanger@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191002205227.16149-1-maxime.roussinbelanger@gmail.com>
	<3547886f-9101-7c00-938c-f2da9a639f06@windriver.com>
	<CAE=T-s6Lse5Rj3WZLaZE+qYam95AFg=GnYc5ZbBNT99WLmADTQ@mail.gmail.com>
	<4fa7febe-c3dc-b821-4426-ddc087e09e28@windriver.com>
	<CAE=T-s5GJXrM3TOboUBuVE99tcKAr1Cd1T422BzJe+6Qg9Zxwg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e5382543-8d7e-ab13-1bf8-0bb65491dcc4@windriver.com>
Date: Tue, 8 Oct 2019 21:44:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAE=T-s5GJXrM3TOboUBuVE99tcKAr1Cd1T422BzJe+6Qg9Zxwg@mail.gmail.com>
X-Originating-IP: [172.25.44.5]
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
X-List-Received-Date: Wed, 09 Oct 2019 01:44:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 10/8/19 9:22 PM, Maxime Roussin-Bélanger wrote:
> It looks like Richard has already merged the changes.
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02afd606b53501bead3b387a66bf050f10d94683
> 
> There is not much I can't do here right? I can create another patchset
> to remove the unnecessary descriptions, or it's a bit late for that?

I'd like you to do that. It might be too late for 3.0 but 3.1 and
with a cherry-pick, also 3.0.1 in ~ 2 months.
> 
> I should probably focus on the next recipes.

Also good!

../Randy

> 
> Max.
> 
> On Tue, Oct 8, 2019 at 8:16 PM Randy MacLeod 
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote:
> 
>     On 10/7/19 10:45 PM, Maxime Roussin-Bélanger wrote:
>     ...
>      >      > -                RPM_NO_CHROOT_FOR_SCRIPTS=1
>      >      > +                RPM_NO_CHROOT_FOR_SCRIPTS=1
>      >     Whitespace only? Ah, you removed a trailing space.
>      >     Please add:
>      >         Remove trailing space in dnf recipe.
>      >     in the log to prevent OCDers from wondering if there was a typo.
>      >
>      >
>      > I was not intending to submit this change.
>      >
>      > Your comment means to submit a 2 part patch with this change right?
> 
>     Ideally but for a one space removal I'd just add a comment.
> 
>     Btw, it's a convention to add your signature immediately after
>     your last comment so that the readers know that they can ignore
>     any remaining text. Like this:
> 
>     ../Randy
> 
>      >
>      >      >   }
>      >      >
>      >      >   SYSTEMD_SERVICE_${PN} = "dnf-makecache.service
>      >     dnf-makecache.timer \
>      >      > diff --git a/meta/recipes-devtools/meson/meson.inc
>      >     b/meta/recipes-devtools/meson/meson.inc
>      >      > index 6de109de7f..2958a2a8de 100644
>      >      > --- a/meta/recipes-devtools/meson/meson.inc
>      >      > +++ b/meta/recipes-devtools/meson/meson.inc
>      >      > @@ -1,5 +1,8 @@
>      >      >   HOMEPAGE = "http://mesonbuild.com"
>      >      >   SUMMARY = "A high performance build system"
>      >      > +DESCRIPTION = "Meson is a build system designed to increase
>      >     programmer \
>      >      > +productivity. It does this by providing a fast, simple
>     and easy
>      >     to use \
>      >      > +interface for modern software development tools and
>     practices."
>      >      >
>      >      >   LICENSE = "Apache-2.0"
>      >      >   LIC_FILES_CHKSUM =
>      >     "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>      >      > diff --git a/meta/recipes-devtools/qemu/qemu.inc
>      >     b/meta/recipes-devtools/qemu/qemu.inc
>      >      > index de21d30732..11783eaca5 100644
>      >      > --- a/meta/recipes-devtools/qemu/qemu.inc
>      >      > +++ b/meta/recipes-devtools/qemu/qemu.inc
>      >      > @@ -1,4 +1,8 @@
>      >      >   SUMMARY = "Fast open source processor emulator"
>      >      > +DESCRIPTION = "QEMU is a hosted virtual machine monitor: it
>      >     emulates the \
>      >      > +machine's processor through dynamic binary translation and
>      >     provides a set \
>      >      > +of different hardware and device models for the machine,
>      >     enabling it to run \
>      >      > +a variety of guest operating systems"
>      >      >   HOMEPAGE = "http://qemu.org"
>      >      >   LICENSE = "GPLv2 & LGPLv2.1"
>      >      >
>      >      > diff --git a/meta/recipes-devtools/quilt/quilt.inc
>      >     b/meta/recipes-devtools/quilt/quilt.inc
>      >      > index 433e9b40b7..61e1c93605 100644
>      >      > --- a/meta/recipes-devtools/quilt/quilt.inc
>      >      > +++ b/meta/recipes-devtools/quilt/quilt.inc
>      >      > @@ -1,4 +1,8 @@
>      >      >   SUMMARY = "Tool for working with series of patches"
>      >      > +DESCRIPTION = "Quilt is a tool to manage large sets of
>     patches
>      >     by keeping \
>      >      > +track of the changes each patch makes. Patches can be
>     applied,
>      >     un-applied,\
>      >      > +refreshed, etc.
>      >     End here as is done:
>      > http://savannah.nongnu.org/projects/quilt/
>      >      > The key philosophical concept is that your primary output \
>      >      > +is patches."
>      >
>      >
>      >     Thanks again for the updates.
>      >     ../Randy
>      >
>      >      >   HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
>      >      >   SECTION = "devel"
>      >      >   LICENSE = "GPLv2"
>      >      > diff --git a/meta/recipes-devtools/swig/swig.inc
>      >     b/meta/recipes-devtools/swig/swig.inc
>      >      > index 00b9c5b605..e62718c508 100644
>      >      > --- a/meta/recipes-devtools/swig/swig.inc
>      >      > +++ b/meta/recipes-devtools/swig/swig.inc
>      >      > @@ -1,4 +1,7 @@
>      >      >   SUMMARY = "SWIG - Simplified Wrapper and Interface
>     Generator"
>      >      > +DESCRIPTION = "SWIG is a compiler that makes it easy to
>      >     integrate C and C++ \
>      >      > +code with other languages including Perl, Tcl, Ruby, Python,
>      >     Java, Guile, \
>      >      > +Mzscheme, Chicken, OCaml, Pike, and C#."
>      >      >   HOMEPAGE = "http://swig.sourceforge.net/"
>      >      >   LICENSE = "BSD & GPLv3"
>      >      >   LIC_FILES_CHKSUM =
>      >     "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
>      >      > diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb
>     <http://unfs3_git.bb>
>      >     <http://unfs3_git.bb>
>     b/meta/recipes-devtools/unfs3/unfs3_git.bb <http://unfs3_git.bb>
>      >     <http://unfs3_git.bb>
>      >      > index a4ac46c68e..79d09788d3 100644
>      >      > --- a/meta/recipes-devtools/unfs3/unfs3_git.bb
>     <http://unfs3_git.bb> <http://unfs3_git.bb>
>      >      > +++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
>     <http://unfs3_git.bb> <http://unfs3_git.bb>
>      >      > @@ -1,4 +1,7 @@
>      >      >   SUMMARY = "Userspace NFS server v3 protocol"
>      >      > +DESCRIPTION = "UNFS3 is a user-space implementation of
>     the NFSv3
>      >     server \
>      >      > +specification. It provides a daemon for the MOUNT and NFS
>      >     protocols, which \
>      >      > +are used by NFS clients for accessing files on the server."
>      >      >   SECTION = "console/network"
>      >      >   LICENSE = "unfs3"
>      >      >   LIC_FILES_CHKSUM =
>      >     "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
>      >      >
>      >
>      >
>      >     --
>      >     # Randy MacLeod
>      >     # Wind River Linux
>      >
> 
> 
>     -- 
>     # Randy MacLeod
>     # Wind River Linux
> 


-- 
# Randy MacLeod
# Wind River Linux

