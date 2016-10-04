Return-Path: <sujith.h@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id CA45271A0F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:44:17 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y38so1415906qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=V9hp/bvhu8F2nP1qjacn/MiSQWYxfFiZyS4ajIUTAGU=;
	b=oEaz9rF+nbRDz4HYWJUECuNRycL5KrxBk4NbJML7C7fWJFXvL4hfXqLh1N8aY1rKYM
	9u41+xU4r6VRbLKbbktbT3XbvkGswtRTg5qE9AEpD6WvZnu98gOxezMcygwvVt42ibjk
	01ragic13H4XaH9wBI4bbxR73coDpliNSnuFVlp1u7DeNDhbRAogomvpyy6Sb28xI66Q
	cz8IaoBHQxvV8YF/bu6QuyV56q4eEDklftWjsENqvtbVyY8/Lq8fUm+QVfJ3rSj6oZgO
	Myu9f2LSq5mQDk6jC1iYHFYXWnrp0C90oQYFa5Z9YYewARSxO/iQ++AtVSi33o+7+iWD
	7TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=V9hp/bvhu8F2nP1qjacn/MiSQWYxfFiZyS4ajIUTAGU=;
	b=KehHPOlbo5JsKAl/qSFEI2XIYUekcB5yQ0Ikzz1ZKJ9Z+otfWPm4GaZv8pPnh7ljr7
	ruoI3OHZKyB9w2t5JimPgsem9p+bgovRP+10imomgu3QYxbgS7ktnoAF6g5FejAg+/Nb
	GqvSLSHUmcdV/gkjo1DVml9fi1fEe2ffQRwBnjBP+vR7+YlcOZ12eCcgyo9v2hh0NrHP
	KbusAlVEqBZyGIvbN3Zk9AKANLArU2mVp7AiuT1JNFkrKYR3oCZYWR1zlSzX/V/yqQ0w
	WCUAKdIf205JLFSnq3+h0SxAGLEwqJi+aemVhhdcJkQGTSgYVvsAdWi0VylllWKkjfwm
	398A==
X-Gm-Message-State: AA6/9RmkQTIkmLQ5dR/S4j3V1vNrpEBNk92X5/PC1znbOl7vE21tey9cXiydVUdSRtFoWJMDGL5pY5xNzDwYog==
X-Received: by 10.237.59.130 with SMTP id r2mr2653062qte.77.1475574258504;
	Tue, 04 Oct 2016 02:44:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Tue, 4 Oct 2016 02:43:58 -0700 (PDT)
In-Reply-To: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
References: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 4 Oct 2016 15:13:58 +0530
Message-ID: <CADyYWL=2hK+tN2wusGXruGyPu9tbmFBpyHWWZJ7Twff=L_FLzw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure
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
X-List-Received-Date: Tue, 04 Oct 2016 09:44:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c0d7c28849c5a053e06e783

--94eb2c0d7c28849c5a053e06e783
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Without this change perf was failing for minnow max BSP.

Below is the complete log before applying the patch:

