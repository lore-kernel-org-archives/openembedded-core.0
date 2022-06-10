Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E212C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 11:49:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.25936.1654861760336187027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 04:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=duYm+8bY;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so1040822wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZhW+s9KylKIGlDoLvqqVl+OUaZ1KirYOzm2La2ErZg=;
        b=duYm+8bYU/w3Je4pN1CQXAKUO9ppOXFjLGBqWxOns8fL3pAY5nEvXtje3zLUJIoEgW
         KAQ+WBPSHsrLjYtoHEqVWkmv0266qJsoqxBbr/pcxX6YnSiloU1MRQa/lFos6Mv/VwqO
         O7cpd6LVQhs5SUhjweALFy1HWDldVkkXf5VpMRMOmtk/UFR582ztUjtt06QRrqgzZfXm
         YTgwfpsArQChYHVLj9tYYsb7uFQz30nCQj7A32JwKgxUVV+BwOoYqbVclDMXS6scSIrj
         CPhJxuH5D9YHsLlBsjkWUyeXTlazZRu/kFO2UfcMwnEd6zslzyACi118pLxWyg97pnF3
         G4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZhW+s9KylKIGlDoLvqqVl+OUaZ1KirYOzm2La2ErZg=;
        b=DfZEM27Nqqcu6OW+67aoGKkbpEYml7m9G/jckEF0ddyFsNvVVNtWdtg8iXxzwFeTey
         5xM1nzxu/7+qMfscPK8Dxy0gvX263tE6mcB2EaZBu8Xw5vNtd0cuYPiW7jUHDIrrLFdd
         Y4FP8AAn72LlAh4soEtWD/2PdNEDBtfH8x/thufWBlw5F6DECHFR3oYlSUU5fYgor0s8
         HpDg7ntlGVuYGFka1lAtdmdaXJsrWF9M29VibA5forS24B3V3PVNvLOgr0c3JRdnufmn
         2F5W3WxEUmX2qMzR+pvQGv5qJJn3nO4LynfEh58Qgm7V6cuyaYWcvkHq4k6226f2C53R
         R68g==
X-Gm-Message-State: AOAM530YMIT2l0I95JMg7u6elIyHD4LMvH4lNXMaYd/HHOvM0DdS3261
	XZdVFE3LXL01IwXlHId+Efzuw25IXGoKdBrdsN8=
X-Google-Smtp-Source: 
 ABdhPJxqhEx8t2Iz5fQ6jtnsG0zJ2VCS7k9rWXYLKegJ5fGGonflEYJ3ZKk93rod00uOmkZpxL24KrcZ9MIMfhpk0rc=
X-Received: by 2002:a7b:c057:0:b0:39c:4579:42e1 with SMTP id
 u23-20020a7bc057000000b0039c457942e1mr8330142wmc.102.1654861758610; Fri, 10
 Jun 2022 04:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220606120126.3381438-1-alex@linutronix.de>
 <20220606120126.3381438-18-alex@linutronix.de>
 <CA+chaQfAtrfQttR6rEVgMCV7CrXzRDUyVcW=ujFSc9uic-3CFQ@mail.gmail.com>
 <f5cea24f326b0450d8c5ae14a1edb8a10b2526d1.camel@linuxfoundation.org>
 <16F701C5780AB8CB.2506@lists.openembedded.org>
In-Reply-To: <16F701C5780AB8CB.2506@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jun 2022 13:49:06 +0200
Message-ID: 
 <CA+chaQeJeeHJhNDZY2-MVDmmFKAyU0ocm6LnvhX17StseDDcAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/21] perl: update 5.34.1 -> 5.36.0
To: Martin.Jansa@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000004642e205e11687c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 11:49:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166798

--0000000000004642e205e11687c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Small update:

This hang is definitely caused by:
https://git.openembedded.org/openembedded-core/commit/?id=3D00aeb84a5e7c6d4=
293fb4cd30dd1e28d60c6aac5

I've reproduced this issue with master 5 times with:
oe-selftest -r buildoptions.ImageOptionsTests.test_ccache_tool

then after reverting 00aeb84a5e7c6d4293fb4cd30dd1e28d60c6aac5 it passed 3
times and failed again when I've restored this commit.

I have huge 852M    install.man-make-native-4.3.j2.trace.d.log

where it looks like make-native ends in neverending loop, make from gentoo
has the same issue (when just called with full path as /usr/bin/make -d
--trace -j 2 install.man
'DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0=
-r0/image'
2>&1 | tee install.man-make-gentoo-4.3.j2.trace.d.log).

With -j 1 in the same directory it works fine.

perl-native/5.36.0-r0/perl-5.36.0 $ grep Considering.target.file..nonxs_ext
install.man-make-gentoo-4.3.j2.trace.d.log | wc -l
7621

The relevant (I hope) part of the log looks like:
       Pruning file 'ext/Sys-Hostname/pm_to_blib'.
       Pruning file 'ext/XS-APItest/pm_to_blib'.
       Pruning file 'ext/XS-Typemap/pm_to_blib'.
      Finished prerequisites of target file 'dynamic_ext'.
     The prerequisites of 'dynamic_ext' are being made.
     Considering target file 'static_ext'.
     File 'static_ext' was considered already.
     Finished prerequisites of target file 'extensions'.
    The prerequisites of 'extensions' are being made.
    Finished prerequisites of target file 'modules'.
   The prerequisites of 'modules' are being made.
   Finished prerequisites of target file 'pod/perltoc.pod'.
  The prerequisites of 'pod/perltoc.pod' are being made.
  Pruning file 'miniperl'.
 Finished prerequisites of target file 'install.man'.
The prerequisites of 'install.man' are being made.
Live child 0x55a28372eaf0 (ext/XS-Typemap/Makefile) PID 517626
Generating a Unix-style Makefile
Writing Makefile for XS::Typemap
Reaping winning child 0x55a28372eaf0 PID 517626
Removing child 0x55a28372eaf0 PID 517626 from chain.
Considering target file 'install.man'.
 File 'install.man' does not exist.
  Considering target file 'installman'.
  File 'installman' was considered already.
  Considering target file 'pod/perltoc.pod'.
    Considering target file 'pod/buildtoc'.
    File 'pod/buildtoc' was considered already.
    Considering target file 'miniperl'.
    File 'miniperl' was considered already.
    Considering target file 'modules'.
     File 'modules' does not exist.
      Considering target file 'extensions'.
       File 'extensions' does not exist.
        Considering target file 'cflags'.
        File 'cflags' was considered already.
        Considering target file 'nonxs_ext'.
         File 'nonxs_ext' does not exist.
          Considering target file 'cpan/Archive-Tar/pm_to_blib'.
          File 'cpan/Archive-Tar/pm_to_blib' was considered already.
          Considering target file 'cpan/autodie/pm_to_blib'.
          File 'cpan/autodie/pm_to_blib' was considered already.
