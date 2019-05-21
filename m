Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id D80D77E226
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:40:06 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q17so13493157lfo.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Vd+XuFjoQ0q0GaXNsb0DfEcLTrDVo2LcInOZ72qN3E=;
	b=eqIZKEuEAk0ObeLf5nimolaaF4T9HQNMMWpQ3O+tQcuMLGYDwBdUSH7Ls6JKgpZqo5
	I5DcwZp6BAbkrtZKeD2oQzzEasF9YlG2zaIntWqddOEg1mqVOBUYKk+LpNlE5iE3E7Y3
	Y0OXSadwCwVwhCNEPW4I4rT7StHt3cjxCiu/r50rMOiVSdFtaikyNjfepgUDhjd5blSh
	sLBgUviPbF1pEl2Y3daaMaQ22+gjcn7Mk5j2TmJiZMdg05nxF1Ur/+QANCE4uh3rpYNh
	sfZtNINjgODsWOmua/Wbpvs8175VX+gPrj+7wrFMglwNzt9kc+0l68U5pk90Ytcw9GTO
	qN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Vd+XuFjoQ0q0GaXNsb0DfEcLTrDVo2LcInOZ72qN3E=;
	b=Ui2WOiX5Abpf6GpbRlv40nvtPnMK8ym0dnvShfMHdxeiMGKW8x9h1cCd3cXvgYBWlS
	G5K3yzCGj8TsQxuXYSSO+3thMH059VnlqART14RbqLzLvHOegRTKE1TSPheM7IPrYLek
	UucffRiI+dLrQUuo6hT4F7DvodBr6t/mxdvZ2bATg6A1GGdoyrlO/k+RO+bJLKvkS1MF
	ef7mlNfF7n8v8dfjof769QxLhvp5esyTH/0K3d20nB6OUvwH7YdJGz/wI0A248H3a9LJ
	WS8HsmRlPyaf8x1seHZLHqAKcaonaBTSmwJdZtVrTSGKDk1JvBY0GmT3il97QEFiPy3N
	XtXw==
X-Gm-Message-State: APjAAAUv55Eie2RXUphIkZAdLfEq812WsaT40+zCR1nL88UGpR+NPcUM
	1JMgOFcOZQbqqfhHxfzCRWyGLvohfndpT2w40fo=
X-Google-Smtp-Source: APXvYqy8lp2jOqGod88pdhArfhdsaABJP07wK2FLBOZLn/RfvVCpZ8QSPkZAuuhFlTKlX8llIpSpBwRnUZPibLNTAKE=
X-Received: by 2002:ac2:518e:: with SMTP id u14mr3164162lfi.120.1558453207258; 
	Tue, 21 May 2019 08:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190517235308.4139-1-alistair.francis@wdc.com>
	<5677817951fee18102345b773c66546f550bb3e6.camel@linuxfoundation.org>
In-Reply-To: <5677817951fee18102345b773c66546f550bb3e6.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 May 2019 08:37:51 -0700
Message-ID: <CAKmqyKNx0ygQ=0+24x3A8K4HjuZo1oWZ+0dtkd1RCZpKSxSx0A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Tue, 21 May 2019 15:40:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 12:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-05-17 at 16:53 -0700, Alistair Francis wrote:
> > Bump GDB and change the oeqa selftest expression to allow ptests to
> > pass.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >  meta/lib/oeqa/selftest/cases/package.py       |  2 +-
> >  .../gdb/{gdb-8.2.1.inc => gdb-8.3.inc}        | 12 +--
> >  .../gdb/gdb-cross-canadian.inc                |  1 -
> >  ...ian_8.2.1.bb => gdb-cross-canadian_8.3.bb} |  0
> >  .../{gdb-cross_8.2.1.bb => gdb-cross_8.3.bb}  |  0
> >  ...1-Fix-build-with-latest-GCC-9.0-tree.patch | 50 ----------
> >  ...h => 0001-gdbserver-ctrl-c-handling.patch} |  0
> >  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 23 ++---
> >  ...-Use-exorted-definitions-of-SIGRTMIN.patch | 16 ++-
> >  ...h64-Fix-the-gdb-build-with-musl-libc.patch | 52 ----------
> >  .../gdb/gdb/CVE-2017-9778.patch               | 99 ---------------
> > ----
> >  .../gdb/{gdb_8.2.1.bb => gdb_8.3.bb}          |  0
> >  13 files changed, 23 insertions(+), 234 deletions(-)
> >  rename meta/recipes-devtools/gdb/{gdb-8.2.1.inc => gdb-8.3.inc}
> > (73%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.2.1.bb =>
> > gdb-cross-canadian_8.3.bb} (100%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross_8.2.1.bb => gdb-
> > cross_8.3.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-Fix-build-
> > with-latest-GCC-9.0-tree.patch
> >  rename meta/recipes-devtools/gdb/gdb/{gdbserver-ctrl-c-
> > handling.patch => 0001-gdbserver-ctrl-c-handling.patch} (100%)
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-
> > the-gdb-build-with-musl-libc.patch
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
> >  rename meta/recipes-devtools/gdb/{gdb_8.2.1.bb => gdb_8.3.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> > b/meta/conf/distro/include/tcmode-default.inc
> > index 668f31324e..744c6c3247 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -21,7 +21,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> >  GCCVERSION ?= "8.%"
> >  SDKGCCVERSION ?= "${GCCVERSION}"
> >  BINUVERSION ?= "2.32%"
> > -GDBVERSION ?= "8.2%"
> > +GDBVERSION ?= "8.3%"
> >  GLIBCVERSION ?= "2.29%"
> >  LINUXLIBCVERSION ?= "5.0%"
> >  QEMUVERSION ?= "4.0%"
> > diff --git a/meta/lib/oeqa/selftest/cases/package.py
> > b/meta/lib/oeqa/selftest/cases/package.py
> > index 7a00753821..aa13a8df76 100644
> > --- a/meta/lib/oeqa/selftest/cases/package.py
> > +++ b/meta/lib/oeqa/selftest/cases/package.py
> > @@ -134,7 +134,7 @@ class PackageTests(OESelftestTestCase):
> >                      return False
> >
> >                  # Check debugging symbols works correctly
> > -                elif "Breakpoint 1, main () at hello.c:4" in l:
> > +                elif re.match("Breakpoint 1.*hello\.c.*4", l):
> >                      return True
> >
> >              self.logger.error("GDB result:\n%d: %s", status, output)
>
>
> 2019-05-20 19:03:42,463 - oe-selftest - INFO - ======================================================================
> 2019-05-20 19:03:42,463 - oe-selftest - INFO - ERROR: package.PackageTests.test_gdb_hardlink_debug (subunit.RemotedTestCase)
> 2019-05-20 19:03:42,464 - oe-selftest - INFO - ----------------------------------------------------------------------
> 2019-05-20 19:03:42,464 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/package.py", line 148, in test_gdb_hardlink_debug
>     if not gdbtest(qemu, binary):
>   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/package.py", line 137, in gdbtest
>     elif re.match("Breakpoint 1.*hello\.c.*4", l):
> NameError: name 're' is not defined

Argh! I ran the tests but it must not have trigger the GDB test. I see
that you fixed it and pushed it to master, thanks for that.

Alistair

>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