| DEBUG: Executing shell function do_compile
| NOTE: make -j10 -C
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work-shared/intel-corei7-64/ke=
rnel-source/tools/perf
O=3D/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0
CROSS_COMPILE=3Di686-pc-linux-gnu- ARCH=3Dx86 CC=3Di686-pc-linux-gnu-gcc -m=
64
-march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2 -msgxx-glibc
--no-sysroot-suffix
--sysroot=3D/home/sujith/MEL/dogwood/build-minnowmax/tmp/sysroots/intel-cor=
ei7-64
AR=3Di686-pc-linux-gnu-ar LD=3Di686-pc-linux-gnu-ld
--sysroot=3D/home/sujith/MEL/dogwood/build-minnowmax/tmp/sysroots/intel-cor=
ei7-64
-m elf_x86_64 EXTRA_CFLAGS=3D-ldw perfexecdir=3D/usr/libexec NO_GTK2=3D1
NO_DWARF=3D1 NO_LIBUNWIND=3D1 NO_LIBDW_DWARF_UNWIND=3D1 NO_LIBNUMA=3D1
DESTDIR=3D/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/image
prefix=3D/usr bindir=3D/usr/bin sharedir=3D/usr/share sysconfdir=3D/etc
perfexecdir=3D/usr/libexec/perf-core ETC_PERFCONFIG=3D../etc sharedir=3Dsha=
re
mandir=3Dshare/man infodir=3Dshare/info INCLUDES=3D-I. $(CONFIG_INCLUDES) a=
ll
| make: Entering directory
`/home/sujith/MEL/dogwood/build-minnowmax/tmp/work-shared/intel-corei7-64/k=
ernel-source/tools/perf'
|   BUILD:   Doing 'make -j5' parallel build
|
| Auto-detecting system features:
| ...                         dwarf: [ on  ]
| ...                         glibc: [ on  ]
| ...                          gtk2: [ OFF ]
| ...                      libaudit: [ OFF ]
| ...                        libbfd: [ on  ]
| ...                        libelf: [ on  ]
| ...                       libnuma: [ OFF ]
| ...                       libperl: [ on  ]
| ...                     libpython: [ on  ]
| ...                      libslang: [ on  ]
| ...                     libunwind: [ OFF ]
| ...            libdw-dwarf-unwind: [ on  ]
| ...                          zlib: [ on  ]
| ...                          lzma: [ on  ]
|
| config/Makefile:319: Disabling post unwind, no support found.
| config/Makefile:360: No libaudit.h found, disables 'trace' tool, please
install audit-libs-devel or libaudit-dev
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/abspath.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/Context.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/setup.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/common.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/fd/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/fd/array.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/alias.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/fd/
|   LD
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/fd/libapi-in.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/
|
/home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebenc=
h/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/fd/array.o)
to format elf32-i386
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/fd/libapi-in.o)
is not supported
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/helpline.o
| make[4]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/fd/libapi-in.o]
Error 1
| make[3]: *** [fd] Error 2
| make[2]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/libapi-in.o]
Error 2
| make[1]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/libapi.a]
Error 2
| make[1]: *** Waiting for unfinished jobs....
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/annotate.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/build-id.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/
|   LD
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/libperf-in.o
|
/home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebenc=
h/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/Context.o)
to format elf32-i386
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/libperf-in.o)
is not supported
| make[4]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/libperf-in.o]
Error 1
| make[3]: *** [perl/Perf-Trace-Util] Error 2
| make[2]: *** [scripts] Error 2
| make[2]: *** Waiting for unfinished jobs....
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/config.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/header.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/progress.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/tsc.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/util.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/ctype.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/kvm-stat.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/db-export.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/environment.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/hist.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/event.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/
|   LD
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/arch/x86/util/libperf-in.o
|
/home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebenc=
h/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/arch/x86/util/header.o)
to format elf32-i386
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/arch/x86/util/libperf-in.o)
is not supported
| make[5]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/arch/x86/util/libperf-in.o]
Error 1
| make[4]: *** [util] Error 2
| make[3]: *** [x86] Error 2
| make[2]: *** [arch] Error 2
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/evlist.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/evsel.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/exec_cmd.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/find_next_bit.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/help.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/kallsyms.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/levenshtein.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-options.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   BISON
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-events-bison.c
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/path.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/stdio/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/stdio/hist.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browser.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/rbtree.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/bitmap.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/hweight.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/run-command.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/quote.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/strbuf.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/string.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/strlist.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/setup.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/annotate.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/util.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/strfilter.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/top.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/usage.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/wrapper.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/helpline.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/sigchain.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/dso.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/symbol.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/progress.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/color.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/
|   LD
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/tui/libperf-in.o
|
/home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebenc=
h/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/tui/setup.o)
to format elf32-i386
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/tui/libperf-in.o)
is not supported
| make[4]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/tui/libperf-in.o]
Error 1
| make[3]: *** [tui] Error 2
| make[3]: *** Waiting for unfinished jobs....
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/hists.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/map.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pager.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/scripts.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/header.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/callchain.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/header.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/values.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/debug.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/machine.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/map.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pstack.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/session.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/ordered-events.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/
|   LD
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/ui/browsers/libperf-in.o
|
/home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebenc=
h/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/browsers/annotate.o)
to format elf32-i386
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/browsers/libperf-in.o)
is not supported
| make[4]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/browsers/libperf-in.o]
Error 1
| make[3]: *** [browsers] Error 2
| make[2]: *** [ui] Error 2
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/comm.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/thread.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/thread_map.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/trace-event-parse.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-events-bison.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   BISON
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pmu-bison.c
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/trace-event-read.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/trace-event-info.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/trace-event-scripting.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/svghelper.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/trace-event.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/sort.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/hist.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/util.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/xyarray.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/cpumap.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/cgroup.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/target.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/rblist.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/intlist.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/vdso.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/stat.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/record.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/srcline.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/data.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/tsc.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/cloexec.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/thread-stack.o
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/symbol-elf.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/probe-event.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/scripting-engines/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/scripting-engines/trace-event-perl.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/perf_regs.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/zlib.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/lzma.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   FLEX
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-events-flex.c
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   FLEX
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pmu-flex.c
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pmu-bison.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-events.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/scripting-engines/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/scripting-engines/trace-event-python.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-events-flex.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pmu.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/
|   CC
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/pmu-flex.o
|   MKDIR
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/scripting-engines/
|   LD
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/scripting-engines/libperf-in.o
|
/home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebenc=
h/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/util/scripting-engines/trace-event-perl.o)
to format elf32-i386
(/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/util/scripting-engines/libperf-in.o)
is not supported
| ERROR: oe_runmake failed
| make[4]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/util/scripting-engines/libperf-in.o]
Error 1
| make[3]: *** [scripting-engines] Error 2
| make[3]: *** Waiting for unfinished jobs....
| make[2]: *** [util] Error 2
| make[1]: ***
[/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/libperf-in.o]
Error 2
| make: *** [all] Error 2
| make: Leaving directory
`/home/sujith/MEL/dogwood/build-minnowmax/tmp/work-shared/intel-corei7-64/k=
ernel-source/tools/perf'
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/temp/log.do_compile.29062)

