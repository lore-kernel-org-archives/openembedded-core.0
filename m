Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B9C07606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 14:36:08 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id i5so29029061wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aWNh8aMLzSRCCbl71HtlFjO547KQlwngyGSGm6KxomA=;
	b=EQiZyteIMI2VEbDNYAaXK/sB5/7rTimcu3h6M/L39h6P4e2brUNR/zIqvKNmVd/viW
	gzXf2/jt+A4U3NvBwGfHCqKaIYMDvl2xrY1wJOLyF79cwF2IMFXFHDIGtSQnx4boqQF/
	Yy0J3wxYQTUueCr7cVjpRjh4ft+wksDntaXu3G3BRgnnevEH7a16k6sYBXGwphKvuHoR
	2GLfu7c256GOS6uO+Pkfa+MHtRVfIUVdE1hllawX3xpNP5Pkfq7NpDtoPKQk7o3uNdxD
	luZ5cf6zfbMrbbn2uaO6Y7ysXikaT1HphAvM0ouF9fAOKmgzqQhNVPUCIYKzdpdt/mCp
	p1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aWNh8aMLzSRCCbl71HtlFjO547KQlwngyGSGm6KxomA=;
	b=G+eXoFkhWcV1vLZ35gFFt4lWG3F5gZyGPCNQL1lhPQgtOH9fjhS4aO8My3NeJTndjQ
	A6A7tojXtBZbfcfX2ZQpKUAfhAFVH9Njj5nd730l4tsiWKKf8KgEyBWJexNImVCMnror
	pFYZ2Bnu1p2DRjMLbSgZAmpFL+TmXcsOxbaNCpQIDXaA8p1x9Cd9uMr8RLLtVEDwsQUa
	iVkMvE7qMJOiFISlKI60+5vJQ59qARI7oA28RzKerlsbe+nUffrlRKluJaEwC8LLb9y1
	whp7WTeQw7mI2QUqgQyUGz4MCoTytdSF0Ebdw74ESJC1iroLV7B/uP1rC0jGniZ+/kFC
	r7kw==
X-Gm-Message-State: ALyK8tJ0XUpW+H6fdSA7z2PW7iBngZ2y8Hb8dpD3U0uCH2thsEHzTXYTW4D1YyNtZk2MAQdY
X-Received: by 10.28.221.8 with SMTP id u8mr2959662wmg.61.1468938966077;
	Tue, 19 Jul 2016 07:36:06 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b130sm23429968wmg.3.2016.07.19.07.36.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 07:36:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 15:36:01 +0100
Message-Id: <1468938961-17098-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] uclibc: remove
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
X-List-Received-Date: Tue, 19 Jul 2016 14:36:11 -0000

uclibc is showing its age now and upstarts like musl are approximately the same
size but with far more features and active maintainers.  Remove uclibc from
oe-core and use endorse musl as the lighter alternative to full-fat glibc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/tclibc-uclibc.inc         |  28 --
 meta/recipes-core/uclibc/site_config/funcs         | 474 ---------------------
 meta/recipes-core/uclibc/site_config/headers       | 156 -------
 meta/recipes-core/uclibc/site_config/types         |  21 -
 meta/recipes-core/uclibc/uclibc-config.inc         | 142 ------
 meta/recipes-core/uclibc/uclibc-git.inc            |  18 -
 .../0001-Disable-lrount_tes-function.patch         |  37 --
 .../0001-Provide-an-alias-to-_obstack_free.patch   |  44 --
 meta/recipes-core/uclibc/uclibc-git/locale.cfg     |   3 -
 meta/recipes-core/uclibc/uclibc-git/obstack.cfg    |   1 -
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  | 195 ---------
 meta/recipes-core/uclibc/uclibc-git/uClibc.machine |  14 -
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |  36 --
 meta/recipes-core/uclibc/uclibc-package.inc        |  36 --
 meta/recipes-core/uclibc/uclibc.inc                | 159 -------
 meta/recipes-core/uclibc/uclibc_git.bb             |  22 -
 16 files changed, 1386 deletions(-)
 delete mode 100644 meta/conf/distro/include/tclibc-uclibc.inc
 delete mode 100644 meta/recipes-core/uclibc/site_config/funcs
 delete mode 100644 meta/recipes-core/uclibc/site_config/headers
 delete mode 100644 meta/recipes-core/uclibc/site_config/types
 delete mode 100644 meta/recipes-core/uclibc/uclibc-config.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/locale.cfg
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/obstack.cfg
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.distro
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-initial_git.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc-package.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc_git.bb

diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
deleted file mode 100644
index 14c3cdb..0000000
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# uclibc specific configuration
-#
-
-LIBCEXTENSION = "-uclibc"
-
-# Add uclibc overrides to the overrides.
-LIBCOVERRIDE = ":libc-uclibc"
-OVERRIDES .= "${LIBCOVERRIDE}"
-
-PREFERRED_PROVIDER_virtual/libc ?= "uclibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
-
-USE_NLS ?= "no"
-
-CXXFLAGS += "-fvisibility-inlines-hidden"
-
-IMAGE_LINGUAS = ""
-
-LIBC_DEPENDENCIES = "\
-    uclibc \
-    uclibc-dbg \
-    uclibc-dev \
-    uclibc-thread-db \
-    "
diff --git a/meta/recipes-core/uclibc/site_config/funcs b/meta/recipes-core/uclibc/site_config/funcs
deleted file mode 100644
index ccc8539..0000000
--- a/meta/recipes-core/uclibc/site_config/funcs
+++ /dev/null
@@ -1,474 +0,0 @@
-a64l
-abs
-access
-__adjtimex
-alarm
-alphasort
-argz_append
-__argz_count
-argz_create_sep
-argz_insert
-__argz_next
-argz_next
-__argz_stringify
-argz_stringify
-asprintf
-atexit
-atof
-atoi
-bcmp
-bcopy
-bindresvport
-bind_textdomain_codeset
-btowc
-bzero
-calloc
-canonicalize_file_name
-catgets
-cfgetospeed
-cfsetispeed
-cfsetspeed
-chmod
-chown
-chroot
-clock
-close
-closedir
-closelog
-confstr
-connect
-daemon
-dcgettext
-difftime
-dirfd
-dirname
-dngettext
-dup2
-ecvt
-endgrent
-endmntent
-endpwent
-endutent
-endutxent
-epoll_ctl
-err
-ether_hostton
-ether_ntohost
-euidaccess
-execv
-fchdir
-fchmod
-fchmodat
-fchown
-fchownat
-fcntl
-fcvt
-fdatasync
-fdopendir
-feof_unlocked
-fgets_unlocked
-fgetxattr
-finite
-flistxattr
-flock
-flockfile
-fnmatch
-fork
-fpathconf
-__fpending
-fprintf
-free
-freeaddrinfo
-freeifaddrs
-fseeko
-__fsetlocking
-fsetxattr
-fstat64
-fstat
-fstatfs
-fsync
-ftello
-ftime
-ftruncate
-funlockfile
-futimes
-futimesat
-gai_strerror
-gcvt
-getaddrinfo
-getc_unlocked
-getcwd
-getdelim
-getdomainname
-getdtablesize
-getegid
-getenv
-geteuid
-getgid
-getgrent
-getgrent_r
-getgrgid_r
-getgrnam
-getgrnam_r
-getgrouplist
-getgroups
-gethostbyaddr_r
-gethostbyname2
-gethostbyname
-gethostbyname_r
-gethostent
-gethostid
-gethostname
-getifaddrs
-getline
-getloadavg
-getmntent
-getmsg
-getnameinfo
-getnetbyaddr_r
-getnetgrent_r
-getopt
-getopt_long
-getopt_long_only
-getpagesize
-getpass
-getpeername
-getpgrp
-getpid
-getppid
-getprotoent_r
-getpwent
-getpwent_r
-getpwnam
-getpwnam_r
-getpwuid
-getpwuid_r
-getresuid
-getrlimit
-getrusage
-getservbyname
-getservbyname_r
-getservbyport_r
-getservent
-getservent_r
-getspnam
-getspnam_r
-gettimeofday
-getttyent
-getttynam
-getuid
-getusershell
-getutent
-getutid
-getutline
-getutmp
-getutmpx
-getutxent
-getutxid
-getutxline
-getwd
-getxattr
-glob
-gmtime
-gmtime_r
-grantpt
-group_member
-herror
-hstrerror
-iconv
-iconv_open
-if_freenameindex
-if_indextoname
-if_nameindex
-if_nametoindex
-index
-inet_addr
-inet_aton
-inet_ntoa
-inet_ntop
-inet_pton
-initgroups
-innetgr
-iruserok
-isascii
-isatty
-isblank
-isgraph
-isinf
-isnan
-isprint
-isspace
-iswalnum
-iswcntrl
-iswctype
-iswprint
-iswspace
-iswupper
-isxdigit
-kill
-killpg
-lchown
-lckpwdf
-lgetxattr
-link
-listxattr
-llistxattr
-localtime
-localtime_r
-lockf
-lrand48
-lsearch
-lseek64
-lsetxattr
-lstat
-mallinfo
-malloc
-mblen
-mbrlen
-mbrtowc
-mbsinit
-mbsrtowcs
-mbtowc
-memalign
-memchr
-memcmp
-memcpy
-memmove
-mempcpy
-memrchr
-memset
-mkdir
-mkdirat
-mkdtemp
-mkfifo
-mknod
-mkstemp64
-mkstemp
-mktime
-mlock
-mmap
-mtrace
-munlock
-munmap
-nanosleep
-nice
-nl_langinfo
-ntp_adjtime
-ntp_gettime
-_obstack_free
-on_exit
-open64
-open
-openat
-opendir
-openlog
-pathconf
-pipe
-poll
-popen
-posix_memalign
-prctl
-pread
-printf
-__progname
-pselect
-pthread_mutex_lock
-ptsname
-putenv
-putgrent
-putpwent
-putspent
-pututline
-pututxline
-putwc
-pwrite
-qsort
-raise
-rand
-random
-rand_r
-read
-readdir
-readdir_r
-readlink
-realloc
-realpath
-re_comp
-recvmsg
-re_exec
-regcomp
-regexec
-remove
-rename
-re_search
-rmdir
-rpmatch
-rresvport_af
-ruserok
-ruserok_af
-sbrk
-scandir
-sched_setscheduler
-sched_yield
-__secure_getenv
-select
-semctl
-semget
-sendmsg
-setbuf
-setbuffer
-setegid
-setenv
-seteuid
-setgid
-setgroups
-sethostname
-setitimer
-_setjmp
-setjmp
-setlinebuf
-setlocale
-setmntent
-setpgid
-setpgrp
-setpriority
-setregid
-setresgid
-setresuid
-setreuid
-setrlimit
-setsid
-setsockopt
-settimeofday
-setuid
-setutent
-setutxent
-setvbuf
-setxattr
-sgetspent
-shmat
-shmctl
-shmdt
-shmget
-shutdown
-sigaction
-sigaddset
-sigaltstack
-sigblock
-sigemptyset
-sighold
-siginterrupt
-signal
-sigprocmask
-sigset
-sigsetmask
-sigstack
-sigsuspend
-sigvec
-snprintf
-socket
-socketpair
-sprintf
-srand48
-srand
-srandom
-sscanf
-stat
-statfs
-statvfs
-stime
-stpcpy
-strcasecmp
-strcasestr
-strchr
-strchrnul
-strcmp
-strcspn
-strdup
-strerror
-strerror_r
-strftime
-strlen
-strncasecmp
-strncmp
-strndup
-strnlen
-strpbrk
-strptime
-strrchr
-strsep
-strsignal
-strspn
-strstr
-strtod
-strtoimax
-strtok_r
-strtol
-strtoll
-strtoul
-strtoull
-strtoumax
-strverscmp
-strxfrm
-symlink
-sync
-sysconf
-sysctl
-sysinfo
-syslog
-_sys_siglist
-sys_siglist
-system
-tcgetattr
-tcgetpgrp
-tcsetattr
-tcsetpgrp
-time
-timegm
-times
-timezone
-tmpnam
-towlower
-towupper
-truncate
-tsearch
-ttyname
-tzset
-ulimit
-umask
-uname
-unlink
-unsetenv
-unshare
-updwtmp
-updwtmpx
-usleep
-ustat
-utime
-utimes
-utmpname
-utmpxname
-valloc
-vasprintf
-verrx
-vfork
-vfprintf
-vfscanf
-vhangup
-vprintf
-vsnprintf
-vsprintf
-wait3
-wait4
-waitpid
-wcrtomb
-wcscoll
-wcsdup
-wcslen
-wctob
-wctomb
-wctype
-wcwidth
-wmemchr
-wmemcpy
-wmempcpy
diff --git a/meta/recipes-core/uclibc/site_config/headers b/meta/recipes-core/uclibc/site_config/headers
deleted file mode 100644
index 609ab53..0000000
--- a/meta/recipes-core/uclibc/site_config/headers
+++ /dev/null
@@ -1,156 +0,0 @@
-aio.h
-alloca.h
-argz.h
-arpa/inet.h
-arpa/nameser.h
-asm/byteorder.h
-asm/ioctls.h
-asm/page.h
-asm/types.h
-assert.h
-byteswap.h
-crypt.h
-ctype.h
-dirent.h
-dlfcn.h
-elf.h
-endian.h
-err.h
-errno.h
-execinfo.h
-fcntl.h
-features.h
-float.h
-fstab.h
-ftw.h
-getopt.h
-glob.h
-grp.h
-iconv.h
-ifaddrs.h
-inttypes.h
-langinfo.h
-lastlog.h
-libgen.h
-libintl.h
-limits.h
-linux/capability.h
-linux/fd.h
-linux/fs.h
-linux/hayesesp.h
-linux/hdreg.h
-linux/icmp.h
-linux/in6.h
-linux/joystick.h
-linux/ptrace.h
-linux/serial.h
-linux/sonypi.h
-linux/unistd.h
-linux/utsname.h
-linux/version.h
-locale.h
-malloc.h
-math.h
-mcheck.h
-memory.h
-mntent.h
-mqueue.h
-netdb.h
-net/if.h
-netinet/ether.h
-netinet/in.h
-netinet/ip6.h
-netinet/ip.h
-netinet/tcp.h
-netinet/udp.h
-netipx/ipx.h
-net/route.h
-paths.h
-poll.h
-pthread.h
-pty.h
-pwd.h
-regex.h
-resolv.h
-rpc/rpc.h
-rpc/types.h
-sched.h
-scsi/scsi.h
-search.h
-semaphore.h
-setjmp.h
-sgtty.h
-shadow.h
-signal.h
-stdarg.h
-stdbool.h
-stdc
-stddef.h
-stdint.h
-stdio.h
-stdlib.h
-string.h
-strings.h
-stropts.h
-sys/bitypes.h
-sys/cdefs.h
-sys/dir.h
-sys/epoll.h
-sysexits.h
-sys/fcntl.h
-sys/file.h
-sys/fsuid.h
-sys/ioctl.h
-sys/ipc.h
-syslog.h
-sys/mman.h
-sys/mount.h
-sys/mtio.h
-sys/param.h
-sys/poll.h
-sys/prctl.h
-sys/ptrace.h
-sys/queue.h
-sys/reg.h
-sys/resource.h
-sys/select.h
-sys/sem.h
-sys/shm.h
-sys/signal.h
-sys/socket.h
-sys/socketvar.h
-sys/soundcard.h
-sys/statfs.h
-sys/stat.h
-sys/statvfs.h
-sys/stropts.h
-sys/swap.h
-sys/sysctl.h
-sys/sysinfo.h
-sys/sysmacros.h
-sys/termios.h
-sys/timeb.h
-sys/time.h
-sys/times.h
-sys/timex.h
-sys/types.h
-sys/uio.h
-sys/un.h
-sys/unistd.h
-sys/user.h
-sys/utsname.h
-sys/vfs.h
-sys/wait.h
-termio.h
-termios.h
-time.h
-ttyent.h
-ulimit.h
-unistd.h
-ustat.h
-utime.h
-utmp.h
-utmpx.h
-values.h
-wchar.h
-wctype.h
diff --git a/meta/recipes-core/uclibc/site_config/types b/meta/recipes-core/uclibc/site_config/types
deleted file mode 100644
index 178bd85..0000000
--- a/meta/recipes-core/uclibc/site_config/types
+++ /dev/null
@@ -1,21 +0,0 @@
-char
-char *
-double
-float
-int
-long
-long double
-long int
-long long
-long long int
-short
-short int
-signed char
-unsigned char
-unsigned int
-unsigned long
-unsigned long int
-unsigned long long int
-unsigned short
-unsigned short int
-void *
diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
deleted file mode 100644
index 8b9e41c..0000000
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ /dev/null
@@ -1,142 +0,0 @@
-DEPENDS += "kern-tools-native"
-inherit cml1
-#
-# Set the ARCH environment variable for uClibc compilation.
-# Return value must match one of the architectures known to uClibc:
-# libc/sysdeps/*/*
-#
-
-valid_archs = "\
-alpha \
-arm \
-avr32 \
-bfin \
-c6x \
-cris \
-e1 \
-frv \
-h8300 \
-hppa \
-i386 \
-i960 \
-ia64 \
-m68k \
-microblaze \
-mips \
-nios \
-nios2 \
-powerpc \
-sh \
-sh64 \
-sparc \
-v850 \
-vax \
-x86_64 \
-xtensa \
-"
-def map_uclibc_arch(a, d):
-    """Return the uClibc architecture for the given TARGET_ARCH."""
-    import re
-
-    valid_archs = d.getVar('valid_archs', True).split()
-
-    if re.match('^(arm|sa110).*', a):
-        return 'arm'
-    elif re.match('^(i.86|athlon)$', a):
-        return 'i386'
-    elif re.match('^mips.*', a):
-        return 'mips'
-    elif re.match('^parisc.*', a):
-        return 'hppa'
-    elif re.match('^ppc.*', a):
-        return 'powerpc'
-    elif re.match('^s390.*', a):
-        return 's390'
-    elif re.match('^sh.*', a):
-        return 'sh'
-    elif re.match('^(sun|sparc).*', a):
-        return 'sparc'
-    elif re.match('^xtensa.*', a):
-        return 'xtensa'
-    elif a in valid_archs:
-        return a
-    else:
-        bb.error("cannot map '%s' to a uClibc architecture" % a)
-
-export UCLIBC_ARCH = "${@map_uclibc_arch(d.getVar('TARGET_ARCH', True), d)}"
-
-def map_uclibc_abi(o, d):
-    """Return the uClibc ABI for the given TARGET_OS."""
-    import re
-
-    arch = d.getVar('TARGET_ARCH', True)
-    if map_uclibc_arch(d.getVar('TARGET_ARCH', True), d) == "arm":
-        if re.match('.*eabi$', o):
-            return 'ARM_EABI'
-        else:
-            return 'ARM_OABI'
-    # FIXME: This is inaccurate! Handle o32, n32, n64
-    elif re.match('^mips.*64$', arch):
-        return 'MIPS_N64_ABI'
-    elif re.match('^mips.*', arch):
-        return 'MIPS_O32_ABI'
-    return ""
-
-export UCLIBC_ABI = "${@map_uclibc_abi(d.getVar('TARGET_OS', True), d)}"
-
-def map_uclibc_endian(a, d):
-    """Return the uClibc endianess for the given TARGET_ARCH."""
-    import re
-
-    # Always BE
-    if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
-        return 'BIG'
-    # Possibly BE
-    elif re.match('^(((arm|sa110).*eb)|h8300.*eb|(parisc|hppa).*eb|mips|mips64|sh.*eb|xtensa.*eb)$', a):
-        return 'BIG'
-    return 'LITTLE'
-
-export UCLIBC_ENDIAN = "${@map_uclibc_endian(d.getVar('TARGET_ARCH', True), d)}"
-
-# internal helper
-def uclibc_cfg(feature, features, tokens, cnf, rem):
-    if type(tokens) == type(""):
-        tokens = [tokens]
-    rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
-    if type(features) == type([]) and feature in features:
-        cnf.extend([token + '=y' for token in tokens])
-    else:
-        cnf.extend(['# ' + token + ' is not set' for token in tokens])
-
-# Map distro features to config settings
-def features_to_uclibc_settings(d):
-    cnf, rem = ([], [])
-    distro_features = d.getVar('DISTRO_FEATURES', True).split()
-    uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
-    uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
-    uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
-    uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
-    uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
-    uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
-    uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
-    uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
-    uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
-    return "\n".join(cnf), "\n".join(rem)
-# X, Y = ${@features_to_uclibc_settings(d)}
-# unfortunately doesn't seem to work with bitbake, workaround:
-def features_to_uclibc_conf(d):
-    cnf, rem = features_to_uclibc_settings(d)
-    return cnf
-def features_to_uclibc_del(d):
-    cnf, rem = features_to_uclibc_settings(d)
-    return rem
-
-# returns all the elements from the src uri that are .cfg files
-def find_cfgs(d):
-    sources=src_patches(d, True)
-    sources_list=[]
-    for s in sources:
-        if s.endswith('.cfg'):
-            sources_list.append(s)
-
-    return sources_list
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
deleted file mode 100644
index 718bee9..0000000
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SRCREV = "003b266cbeb370a8eae91dc256197f00798c6f93"
-
-PV = "1.0.12+git${SRCPV}"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
-
-SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
-        file://0001-Disable-lrount_tes-function.patch \
-        file://0001-Provide-an-alias-to-_obstack_free.patch \
-        file://uClibc.machine \
-        file://uClibc.distro \
-        file://obstack.cfg \
-        file://locale.cfg \
-"
-S = "${WORKDIR}/git"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch
deleted file mode 100644
index 506f146..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Disable-lrount_tes-function.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 14b865b3438d0df29b4969148678d8fa8943e1ef Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Aug 2015 20:49:33 -0700
-Subject: [PATCH 1/7] Disable lrount_tes() function
-
-Its not used anyway, avoids some strict compiler warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- test/math/libm-test.inc | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/test/math/libm-test.inc b/test/math/libm-test.inc
-index f50b48b..6d70a95 100644
---- a/test/math/libm-test.inc
-+++ b/test/math/libm-test.inc
-@@ -3470,7 +3470,6 @@ logb_test (void)
- }
- 
- 
--#if 0
- static void
- lround_test (void)
- {
-@@ -3605,7 +3604,6 @@ llround_test (void)
- 
-   END (llround);
- }
--#endif
- 
- static void
- modf_test (void)
--- 
-2.1.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch
deleted file mode 100644
index 30b443f..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 06e4fe64bbd01f16ee84da161b8e1a61e73b4cdb Mon Sep 17 00:00:00 2001
-From: Alexey Neyman <aneyman@lynx.com>
-Date: Thu, 31 Mar 2016 13:02:47 -0700
-Subject: [PATCH] Provide an alias to _obstack_free
-
-GDB 7.11 does not build if compiled against uclibc-ng (1.0.12 was used,
-but the problematic code exists in 1.0.13 as well). The reason is that
-GDB release includes its own obstack implementation, but elides the code
-if <gnu-versions.h> declares a compatible obstack implementation in
-libc. uclibc-ng does claim compatible obstack interface (GDB expects
-version 2, but accepts version 1 if sizeof(int) == sizeof(size_t)),
-however, uclibc-ng does not provide the _obstack_free symbol that is a
-part of the interface (glibc does provide this symbol). This later
-causes a link failure.
-
-The attached patch makes uclibc-ng enables an alias _obstack_free ->
-obstack_free.
-
-Signed-off-by: Alexey Neyman <stilor@att.net>
----
-Upstream-Status: Backport
-
- libc/misc/gnu/obstack.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
-index 38cfd83..6acc567 100644
---- a/libc/misc/gnu/obstack.c
-+++ b/libc/misc/gnu/obstack.c
-@@ -385,11 +385,9 @@ obstack_free (struct obstack *h, void *obj)
-     abort ();
- }
- 
--# if 0
- /* Older versions of libc used a function _obstack_free intended to be
-    called by non-GCC compilers.  */
- strong_alias (obstack_free, _obstack_free)
--# endif
- 
- int
- _obstack_memory_used (struct obstack *h)
--- 
-2.8.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/locale.cfg b/meta/recipes-core/uclibc/uclibc-git/locale.cfg
deleted file mode 100644
index fc66435..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/locale.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-UCLIBC_HAS_LOCALE=y
-UCLIBC_HAS_XLOCALE=y
-UCLIBC_BUILD_MINIMAL_LOCALE=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/obstack.cfg b/meta/recipes-core/uclibc/uclibc-git/obstack.cfg
deleted file mode 100644
index 36bf9d6..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/obstack.cfg
+++ /dev/null
@@ -1 +0,0 @@
-UCLIBC_HAS_OBSTACK=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
deleted file mode 100644
index 7785ce8..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ /dev/null
@@ -1,195 +0,0 @@
-#
-# General Library Settings
-#
-# HAVE_NO_PIC is not set
-# DOPIC is not set
-# HAVE_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
-# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
-LDSO_LDD_SUPPORT=y
-LDSO_CACHE_SUPPORT=y
-# LDSO_PRELOAD_FILE_SUPPORT is not set
-LDSO_BASE_FILENAME="ld.so"
-# UCLIBC_STATIC_LDCONFIG is not set
-LDSO_RUNPATH=y
-UCLIBC_CTOR_DTOR=y
-LDSO_GNU_HASH_SUPPORT=y
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-UCLIBC_HAS_THREADS_NATIVE=y
-PTHREADS_DEBUG_SUPPORT=y
-# LINUXTHREADS_OLD is not set
-UCLIBC_HAS_LFS=y
-# MALLOC is not set
-# MALLOC_SIMPLE is not set
-MALLOC_STANDARD=y
-MALLOC_GLIBC_COMPAT=y
-UCLIBC_DYNAMIC_ATEXIT=y
-COMPAT_ATEXIT=y
-UCLIBC_SUSV3_LEGACY=y
-UCLIBC_SUSV3_LEGACY_MACROS=y
-UCLIBC_SUSV4_LEGACY=y
-UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
-UCLIBC_HAS___PROGNAME=y
-UNIX98PTY_ONLY=y
-ASSUME_DEVPTS=y
-UCLIBC_HAS_LIBUTIL=y
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-
-#
-# Networking Support
-#
-UCLIBC_HAS_IPV6=y
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-UCLIBC_HAS_REENTRANT_RPC=y
-UCLIBC_USE_NETLINK=y
-UCLIBC_SUPPORT_AI_ADDRCONFIG=y
-
-UCLIBC_HAS_BSD_RES_CLOSE=y
-UCLIBC_HAS_LIBRESOLV_STUB=y
-UCLIBC_HAS_LIBNSL_STUB=y
-
-#
-# String and Stdio Support
-#
-UCLIBC_HAS_STRING_GENERIC_OPT=y
-UCLIBC_HAS_STRING_ARCH_OPT=y
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-UCLIBC_HAS_CTYPE_CHECKED=y
-# UCLIBC_HAS_CTYPE_ENFORCED is not set
-UCLIBC_HAS_WCHAR=y
-# UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-UCLIBC_HAS_STDIO_GETC_MACRO=y
-UCLIBC_HAS_STDIO_PUTC_MACRO=y
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-UCLIBC_HAS_GNU_GETSUBOPT=y
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-# UCLIBC_HAS_REGEX_OLD is not set
-UCLIBC_HAS_FNMATCH=y
-# UCLIBC_HAS_FNMATCH_OLD is not set
-UCLIBC_HAS_WORDEXP=y
-UCLIBC_HAS_NFTW=y
-UCLIBC_HAS_FTW=y
-UCLIBC_HAS_FTS=y
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-SHARED_LIB_LOADER_PREFIX="/lib"
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="//usr"
-MULTILIB_DIR="lib"
-
-#
-# Security options
-#
-# UCLIBC_BUILD_PIE is not set
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
-UCLIBC_BUILD_RELRO=y
-UCLIBC_BUILD_NOW=y
-UCLIBC_BUILD_NOEXECSTACK=y
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DODEBUG_PT is not set
-# DOSTRIP is not set
-# DOASSERTS is not set
-# SUPPORT_LD_DEBUG is not set
-# SUPPORT_LD_DEBUG_EARLY is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-UCLIBC_HAS_BACKTRACE=y
-WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
-
-# math stuff for perl
-DO_C99_MATH=y
-UCLIBC_HAS_LONG_DOUBLE_MATH=y
-UCLIBC_HAS_FENV=y
-UCLIBC_LINUX_MODULE_26=y
-# UCLIBC_LINUX_MODULE_24 is not set
-UCLIBC_LINUX_SPECIFIC=y
-UCLIBC_HAS_REALTIME=y
-UCLIBC_HAS_ADVANCED_REALTIME=y
-UCLIBC_HAS_NETWORK_SUPPORT=y
-UCLIBC_HAS_SOCKET=y
-UCLIBC_HAS_BSD_ERR=y
-UCLIBC_HAS_SYSLOG=y
-UCLIBC_HAS_CRYPT=y
-UCLIBC_HAS_CRYPT_IMPL=y
-UCLIBC_HAS_GNU_ERROR=y
-UCLIBC_HAS_PTY=y
-UCLIBC_BSD_SPECIFIC=y
-UCLIBC_HAS_EPOLL=y
-UCLIBC_HAS_FLOATS=y
-
-# The below option is needed for ARM since depending
-# upong what intruction set is chosen this will be
-# enabled. As such it is harmless and will be punted
-# by menuconfig for other arches.
-
-# COMPILE_IN_THUMB_MODE is not set
-
-# needed by shadow
-UCLIBC_HAS_UTMP=y
-# needed by systemd
-UCLIBC_HAS_UTMPX=y
-UCLIBC_LINUX_MODULE_26=y
-UCLIBC_HAS_RESOLVER_SUPPORT=y
-# needed for LTP
-UCLIBC_SUSV4_LEGACY=y
-UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
-DO_XSI_MATH=y
-UCLIBC_SV4_DEPRECATED=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/uClibc.machine
deleted file mode 100644
index 595f444..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.machine
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Version: 0.9.32-git
-# Mon Jul 19 01:34:29 2010
-#
-#
-# Using ELF file format
-#
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
deleted file mode 100644
index c937ccb..0000000
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SECTION = "base"
-require uclibc.inc
-require uclibc-git.inc
-
-DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial libgcc-initial kern-tools-native"
-PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-
-PACKAGES = ""
-PACKAGES_DYNAMIC = ""
-
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
-
-do_install() {
-	# Install initial headers into the cross dir
-	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		install_headers install_startfiles
-
-        # add links to linux-libc-headers: final uclibc build need this.
-        for t in linux asm asm-generic; do
-                if [ -d ${D}${includedir}/$t ]; then
-                    rm -rf ${D}${includedir}/$t
-                fi
-                ln -sf ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
-        done
-
-}
-do_compile() {
-	:
-}
-
-do_siteconfig () {
-        :
-}
-
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
diff --git a/meta/recipes-core/uclibc/uclibc-package.inc b/meta/recipes-core/uclibc/uclibc-package.inc
deleted file mode 100644
index 439f84e..0000000
--- a/meta/recipes-core/uclibc/uclibc-package.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
-# *_nonshared.a libraries to be packaged in the uclibc-dev package.
-PACKAGES = "ldd uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-
-FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
-FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
-FILES_uclibc-libnsl = "${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so"
-FILES_uclibc-libresolv = "${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so"
-FILES_uclibc-libm = "${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so"
-FILES_uclibc-libdl = "${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so"
-FILES_uclibc-libutil = "${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so"
-FILES_uclibc-libpthread = "${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so"
-FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
-
-FILES_ldd = "${bindir}/ldd"
-FILES_uclibc-utils = "${bindir} ${sbindir}"
-FILES_uclibc-gconv = "${libdir}/gconv"
-FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
-FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
-FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
-
-# The last line (gdb and lib1) is for uclinux-uclibc builds
-uclibc_baselibs = "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
-                   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
-                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
-                  "
-FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
-FILES_${PN}-dev += "\
-        ${libdir}/lib*.so \
-        ${libdir}/*_nonshared.a \
-        ${libdir}/[S]*crt[1in].o \
-        ${libdir}/crtreloc*.o \
-        ${includedir}/*.h ${includedir}/*/*.h \
-       "
-FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
-               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
deleted file mode 100644
index 02cd8d1..0000000
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ /dev/null
@@ -1,159 +0,0 @@
-SUMMARY = "C library for embedded systems"
-DESCRIPTION = "The name uClibc is an abbreviation for 'the \
-microcontroller C library'. For simplicity, uClibc is pronounced \
-'yew-see-lib-see'.  The goal of uClibc is to provide as much \
-functionality as possible in a small amount of space, and it is intended \
-primarily for embedded use. It is also highly configurable in supported \
-features, at the cost of ABI differences for different configurations. \
-uClibc has been designed from the ground up to be a C library for \
-embedded Linux.  It is NOT compatible with binaries linked against glibc."
-
-LICENSE = "LGPLv2.1+"
-SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
-file://${S}/test/regex/testregex.c;beginline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-
-require uclibc-config.inc
-
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
-
-# siteconfig.bbclass runs configure which needs a working compiler
-# For the compiler to work we need a working libc yet libc isn't
-# in the sysroots directory at this point. This means the libc.so
-# linker script won't work as the --sysroot setting isn't correct.
-# Here we create a hacked up libc linker script and pass in the right
-# flags to let configure work. Ugly.
-EXTRASITECONFIG = "CFLAGS='${CFLAGS} -Wl,-L${WORKDIR}/site_config_libc -L${WORKDIR}/site_config_libc -L${SYSROOT_DESTDIR}${libdir} -L${SYSROOT_DESTDIR}${base_libdir} -Wl,-L${SYSROOT_DESTDIR}${libdir} -Wl,-L${SYSROOT_DESTDIR}${base_libdir}'"
-siteconfig_do_siteconfig_gencache_prepend = " \
-mkdir -p ${WORKDIR}/site_config_libc; \
-cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
-sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
-"
-
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a glibc one if our build
-# is a uclibc build.
-COMPATIBLE_HOST = ".*-uclibc.*"
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-# There appears to be a parallel race in uclibc:
-# GEN /extra/locale/locale_collate.h
-# xargs: ../..//extra/locale/gen_collate: Text file busy
-# make[1]: *** [../..//extra/locale/locale_collate.h] Error 126
-PARALLEL_MAKE = ""
-
-# do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARCH' in
-# the CFLAGS (when building the utils).
-OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}'"
-EXTRA_OEMAKE = "${OEMAKE_NO_CC} \
-                'HOSTCC=${BUILD_CC}' \
-                'HOST_CFLAGS=${BUILD_CFLAGS}' \
-                'CC=${CC}' \
-                ARCH=${UCLIBC_ARCH} \
-                V=1"
-
-EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
-
-# -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
-#
-CFLAGS_remove_arm = "-fno-omit-frame-pointer"
-UCLIBC_EXTRA_CFLAGS  = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
-
-# Doesn't compile in MIPS16e mode due to use of hand-written
-# assembly
-MIPS_INSTRUCTION_SET_pn-uclibc = "mips"
-
-configmangle = '/^KERNEL_HEADERS/d; \
-                /^RUNTIME_PREFIX/d; \
-                /^DEVEL_PREFIX/d; \
-                /^SHARED_LIB_LOADER_PREFIX/d; \
-                /^UCLIBC_EXTRA_CFLAGS/d; \
-                s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][d.getVar("ARM_INSTRUCTION_SET", True) == "thumb"]} \
-                ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][d.getVar("USE_NLS", True) == "yes"]} \
-                ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][d.getVar("TARGET_ARCH", True) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
-                /^CROSS/d; \
-                /^TARGET_ARCH=/d; \
-                /^TARGET_/s,^\([^=]*\).*,# \1 is not set,g; \
-                s,^DOSTRIP.*,# DOSTRIP is not set,g; \
-                /_[EO]*ABI/d; \
-                /HAS_FPU/d; \
-                ${@["","s,.*MULTILIB_DIR.*,MULTILIB_DIR=\"${baselib}\",;"][d.getVar("baselib", True) != "lib"]} \
-               '
-OE_FEATURES = "${@features_to_uclibc_conf(d)}"
-OE_DEL      = "${@features_to_uclibc_del(d)}"
-python () {
-    if "${OE_DEL}":
-        d.setVar('configmangle_append', "${OE_DEL}" + "\n")
-
-    if "${OE_FEATURES}":
-        d.setVar('configmangle_append',
-                   "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
-                   ("\\n".join((d.expand("${OE_FEATURES}").split("\n")))))
-    d.setVar('configmangle_append',
-                 "/^### CROSS$/a\\\n%s\n" %
-                  ("\\n".join(["CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
-                        "UCLIBC_EXTRA_CFLAGS=\"${UCLIBC_EXTRA_CFLAGS}\"",
-                         "KERNEL_HEADERS=\"${STAGING_INCDIR}\"",
-                         "RUNTIME_PREFIX=\"/\"",
-                         "DEVEL_PREFIX=\"/${prefix}\"",
-                         "SHARED_LIB_LOADER_PREFIX=\"/lib\"",
-                        ])
-                  ))
-    d.setVar('configmangle_append',
-                 "/^### TGT$/a\\\nTARGET_ARCH=\"%s\"\\nTARGET_%s=y\n" %
-                        ("${UCLIBC_ARCH}", "${UCLIBC_ARCH}"))
-    d.setVar('configmangle_append',
-    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][d.getVar('TARGET_FPU', True) in [ 'soft' ]]))
-    if "${UCLIBC_ENDIAN}":
-        d.setVar('configmangle_append',
-                   "/^### ABI$/a\\\nARCH_WANTS_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"))
-    if "${UCLIBC_ABI}":
-        d.setVar('configmangle_append',
-                   "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"))
-}
-
-python do_patch_append() {
-    import subprocess
-    subprocess.call("ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux", shell=True)
-    subprocess.call("ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm", shell=True)
-}
-
-do_configure() {
-        rm -f ${S}/.config
-
-        # OpenEmbedded splits the uClibc.config in two parts:
-        # uClibc.machine, uClibc.distro
-        echo "### uClibc.machine ###" >${S}/merged.config
-        cat ${WORKDIR}/uClibc.machine >>${S}/merged.config
-        echo "### uClibc.distro ###" >>${S}/merged.config
-        cat ${WORKDIR}/uClibc.distro >>${S}/merged.config
-        echo "### CROSS" >>${S}/merged.config
-        echo "### TGT" >>${S}/merged.config
-        echo "### MMU" >>${S}/merged.config
-        echo "### FPU" >>${S}/merged.config
-        echo "### ABI" >>${S}/merged.config
-        echo "### DISTRO FEATURES" >>${S}/merged.config
-
-        # Mangle the resulting .config depending on OE variables
-        sed -i -e '${configmangle}' ${S}/merged.config
-	cp ${S}/merged.config .config
-        merge_config.sh -r -n -m .config ${@" ".join(find_cfgs(d))}
-	cml1_do_configure
-
-}
-
-do_install() {
-	oe_runmake PREFIX=${D} install
-	rm -rf ${D}${includedir}/iconv.h
-}
-
-# build ldd, ldconfig and friends but only for full uclibc
-do_install_append_pn-uclibc () {
-        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" -C utils utils_install
-}
-
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
deleted file mode 100644
index fd02b3d..0000000
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require uclibc.inc
-require uclibc-package.inc
-require uclibc-git.inc
-
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
-
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-
-DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc-initial \
-           virtual/${TARGET_PREFIX}libc-initial \
-           linux-libc-headers ncurses-native \
-           libgcc-initial kern-tools-native"
-
-RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
-RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
-# uclibc does not really have libsegfault but then using the one from glibc is also not
-# going to work. So we pretend that we have it to make bitbake not pull other recipes
-# to satisfy this dependency for the images/tasks
-
-RPROVIDES_${PN} += "libsegfault rtld(GNU_HASH)"
-- 
2.8.1