......
          Considering target file 'dist/ExtUtils-CBuilder/pm_to_blib'.
          File 'dist/ExtUtils-CBuilder/pm_to_blib' was considered already.
          Considering target file 'dist/ExtUtils-ParseXS/pm_to_blib'.
            Considering target file 'dist/ExtUtils-ParseXS/Makefile'.
            File 'dist/ExtUtils-ParseXS/Makefile' was considered already.
            Considering target file 'dist/ExtUtils-ParseXS/ppport.h'.
              Considering target file 'dist/Devel-PPPort/ppport.h'.
                Considering target file 'dist/Devel-PPPort/PPPort.pm'.
                  Considering target file 'dist/Devel-PPPort/pm_to_blib'.
                    Considering target file 'dist/Devel-PPPort/Makefile'.
                    File 'dist/Devel-PPPort/Makefile' was considered
already.
                     Considering target file 'DynaLoader.o'.
                       Considering target file 'ext/DynaLoader/pm_to_blib'.
                        Finished prerequisites of target file
'ext/DynaLoader/pm_to_blib'.
                       The prerequisites of 'ext/DynaLoader/pm_to_blib' are
being made.
                      Finished prerequisites of target file 'DynaLoader.o'.
                     The prerequisites of 'DynaLoader.o' are being made.
                    Pruning file 'DynaLoader.o'.
                    Pruning file 'dist/ExtUtils-CBuilder/pm_to_blib'.
                   Finished prerequisites of target file
'dist/Devel-PPPort/pm_to_blib'.
                  The prerequisites of 'dist/Devel-PPPort/pm_to_blib' are
being made.
                 Finished prerequisites of target file
'dist/Devel-PPPort/PPPort.pm'.
                The prerequisites of 'dist/Devel-PPPort/PPPort.pm' are
being made.
                Pruning file 'miniperl'.
               Finished prerequisites of target file
'dist/Devel-PPPort/ppport.h'.
              The prerequisites of 'dist/Devel-PPPort/ppport.h' are being
made.
             Finished prerequisites of target file
'dist/ExtUtils-ParseXS/ppport.h'.
            The prerequisites of 'dist/ExtUtils-ParseXS/ppport.h' are being
made.
           Finished prerequisites of target file
'dist/ExtUtils-ParseXS/pm_to_blib'.
          The prerequisites of 'dist/ExtUtils-ParseXS/pm_to_blib' are being
made.
          Considering target file 'dist/Filter-Simple/pm_to_blib'.
          File 'dist/Filter-Simple/pm_to_blib' was considered already.
          Considering target file 'dist/FindBin/pm_to_blib'.
.....
          Considering target file 'ext/Tie-Memoize/pm_to_blib'.
          File 'ext/Tie-Memoize/pm_to_blib' was considered already.
         Finished prerequisites of target file 'nonxs_ext'.
        The prerequisites of 'nonxs_ext' are being made.
        Considering target file 'dynamic_ext'.
         File 'dynamic_ext' does not exist.
          Considering target file 'cpan/Compress-Raw-Bzip2/pm_to_blib'.
            Considering target file 'cpan/Compress-Raw-Bzip2/Makefile'.
            File 'cpan/Compress-Raw-Bzip2/Makefile' was considered already.
            Pruning file 'DynaLoader.o'.
            Pruning file 'dist/ExtUtils-CBuilder/pm_to_blib'.
           Finished prerequisites of target file
'cpan/Compress-Raw-Bzip2/pm_to_blib'.
          The prerequisites of 'cpan/Compress-Raw-Bzip2/pm_to_blib' are
being made.
          Considering target file 'cpan/Compress-Raw-Zlib/pm_to_blib'.
....
          The prerequisites of 'ext/XS-Typemap/pm_to_blib' are being made.
         Finished prerequisites of target file 'dynamic_ext'.
        The prerequisites of 'dynamic_ext' are being made.
        Considering target file 'static_ext'.
        File 'static_ext' was considered already.
       Considering target file 'nonxs_ext'.
        File 'nonxs_ext' does not exist.
         Pruning file 'cpan/Archive-Tar/pm_to_blib'.
         Pruning file 'cpan/autodie/pm_to_blib'.
         Pruning file 'cpan/AutoLoader/pm_to_blib'.
....
         Pruning file 'ext/Tie-Hash-NamedCapture/pm_to_blib'.
         Pruning file 'ext/Tie-Memoize/pm_to_blib'.
        Finished prerequisites of target file 'nonxs_ext'.
       The prerequisites of 'nonxs_ext' are being made.
       Considering target file 'dynamic_ext'.
        File 'dynamic_ext' does not exist.
         Pruning file 'cpan/Compress-Raw-Bzip2/pm_to_blib'.
         Pruning file 'cpan/Compress-Raw-Zlib/pm_to_blib'.
...
         Pruning file 'ext/XS-APItest/pm_to_blib'.
         Pruning file 'ext/XS-Typemap/pm_to_blib'.
        Finished prerequisites of target file 'dynamic_ext'.
       The prerequisites of 'dynamic_ext' are being made.
       Considering target file 'static_ext'.
       File 'static_ext' was considered already.
       Finished prerequisites of target file 'extensions'.
      The prerequisites of 'extensions' are being made.
     Considering target file 'extensions'.
      File 'extensions' does not exist.
       Pruning file 'cflags'.
       Pruning file 'nonxs_ext'.
       Pruning file 'dynamic_ext'.
       Pruning file 'static_ext'.
      Considering target file 'nonxs_ext'.
       File 'nonxs_ext' does not exist.
        Pruning file 'cpan/Archive-Tar/pm_to_blib'.
        Pruning file 'cpan/autodie/pm_to_blib'.