After applying the patch it built cleanly.

On Tue, Oct 4, 2016 at 3:11 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>
> When built on minnowmax ( machine name: intel-corei7-64),
> an error is noticed during the do_compile:
>
>  /home/sujith/codebench-linux-install-2015.12-133-i686-pc-
> linux-gnu/codebench/bin/i686-pc-linux-gnu-ld:
> Relocatable linking with relocations from format elf64-x86-64
> (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/
> intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o)
> to format elf32-i386 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/
> intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/libapi-in.o)
> is not supported
>
> This change help fix the issue.
>
> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 0d104d3..471023d 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -170,6 +170,7 @@ do_configure_prepend () {
>      if [ -e "${S}/tools/perf/Makefile.perf" ]; then
>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,'
> ${S}/tools/perf/Makefile.perf
>          sed -i 's,AR =3D $(CROSS_COMPILE)ar,#AR,'
> ${S}/tools/perf/Makefile.perf
> +        sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,'
> ${S}/tools/perf/Makefile.perf
>      fi
>      if [ -e "${S}/tools/lib/api/Makefile" ]; then
>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,'
> ${S}/tools/lib/api/Makefile
> --
> 1.9.1
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--94eb2c0d7c28849c5a053e06e783
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Without this change perf was failing for minnow =
max BSP.<br><br></div>Below is the complete log before applying the patch:<=
br><br>| DEBUG: Executing shell function do_compile<br>| NOTE: make -j10 -C=
 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work-shared/intel-corei7-64/k=
ernel-source/tools/perf O=3D/home/sujith/MEL/dogwood/build-minnowmax/tmp/wo=
rk/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0 CROSS_COMPILE=3Di686-pc-l=
inux-gnu- ARCH=3Dx86 CC=3Di686-pc-linux-gnu-gcc -m64 -march=3Dcorei7 -mtune=
=3Dcorei7 -mfpmath=3Dsse -msse4.2 -msgxx-glibc --no-sysroot-suffix --sysroo=
t=3D/home/sujith/MEL/dogwood/build-minnowmax/tmp/sysroots/intel-corei7-64 A=
R=3Di686-pc-linux-gnu-ar LD=3Di686-pc-linux-gnu-ld --sysroot=3D/home/sujith=
/MEL/dogwood/build-minnowmax/tmp/sysroots/intel-corei7-64=C2=A0=C2=A0 -m el=
f_x86_64 EXTRA_CFLAGS=3D-ldw perfexecdir=3D/usr/libexec NO_GTK2=3D1 NO_DWAR=
F=3D1 NO_LIBUNWIND=3D1 NO_LIBDW_DWARF_UNWIND=3D1 NO_LIBNUMA=3D1 DESTDIR=3D/=
home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/=
perf/1.0-r9/image prefix=3D/usr bindir=3D/usr/bin sharedir=3D/usr/share sys=
confdir=3D/etc perfexecdir=3D/usr/libexec/perf-core ETC_PERFCONFIG=3D../etc=
 sharedir=3Dshare mandir=3Dshare/man infodir=3Dshare/info INCLUDES=3D-I. $(=
CONFIG_INCLUDES) all<br>| make: Entering directory `/home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work-shared/intel-corei7-64/kernel-source/tools/perf&=
#39;<br>|=C2=A0=C2=A0 BUILD:=C2=A0=C2=A0 Doing &#39;make -j5&#39; parallel =
build<br>| <br>| Auto-detecting system features:<br>| ...=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dwarf: [ on=C2=A0 ]<br>=
| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 glibc: [ on=C2=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gtk2: [ OFF ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libaudit: [ OFF ]<br>| ...=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libbfd: [ on=C2=A0 ]<br>| ...=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libelf: [ o=
n=C2=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 libnuma: [ OFF ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 libperl: [ on=C2=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libpython: [ on=C2=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 libslang: [ on=C2=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libunwind: [ OFF ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libdw-dwarf-unwind: [ on=C2=
=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 zlib: [ on=C2=A0 ]<br>| ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lzma: [ on=C2=A0 ]<br>| <br>|=
 config/Makefile:319: Disabling post unwind, no support found.<br>| config/=
Makefile:360: No libaudit.h found, disables &#39;trace&#39; tool, please in=
stall audit-libs-devel or libaudit-dev<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0=
 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/s=
ujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1=
.0-r9/perf-1.0/arch/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/=
MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/=
perf-1.0/scripts/perl/Perf-Trace-Util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/abspath.o<br>|=C2=A0=C2=A0=
 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/scripts/perl/=
Perf-Trace-Util/Context.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/ui/setup.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/common.o<br>|=C2=A0=C2=A0 =
MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/i=
ntel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o<br>|=C2=A0=
=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0=
 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/alias.o<=
br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-min=
nowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/<br>|=C2=
=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/b=
uild-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/l=
ibapi-in.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/u=
i/<br>| /home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/=
codebench/bin/i686-pc-linux-gnu-ld: Relocatable linking with relocations fr=
om format elf64-x86-64 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/i=
ntel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o) to format elf32-i=
386 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-=
linux/perf/1.0-r9/perf-1.0/fd/libapi-in.o) is not supported<br>|=C2=A0=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-m=
innowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/helplin=
e.o<br>| make[4]: *** [/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/in=
tel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/libapi-in.o] Error 1<br>| m=
ake[3]: *** [fd] Error 2<br>| make[2]: *** [/home/sujith/MEL/dogwood/build-=
minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/libapi-in=
.o] Error 2<br>| make[1]: *** [/home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/libapi.a] Error 2<br>|=
 make[1]: *** Waiting for unfinished jobs....<br>|=C2=A0=C2=A0 MKDIR=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/annotate.o<br>|=C2=A0=C2=
=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/wo=
rk/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/build-id.o<=
br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-min=
nowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/scripts/perl=
/Perf-Trace-Util/<br>|=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/=
perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/libperf-in.o<br>| /home/s=
ujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/codebench/bin/i=
686-pc-linux-gnu-ld: Relocatable linking with relocations from format elf64=
-x86-64 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-=
mel-linux/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/Context.o) to f=
ormat elf32-i386 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_c=
orei7_64-mel-linux/perf/1.0-r9/perf-1.0/scripts/perl/Perf-Trace-Util/libper=
f-in.o) is not supported<br>| make[4]: *** [/home/sujith/MEL/dogwood/build-=
minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/scripts/p=
erl/Perf-Trace-Util/libperf-in.o] Error 1<br>| make[3]: *** [perl/Perf-Trac=
e-Util] Error 2<br>| make[2]: *** [scripts] Error 2<br>| make[2]: *** Waiti=
ng for unfinished jobs....<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/s=
ujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1=
.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0/util/config.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/arch/x86/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/ui/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86/util/header.o<br>|=C2=A0=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/prog=
ress.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/bu=
ild-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/=
x86/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/suj=
ith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0=
-r9/perf-1.0/arch/x86/util/tsc.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /=
home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/=
perf/1.0-r9/perf-1.0/ui/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/ui/util.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/ctype.o<br>|=C2=A0=C2=A0 MKDIR=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86/util/<br>|=C2=A0=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86/util/kv=
m-stat.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/=
build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/uti=
l/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL=
/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/per=
f-1.0/util/db-export.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujit=
h/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r=
9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /h=
ome/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/p=
erf/1.0-r9/perf-1.0/util/environment.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/ui/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/hist.o<br>|=C2=A0=C2=A0 MKDIR=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/=
intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/event.o<br>|=C2=A0=C2=
=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/wo=
rk/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86/util/<br>|=C2=A0=
=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x8=
6/util/libperf-in.o<br>| /home/sujith/codebench-linux-install-2015.12-133-i=
686-pc-linux-gnu/codebench/bin/i686-pc-linux-gnu-ld: Relocatable linking wi=
th relocations from format elf64-x86-64 (/home/sujith/MEL/dogwood/build-min=
nowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86/uti=
l/header.o) to format elf32-i386 (/home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86/util/libpe=
rf-in.o) is not supported<br>| make[5]: *** [/home/sujith/MEL/dogwood/build=
-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/arch/x86=
/util/libperf-in.o] Error 1<br>| make[4]: *** [util] Error 2<br>| make[3]: =
*** [x86] Error 2<br>| make[2]: *** [arch] Error 2<br>|=C2=A0=C2=A0 MKDIR=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/wo=
rk/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/evlist.o<br>|=C2=A0=
=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0=
 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/evsel.o<=
br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-min=
nowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=
=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/u=
til/exec_cmd.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/do=
gwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1=
.0/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/=
build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/uti=
l/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL=
/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/per=
f-1.0/util/find_next_bit.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/help.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/kallsyms.o<br>|=C2=A0=C2=A0 M=
KDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/in=
tel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/levenshtein.o<=
br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-min=
nowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=
=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/u=
til/parse-options.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/M=
EL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/p=
erf-1.0/util/<br>|=C2=A0=C2=A0 BISON=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dog=
wood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.=
0/util/parse-events-bison.c<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/=
sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/=
1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0/util/path.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0/ui/stdio/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/stdio/hist.o<br>|=C2=A0=C2=A0 M=
KDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/in=
tel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browser.o<br>|=C2=
=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-m=
innowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/rbtre=
e.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build=
-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br=
>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogw=
ood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0=
/util/bitmap.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/do=
gwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1=
.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/suji=
th/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-=
r9/perf-1.0/util/hweight.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/s=
ujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1=
.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0/util/run-command.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/quote.o<br>|=C2=A0=C2=A0 M=
KDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/in=
tel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/strbuf.o<br>|=
=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/st=
ring.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/bu=
ild-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/=
<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/d=
ogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-=
1.0/util/strlist.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/ME=
L/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/pe=
rf-1.0/ui/browsers/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/M=
EL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/p=
erf-1.0/ui/tui/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ho=
me/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/pe=
rf/1.0-r9/perf-1.0/ui/tui/setup.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/annotate.o<br>|=C2=A0=C2=
=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/wo=
rk/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/<br>|=C2=A0=C2=A0 =
CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minno=
wmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/util.o<=
br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-min=
nowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=
=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/u=
til/strfilter.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/d=
ogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-=
1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/suj=
ith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0=
-r9/perf-1.0/util/top.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/suji=
th/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-=
r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/=
perf/1.0-r9/perf-1.0/util/usage.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 =
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/wrapper.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/ui/tui/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/helpline.o<br>|=C2=A0=C2=A0=
 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/sigchain=
.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-=
minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>=
|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwo=
od/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/=
util/dso.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/u=
til/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/M=
EL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/p=
erf-1.0/util/symbol.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith=
/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9=
/perf-1.0/ui/tui/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL=
/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/per=
f-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/s=
ujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1=
.0-r9/perf-1.0/ui/tui/progress.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/color.o<br>|=C2=A0=C2=A0 MKDIR=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/<br>|=C2=A0=C2=A0 MKDIR=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/<br>|=C2=A0=C2=A0 LD=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/libperf-in.o=
<br>| /home/sujith/codebench-linux-install-2015.12-133-i686-pc-linux-gnu/co=
debench/bin/i686-pc-linux-gnu-ld: Relocatable linking with relocations from=
 format elf64-x86-64 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/setup.o) to format elf32=
-i386 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/ui/tui/libperf-in.o) is not supported<br>| mak=
e[4]: *** [/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_6=
4-mel-linux/perf/1.0-r9/perf-1.0/ui/tui/libperf-in.o] Error 1<br>| make[3]:=
 *** [tui] Error 2<br>| make[3]: *** Waiting for unfinished jobs....<br>|=
=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/<br>=
|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwo=
od/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/=
ui/browsers/hists.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/ui/browsers/map.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/pager.o<br>|=C2=A0=C2=A0 MKDIR=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/<br>|=C2=A0=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/scri=
pts.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/bui=
ld-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<=
br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/do=
gwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1=
.0/util/header.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/=
dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf=
-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/su=
jith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.=
0-r9/perf-1.0/util/callchain.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /ho=
me/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/pe=
rf/1.0-r9/perf-1.0/ui/browsers/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/header.o<br>|=C2=A0=C2=A0 MK=
DIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/values.o<br>|=C2=
=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-m=
innowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/debug=
.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-=
minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>=
|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwo=
od/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/=
util/machine.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/do=
gwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1=
.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/suji=
th/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-=
r9/perf-1.0/util/map.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujit=
h/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r=
9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /h=
ome/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/p=
erf/1.0-r9/perf-1.0/util/pstack.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 =
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/=
sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/=
1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0/util/session.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/ordered-events.o<br>|=C2=
=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/<br>|=
=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwoo=
d/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/u=
i/browsers/libperf-in.o<br>| /home/sujith/codebench-linux-install-2015.12-1=
33-i686-pc-linux-gnu/codebench/bin/i686-pc-linux-gnu-ld: Relocatable linkin=
g with relocations from format elf64-x86-64 (/home/sujith/MEL/dogwood/build=
-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/brows=
ers/annotate.o) to format elf32-i386 (/home/sujith/MEL/dogwood/build-minnow=
max/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/browsers/lib=
perf-in.o) is not supported<br>| make[4]: *** [/home/sujith/MEL/dogwood/bui=
ld-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/ui/bro=
wsers/libperf-in.o] Error 1<br>| make[3]: *** [browsers] Error 2<br>| make[=
2]: *** [ui] Error 2<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/=
MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/=
perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /hom=
e/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/per=
f/1.0-r9/perf-1.0/util/comm.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /hom=
e/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/per=
f/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/util/thread.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/thread_map.o<br>|=C2=A0=C2=A0=
 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/=
intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/trace-event-pa=
rse.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/bui=
ld-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<=
br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/do=
gwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1=
.0/util/parse-events-bison.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home=
/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf=
/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujit=
h/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r=
9/perf-1.0/util/<br>|=C2=A0=C2=A0 BISON=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/=
dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf=
-1.0/util/pmu-bison.c<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-l=
inux/perf/1.0-r9/perf-1.0/util/trace-event-read.o<br>|=C2=A0=C2=A0 MKDIR=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/=
intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/trace-event-info.o<br>|=
=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/tr=
ace-event-scripting.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith=
/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9=
/perf-1.0/util/<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/d=
ogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-=
1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/suj=
ith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0=
-r9/perf-1.0/util/svghelper.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/util/trace-event.o<br>|=C2=A0=C2=A0 MKDI=
R=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel=
_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/sort.o<br>|=C2=A0=
=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0=
 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/hist.o<b=
r>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=
=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/b=
uild-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util=
/util.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/b=
uild-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util=
/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/=
dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf=
-1.0/util/xyarray.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/M=
EL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/p=
erf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home=
/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf=
/1.0-r9/perf-1.0/util/cpumap.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /ho=
me/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/pe=
rf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/util/cgroup.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/target.o<br>|=C2=A0=C2=A0 MKD=
IR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/inte=
l_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/rblist.o<br>|=C2=
=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=
=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/wo=
rk/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/intlist.o<b=
r>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dog=
wood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.=
0/util/vdso.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dog=
wood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.=
0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujit=
h/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r=
9/perf-1.0/util/stat.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujit=
h/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r=
9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /h=
ome/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/p=
erf/1.0-r9/perf-1.0/util/record.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 =
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/srcline.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/data.o<br>|=C2=A0=C2=A0 MK=
DIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/tsc.o<br>|=C2=A0=
=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0=
 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minn=
owmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/cloexec.=
o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-m=
innowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=
=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/th=
read-stack.o<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/=
sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/=
1.0-r9/perf-1.0/util/symbol-elf.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 =
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/probe-event.o<br>|=C2=A0=C2=A0 MKDIR=
=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_=
corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/scripting-engines/<br>|=C2=A0=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/sc=
ripting-engines/trace-event-perl.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0=
 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linu=
x/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64=
-mel-linux/perf/1.0-r9/perf-1.0/util/perf_regs.o<br>|=C2=A0=C2=A0 MKDIR=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor=
ei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/=
intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/zlib.o<br>|=C2=A0=C2=A0=
 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/=
intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/lzma.o<br>|=C2=
=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=
=A0 FLEX=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/t=
mp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/parse-events-fl=
ex.c<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/buil=
d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<b=
r>|=C2=A0=C2=A0 FLEX=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build=
-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/pmu=
-flex.c<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/b=
uild-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util=
/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/=
dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf=
-1.0/util/pmu-bison.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith=
/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9=
/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ho=
me/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/pe=
rf/1.0-r9/perf-1.0/util/parse-events.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=
=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-me=
l-linux/perf/1.0-r9/perf-1.0/util/scripting-engines/<br>|=C2=A0=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/=
tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/scripting-engi=
nes/trace-event-python.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/suj=
ith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0=
-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux=
/perf/1.0-r9/perf-1.0/util/parse-events-flex.o<br>|=C2=A0=C2=A0 MKDIR=C2=A0=
=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7=
_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/int=
el_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/pmu.o<br>|=C2=A0=C2=A0 MKD=
IR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp/work/inte=
l_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/<br>|=C2=A0=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowmax/tmp=
/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/pmu-flex.o<br>|=
=C2=A0=C2=A0 MKDIR=C2=A0=C2=A0=C2=A0 /home/sujith/MEL/dogwood/build-minnowm=
ax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/util/scripting-e=
ngines/<br>|=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sujit=
h/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r=
9/perf-1.0/util/scripting-engines/libperf-in.o<br>| /home/sujith/codebench-=
linux-install-2015.12-133-i686-pc-linux-gnu/codebench/bin/i686-pc-linux-gnu=
-ld: Relocatable linking with relocations from format elf64-x86-64 (/home/s=
ujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1=
.0-r9/perf-1.0/util/scripting-engines/trace-event-perl.o) to format elf32-i=
386 (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-=
linux/perf/1.0-r9/perf-1.0/util/scripting-engines/libperf-in.o) is not supp=
orted<br>| ERROR: oe_runmake failed<br>| make[4]: *** [/home/sujith/MEL/dog=
wood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.=
0/util/scripting-engines/libperf-in.o] Error 1<br>| make[3]: *** [scripting=
-engines] Error 2<br>| make[3]: *** Waiting for unfinished jobs....<br>| ma=
ke[2]: *** [util] Error 2<br>| make[1]: *** [/home/sujith/MEL/dogwood/build=
-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/perf-1.0/libperf-=
in.o] Error 2<br>| make: *** [all] Error 2<br>| make: Leaving directory `/h=
ome/sujith/MEL/dogwood/build-minnowmax/tmp/work-shared/intel-corei7-64/kern=
el-source/tools/perf&#39;<br>| WARNING: exit code 1 from a shell command.<b=
r>| ERROR: Function failed: do_compile (log file is located at /home/sujith=
/MEL/dogwood/build-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9=
/temp/log.do_compile.29062)<br><br></div>After applying the patch it built =
cleanly. <br><div><div><div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Tue, Oct 4, 2016 at 3:11 PM, Sujith H <span dir=3D"ltr">&lt;<=
a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">Su=
jith_Haridasan@mentor.com</a>&gt;<br>
<br>
When built on minnowmax ( machine name: intel-corei7-64),<br>
an error is noticed during the do_compile:<br>
<br>
=C2=A0/home/sujith/codebench-linux-<wbr>install-2015.12-133-i686-pc-<wbr>li=
nux-gnu/codebench/bin/i686-<wbr>pc-linux-gnu-ld:<br>
Relocatable linking with relocations from format elf64-x86-64<br>
(/home/sujith/MEL/dogwood/<wbr>build-minnowmax/tmp/work/<wbr>intel_corei7_6=
4-mel-linux/<wbr>perf/1.0-r9/perf-1.0/fd/array.<wbr>o)<br>
to format elf32-i386 (/home/sujith/MEL/dogwood/<wbr>build-minnowmax/tmp/wor=
k/<wbr>intel_corei7_64-mel-linux/<wbr>perf/1.0-r9/perf-1.0/fd/<wbr>libapi-i=
n.o)<br>
is not supported<br>
<br>
This change help fix the issue.<br>
<br>
Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@ment=
or.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.<wbr>bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">per<wbr>f.bb</a> b/meta/recipes-kernel/perf/<a h=
ref=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a=
><br>
index 0d104d3..471023d 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">per<wbr>f.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">per<wbr>f.bb</a><br>
@@ -170,6 +170,7 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0if [ -e &quot;${S}/tools/perf/Makefile.<wbr>perf&quot; =
]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,CC =3D $(CROSS_COMPILE)gcc,=
#CC,&#39; ${S}/tools/perf/Makefile.perf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,AR =3D $(CROSS_COMPILE)ar,#=
AR,&#39; ${S}/tools/perf/Makefile.perf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,LD =3D $(CROSS_COMPILE)ld,#LD,&#=
39; ${S}/tools/perf/Makefile.perf<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ -e &quot;${S}/tools/lib/api/Makefile&quot; ]; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,CC =3D $(CROSS_COMPILE)gcc,=
#CC,&#39; ${S}/tools/lib/api/Makefile<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br></div><div>&lt;Project&gt;Contributor to Yo=
cto project<br></div><div><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Cam=
paign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br=
>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://suji=
thh.info</a><br></div><div>C-x C-c<br></div></div></div></div></div>
</div></div></div></div></div>

--94eb2c0d7c28849c5a053e06e783--
