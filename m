Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCA107BD84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 00:11:28 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id c16so24345181lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 16:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y8AG8uQbp74svlrCNoiRJxrQERhJ98emudgoKo6TjIM=;
	b=J1D9J40xYyW8sW7lXqMo4W8+UraGCd/uvI5PVbXYpzmUS77wfTKqMpzLe/r2lTQj6s
	FVqg0oSqe789xGNvh7nSi/5nnELF9bRNzBe04OtMKCG7UA7X+avAHIJbQR8kmq1BPQZo
	hmJGKH1+kySNw9h97zAjWd/eSyLpwo4E44MyF9b39p2bZjN83zu/QWWpEoFa+HMxZR86
	0+th00fL9+x9/Ta52gRKLlhtCj7zTHTBthDF5LzXuKLeR80jWv7dRC+cH2XKeKTS0hSa
	owhaz/zw7qS0n/q2Iv6tJgrmZEQW9/Qa8m0+8wideN55BbMOgoYseBBAww+yvIL2V9rk
	iKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y8AG8uQbp74svlrCNoiRJxrQERhJ98emudgoKo6TjIM=;
	b=i7IDn3z8RxHq0f5YWtGdBBIy9jY7R7fuLJfgcIwAk1fL9+srwhg2xqLSFOfF74+Fqh
	9k7/78B9izbrv8qvFsUvZNiNuXCfz0enl+Quoq26wPX7aT7CMnHVU6I0sApHjHiYKwPI
	3zNp8aNfqeRzfexOF5ArQKhfBTQaVtdNAm9vrVjscBMgE6+J94ZMHevOqVnreSlTw9pi
	iCEg2JxWNg+EpcA/UVncShA1x9b8FquomzqGYxHRE89mYCxnqKyAwhNGr+K2CC1+Jntf
	3cQvS/CqZJXFyjRJdNbh6s2hGDq9cdrCLqK8gL6sBajz+jCteDa4RgHjOADHnRp5plWe
	MgAw==
X-Gm-Message-State: AA+aEWZSuoOad+uc/NNFFHOuSFqthv3Rl33SiEldgN4ko+RGDXrBKwKn
	btf944n6pa3LSntnIx+egFlyfVIKW3wxa6Y6UTA=
X-Google-Smtp-Source: AFSGD/WjpyqS1sWVyXzyq6WRHam28cFnAKV5/eDpS4DT/QRNG//V4uFTaxwKu1x5NcMq9/wfxORnNUpxh/xwInyy7Ds=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr22695879lff.59.1546560688984;
	Thu, 03 Jan 2019 16:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20190103231826.31290-1-alistair.francis@wdc.com>
	<CAJTo0LYQH+=kx8=jmxsRB6SAgf4Un+vK_0ea+NdRbVpB9Yr47w@mail.gmail.com>
In-Reply-To: <CAJTo0LYQH+=kx8=jmxsRB6SAgf4Un+vK_0ea+NdRbVpB9Yr47w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 16:11:01 -0800
Message-ID: <CAKmqyKN5sAyo64g+if-t=wp6tqkjsyMLFEcbCMoZquA378fVgw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Fri, 04 Jan 2019 00:11:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 4:02 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 3 Jan 2019 at 23:18, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > Fix the swig build by calling autogen.sh before running configure.
>
> But...
>
> > @@ -45,6 +45,7 @@ do_configure() {
> >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
> >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
> >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> > +    (cd ${S} && ./autogen.sh)
> >      oe_runconf
>
> Now this is literally just reimplementing the default do_configure
> from autotools.  The first three lines are gnuconfigize, autogen.sh is
> generally just autoreconf in modern systems, and then oe_runconf.
>
> If do_configure is just deleted, what breaks?

This is the error I see:

ERROR: swig-native-3.0.12-r0 do_configure: autoreconf execution failed.
ERROR: swig-native-3.0.12-r0 do_configure: Function failed:
do_configure (log file is located at
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027)
ERROR: Logfile of failure stored in:
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027
Log data follows:
| DEBUG: Executing shell function autotools_preconfigure
| Previously configured separate build directory detected, cleaning
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/build
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.1
| Copyright (C) 2018 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
<https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal
--system-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal/
--automake-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal-1.16"
autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
--system-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal/
--automake-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal-1.16
--force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: adding subdirectory CCache to autoreconf
| autoreconf: Entering directory `CCache'
| autoreconf: configure.ac: not using Libtool
| autoreconf: running:
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoconf
--force
| autoreconf: running:
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoheader
--force
| autoreconf: configure.ac: not using Automake
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `CCache'
| configure.ac:35: error: possibly undefined macro: AC_COMPILE_WARNINGS
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| configure.ac:2982: error: possibly undefined macro: AC_DEFINE_DIR
| autoreconf: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoconf
failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/run.do_configure.9027:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_configure (log file is located at
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027)
ERROR: Task (virtual:native:/scratch/alistair/yocto/oe-master/meta/recipes-devtools/swig/swig_3.0.12.bb:do_configure)
failed with exit code '1'

Alistair

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