....
       Pruning file 'ext/XS-APItest/pm_to_blib'.
        Pruning file 'ext/XS-Typemap/pm_to_blib'.
       Finished prerequisites of target file 'dynamic_ext'.
      The prerequisites of 'dynamic_ext' are being made.
      Considering target file 'static_ext'.
      File 'static_ext' was considered already.
      Finished prerequisites of target file 'extensions'.
     The prerequisites of 'extensions' are being made.
     Finished prerequisites of target file 'modules'.
    The prerequisites of 'modules' are being made.
    Considering target file 'extra.pods'.
    File 'extra.pods' was considered already.
    Considering target file 'pod/perlapi.pod'.
    File 'pod/perlapi.pod' was considered already.
    Considering target file 'pod/perlintern.pod'.
    File 'pod/perlintern.pod' was considered already.
    Considering target file 'pod/perlmodlib.pod'.
    File 'pod/perlmodlib.pod' was considered already.
    Considering target file 'pod/perluniprops.pod'.
    File 'pod/perluniprops.pod' was considered already.
    Considering target file 'pod/perl5360delta.pod'.
    File 'pod/perl5360delta.pod' was considered already.
   Considering target file 'modules'.
    File 'modules' does not exist.
     Pruning file 'extensions'.
    Considering target file 'extensions'.
     File 'extensions' does not exist.
      Pruning file 'cflags'.
      Pruning file 'nonxs_ext'.
      Pruning file 'dynamic_ext'.
      Pruning file 'static_ext'.
     Considering target file 'nonxs_ext'.
      File 'nonxs_ext' does not exist.
       Pruning file 'cpan/Archive-Tar/pm_to_blib'.
       Pruning file 'cpan/autodie/pm_to_blib'.
....
       Pruning file 'ext/XS-APItest/pm_to_blib'.
       Pruning file 'ext/XS-Typemap/pm_to_blib'.
      Finished prerequisites of target file 'dynamic_ext'.
     The prerequisites of 'dynamic_ext' are being made.
     Considering target file 'static_ext'.
     File 'static_ext' was considered already.
     Finished prerequisites of target file 'extensions'.
    The prerequisites of 'extensions' are being made.
    Finished prerequisites of target file 'modules'.
   The prerequisites of 'modules' are being made.
   Finished prerequisites of target file 'pod/perltoc.pod'.
  The prerequisites of 'pod/perltoc.pod' are being made.
  Pruning file 'miniperl'.
 Finished prerequisites of target file 'install.man'.
The prerequisites of 'install.man' are being made.
Considering target file 'install.man'.
 File 'install.man' does not exist.
  Considering target file 'installman'.
  File 'installman' was considered already.
  Considering target file 'pod/perltoc.pod'.
    Considering target file 'pod/buildtoc'.
    File 'pod/buildtoc' was considered already.
    Considering target file 'miniperl'.
    File 'miniperl' was considered already.
    Considering target file 'modules'.
     File 'modules' does not exist.
      Considering target file 'extensions'.
       File 'extensions' does not exist.
        Considering target file 'cflags'.
        File 'cflags' was considered already.
        Considering target file 'nonxs_ext'.
         File 'nonxs_ext' does not exist.
          Considering target file 'cpan/Archive-Tar/pm_to_blib'.
          File 'cpan/Archive-Tar/pm_to_blib' was considered already.

and then it repeats in never-ending loop, only make using 100% CPU and even
on smaller log:
120M    install.man-make-gentoo-4.3.j2.trace.d.log

