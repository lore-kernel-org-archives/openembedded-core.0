Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B16B07BD84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 00:16:54 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g85so47749945ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 16:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sg32pVoIdSMdAYOzqi2FInLmtC7P1tpIGzjgd8VpGy8=;
	b=hg5ywpEY1Y48KZQ1OnZtPM2v+ThzDHas3TQa8UHUHXtKPZxHAbtwhdEtf+lRTVPQAO
	IgoKCSrbKdEpz2abG7TXxK4juxyskV8Y3SoYTlaT2bxyIOcye/fTOdmDnOqCMpaApo9s
	TeZPNPR3gZ3t4SaictSm1dRdpQwRUm9N8XRUh4ksKNRa6z5cLZdUz6YFZ8Q7DZFz06bU
	xPDXjPuybfQwQJ16Rchl6rcLPo9kv94HvR0ioUG8RJIMsYIsKRWkg2SkOFPJ5qgEEQVA
	1xhO313tz76xx50meIplahX9dlwzG6say/2ZcP1xoD4kiotGr96HQ0PnysyNQ3SF8SJo
	mqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sg32pVoIdSMdAYOzqi2FInLmtC7P1tpIGzjgd8VpGy8=;
	b=c4+QT2RK4yo3urFgevPwDW7zz0G7Uo5IDWwdk9F3MnmyIPqJdPCliwT0AnXAJxvOBB
	Fx9TJe537JqLRn17RDQpjtceTQ4lNv0qwxzcdnrPNe0E9oKVmCwFhgvubIFGEFhAcxkv
	9UrCRKJrDkG0l0aCpHxHCRFXFfa3qzpfRA0i6n7i5D0TJ+Vq/B91aJFpHdnNDr0WyJ2v
	6QaOQeXLF3SaMX7L+g5dyS3p+zzFHc7CLxu+2Nag5SAvImoOQmQl8aAOi/VUZv/B4t/a
	tAAiOO1scuVPPCMhVzqgXU3awtZ/Lr7rBQRO0MUvDFyy5sfsikausad22Z/ZGbrYDEIH
	G6hQ==
X-Gm-Message-State: AJcUukewiGMjHTcfrtFLBgQp9n1gPLUg9zqH8W/8BfdemnMS3Ee9ZftE
	AlwegVRhuo9UmLU2hsyTjU1UvXknfLkAoFpsBd4eIQ==
X-Google-Smtp-Source: ALg8bN7FkCyC1XVJ3B/SrSa8Zs4pRHBHcrhmPVUsiitBdIm/bRMiWxLHQLWIHd4zTO0sUs4/Mo56kUyAARz6orbSL9w=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr259514ite.26.1546561015678;
	Thu, 03 Jan 2019 16:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20190103231826.31290-1-alistair.francis@wdc.com>
	<CAJTo0LYQH+=kx8=jmxsRB6SAgf4Un+vK_0ea+NdRbVpB9Yr47w@mail.gmail.com>
	<CAKmqyKN5sAyo64g+if-t=wp6tqkjsyMLFEcbCMoZquA378fVgw@mail.gmail.com>
In-Reply-To: <CAKmqyKN5sAyo64g+if-t=wp6tqkjsyMLFEcbCMoZquA378fVgw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jan 2019 00:16:44 +0000
Message-ID: <CAJTo0LZgU9gJqDSmiNxv+zWX12Og4my4FRugVEtqdyJN2-04Ng@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] swig: Fix configure failure
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
X-List-Received-Date: Fri, 04 Jan 2019 00:16:55 -0000
Content-Type: text/plain; charset="UTF-8"

Try adding EXTRA_AUTORECONF += "-I Tools/config"?

Ross

On Fri, 4 Jan 2019 at 00:11, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jan 3, 2019 at 4:02 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On Thu, 3 Jan 2019 at 23:18, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > > Fix the swig build by calling autogen.sh before running configure.
> >
> > But...
> >
> > > @@ -45,6 +45,7 @@ do_configure() {
> > >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
> > >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
> > >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> > > +    (cd ${S} && ./autogen.sh)
> > >      oe_runconf
> >
> > Now this is literally just reimplementing the default do_configure
> > from autotools.  The first three lines are gnuconfigize, autogen.sh is
> > generally just autoreconf in modern systems, and then oe_runconf.
> >
> > If do_configure is just deleted, what breaks?
>
> This is the error I see:
>
> ERROR: swig-native-3.0.12-r0 do_configure: autoreconf execution failed.
> ERROR: swig-native-3.0.12-r0 do_configure: Function failed:
> do_configure (log file is located at
> /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027)
> ERROR: Logfile of failure stored in:
> /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027
> Log data follows:
> | DEBUG: Executing shell function autotools_preconfigure
> | Previously configured separate build directory detected, cleaning
> /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/build
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_aclocals
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Python function autotools_aclocals finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.16.1
> | Copyright (C) 2018 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later
> <https://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.16
> | NOTE: Executing ACLOCAL="aclocal
> --system-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal/
> --automake-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal-1.16"
> autoreconf -Wcross --verbose --install --force --exclude=autopoint
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal
> --system-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal/
> --automake-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal-1.16
> --force
> | autoreconf: configure.ac: tracing
> | autoreconf: configure.ac: adding subdirectory CCache to autoreconf
> | autoreconf: Entering directory `CCache'
> | autoreconf: configure.ac: not using Libtool
> | autoreconf: running:
> /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoconf
> --force
> | autoreconf: running:
> /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoheader
> --force
> | autoreconf: configure.ac: not using Automake
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `CCache'
> | configure.ac:35: error: possibly undefined macro: AC_COMPILE_WARNINGS
> |       If this token and others are legitimate, please use m4_pattern_allow.
> |       See the Autoconf documentation.
> | configure.ac:2982: error: possibly undefined macro: AC_DEFINE_DIR
> | autoreconf: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoconf
> failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | WARNING: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/run.do_configure.9027:1
> exit 1 from 'exit 1'
> | ERROR: Function failed: do_configure (log file is located at
> /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027)
> ERROR: Task (virtual:native:/scratch/alistair/yocto/oe-master/meta/recipes-devtools/swig/swig_3.0.12.bb:do_configure)
> failed with exit code '1'
>
> Alistair
>
> >
> > Ross
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

