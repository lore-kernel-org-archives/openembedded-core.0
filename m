Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D416610FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:15:37 +0000 (UTC)
Message-ID: <524006B4.6080209@communistcode.co.uk>
Date: Mon, 23 Sep 2013 10:15:32 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: elfutils patch failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 09:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I updated this morning and I'm now hitting an issue with elfutils in the 
patching stage.

It seems as though this commit c1cbc57eb80d2cab9a80d5e5aa65419f40eefb15 
is causing the issue by adding the redhat-portability patch...

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/lto-wrapper
Target: x86_64-unknown-linux-gnu
Configured with: /build/gcc/src/gcc-4.8-20130725/configure --prefix=/usr 
--libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man 
--infodir=/usr/share/info --with-bugurl=https://bugs.archlinux.org/ 
--enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ --enable-shared 
--enable-threads=posix --with-system-zlib --enable-__cxa_atexit 
--disable-libunwind-exceptions --enable-clocale=gnu 
--disable-libstdcxx-pch --enable-gnu-unique-object 
--enable-linker-build-id --enable-cloog-backend=isl 
--disable-cloog-version-check --enable-lto --enable-gold 
--enable-ld=default --enable-plugin --with-plugin-ld=ld.gold 
--with-linker-hash-style=gnu --disable-install-libiberty 
--disable-multilib --disable-libssp --disable-werror 
--enable-checking=release
Thread model: posix
gcc version 4.8.1 20130725 (prerelease) (GCC)

meta              = "master:1d16e8035dda062041394b1e51839a9a7d077cf5"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Command Error: exit status: 1  Output:
Applying patch redhat-portability.diff
patching file backends/ChangeLog
patching file backends/Makefile.am
patching file backends/Makefile.in
patching file ChangeLog
patching file config/ChangeLog
patching file config/eu.am
patching file config/Makefile.in
patching file config.h.in
patching file configure
Hunk #1 FAILED at 598.
Hunk #2 FAILED at 612.
Hunk #3 FAILED at 725.
Hunk #4 FAILED at 1378.
Hunk #5 succeeded at 4079 with fuzz 1 (offset 162 lines).
Hunk #6 FAILED at 4077.
Hunk #7 succeeded at 4612 (offset 186 lines).
Hunk #8 FAILED at 5162.
Hunk #9 succeeded at 5530 with fuzz 1 (offset 205 lines).
6 out of 9 hunks FAILED -- rejects in file configure
patching file configure.ac
patching file lib/ChangeLog
patching file lib/eu-config.h
patching file lib/Makefile.in
patching file libasm/ChangeLog
patching file libasm/Makefile.in
patching file libcpu/ChangeLog
patching file libcpu/i386_disasm.c
patching file libcpu/Makefile.in
patching file libdw/ChangeLog
patching file libdw/dwarf_begin_elf.c
patching file libdw/libdw.h
patching file libdw/Makefile.in
patching file libdwfl/ChangeLog
patching file libdwfl/Makefile.in
patching file libebl/ChangeLog
patching file libebl/Makefile.in
patching file libelf/ChangeLog
patching file libelf/common.h
patching file libelf/gnuhash_xlate.h
patching file libelf/Makefile.in
patching file m4/Makefile.in
patching file Makefile.in
patching file src/addr2line.c
patching file src/ChangeLog
patching file src/findtextrel.c
patching file src/ld.h
patching file src/Makefile.am
patching file src/Makefile.in
patching file src/readelf.c
patching file src/strings.c
patching file src/strip.c
patching file tests/ChangeLog
patching file tests/line2addr.c
patching file tests/Makefile.in
Patch redhat-portability.diff does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: 
/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/elfutils-native/0.155-r0/temp/log.do_patch.25742
ERROR: Task 627 
(virtual:native:/home/jack/Work/oe-core.git/meta/recipes-devtools/elfutils/elfutils_0.155.bb, 
do_patch) failed with exit code '1'

Cheers,
Jack.