it considers nonxs_ext too many times (before I've killed the make):
x86_64-linux/perl-native/5.36.0-r0/perl-5.36.0 $ grep
Considering.target.file..nonxs_ext
install.man-make-gentoo-4.3.j2.trace.d.log | wc -l
7621

Will try to narrow this even more and produce the debug/trace output from
working case for comparison, just wanted to share the update in case
someone sees what's wrong right away.

I still wasn't able to reproduce this outside poky build "bitbake
libgcc-initial -f -c compile" with INHERIT +=3D "ccache" in local.conf in
build dir without sstate-cache populated isn't enough to reproduce
what buildoptions.ImageOptionsTests.test_ccache_tool somehow triggers, but
YMMV, let me know if you have seen this or can reproduce it with selftest
as well.

Cheers,

On Thu, Jun 9, 2022 at 6:48 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> I was reading
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13244
> and your e-mail about the make issue in perl, but in my case it looks a
> bit different I think.
>
> It was with the make-native dependency, but happens only in
> selftest test_ccache_tool:
>
> 2022-06-09 11:30:21,855 - oe-selftest - INFO - test_ccache_tool
> (buildoptions.ImageOptionsTests.test_ccache_tool)
> 2022-06-09 12:53:41,855 - oe-selftest - INFO - Keepalive message
> 2022-06-09 14:17:01,856 - oe-selftest - INFO - Keepalive message
> 2022-06-09 15:40:21,856 - oe-selftest - INFO - Keepalive message
> ^^ was what triggered me to look where it got stuck.
>
> I can build perl-native fine in my other oe-core nodistro build directory
> and now I've built it ok also in regular poky build directory as in:
> 5f249a407f6 vim: put xxd in its own package
>
> While the selftest was stuck I was checking where exactly it got stuck in
> the WORKDIR and
> oe_runmake -j 1 installman
> 'DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36=
.0-r0/image'
> install 2>&1 | tee installman.log
> finished fine, while:
> oe_runmake -j 2 installman
> 'DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36=
.0-r0/image'
> install 2>&1  | tee installman.log
> was getting stuck:
>
> ....
> Generating a Unix-style Makefile
> Writing Makefile for Sys::Hostname
> cd ext/XS-Typemap/ && ../../miniperl_top -I../../lib Makefile.PL \
>  INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \
>  PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D"../../miniperl_top"
> Generating a Unix-style Makefile
> Writing Makefile for XS::APItest
> Generating a Unix-style Makefile
> Writing Makefile for XS::Typemap
>
> With -n, it looks like it got stuck just before building buildtoc:
>
> ....
> cd ext/XS-APItest/ && ../../miniperl_top -I../../lib Makefile.PL \
>  INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \
>  PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D"../../miniperl_top"
> cd ext/XS-Typemap/ && ../../miniperl_top -I../../lib Makefile.PL \
>  INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \
>  PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D"../../miniperl_top"
> ./miniperl_top -f pod/buildtoc -q
> ./miniperl_top installman
> --destdir=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.3=
6.0-r0/image
>
> make[1]: Leaving directory
> '/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl=
-5.36.0'
>
> It didn't start miniperl_top (which itself works fine):
> martin@jama
> /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-=
5.36.0
> $ ./miniperl_top -f pod/buildtoc -q
> martin@jama
> /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-=
5.36.0
> $ echo $?
> 0
>
> martin   3016692  0.0  0.0  99860  2788 ?        S    17:47   0:00 make -=
j
> 40
> DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.=
0-r0/image
> install
> martin   3016738 99.9  0.0 101440  4184 ?        R    17:47  56:21 make
> install.man
>
> Attaching to process 3016738
> Reading symbols from
> /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/recip=
e-sysroot-native/usr/bin/make...
> (No debugging symbols found in
> /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/recip=
e-sysroot-native/usr/bin/make)
> Reading symbols from
> /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6=
...
> Reading symbols from
> /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/li=
bc.so.6...
> Reading symbols from
> /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-=
x86-64.so.2...
> Reading symbols from
> /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/ld=
-linux-x86-64.so.2...
> (No debugging symbols found in
> /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/ld=
-linux-x86-64.so.2)
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/usr/lib64/libthread_db.so.1".
> 0x000055c946453a1f in ?? ()
> (gdb) bt
> #0  0x000055c946453a1f in ?? ()
> #1  0x000055c946452bf3 in ?? ()
> #2  0x000055c946453b98 in ?? ()
> #3  0x000055c946452bf3 in ?? ()
> #4  0x000055c946453b98 in ?? ()
> #5  0x000055c946452bf3 in ?? ()
> #6  0x000055c946453b98 in ?? ()
> #7  0x000055c946452bf3 in ?? ()
> #8  0x000055c946453b98 in ?? ()
> #9  0x000055c946452bf3 in ?? ()
> #10 0x000055c946453fd6 in update_goal_chain ()
> #11 0x000055c946438df3 in main ()
> (gdb)
>
> I've reproduced this twice today, so I was assuming it's just new separat=
e
> issue from new perl version - that's why I was asking if someone else is
> seeing this behavior now.
>
> I'll try to reproduce this with ccache enabled in regular build (I
> normally don't use poky nor selftest). If it fails again, I'll enable deb=
ug
> for make-native (or switch back to make-4.3 from gentoo).
>
> Regards,
>
> On Thu, Jun 9, 2022 at 6:21 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2022-06-09 at 14:44 +0200, Martin Jansa wrote:
>> > On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin <
>> alex.kanavin@gmail.com> wrote:
>> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > > ---
>> > >  .../{perlcross_1.3.7.bb =3D> perlcross_1.4.bb}  |  2 +-
>> > >  .../perl/files/perl-configpm-switch.patch     |  2 +-
>> > >  .../perl/files/perl-dynloader.patch           |  2 +-
>> > >  .../perl/files/perl-rdepends.txt              | 49
>> ++++++++++++-------
>> > >  .../perl/{perl_5.34.1.bb =3D> perl_5.36.0.bb}   |  2 +-
>> > >  5 files changed, 35 insertions(+), 22 deletions(-)
>> > >  rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb =3D>
>> perlcross_1.4.bb} (92%)
>> > >  rename meta/recipes-devtools/perl/{perl_5.34.1.bb =3D> perl_5.36.0.=
bb}
>> (99%)
>> > >
>> >
>> >
>> > Have anyone else seen perl.do_install getting stuck with this new shin=
y
>> version as well?
>> >
>> >  690770 martin      20   0 10020  3700  3196 S   0.0  0.0  0:00.00 =E2=
=94=82
>>      =E2=94=94=E2=94=80 /bin/sh
>> /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/temp=
/run.do_install.690768
>> >  690771 martin      20   0 99860  1948  1364 S   0.0  0.0  0:00.00 =E2=
=94=82
>>         =E2=94=94=E2=94=80 make -j 40
>> DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36=
.0-r0/image
>> install
>> >  690816 martin      20   0   99M  3340  1428 R 102.1  0.0  3h06:44 =E2=
=94=82
>>            =E2=94=94=E2=94=80 make install.man
>>
>> I've seen perl and the kernel hang in make for some versions, I did try
>> and put a warning about the known Fedora issue. Was this with the
>> recent make-native dependency added? If so that would indicate it is
>> potentially a bug in the current make version :(
>>
>> Cheers,
>>
>> Richard
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166786):
> https://lists.openembedded.org/g/openembedded-core/message/166786
> Mute This Topic: https://lists.openembedded.org/mt/91575167/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004642e205e11687c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Small update:<div><br></div><div>This hang is definitely c=
aused by:</div><div><a href=3D"https://git.openembedded.org/openembedded-co=
re/commit/?id=3D00aeb84a5e7c6d4293fb4cd30dd1e28d60c6aac5">https://git.opene=
mbedded.org/openembedded-core/commit/?id=3D00aeb84a5e7c6d4293fb4cd30dd1e28d=
60c6aac5</a><br></div><div><br></div><div>I&#39;ve reproduced this issue wi=
th master 5 times with:</div><div>oe-selftest -r buildoptions.ImageOptionsT=
ests.test_ccache_tool<br></div><div><br></div><div>then after reverting=C2=
=A000aeb84a5e7c6d4293fb4cd30dd1e28d60c6aac5 it passed 3 times and failed ag=
ain when I&#39;ve restored this commit.</div><div><br></div><div>I have hug=
e 852M =C2=A0 =C2=A0install.man-make-native-4.3.j2.trace.d.log</div><div><b=
r></div><div>where it looks like make-native ends in neverending loop,=C2=
=A0make from gentoo has the same issue (when just called with full path as=
=C2=A0/usr/bin/make -d --trace -j 2 install.man &#39;DESTDIR=3D/OE/build/po=
ky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image&#39; 2&gt;&am=
p;1 | tee install.man-make-gentoo-4.3.j2.trace.d.log).<br></div><div><br></=
div><div>With -j 1 in the same directory it works fine.</div><div><br></div=
><div>perl-native/5.36.0-r0/perl-5.36.0 $ grep Considering.target.file..non=
xs_ext install.man-make-gentoo-4.3.j2.trace.d.log | wc -l<br>7621<br></div>=
<div><br></div><div>The relevant (I hope) part of the log looks like:</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;ext/Sys-Hostname/pm_to_bl=
ib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;ext/XS-APItest/pm_=
to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;ext/XS-Typema=
p/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 Finished prerequisites of target=
 file &#39;dynamic_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0The prerequisites of &#=
39;dynamic_ext&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0Considering targ=
et file &#39;static_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0File &#39;static_ext&#=
39; was considered already.<br>=C2=A0 =C2=A0 =C2=A0Finished prerequisites o=
f target file &#39;extensions&#39;.<br>=C2=A0 =C2=A0 The prerequisites of &=
#39;extensions&#39; are being made.<br>=C2=A0 =C2=A0 Finished prerequisites=
 of target file &#39;modules&#39;.<br>=C2=A0 =C2=A0The prerequisites of &#3=
