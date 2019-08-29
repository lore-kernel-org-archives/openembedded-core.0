Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 21E577E555
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:14:02 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id x3so1258815lji.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A7iAJB5gFhXERGnfbUkVCzF5rFMGL5aexouOlyX82CE=;
	b=g5oMFaF6VajPpQpOh5Dq1rUQvavoQ4EST6e9qNgv2eJ0syKLWSU1AEbDNCMelmBsBP
	3z/R+ZaPXGY71C/KVSLn2bE+5NmH/1BGNkfc95xWAG1uPAtgvVanNe30UoE+5gAYnKL7
	CVkduylCmojtgxyoJKWW0jWy9f4aEjbJ3HaVNy5PUKdDSa32NAHy3ZDyBUnEAdlqkkYs
	0hMyVfWTBH8Yddt6+wkamC9RoehrPFbqRCrVkQy4LLrmLbHvWdALdAUBebwnt3YPM+hY
	D+MV2q1Y1DOB4BJTtM3NLjLYLfCzdMm4AZLOxMEZax61S/pBHG6D5c7zGuQxdyYlwuGF
	cK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A7iAJB5gFhXERGnfbUkVCzF5rFMGL5aexouOlyX82CE=;
	b=KPyybXxHjkOOp3GhCFcfDRR+qLccOhVHZgeh34m1PgSYgw2t44MwLGYj4149lt/uy8
	4x90lbQk9Lz7sU2WnlFgvs66tq8H4w2h2nBW0vVyJJeaJOTmCdBTPF84q7rWZW+w8GbJ
	B4fL9xOBHavkaXO0rxbhnpGIv86qr72TdWrLzscZDD64qLfYbJEaMJuZPxpGdOVSclha
	Z+T0aIftbELsnW3ruL08P1l8mYNNXMzlVLib7XPpa8vusXeqEF51qk7kP2FvNVu9RlaW
	o5aHx4J4hkkYzSdwbviykwUDsgs6W1E95vzLulsqp9AqHtJky5nP5Pb9LASqlfVyzZMZ
	4n/A==
X-Gm-Message-State: APjAAAWiRxnazcPMXP3cHht4gQ9K4PDjpsJLeTLGxdgPpSx/AyEahyH7
	0cAnGkPktcD7p+PKLxa0CnMaBnGtdRyGLRG9oeY=
X-Google-Smtp-Source: APXvYqyEHPq0kiTFxyH+GTeTcnywkTB59ln1yqVXuUkoAk6wwJBPhCPidZoTqmXgqXE0isS/cdpOvWWFjkcgGrQRpZg=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr3398950ljg.232.1567037642463; 
	Wed, 28 Aug 2019 17:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<c1bffa0ef4621c96d200e8ed14fd818d97b41677.1567019771.git.bruce.ashfield@gmail.com>
	<8664f9ff7f4a8463b16d3d17d213ad3375798ea8.camel@intel.com>
In-Reply-To: <8664f9ff7f4a8463b16d3d17d213ad3375798ea8.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 20:13:50 -0400
Message-ID: <CADkTA4O_39fPJYD1DmiVVUL4GguyjqYG6VUct330GtzDnSezow@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 00:14:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 8:01 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> This is causing failure for 5.0 kernels probably because the attr.py
> python -> python3 changes are not there ...
>
> ERROR: perf-1.0-r9 do_package_qa: QA Issue: /usr/libexec/perf-
> core/tests/attr.py contained in package perf-tests requires
> /usr/bin/python, but no providers found in RDEPENDS_perf-tests? [file-
> rdeps]
> ERROR: perf-1.0-r9 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> worker/genericx86/build/build/tmp/work/genericx86-poky-linux/perf/1.0-
> r9/temp/log.do_package_qa.36284
> NOTE: recipe perf-1.0-r9: task do_package_qa: Failed
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/975/steps/8/logs/step1b

unfortunately, I can only cover the active kernels in master with any
certainty, and I already have a patch to drop 5.0, so I didn't trigger
this.
I can spin a patch for 5.0 and make sure it is version proofed a ibt,
but if anyone else has issues with <insert version here>, they'll need
to send their own patch.

Bruce

>
> Thanks,
>
> Anuj
>
> On Wed, 2019-08-28 at 15:28 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The upstream kernel can now handle python3 for the perf scripts,
> > coupled
> > with the impending EOL of python2, we switch the dependencies in perf
> > (scripting) to python3.
> >
> > Outside of dependency changes, we also pass the following two
> > variables
> > to the perf build: PYTHON=python3 PYTHON_CONFIG=python3-config. To
> > ensure that our python3 components are used.
> >
> > For configurations that disable perf scripting, there is no change in
> > behaviour.
> >
> > [YOCTO #13358]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > kernel/perf/perf.bb
> > index 4e603f1a32..8ac8e7c308 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -13,7 +13,7 @@ PR = "r9"
> >
> >  PACKAGECONFIG ??= "scripting tui libunwind"
> >  PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
> > -PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl
> > python"
> > +PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl
> > python3"
> >  # gui support was added with kernel 3.6.35
> >  # since 3.10 libnewt was replaced by slang
> >  # to cover a wide range of kernel we add both dependencies
> > @@ -44,8 +44,8 @@ PROVIDES = "virtual/perf"
> >  inherit linux-kernel-base kernel-arch manpages
> >
> >  # needed for building the tools/perf Python bindings
> > -inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting',
> > 'pythonnative', '', d)}
> > -inherit python-dir
> > +inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting',
> > 'python3native', '', d)}
> > +inherit python3-dir
> >  export PYTHON_SITEPACKAGES_DIR
> >
> >  #kernel 3.1+ supports WERROR to disable warnings as errors
> > @@ -94,6 +94,7 @@ EXTRA_OEMAKE += "\
> >      'sharedir=${@os.path.relpath(datadir, prefix)}' \
> >      'mandir=${@os.path.relpath(mandir, prefix)}' \
> >      'infodir=${@os.path.relpath(infodir, prefix)}' \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'scripting',
> > 'PYTHON=python3 PYTHON_CONFIG=python3-config', '', d)} \
> >  "
> >
> >  # During do_configure, we might run a 'make clean'. That often
> > breaks
> > @@ -132,7 +133,7 @@ do_install() {
> >       oe_runmake install
> >       # we are checking for this make target to be compatible with
> > older perf versions
> >       if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true',
> > 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*;
> > then
> > -             oe_runmake DESTDIR=${D} install-python_ext
> > +         oe_runmake DESTDIR=${D} install-python_ext
> >       fi
> >  }
> >
> > @@ -233,7 +234,8 @@ do_configure_prepend () {
> >
> >      # use /usr/bin/env instead of version specific python
> >      for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
> > -        sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
> > +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> > +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> >      done
> >
> >      # unistd.h can be out of sync between libc-headers and the
> > captured version in the perf source
> > @@ -252,9 +254,9 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl
> > ${PN}-python"
> >
> >  RDEPENDS_${PN} += "elfutils bash"
> >  RDEPENDS_${PN}-archive =+ "bash"
> > -RDEPENDS_${PN}-python =+ "bash python python-modules
> > ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '',
> > d)}"
> > +RDEPENDS_${PN}-python =+ "bash python3 python3-modules
> > ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '',
> > d)}"
> >  RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
> > -RDEPENDS_${PN}-tests =+ "python"
> > +RDEPENDS_${PN}-tests =+ "python3"
> >
> >  RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG',
> > 'scripting', '${PN}-perl ${PN}-python', '',d)}"
> >  RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests
> > ${RSUGGESTS_SCRIPTING}"
> > --
> > 2.19.1
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

