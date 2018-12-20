Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id A375579E9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:51:05 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id n18so1104656lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 03:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bdOFojFNmWKiMgm6aCFyriYNrnkhvQgEUjZxPwYffqc=;
	b=PGg9H2W9ua56RhMhtUqJYSq4P+xZYsqldESy1gYWzpM6r4cq4BQZVAVNS8gYRpxD9q
	HYRtYQnJP2kzc310+8Zc4k9fBMhoh256s2i6vbyrvu/wHy05+uahIH1YstIKx6/ae4Q0
	OHQK7PuAtx0pRE/EukIE9S1XSNsNIlnKNfLXDkNcgKOvcgnXHXFVplo5dXgN5ODeON2w
	0D2QURJ1R8LWRIMcK6SwPnzAvoyOyO0iy9LKvN3ZCOaAPcd9ZMdsCY29vwtskqO4v4Ha
	tKunXu/rPr+FHkbjVl6B2OVS+TXrVXJHdREMGD7FSGfGJKYb23aX6Emsjy9Mhz8jlUST
	2Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bdOFojFNmWKiMgm6aCFyriYNrnkhvQgEUjZxPwYffqc=;
	b=UJxjkD6E95selk1gdNFJmzVhwBNuRLe1xTMLPwrcz8+StEaKS2yOwDcTrK5HQeVQ+Q
	3nKsqyMgXITm2Omh4x9D3VxwjrKCPOrkDHC4p1FTEkc1BHt7TtfVb6tqleHvstA3FIMt
	8HF8ut5u0Bd8JFH9GIFu88sGdZOyULskWsuLwjpfufZ/lTE3PzDSw9gRISdlsT/00u7d
	mb8Jcan0+W18Tc1kOXPxzvsNNr/h79my+A6FBqZQrKDt2IpAXF9n7umxS21ERs8tOan8
	eyZFyiNZ5ePnBm1JzYg0t5HD0uVodzdk36EKv98tv6fSqlAshY7V0SDMF3RsNa+PIZ5n
	7jFw==
X-Gm-Message-State: AA+aEWYMLEh7JwhMa/8FyeycMQKiIC1TM0x9gonKwZHfaEj5VmhVKHKR
	x3vSsw04+9V5Rc8dan3779L9YIXsdgCF7/H5fwA/mmDl
X-Google-Smtp-Source: AFSGD/Vc2lqhdN31ebRnt9wQMF1jMBUX8ldBZ1kkLPqs3aUGiRO+RSS3ZYnUC4aIEuZnw8kItQ+8Mg3AAfJI6q+tJ+Q=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr13249806lfm.81.1545306665773; 
	Thu, 20 Dec 2018 03:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 11:50:53 +0000
Message-ID: <CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and glibc-initial
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
X-List-Received-Date: Thu, 20 Dec 2018 11:51:06 -0000
Content-Type: text/plain; charset="UTF-8"

As the only users of siteconfig are now zlib and ncurses, should we
just rip it out entirely leaving a gap for a fresh implementation?