9;modules&#39; are being made.<br>=C2=A0 =C2=A0Finished prerequisites of ta=
rget file &#39;pod/perltoc.pod&#39;.<br>=C2=A0 The prerequisites of &#39;po=
d/perltoc.pod&#39; are being made.<br>=C2=A0 Pruning file &#39;miniperl&#39=
;.<br>=C2=A0Finished prerequisites of target file &#39;install.man&#39;.<br=
>The prerequisites of &#39;install.man&#39; are being made.<br>Live child 0=
x55a28372eaf0 (ext/XS-Typemap/Makefile) PID 517626<br>Generating a Unix-sty=
le Makefile<br>Writing Makefile for XS::Typemap<br>Reaping winning child 0x=
55a28372eaf0 PID 517626<br>Removing child 0x55a28372eaf0 PID 517626 from ch=
ain.<br>Considering target file &#39;install.man&#39;.<br>=C2=A0File &#39;i=
nstall.man&#39; does not exist.<br>=C2=A0 Considering target file &#39;inst=
allman&#39;.<br>=C2=A0 File &#39;installman&#39; was considered already.<br=
>=C2=A0 Considering target file &#39;pod/perltoc.pod&#39;.<br>=C2=A0 =C2=A0=
 Considering target file &#39;pod/buildtoc&#39;.<br>=C2=A0 =C2=A0 File &#39=
;pod/buildtoc&#39; was considered already.<br>=C2=A0 =C2=A0 Considering tar=
get file &#39;miniperl&#39;.<br>=C2=A0 =C2=A0 File &#39;miniperl&#39; was c=
onsidered already.<br>=C2=A0 =C2=A0 Considering target file &#39;modules&#3=
9;.<br>=C2=A0 =C2=A0 =C2=A0File &#39;modules&#39; does not exist.<br>=C2=A0=
 =C2=A0 =C2=A0 Considering target file &#39;extensions&#39;.<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0File &#39;extensions&#39; does not exist.<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Considering target file &#39;cflags&#39;.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 File &#39;cflags&#39; was considered already.<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Considering target file &#39;nonxs_ext&#39;.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0File &#39;nonxs_ext&#39; does not exist.<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;cpan/Archive-T=
ar/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;cpan/Ar=
chive-Tar/pm_to_blib&#39; was considered already.<br></div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;cpan/autodie/pm_to_bl=
ib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;cpan/autodie/pm_to=
_blib&#39; was considered already.<br></div><div>......</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;dist/ExtUtils-CBui=
lder/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;dist/=
ExtUtils-CBuilder/pm_to_blib&#39; was considered already.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Considering target file &#39;dist/ExtUtils-ParseXS/pm_=
to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering targ=
et file &#39;dist/ExtUtils-ParseXS/Makefile&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 File &#39;dist/ExtUtils-ParseXS/Makefile&#39; was cons=
idered already.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering ta=
rget file &#39;dist/ExtUtils-ParseXS/ppport.h&#39;.<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;dist/Devel-PPPort=
/ppport.h&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Considering target file &#39;dist/Devel-PPPort/PPPort.pm&#39;.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target =
file &#39;dist/Devel-PPPort/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;dis=
t/Devel-PPPort/Makefile&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;dist/Devel-PPPort/Makefile&#39; was c=
onsidered already.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Considering target file &#39;DynaLoader.o&#39;.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Considering target file &#39;ext/DynaLoader/pm_to_blib&#39;.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Finished prerequisites of target file &#39;ext/DynaLoader/pm_to_=
blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0The prerequisites of &#39;ext/DynaLoader/pm_to_blib=
&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Finished prerequisites of target file &#39;Dyna=
Loader.o&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0The prerequisites of &#39;DynaLoader.o&#39; are being m=
ade.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Pruning file &#39;DynaLoader.o&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pruning file &#39;dist/ExtUtils-CBui=
lder/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Finished prerequisites of target file &#39;dist/Devel-P=
PPort/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 The prerequisites of &#39;dist/Devel-PPPort/pm_to_blib&#39; a=
re being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Finished prerequisites of target file &#39;dist/Devel-PPPort/PPPort.p=
m&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The prer=
equisites of &#39;dist/Devel-PPPort/PPPort.pm&#39; are being made.<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pruning file &#39;mini=
perl&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Finish=
ed prerequisites of target file &#39;dist/Devel-PPPort/ppport.h&#39;.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The prerequisites of &#39;=
dist/Devel-PPPort/ppport.h&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Finished prerequisites of target file &#39;dist/Ext=
Utils-ParseXS/ppport.h&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 T=
he prerequisites of &#39;dist/ExtUtils-ParseXS/ppport.h&#39; are being made=
.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Finished prerequisites of tar=
get file &#39;dist/ExtUtils-ParseXS/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 The prerequisites of &#39;dist/ExtUtils-ParseXS/pm_to_bli=
b&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering ta=
rget file &#39;dist/Filter-Simple/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 File &#39;dist/Filter-Simple/pm_to_blib&#39; was considered a=
lready.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;=
dist/FindBin/pm_to_blib&#39;.<br></div><div>.....</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Considering target file &#39;ext/Tie-Memoize/pm_to_bli=
b&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;ext/Tie-Memoize/pm_=
to_blib&#39; was considered already.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F=
inished prerequisites of target file &#39;nonxs_ext&#39;.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 The prerequisites of &#39;nonxs_ext&#39; are being made.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;dynamic_ext&#39;.<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0File &#39;dynamic_ext&#39; does not ex=
ist.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;cpa=
n/Compress-Raw-Bzip2/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Considering target file &#39;cpan/Compress-Raw-Bzip2/Makefile&#39;.=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;cpan/Compress-Raw-B=
zip2/Makefile&#39; was considered already.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Pruning file &#39;DynaLoader.o&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Pruning file &#39;dist/ExtUtils-CBuilder/pm_to_blib&#3=
9;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Finished prerequisites of t=
arget file &#39;cpan/Compress-Raw-Bzip2/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 The prerequisites of &#39;cpan/Compress-Raw-Bzip2/pm_t=
o_blib&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Consideri=
ng target file &#39;cpan/Compress-Raw-Zlib/pm_to_blib&#39;.<br></div><div>.=
...</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The prerequisites of &#39;=
ext/XS-Typemap/pm_to_blib&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Finished prerequisites of target file &#39;dynamic_ext&#39;.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The prerequisites of &#39;dynamic_ext&#39; are =
being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;sta=
tic_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;static_ext&#39; was =
considered already.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Considering target file &=
#39;nonxs_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;nonxs_ext&#39;=
 does not exist.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;cpa=
