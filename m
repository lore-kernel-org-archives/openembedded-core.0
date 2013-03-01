Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UBOtw-0000IN-Bm
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 13:17:44 +0100
Message-ID: <5130987B.5050800@communistcode.co.uk>
Date: Fri, 01 Mar 2013 12:00:59 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Perf using host system includes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 12:17:46 -0000
X-Groupsio-MsgNum: 36080
Content-Type: multipart/mixed; boundary="------------080908090201070806020400"

--------------080908090201070806020400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

It seems Perf is managing to have some system includes slip into the 
build. Attached is the log file with details.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------080908090201070806020400
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_compile"

DEBUG: Executing shell function do_compile
NOTE: make -j 8 -C /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/src/kernel/tools/perf O=/mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4 CROSS_COMPILE=arm-oecore-linux-gnueabi- ARCH=arm CC=arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone AR=arm-oecore-linux-gnueabi-ar perfexecdir=/usr/lib/perf NO_GTK2=1 NO_DWARF=1 CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types LDFLAGS=-ldl -lutil -lpthread -lrt -lelf -lm -lbfd prefix=/usr bindir=/usr/bin sharedir=/usr/share sysconfdir=/etc perfexecdir=/usr/lib/perf/perf-core ETC_PERFCONFIG=../etc sharedir=share mandir=share/man infodir=share/info all
    CHK -fstack-protector-all
    CHK -Wstack-protector
    CHK -Wvolatile-register-var
    CHK bionic
    CHK libelf
    CHK libdw
make: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/src/kernel/tools/perf'
Makefile:554: No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev
    CHK libunwind
Makefile:570: No libunwind found, disabling post unwind support. Please install libunwind-dev[el] >= 0.99
    CHK -DLIBELF_MMAP
    CHK libaudit
Makefile:627: No libaudit.h found, disables 'trace' tool, please install audit-libs-devel or libaudit-dev
    CHK libnewt
    CHK perl
    CHK python
    CHK python version
    CHK libbfd
    CHK -DHAVE_STRLCPY
    CHK -DHAVE_ON_EXIT
    CHK -DBACKTRACE_SUPPORT
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/arch/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/bench/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/scripts/perl/Perf-Trace-Util/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/scripts/python/Perf-Trace-Util/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/browsers/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/stdio/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/tui/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/scripting-engines/
    MKDIR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/
PERF_VERSION = 3.8.0
make: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/src/kernel/tools/perf'
    CHK -fstack-protector-all
    CHK -Wstack-protector
    CHK -Wvolatile-register-var
    CHK bionic
    CHK libelf
    CHK libdw
make: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/src/kernel/tools/perf'
Makefile:554: No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev
    CHK libunwind
Makefile:570: No libunwind found, disabling post unwind support. Please install libunwind-dev[el] >= 0.99
    CHK -DLIBELF_MMAP
    CHK libaudit
Makefile:627: No libaudit.h found, disables 'trace' tool, please install audit-libs-devel or libaudit-dev
    CHK libnewt
    CHK perl
    CHK python
    CHK python version
    CHK libbfd
    CHK -DHAVE_STRLCPY
    CHK -DHAVE_ON_EXIT
    CHK -DBACKTRACE_SUPPORT
    GEN /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/common-cmds.h
    * new build flags or prefix
    BISON /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pmu-bison.c
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/environment.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/event.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/evlist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/evsel.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/exec_cmd.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/help.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/levenshtein.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/parse-options.o
    BISON /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/parse-events-bison.c
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/path.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/rbtree.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/bitmap.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/hweight.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/run-command.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/quote.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/strbuf.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/string.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/strlist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/strfilter.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/top.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/usage.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/wrapper.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/sigchain.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/dso.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/symbol.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/symbol-elf.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/color.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pager.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/header.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/callchain.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/values.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/debug.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/machine.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/map.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pstack.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/session.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/thread.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/thread_map.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/trace-event-parse.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/parse-events-bison.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pmu-bison.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/trace-event-read.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/trace-event-info.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/trace-event-scripting.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/svghelper.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/sort.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/hist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/probe-event.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/util.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/xyarray.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/cpumap.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/cgroup.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/target.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/rblist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/intlist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/vdso.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/stat.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/setup.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/helpline.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/progress.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/hist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/stdio/hist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/arch/common.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/parse-events.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/dso-data.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/attr.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/vmlinux-kallsyms.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/open-syscall.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/open-syscall-all-cpus.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/open-syscall-tp-fields.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/mmap-basic.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/perf-record.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/rdpmc.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/evsel-roundtrip-name.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/evsel-tp-sched.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/pmu.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/util.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/browser.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/browsers/annotate.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/browsers/hists.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/browsers/map.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/browsers/scripts.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/util.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/tui/setup.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/tui/util.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/tui/helpline.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/ui/tui/progress.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/scripting-engines/trace-event-perl.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/scripts/perl/Perf-Trace-Util/Context.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/scripting-engines/trace-event-python.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/scripts/python/Perf-Trace-Util/Context.o
    GEN perf-archive
    GEN /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/python/perf.so
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/src/kernel/tools/lib/traceevent'
make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
    * new build flags or cross compiler
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/perf.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-annotate.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
  CC FPIC            event-parse.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-bench.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/bench/sched-messaging.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/bench/sched-pipe.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/bench/mem-memcpy.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/bench/mem-memset.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-diff.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-evlist.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-help.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-sched.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-buildid-list.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-buildid-cache.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-list.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-record.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-report.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-stat.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-timechart.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-top.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-script.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-probe.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-kmem.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-lock.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-kvm.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/builtin-inject.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/tests/builtin-test.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/abspath.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/alias.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/annotate.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/build-id.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/config.o
  CC FPIC            trace-seq.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/ctype.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/debugfs.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/sysfs.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
    FLEX /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pmu-flex.c
  CC FPIC            parse-filter.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
    FLEX /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/parse-events-flex.c
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pmu.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/pmu-flex.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/parse-events.o
    CC /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/util/parse-events-flex.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
    AR /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/libperf.a
  CC FPIC            parse-utils.o
cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
  BUILD STATIC LIB   libtraceevent.a
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/src/kernel/tools/lib/traceevent'
    LINK /mnt/SSD/oe-r0005/ccoR0005/tmp/work/beaglebone-oecore-linux-gnueabi/perf/3.4-r8/perf-3.4/perf
DEBUG: Shell function do_compile finished

--------------080908090201070806020400--