Ross
On Thu, 20 Dec 2018 at 00:16, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The only reason we appear to need glibc-initial at this time is to support
> the site_config code. The site_config code compiles and therefore needs
> at least some level of working C library to link against.
>
> This isn't a good reason to keep the complexity of glibc-initial around
> so remove it, and the site_config support which then breaks.
>
> Performance benchmarks suggest the time spent just rerunning configure
> for site_config just about equals any performance benefit for OE-Core
> image builds excluding the time spent adding glibc-initial to the
> dependency chain.
>
> I'm not opposed to readding some other form of site_config support
> but it needs to be rethought.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glibc/glibc-initial.inc     |  57 ---
>  meta/recipes-core/glibc/glibc-initial_2.28.bb |   9 -
>  meta/recipes-core/glibc/glibc.inc             |  16 +-
>  meta/recipes-core/glibc/site_config/funcs     | 474 ------------------
>  meta/recipes-core/glibc/site_config/headers   | 155 ------
>  meta/recipes-core/glibc/site_config/types     |  21 -
>  6 files changed, 1 insertion(+), 731 deletions(-)
>  delete mode 100644 meta/recipes-core/glibc/glibc-initial.inc
>  delete mode 100644 meta/recipes-core/glibc/glibc-initial_2.28.bb
>  delete mode 100644 meta/recipes-core/glibc/site_config/funcs
>  delete mode 100644 meta/recipes-core/glibc/site_config/headers
>  delete mode 100644 meta/recipes-core/glibc/site_config/types
>
> diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
> deleted file mode 100644
> index acd0d6b1dc5..00000000000
> --- a/meta/recipes-core/glibc/glibc-initial.inc
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial libgcc-initial make-native bison-native"
> -PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
> -
> -PACKAGES = ""
> -PACKAGES_DYNAMIC = ""
> -
> -STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
> -STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
> -
> -do_configure () {
> -       (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
> -       find ${S} -name "configure" | xargs touch
> -       cfgscript=`python3 -c "import os; print(os.path.relpath('${S}', '.'))"`/configure
> -       $cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
> -               --prefix=/usr \
> -               --disable-sanity-checks \
> -               --with-headers=${STAGING_DIR_TARGET}${includedir} \
> -               --enable-hacker-mode
> -}
> -
> -do_compile () {
> -       :
> -}
> -
> -do_install () {
> -       oe_runmake cross-compiling=yes install_root=${D} \
> -       includedir='${includedir}' prefix='${prefix}' \
> -       install-bootstrap-headers=yes install-headers
> -
> -       oe_runmake csu/subdir_lib
> -       mkdir -p ${D}${libdir}/
> -       install -m 644 csu/crt[1in].o ${D}${libdir}
> -
> -       # Two headers -- stubs.h and features.h -- aren't installed by install-headers,
> -       # so do them by hand.  We can tolerate an empty stubs.h for the moment.
> -       # See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
> -       mkdir -p ${D}${includedir}/gnu/
> -       touch ${D}${includedir}/gnu/stubs.h
> -       cp ${S}/include/features.h ${D}${includedir}/features.h
> -
> -       if [ -e ${B}/bits/stdio_lim.h ]; then
> -               cp ${B}/bits/stdio_lim.h  ${D}${includedir}/bits/
> -       fi
> -}
> -
> -do_stash_locale() {
> -       :
> -}
> -
> -do_siteconfig () {
> -       :
> -}
> -
> -inherit nopackages
> -
> -# We really only want this built by things that need it, not any recrdeptask
> -deltask do_build
> diff --git a/meta/recipes-core/glibc/glibc-initial_2.28.bb b/meta/recipes-core/glibc/glibc-initial_2.28.bb
> deleted file mode 100644
> index e86770e12d4..00000000000
> --- a/meta/recipes-core/glibc/glibc-initial_2.28.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require glibc_${PV}.bb
> -require glibc-initial.inc
> -
> -# main glibc recipes muck with TARGET_CPPFLAGS to point into
> -# final target sysroot but we
> -# are not there when building glibc-initial
> -# so reset it here
> -
> -TARGET_CPPFLAGS = ""
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 99c92ce46e4..43e71337eef 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -15,21 +15,7 @@ python () {
>          bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
>  }
>
> -# siteconfig.bbclass runs configure which needs a working compiler
> -# For the compiler to work we need a working libc yet libc isn't
> -# in the sysroots directory at this point. This means the libc.so
> -# linker script won't work as the --sysroot setting isn't correct.
> -# Here we create a hacked up libc linker script and pass in the right
> -# flags to let configure work. Ugly.
> -EXTRASITECONFIG = "CFLAGS='${CFLAGS} -Wl,-L${WORKDIR}/site_config_libc -L${WORKDIR}/site_config_libc -L${SYSROOT_DESTDIR}${libdir} -L${SYSROOT_DESTDIR}${base_libdir} -Wl,-L${SYSROOT_DESTDIR}${libdir} -Wl,-L${SYSROOT_DESTDIR}${base_libdir}'"
> -siteconfig_do_siteconfig_gencache_prepend = " \
> -       mkdir -p ${WORKDIR}/site_config_libc; \
> -       cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
> -       sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
> -"
> -
> -# nptl needs unwind support in gcc, which can't be built without glibc.
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers"
>
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
> diff --git a/meta/recipes-core/glibc/site_config/funcs b/meta/recipes-core/glibc/site_config/funcs
> deleted file mode 100644
> index ccc85392d7f..00000000000
> --- a/meta/recipes-core/glibc/site_config/funcs
> +++ /dev/null
> @@ -1,474 +0,0 @@
> -a64l
> -abs
> -access
> -__adjtimex
> -alarm
> -alphasort
> -argz_append
> -__argz_count
> -argz_create_sep
> -argz_insert
> -__argz_next
> -argz_next
> -__argz_stringify
> -argz_stringify
> -asprintf
> -atexit
> -atof
> -atoi
> -bcmp
> -bcopy
> -bindresvport
> -bind_textdomain_codeset
> -btowc
> -bzero
> -calloc
> -canonicalize_file_name
> -catgets
> -cfgetospeed
> -cfsetispeed
> -cfsetspeed
> -chmod
> -chown
> -chroot
> -clock
> -close
> -closedir
> -closelog
> -confstr
> -connect
> -daemon
> -dcgettext
> -difftime
> -dirfd
> -dirname
> -dngettext
> -dup2
> -ecvt
> -endgrent
> -endmntent
> -endpwent
> -endutent
> -endutxent
> -epoll_ctl
> -err
> -ether_hostton
> -ether_ntohost
> -euidaccess
> -execv
> -fchdir
> -fchmod
> -fchmodat
> -fchown
> -fchownat
> -fcntl
> -fcvt
> -fdatasync
> -fdopendir
> -feof_unlocked
> -fgets_unlocked
> -fgetxattr
> -finite
> -flistxattr
> -flock
> -flockfile
> -fnmatch
> -fork
> -fpathconf
> -__fpending
> -fprintf
> -free
> -freeaddrinfo
> -freeifaddrs
> -fseeko
> -__fsetlocking
> -fsetxattr
> -fstat64
> -fstat
> -fstatfs
> -fsync
> -ftello
> -ftime
> -ftruncate
> -funlockfile
> -futimes
> -futimesat
> -gai_strerror
> -gcvt
> -getaddrinfo
> -getc_unlocked
> -getcwd
> -getdelim
> -getdomainname
> -getdtablesize
> -getegid
> -getenv
> -geteuid
> -getgid
> -getgrent
> -getgrent_r
> -getgrgid_r
> -getgrnam
> -getgrnam_r
> -getgrouplist
> -getgroups
> -gethostbyaddr_r
> -gethostbyname2
> -gethostbyname
> -gethostbyname_r
> -gethostent
> -gethostid
> -gethostname
> -getifaddrs
> -getline
> -getloadavg
> -getmntent
> -getmsg
> -getnameinfo
> -getnetbyaddr_r
> -getnetgrent_r
> -getopt
> -getopt_long
> -getopt_long_only
> -getpagesize
> -getpass
> -getpeername
> -getpgrp
> -getpid
> -getppid
> -getprotoent_r
> -getpwent
> -getpwent_r
> -getpwnam
> -getpwnam_r
> -getpwuid
> -getpwuid_r
> -getresuid
> -getrlimit
> -getrusage
> -getservbyname
> -getservbyname_r
> -getservbyport_r
> -getservent
> -getservent_r
> -getspnam
> -getspnam_r
> -gettimeofday
> -getttyent
> -getttynam
> -getuid
> -getusershell
> -getutent
> -getutid
> -getutline
> -getutmp
> -getutmpx
> -getutxent
> -getutxid
> -getutxline
> -getwd
> -getxattr
> -glob
> -gmtime
> -gmtime_r
> -grantpt
> -group_member
> -herror
> -hstrerror
> -iconv
> -iconv_open
> -if_freenameindex
> -if_indextoname
> -if_nameindex
> -if_nametoindex
> -index
> -inet_addr
> -inet_aton
> -inet_ntoa
> -inet_ntop
> -inet_pton
> -initgroups
> -innetgr
> -iruserok
> -isascii
> -isatty
> -isblank
> -isgraph
> -isinf
> -isnan
> -isprint
> -isspace
> -iswalnum
> -iswcntrl
> -iswctype
> -iswprint
> -iswspace
> -iswupper
> -isxdigit
> -kill
> -killpg
> -lchown
> -lckpwdf
> -lgetxattr
> -link
> -listxattr
> -llistxattr
> -localtime
> -localtime_r
> -lockf
> -lrand48
> -lsearch
> -lseek64
> -lsetxattr
> -lstat
> -mallinfo
> -malloc
> -mblen
> -mbrlen
> -mbrtowc
> -mbsinit
> -mbsrtowcs
> -mbtowc
> -memalign
> -memchr
> -memcmp
> -memcpy
> -memmove
> -mempcpy
> -memrchr
> -memset
> -mkdir
> -mkdirat
> -mkdtemp
> -mkfifo
> -mknod
> -mkstemp64
> -mkstemp
> -mktime
> -mlock
> -mmap
> -mtrace
> -munlock
> -munmap
> -nanosleep
> -nice
> -nl_langinfo
> -ntp_adjtime
> -ntp_gettime
> -_obstack_free
> -on_exit
> -open64
> -open
> -openat
> -opendir
> -openlog
> -pathconf
> -pipe
> -poll
> -popen
> -posix_memalign
> -prctl
> -pread
> -printf
> -__progname
> -pselect
> -pthread_mutex_lock
> -ptsname
> -putenv
> -putgrent
> -putpwent
> -putspent
> -pututline
> -pututxline
> -putwc
> -pwrite
> -qsort
> -raise
> -rand
> -random
> -rand_r
> -read
> -readdir
> -readdir_r
> -readlink
> -realloc
> -realpath
> -re_comp
> -recvmsg
> -re_exec
> -regcomp
> -regexec
> -remove
> -rename
> -re_search
> -rmdir
> -rpmatch
> -rresvport_af
> -ruserok
> -ruserok_af
> -sbrk
> -scandir
> -sched_setscheduler
> -sched_yield
> -__secure_getenv
> -select
> -semctl
> -semget
> -sendmsg
> -setbuf
> -setbuffer
> -setegid
> -setenv
> -seteuid
> -setgid
> -setgroups
> -sethostname
> -setitimer
> -_setjmp
> -setjmp
> -setlinebuf
> -setlocale
> -setmntent
> -setpgid
> -setpgrp
> -setpriority
> -setregid
> -setresgid
> -setresuid
> -setreuid
> -setrlimit
> -setsid
> -setsockopt
> -settimeofday
> -setuid
> -setutent
> -setutxent
> -setvbuf
> -setxattr
> -sgetspent
> -shmat
> -shmctl
> -shmdt
> -shmget
> -shutdown
> -sigaction
> -sigaddset
> -sigaltstack
> -sigblock
> -sigemptyset
> -sighold
> -siginterrupt
> -signal
> -sigprocmask
> -sigset
> -sigsetmask
> -sigstack
> -sigsuspend
> -sigvec
> -snprintf
> -socket
> -socketpair
> -sprintf
> -srand48
> -srand
> -srandom
> -sscanf
> -stat
> -statfs
> -statvfs
> -stime
> -stpcpy
> -strcasecmp
> -strcasestr
> -strchr
> -strchrnul
> -strcmp
> -strcspn
> -strdup
> -strerror
> -strerror_r
> -strftime
> -strlen
> -strncasecmp
> -strncmp
> -strndup
> -strnlen
> -strpbrk
> -strptime
> -strrchr
> -strsep
> -strsignal
> -strspn
> -strstr
> -strtod
> -strtoimax
> -strtok_r
> -strtol
> -strtoll
> -strtoul
> -strtoull
> -strtoumax
> -strverscmp
> -strxfrm
> -symlink
> -sync
> -sysconf
> -sysctl
> -sysinfo
> -syslog
> -_sys_siglist
> -sys_siglist
> -system
> -tcgetattr
> -tcgetpgrp
> -tcsetattr
> -tcsetpgrp
> -time
> -timegm
> -times
> -timezone
> -tmpnam
> -towlower
> -towupper
> -truncate
> -tsearch
> -ttyname
> -tzset
> -ulimit
> -umask
> -uname
> -unlink
> -unsetenv
> -unshare
> -updwtmp
> -updwtmpx
> -usleep
> -ustat
> -utime
> -utimes
> -utmpname
> -utmpxname
> -valloc
> -vasprintf
> -verrx
> -vfork
> -vfprintf
> -vfscanf
> -vhangup
> -vprintf
> -vsnprintf
> -vsprintf
> -wait3
> -wait4
> -waitpid
> -wcrtomb
> -wcscoll
> -wcsdup
> -wcslen
> -wctob
> -wctomb
> -wctype
> -wcwidth
> -wmemchr
> -wmemcpy
> -wmempcpy
> diff --git a/meta/recipes-core/glibc/site_config/headers b/meta/recipes-core/glibc/site_config/headers
> deleted file mode 100644
> index 69fedea4e1a..00000000000
> --- a/meta/recipes-core/glibc/site_config/headers
> +++ /dev/null
> @@ -1,155 +0,0 @@
> -aio.h
> -alloca.h
> -argz.h
> -arpa/inet.h
> -arpa/nameser.h
> -asm/byteorder.h
> -asm/ioctls.h
> -asm/page.h
> -asm/types.h
> -assert.h
> -byteswap.h
> -ctype.h
> -dirent.h
> -dlfcn.h
> -elf.h
> -endian.h
> -err.h
> -errno.h
> -execinfo.h
> -fcntl.h
> -features.h
> -float.h
> -fstab.h
> -ftw.h
> -getopt.h
> -glob.h
> -grp.h
> -iconv.h
> -ifaddrs.h
> -inttypes.h
> -langinfo.h
> -lastlog.h
> -libgen.h
> -libintl.h
> -limits.h
> -linux/capability.h
> -linux/fd.h
> -linux/fs.h
> -linux/hayesesp.h
> -linux/hdreg.h
> -linux/icmp.h
> -linux/in6.h
> -linux/joystick.h
> -linux/ptrace.h
> -linux/serial.h
> -linux/sonypi.h
> -linux/unistd.h
> -linux/utsname.h
> -linux/version.h
> -locale.h
> -malloc.h
> -math.h
> -mcheck.h
> -memory.h
> -mntent.h
> -mqueue.h
> -netdb.h
> -net/if.h
> -netinet/ether.h
> -netinet/in.h
> -netinet/ip6.h
> -netinet/ip.h
> -netinet/tcp.h
> -netinet/udp.h
> -netipx/ipx.h
> -net/route.h
> -paths.h
> -poll.h
> -pthread.h
> -pty.h
> -pwd.h
> -regex.h
> -resolv.h
> -rpc/rpc.h
> -rpc/types.h
> -sched.h
> -scsi/scsi.h
> -search.h
> -semaphore.h
> -setjmp.h
> -sgtty.h
> -shadow.h
> -signal.h
> -stdarg.h
> -stdbool.h
> -stdc
> -stddef.h
> -stdint.h
> -stdio.h
> -stdlib.h
> -string.h
> -strings.h
> -stropts.h
> -sys/bitypes.h
> -sys/cdefs.h
> -sys/dir.h
> -sys/epoll.h
> -sysexits.h
> -sys/fcntl.h
> -sys/file.h
> -sys/fsuid.h
> -sys/ioctl.h
> -sys/ipc.h
> -syslog.h
> -sys/mman.h
> -sys/mount.h
> -sys/mtio.h
> -sys/param.h
> -sys/poll.h
> -sys/prctl.h
> -sys/ptrace.h
> -sys/queue.h
> -sys/reg.h
> -sys/resource.h
> -sys/select.h
> -sys/sem.h
> -sys/shm.h
> -sys/signal.h
> -sys/socket.h
> -sys/socketvar.h
> -sys/soundcard.h
> -sys/statfs.h
> -sys/stat.h
> -sys/statvfs.h
> -sys/stropts.h
> -sys/swap.h
> -sys/sysctl.h
> -sys/sysinfo.h
> -sys/sysmacros.h
> -sys/termios.h
> -sys/timeb.h
> -sys/time.h
> -sys/times.h
> -sys/timex.h
> -sys/types.h
> -sys/uio.h
> -sys/un.h
> -sys/unistd.h
> -sys/user.h
> -sys/utsname.h
> -sys/vfs.h
> -sys/wait.h
> -termio.h
> -termios.h
> -time.h
> -ttyent.h
> -ulimit.h
> -unistd.h
> -ustat.h
> -utime.h
> -utmp.h
> -utmpx.h
> -values.h
> -wchar.h
> -wctype.h
> diff --git a/meta/recipes-core/glibc/site_config/types b/meta/recipes-core/glibc/site_config/types
> deleted file mode 100644
> index 178bd85a00b..00000000000
> --- a/meta/recipes-core/glibc/site_config/types
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -char
> -char *
> -double
> -float
> -int
> -long
> -long double
> -long int
> -long long
> -long long int
> -short
> -short int
> -signed char
> -unsigned char
> -unsigned int
> -unsigned long
> -unsigned long int
> -unsigned long long int
> -unsigned short
> -unsigned short int
> -void *
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