n/Archive-Tar/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning=
 file &#39;cpan/autodie/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Pruning file &#39;cpan/AutoLoader/pm_to_blib&#39;.<br></div><div>....</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;ext/Tie-Hash-Na=
medCapture/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning fi=
le &#39;ext/Tie-Memoize/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fin=
ished prerequisites of target file &#39;nonxs_ext&#39;.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0The prerequisites of &#39;nonxs_ext&#39; are being made.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0Considering target file &#39;dynamic_ext&#39;.<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;dynamic_ext&#39; does not exist.<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;cpan/Compress-Raw-Bzip=
2/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;c=
pan/Compress-Raw-Zlib/pm_to_blib&#39;.<br></div><div>...</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;ext/XS-APItest/pm_to_blib&#39;=
.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;ext/XS-Typemap/pm_=
to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Finished prerequisites of targ=
et file &#39;dynamic_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0The prerequisi=
tes of &#39;dynamic_ext&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
Considering target file &#39;static_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0File &#39;static_ext&#39; was considered already.<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Finished prerequisites of target file &#39;extensions&#39;.<br>=
=C2=A0 =C2=A0 =C2=A0 The prerequisites of &#39;extensions&#39; are being ma=
de.<br>=C2=A0 =C2=A0 =C2=A0Considering target file &#39;extensions&#39;.<br=
>=C2=A0 =C2=A0 =C2=A0 File &#39;extensions&#39; does not exist.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Pruning file &#39;cflags&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Pruning file &#39;nonxs_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruni=
ng file &#39;dynamic_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &=
#39;static_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 Considering target file &#39;n=
onxs_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0File &#39;nonxs_ext&#39; does =
not exist.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pruning file &#39;cpan/Archive-Ta=
r/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pruning file &#39;cpan/au=
todie/pm_to_blib&#39;.<br></div><div>....</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Pruning file &#39;ext/XS-APItest/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Pruning file &#39;ext/XS-Typemap/pm_to_blib&#39;.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Finished prerequisites of target file &#39;dynamic_ext&=
#39;.<br>=C2=A0 =C2=A0 =C2=A0 The prerequisites of &#39;dynamic_ext&#39; ar=
e being made.<br>=C2=A0 =C2=A0 =C2=A0 Considering target file &#39;static_e=
xt&#39;.<br>=C2=A0 =C2=A0 =C2=A0 File &#39;static_ext&#39; was considered a=
lready.<br>=C2=A0 =C2=A0 =C2=A0 Finished prerequisites of target file &#39;=
extensions&#39;.<br>=C2=A0 =C2=A0 =C2=A0The prerequisites of &#39;extension=
s&#39; are being made.<br>=C2=A0 =C2=A0 =C2=A0Finished prerequisites of tar=
get file &#39;modules&#39;.<br>=C2=A0 =C2=A0 The prerequisites of &#39;modu=
les&#39; are being made.<br>=C2=A0 =C2=A0 Considering target file &#39;extr=
a.pods&#39;.<br>=C2=A0 =C2=A0 File &#39;extra.pods&#39; was considered alre=
ady.<br>=C2=A0 =C2=A0 Considering target file &#39;pod/perlapi.pod&#39;.<br=
>=C2=A0 =C2=A0 File &#39;pod/perlapi.pod&#39; was considered already.<br>=
=C2=A0 =C2=A0 Considering target file &#39;pod/perlintern.pod&#39;.<br>=C2=
=A0 =C2=A0 File &#39;pod/perlintern.pod&#39; was considered already.<br>=C2=
=A0 =C2=A0 Considering target file &#39;pod/perlmodlib.pod&#39;.<br>=C2=A0 =
=C2=A0 File &#39;pod/perlmodlib.pod&#39; was considered already.<br>=C2=A0 =
=C2=A0 Considering target file &#39;pod/perluniprops.pod&#39;.<br>=C2=A0 =
=C2=A0 File &#39;pod/perluniprops.pod&#39; was considered already.<br>=C2=
=A0 =C2=A0 Considering target file &#39;pod/perl5360delta.pod&#39;.<br>=C2=
=A0 =C2=A0 File &#39;pod/perl5360delta.pod&#39; was considered already.<br>=
=C2=A0 =C2=A0Considering target file &#39;modules&#39;.<br>=C2=A0 =C2=A0 Fi=
le &#39;modules&#39; does not exist.<br>=C2=A0 =C2=A0 =C2=A0Pruning file &#=
39;extensions&#39;.<br>=C2=A0 =C2=A0 Considering target file &#39;extension=
s&#39;.<br>=C2=A0 =C2=A0 =C2=A0File &#39;extensions&#39; does not exist.<br=
>=C2=A0 =C2=A0 =C2=A0 Pruning file &#39;cflags&#39;.<br>=C2=A0 =C2=A0 =C2=
=A0 Pruning file &#39;nonxs_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 Pruning file =
&#39;dynamic_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0 Pruning file &#39;static_ext=
&#39;.<br>=C2=A0 =C2=A0 =C2=A0Considering target file &#39;nonxs_ext&#39;.<=
br>=C2=A0 =C2=A0 =C2=A0 File &#39;nonxs_ext&#39; does not exist.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Pruning file &#39;cpan/Archive-Tar/pm_to_blib&#39;.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;cpan/autodie/pm_to_blib&#39;.<=
br></div><div>....</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &#39;e=
xt/XS-APItest/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Pruning file &=
#39;ext/XS-Typemap/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 Finished prereq=
uisites of target file &#39;dynamic_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0The pr=
erequisites of &#39;dynamic_ext&#39; are being made.<br>=C2=A0 =C2=A0 =C2=
=A0Considering target file &#39;static_ext&#39;.<br>=C2=A0 =C2=A0 =C2=A0Fil=
e &#39;static_ext&#39; was considered already.<br>=C2=A0 =C2=A0 =C2=A0Finis=
hed prerequisites of target file &#39;extensions&#39;.<br>=C2=A0 =C2=A0 The=
 prerequisites of &#39;extensions&#39; are being made.<br>=C2=A0 =C2=A0 Fin=
