Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61B0D7BD9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 00:23:59 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l15-v6so31146060lja.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 16:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tpuArp807VSTQvNqR92l7cOSet0VMq7/lzJxdt0qvrk=;
	b=BziqMNuTQ/8XnjP3GGdu8caaJ844S2TfVFpkifB3RHeSu+Z3Ow1Yrmi5n7T5CA0Beh
	ogJCK6B1/A31pRlZhXwSF3ZVOQM2VXDP37F4yj7IQxbTnSEU5a+i0TPqaXG5b6UVUez4
	ziXpRkT//R0MKAItG/eXla90bs+B3j78k7RnRJYQCPxx6RqrLu+I8Rm6m/77r7KHhj9Q
	C/ne9f2qq2NlI3iunP30eE8RnglYwuTYa/7SDFP4+s3PvCNdXx+nYxLzlmrefJCxAsJu
	R7TBhfJcvTlXJwYu931cDMxWwdYcECvzaXO0zMVOC63twvRvd88HAUsnH+SWRFUcP7CV
	pjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tpuArp807VSTQvNqR92l7cOSet0VMq7/lzJxdt0qvrk=;
	b=aUQU0prQKoK5vFpmWOBno4C1Vq+nbqsVRx7Vjlng3+KlrAvpyc2AVSHAC11XV5xg/i
	1n62OZ+sJZYWjZ+UYjL5T6Zo/LIGNLe8hUGSHZfyF3YT3aRh+dUouVKhkXPBOX6GG5n6
	i6qdAfGDMLhKPkid/kFM3Ev6E9UOP3k024waxfg/+D79SfresckdXZRIFkx/DDIKyKzG
	W10S7wyKz37OCeaOrp60j4gri2dFkk0knpVSAD8LWZ+O0cWCPLJqHKfh7RiVLoh8zX9Y
	T0Ij0przhsqg5QzpfbtFlsB3/jHG97mt4dbNjhVXZMEsT0GtXfVj2hU7kluvlC+hTgX5
	kNIw==
X-Gm-Message-State: AJcUukf0YTtLkBwtbX+BGYfVu80O1Xjgj9yUtypkAacYzdeJjMJX5dlP
	9uolKvDHj4XC7/AOXZGPNnzbSJUFJjfckLnTnHU=
X-Google-Smtp-Source: ALg8bN5xtg8kC7yiNVkZQa+HnhfnYGzYXUf+HhJYq5AN8PAI0x2jgK2jNwHXcJjSiRk8B/Ab+bK7hwrcUW6td+ZrkBs=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr25162853lji.145.1546561439403; 
	Thu, 03 Jan 2019 16:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20190103231826.31290-1-alistair.francis@wdc.com>
	<CAJTo0LYQH+=kx8=jmxsRB6SAgf4Un+vK_0ea+NdRbVpB9Yr47w@mail.gmail.com>
	<CAKmqyKN5sAyo64g+if-t=wp6tqkjsyMLFEcbCMoZquA378fVgw@mail.gmail.com>
	<CAJTo0LZgU9gJqDSmiNxv+zWX12Og4my4FRugVEtqdyJN2-04Ng@mail.gmail.com>
In-Reply-To: <CAJTo0LZgU9gJqDSmiNxv+zWX12Og4my4FRugVEtqdyJN2-04Ng@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 16:23:31 -0800
Message-ID: <CAKmqyKNsB5iuK6J0YxQZrJ9=H7kAoNw4LtP0WUR458Cq55gh0g@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 Jan 2019 00:23:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 4:16 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Try adding EXTRA_AUTORECONF += "-I Tools/config"?

Ah! Perfect.

I'll send a v3.

Alistair

>
> Ross
>
> On Fri, 4 Jan 2019 at 00:11, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Jan 3, 2019 at 4:02 PM Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > On Thu, 3 Jan 2019 at 23:18, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > > > Fix the swig build by calling autogen.sh before running configure.
> > >
> > > But...
> > >
> > > > @@ -45,6 +45,7 @@ do_configure() {
> > > >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
> > > >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
> > > >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> > > > +    (cd ${S} && ./autogen.sh)
> > > >      oe_runconf
> > >
> > > Now this is literally just reimplementing the default do_configure
> > > from autotools.  The first three lines are gnuconfigize, autogen.sh is
> > > generally just autoreconf in modern systems, and then oe_runconf.
> > >
> > > If do_configure is just deleted, what breaks?
> >
> > This is the error I see:
> >
> > ERROR: swig-native-3.0.12-r0 do_configure: autoreconf execution failed.
> > ERROR: swig-native-3.0.12-r0 do_configure: Function failed:
> > do_configure (log file is located at
> > /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027)
> > ERROR: Logfile of failure stored in:
> > /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027
> > Log data follows:
> > | DEBUG: Executing shell function autotools_preconfigure
> > | Previously configured separate build directory detected, cleaning
> > /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/build
> > | DEBUG: Shell function autotools_preconfigure finished
> > | DEBUG: Executing python function autotools_aclocals
> > | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> > 'bit-64', 'x86_64-linux', 'common']
> > | DEBUG: Python function autotools_aclocals finished
> > | DEBUG: Executing shell function do_configure
> > | automake (GNU automake) 1.16.1
> > | Copyright (C) 2018 Free Software Foundation, Inc.
> > | License GPLv2+: GNU GPL version 2 or later
> > <https://gnu.org/licenses/gpl-2.0.html>
> > | This is free software: you are free to change and redistribute it.
> > | There is NO WARRANTY, to the extent permitted by law.
> > |
> > | Written by Tom Tromey <tromey@redhat.com>
> > |        and Alexandre Duret-Lutz <adl@gnu.org>.
> > | AUTOV is 1.16
> > | NOTE: Executing ACLOCAL="aclocal
> > --system-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal/
> > --automake-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal-1.16"
> > autoreconf -Wcross --verbose --install --force --exclude=autopoint
> > | autoreconf: Entering directory `.'
> > | autoreconf: configure.ac: not using Gettext
> > | autoreconf: running: aclocal
> > --system-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal/
> > --automake-acdir=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/share/aclocal-1.16
> > --force
> > | autoreconf: configure.ac: tracing
> > | autoreconf: configure.ac: adding subdirectory CCache to autoreconf
> > | autoreconf: Entering directory `CCache'
> > | autoreconf: configure.ac: not using Libtool
> > | autoreconf: running:
> > /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoconf
> > --force
> > | autoreconf: running:
> > /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoheader
> > --force
> > | autoreconf: configure.ac: not using Automake
> > | autoreconf: running: gnu-configize
> > | autoreconf: Leaving directory `CCache'
> > | configure.ac:35: error: possibly undefined macro: AC_COMPILE_WARNINGS
> > |       If this token and others are legitimate, please use m4_pattern_allow.
> > |       See the Autoconf documentation.
> > | configure.ac:2982: error: possibly undefined macro: AC_DEFINE_DIR
> > | autoreconf: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/recipe-sysroot-native/usr/bin/autoconf
> > failed with exit status: 1
> > | ERROR: autoreconf execution failed.
> > | WARNING: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/run.do_configure.9027:1
> > exit 1 from 'exit 1'
> > | ERROR: Function failed: do_configure (log file is located at
> > /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/x86_64-linux/swig-native/3.0.12-r0/temp/log.do_configure.9027)
> > ERROR: Task (virtual:native:/scratch/alistair/yocto/oe-master/meta/recipes-devtools/swig/swig_3.0.12.bb:do_configure)
> > failed with exit code '1'
> >
> > Alistair
> >
> > >
> > > Ross
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

