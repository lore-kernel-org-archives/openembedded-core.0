Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.2059.1588034263624197482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 17:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fa6ZQt12;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id t14so22601021wrw.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 17:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+rHIFDKO3kSVQT9G8HdWUqDUi4UPleSpWBXSjbnDzc=;
        b=fa6ZQt12MOBiDg7b9cAJ8jy9+X5SWgW34pjJvqx5dpSCYQ9ce6LeGH6+C7inR0oiag
         BKDhjUG+YsF6DLjOe2al/ov9HXwSxKU4Acm5iX1P2lhddbD1Qm6j2wmV/dwwqcvJcxcQ
         IN3zPjZn4A8yrgeWeDekCDEfQ5+TFXQ0JcG96JaxXvPpSktMdcVIaYHejjUEa7oGXGHW
         YiuYtRP7EctDRJTNRAqL6BBf8xZqEAdLZ6nNIYEYHYx7KBf5k3M9vAtxZG/7ObPTPIJf
         uBn3RtgczbFFJqQtdJ3ggo+fZeKyNIL9nb5Qnj29Hk+j+VU2n6OP3e9mRTt3kMiDbLNu
         eeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+rHIFDKO3kSVQT9G8HdWUqDUi4UPleSpWBXSjbnDzc=;
        b=WWCAGk4U581M3l20mMvl1+86AjnVn+1wI37PYpx8sifsBl4EEPxbKi9SvSwlTWvlCk
         /7QZlLcmNoliTF59vvmvx6/pbp3iY0dfdsnGqm9PS/omsN8S+O336EmxM2PeNNlhJnG6
         xgKLagVGMOD7nVM6/pWa9A3OHpGlOkJtsAR7Em8zX6QeLvFtFKz1FGxAPY794fGIxQzl
         0ydqp2r4WrJLFcI6FKAyVnyE6hCkNb6suXEjbRlMSbLQKJl5DYm1pomHOoEN62l8Ms/k
         wyQZ9iUeCvYDadXNNN+BKdJ+MsNgBBDypcNzRFbtf2EE+66blOQYwKjRuGnyRNfXT9pr
         l4zA==
X-Gm-Message-State: AGi0PuaLU3JWWDK72TDP2qRMqnyaTCaBZSusxu0GsrZeNV8JYEFU5IeN
	XdRGNuoLuTNkgkr0FXGsDbFQFe8KHaT1bjyHfjo=
X-Google-Smtp-Source: APiQypKqOGAIaBO9Ps3MBJCaklNigan2JegJ2NwOmZ5sKlOC78olLgRQlCmyw0DB7dYMp8SyhgjUNyWFiGTjzNqNfBA=
X-Received: by 2002:adf:f651:: with SMTP id x17mr29881105wrp.230.1588034261912;
 Mon, 27 Apr 2020 17:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200415231829.4090244-1-raj.khem@gmail.com> <CAGDS+n=FfuBzJcrvbb8i=32+9JXd-0C+MskoxLuUDiz0p_RZyg@mail.gmail.com>
 <0f7cef3c-f0f0-30b9-7107-02450738622c@gmail.com> <20200427233456.GP11927@denix.org>
In-Reply-To: <20200427233456.GP11927@denix.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 27 Apr 2020 14:37:30 -1000
Message-ID: <CAGDS+nnQJiXTp7_abKMNhHiT=MO10THriJP3voBwOZyqOU155Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] gcc: Configure all gccs with --disable-install-libiberty
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 27, 2020 at 1:34 PM Denys Dmytriyenko <denis@denix.org> wrote:

Hi Denys,

> Is there a repo/branch available where you collect patches for dunfell-next?

Yes, I'm using a naming scheme similar to what Armin has been doing
for stable, so you can find what I'm currently testing on the
autobuilder here:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=stable/dunfell-nut

The above repo is constructed from component repos in:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
https://git.openembedded.org/bitbake-contrib/log/?h=stable/1.46-nut

And I'll shortly have pointers to where I am collecting meta-yocto and
yocto-docs patches.

I'm still learning all the systems and refining a workflow.  I'll be
updating this wiki page as I find my way:

https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS

Suggestions and complaints are welcome ;-)

Steve


> On Mon, Apr 27, 2020 at 04:27:45PM -0700, Khem Raj wrote:
> > Yes Steve, there are good for Dunfell. We should consider them
> >
> > On 4/27/20 4:20 PM, Steve Sakoman wrote:
> > >Hi Khem,
> > >
> > >Is this series something I should consider for dunfell LTS?
> > >
> > >Steve
> > >
> > >On Wed, Apr 15, 2020 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >>OE uses libiberty from binutils, since its properly compiled as pic
> > >>archive and applications and other libraries needing libiberty can
> > >>properly link with it.
> > >>
> > >>With this option applied, explicit delete of libiberty headers and
> > >>libraries is not required in install step, since they wont get installed
> > >>in first place.
> > >>
> > >>Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >>---
> > >>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
> > >>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 6 ------
> > >>  meta/recipes-devtools/gcc/gcc-cross.inc            | 4 ----
> > >>  meta/recipes-devtools/gcc/gcc-target.inc           | 4 ----
> > >>  4 files changed, 1 insertion(+), 14 deletions(-)
> > >>
> > >>diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > >>index bb4f6923f2..a64c4caf00 100644
> > >>--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > >>+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > >>@@ -33,6 +33,7 @@ EXTRA_OECONF = "\
> > >>      --enable-libstdcxx-pch \
> > >>      --program-prefix=${TARGET_PREFIX} \
> > >>      --without-local-prefix \
> > >>+    --disable-install-libiberty \
> > >>      ${EXTRA_OECONF_BASE} \
> > >>      ${EXTRA_OECONF_GCC_FLOAT} \
> > >>      ${EXTRA_OECONF_PATHS} \
> > >>diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > >>index 4aac345bec..553ef7fe62 100644
> > >>--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > >>+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > >>@@ -108,12 +108,6 @@ do_install () {
> > >>         # We don't care about the gcc-<version> copies
> > >>         rm -f ${D}${bindir}/*gcc-?.?*
> > >>
> > >>-       # We use libiberty from binutils
> > >>-       rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
> > >>-       # Not sure where the strange paths come from
> > >>-       rm -f ${D}${libdir}/../lib/libiberty.a
> > >>-       rm -f ${D}${libdir}/libiberty.a
> > >>-
> > >>         # Cleanup empty directories which are not shipped
> > >>         # we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
> > >>         # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
> > >>diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> > >>index c68cdd5dc4..6fa8c274cd 100644
> > >>--- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > >>+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > >>@@ -117,10 +117,6 @@ do_install () {
> > >>         cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> > >>         cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> > >>
> > >>-       # We use libiberty from binutils
> > >>-       find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
> > >>-       find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
> > >>-
> > >>         find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
> > >>  }
> > >>
> > >>diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> > >>index 34c1b2263b..8cb432780f 100644
> > >>--- a/meta/recipes-devtools/gcc/gcc-target.inc
> > >>+++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > >>@@ -192,10 +192,6 @@ do_install () {
> > >>         # We don't care about the gcc-<version> ones for this
> > >>         rm -f *gcc-?.?*
> > >>
> > >>-       # We use libiberty from binutils
> > >>-       find ${D}${libdir} -name libiberty.a | xargs rm -f
> > >>-       find ${D}${libdir} -name libiberty.h | xargs rm -f
> > >>-
> > >>         # Not sure why we end up with these but we don't want them...
> > >>         rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
> > >>
> > >>--
> > >>2.26.1
> > >>
> > >>
>
> > 
>