ished prerequisites of target file &#39;modules&#39;.<br>=C2=A0 =C2=A0The p=
rerequisites of &#39;modules&#39; are being made.<br>=C2=A0 =C2=A0Finished =
prerequisites of target file &#39;pod/perltoc.pod&#39;.<br>=C2=A0 The prere=
quisites of &#39;pod/perltoc.pod&#39; are being made.<br>=C2=A0 Pruning fil=
e &#39;miniperl&#39;.<br>=C2=A0Finished prerequisites of target file &#39;i=
nstall.man&#39;.<br>The prerequisites of &#39;install.man&#39; are being ma=
de.<br>Considering target file &#39;install.man&#39;.<br>=C2=A0File &#39;in=
stall.man&#39; does not exist.<br>=C2=A0 Considering target file &#39;insta=
llman&#39;.<br>=C2=A0 File &#39;installman&#39; was considered already.<br>=
=C2=A0 Considering target file &#39;pod/perltoc.pod&#39;.<br>=C2=A0 =C2=A0 =
Considering target file &#39;pod/buildtoc&#39;.<br>=C2=A0 =C2=A0 File &#39;=
pod/buildtoc&#39; was considered already.<br>=C2=A0 =C2=A0 Considering targ=
et file &#39;miniperl&#39;.<br>=C2=A0 =C2=A0 File &#39;miniperl&#39; was co=
nsidered already.<br>=C2=A0 =C2=A0 Considering target file &#39;modules&#39=
;.<br>=C2=A0 =C2=A0 =C2=A0File &#39;modules&#39; does not exist.<br>=C2=A0 =
=C2=A0 =C2=A0 Considering target file &#39;extensions&#39;.<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0File &#39;extensions&#39; does not exist.<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Considering target file &#39;cflags&#39;.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 File &#39;cflags&#39; was considered already.<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Considering target file &#39;nonxs_ext&#39;.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0File &#39;nonxs_ext&#39; does not exist.<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Considering target file &#39;cpan/Archive-T=
ar/pm_to_blib&#39;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File &#39;cpan/Ar=
chive-Tar/pm_to_blib&#39; was considered already.<br></div><div><br></div><=
div>and then it repeats in never-ending loop, only make using 100% CPU and =
even on smaller log:</div><div>120M =C2=A0 =C2=A0install.man-make-gentoo-4.=
3.j2.trace.d.log<br></div><div><br></div><div>it considers nonxs_ext too ma=
ny times (before I&#39;ve killed the make):</div><div>x86_64-linux/perl-nat=
ive/5.36.0-r0/perl-5.36.0 $ grep Considering.target.file..nonxs_ext install=
.man-make-gentoo-4.3.j2.trace.d.log | wc -l<br>7621<br></div><div><br></div=
><div>Will try to narrow this even more and produce the debug/trace output =
from working case for comparison, just wanted to share the update in case s=
omeone sees what&#39;s wrong right away.</div><div><br></div><div>I still w=
asn&#39;t able to reproduce this outside poky build &quot;bitbake libgcc-in=
itial -f -c compile&quot; with=C2=A0INHERIT +=3D &quot;ccache&quot; in loca=
l.conf in build dir without sstate-cache populated isn&#39;t enough to repr=
oduce what=C2=A0buildoptions.ImageOptionsTests.test_ccache_tool somehow tri=
ggers, but YMMV, let me know if you have seen this or can reproduce it with=
 selftest as well.</div><div><br></div><div>Cheers,</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 9, 202=
2 at 6:48 PM Martin Jansa via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I was =
reading<div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14096" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D14096</a><br></div><div><a href=3D"https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D13244" target=3D"_blank">https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D13244</a><br></div><div>and your e-mail about the make iss=
ue in perl, but in my case it looks a bit different I think.</div><div><br>=
</div><div>It was with the make-native dependency, but happens only in self=
test=C2=A0test_ccache_tool:</div><div><br></div><div>2022-06-09 11:30:21,85=
5 - oe-selftest - INFO - test_ccache_tool (buildoptions.ImageOptionsTests.t=
est_ccache_tool)<br>2022-06-09 12:53:41,855 - oe-selftest - INFO - Keepaliv=
e message<br>2022-06-09 14:17:01,856 - oe-selftest - INFO - Keepalive messa=
ge<br>2022-06-09 15:40:21,856 - oe-selftest - INFO - Keepalive message<br>^=
^ was what triggered me to look where it got stuck.<br></div><div><br></div=
><div>I can build perl-native fine in my other oe-core nodistro build direc=
tory and now I&#39;ve built it ok also in regular poky build directory as i=
n:</div><div>5f249a407f6 vim: put xxd in its own package<br></div><div><br>=
</div><div>While the selftest was stuck I was checking where exactly it got=
 stuck in the WORKDIR and</div><div>oe_runmake -j 1 installman &#39;DESTDIR=
=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/imag=
e&#39; install 2&gt;&amp;1=C2=A0| tee installman.log<br></div><div>finished=
 fine, while:</div><div>oe_runmake -j 2 installman &#39;DESTDIR=3D/OE/build=
/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image&#39; insta=
ll 2&gt;&amp;1=C2=A0=C2=A0| tee installman.log<br></div><div>was getting st=
uck:</div><div><br></div><div>....</div><div>Generating a Unix-style Makefi=
le<br>Writing Makefile for Sys::Hostname<br>cd ext/XS-Typemap/ &amp;&amp; .=
./../miniperl_top -I../../lib Makefile.PL \<br>=C2=A0INSTALLDIRS=3Dperl INS=
TALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \<br>=C2=A0PERL_CORE=3D1 LIBPERL_A=
=3Dlibperl.so.5.36.0 PERL=3D&quot;../../miniperl_top&quot;<br>Generating a =
Unix-style Makefile<br>Writing Makefile for XS::APItest<br>Generating a Uni=
x-style Makefile<br>Writing Makefile for XS::Typemap<br></div><div><br></di=
v><div>With -n, it looks like it got stuck just before building buildtoc:</=
div><div><br></div><div>....</div><div>cd ext/XS-APItest/ &amp;&amp; ../../=
miniperl_top -I../../lib Makefile.PL \<br>=C2=A0INSTALLDIRS=3Dperl INSTALLM=
AN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \<br>=C2=A0PERL_CORE=3D1 LIBPERL_A=3Dli=
bperl.so.5.36.0 PERL=3D&quot;../../miniperl_top&quot;<br>cd ext/XS-Typemap/=
 &amp;&amp; ../../miniperl_top -I../../lib Makefile.PL \<br>=C2=A0INSTALLDI=
RS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \<br>=C2=A0PERL_CORE=
=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D&quot;../../miniperl_top&quot;<br=
>./miniperl_top -f pod/buildtoc -q<br>./miniperl_top installman --destdir=
=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/imag=
e <br>make[1]: Leaving directory &#39;/OE/build/poky/build-st/tmp/work/x86_=
64-linux/perl-native/5.36.0-r0/perl-5.36.0&#39;<br></div><div><br></div><di=
v>It didn&#39;t start miniperl_top (which itself works fine):</div><div>mar=
tin@jama /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r=
0/perl-5.36.0 $ ./miniperl_top -f pod/buildtoc -q<br>martin@jama /OE/build/=
poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-5.36.0 $ ech=
o $?<br>0<br></div><div><br></div><div>martin =C2=A0 3016692 =C2=A00.0 =C2=
=A00.0 =C2=A099860 =C2=A02788 ? =C2=A0 =C2=A0 =C2=A0 =C2=A0S =C2=A0 =C2=A01=
7:47 =C2=A0 0:00 make -j 40 DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_=
64-linux/perl-native/5.36.0-r0/image install<br>martin =C2=A0 3016738 99.9 =
=C2=A00.0 101440 =C2=A04184 ? =C2=A0 =C2=A0 =C2=A0 =C2=A0R =C2=A0 =C2=A017:=
47 =C2=A056:21 make install.man<br></div><div><br></div><div>Attaching to p=
rocess 3016738<br>Reading symbols from /OE/build/poky/build-st/tmp/work/x86=
_64-linux/perl-native/5.36.0-r0/recipe-sysroot-native/usr/bin/make...<br>(N=
o debugging symbols found in /OE/build/poky/build-st/tmp/work/x86_64-linux/=
perl-native/5.36.0-r0/recipe-sysroot-native/usr/bin/make)<br>Reading symbol=
s from /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/libc=
.so.6...<br>Reading symbols from /OE/build/poky/build-st/tmp/sysroots-unina=
tive/x86_64-linux/lib/.debug/libc.so.6...<br>Reading symbols from /OE/build=
/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2=
...<br>Reading symbols from /OE/build/poky/build-st/tmp/sysroots-uninative/=
x86_64-linux/lib/.debug/ld-linux-x86-64.so.2...<br>(No debugging symbols fo=
und in /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.deb=
ug/ld-linux-x86-64.so.2)<br>[Thread debugging using libthread_db enabled]<b=
r>Using host libthread_db library &quot;/usr/lib64/libthread_db.so.1&quot;.=
<br>0x000055c946453a1f in ?? ()<br>(gdb) bt<br>#0 =C2=A00x000055c946453a1f =
in ?? ()<br>#1 =C2=A00x000055c946452bf3 in ?? ()<br>#2 =C2=A00x000055c94645=
3b98 in ?? ()<br>#3 =C2=A00x000055c946452bf3 in ?? ()<br>#4 =C2=A00x000055c=
946453b98 in ?? ()<br>#5 =C2=A00x000055c946452bf3 in ?? ()<br>#6 =C2=A00x00=
0055c946453b98 in ?? ()<br>#7 =C2=A00x000055c946452bf3 in ?? ()<br>#8 =C2=
=A00x000055c946453b98 in ?? ()<br>#9 =C2=A00x000055c946452bf3 in ?? ()<br>#=
10 0x000055c946453fd6 in update_goal_chain ()<br>#11 0x000055c946438df3 in =
main ()<br>(gdb)</div><div><br></div><div>I&#39;ve reproduced this twice to=
day, so I was assuming it&#39;s just new separate issue from new perl versi=
on - that&#39;s why I was asking if someone else is seeing this behavior no=
w.</div><div><br></div><div>I&#39;ll try to reproduce this with ccache enab=
led in regular build (I normally don&#39;t use poky nor selftest). If it fa=
ils again, I&#39;ll enable debug for make-native (or switch back to make-4.=
3 from gentoo).<br></div><div><br></div><div>Regards,</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 9, 2=
022 at 6:21 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 20=
22-06-09 at 14:44 +0200, Martin Jansa wrote:<br>
&gt; On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0.../{<a href=3D"http://perlcross_1.3.7.bb" rel=3D"noreferre=
r" target=3D"_blank">perlcross_1.3.7.bb</a> =3D&gt; <a href=3D"http://perlc=
ross_1.4.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.4.bb</a>}=C2=
=A0 |=C2=A0 2 +-<br>
&gt; &gt; =C2=A0.../perl/files/perl-configpm-switch.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt; &gt; =C2=A0.../perl/files/perl-dynloader.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; =C2=A0.../perl/files/perl-rdepends.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 49 ++++++++++++-------<br>
&gt; &gt; =C2=A0.../perl/{<a href=3D"http://perl_5.34.1.bb" rel=3D"noreferr=
er" target=3D"_blank">perl_5.34.1.bb</a> =3D&gt; <a href=3D"http://perl_5.3=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.36.0.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt; &gt; =C2=A05 files changed, 35 insertions(+), 22 deletions(-)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/perl-cross/{<a href=3D"http://=
perlcross_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.7.bb=
</a> =3D&gt; <a href=3D"http://perlcross_1.4.bb" rel=3D"noreferrer" target=
=3D"_blank">perlcross_1.4.bb</a>} (92%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/perl/{<a href=3D"http://perl_5=
.34.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.1.bb</a> =3D&gt; <=
a href=3D"http://perl_5.36.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_=
5.36.0.bb</a>} (99%)<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Have anyone else seen perl.do_install getting stuck with this new shin=
y version as well?<br>
&gt; <br>
&gt; =C2=A0690770 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 10020 =C2=A03700 =
=C2=A03196 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E2=94=94=E2=94=80 /bin/sh /OE/build/poky/build-st/tmp/work/x86_6=
4-linux/perl-native/5.36.0-r0/temp/run.do_install.690768<br>
&gt; =C2=A0690771 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 99860 =C2=A01948 =
=C2=A01364 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80 make -j 40 DESTDIR=3D/OE/build/poky/bu=
ild-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image install<br>
&gt; =C2=A0690816 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 =C2=A0 99M =C2=A03=
340 =C2=A01428 R 102.1 =C2=A00.0 =C2=A03h06:44 =E2=94=82 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80 make install.man=C2=A0<br=
>
<br>
I&#39;ve seen perl and the kernel hang in make for some versions, I did try=
<br>
and put a warning about the known Fedora issue. Was this with the<br>
recent make-native dependency added? If so that would indicate it is<br>
potentially a bug in the current make version :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166786): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166786" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166786</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91575167/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91575167/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004642e205e11687c0--

