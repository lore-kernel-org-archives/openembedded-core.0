Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.26302.1595444584889671248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 12:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R51oTgXv;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a1so3378708ejg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C5dRqK44zy8aKXRttTnnjp+Bfm5XKGLLliT8gMH3x20=;
        b=R51oTgXvIfgbXhTV5rHSGy5mXJX2Yx7xysclgWkwfTfjqx2S6HRIML7PnduoX+VGsV
         eycxDUcXAYH0Cb8Xtbk++1ZeW2ZmBt1PHQbrGAR95xppHE3T1b5UB3GizzQzkEfsOYLA
         y8WfqPDQz686eomuPAwC7SS0K79qKjBQkoeW54OC8suEMg1KMw9cGEweqxbErTU19JN/
         hKP2S4jZGPthDPV8vkb/VgqQQ99m3SOVRZ2HGYURMMxE//UGFh9/Tpcj3J0QJACOA7fH
         lMNrFKnk4Hvez/fW3PE9O96HWl+lhMhoKK5NraD4Aw1QI26FzxonGIw3nyI2tnCTgUmF
         1nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C5dRqK44zy8aKXRttTnnjp+Bfm5XKGLLliT8gMH3x20=;
        b=l8h1k/7pzCfOsZGA9mMjf+G3TirEEfmceFdYdTKY16+J3wTFrLNYgoABz4ltN07Xx7
         Z/rZ4CrZxjgLUMCkQ6qeKtH3FF4gPRmOsYUr9nwWPKqA8sIcyR9j3/7Nq3I3ell2wDvP
         x7FdtQJft/Ln0MDYcQ/Y5Z/Hx3b19TYchNX58RD0fTZ55dyyeMU2mQnj800c1NMy+oHA
         Ui6BDyh/OMzoI3AS/c+NWiZwKBkEsW7mx2sx48lFsmzfsSGNiDiGUjvj5ovfP76Ge9mp
         nbYT2wAZ2qwr+ZxyCjUOoWjNdLYneMfQD6sYyqit5XlRBedC35BPnSsKxOa5FbB6Npx2
         Skbw==
X-Gm-Message-State: AOAM531L6XK7KW7hqWMTpfJsiXUvHYrVKfX/NNDoxz6xMgW3HHg7gqR4
	Z3Qo7wEMzL8w4/buzYr5PDYxDnzxMKU=
X-Google-Smtp-Source: ABdhPJwX8P/yDZJdlO3eKh70EqRTk05ftDlljLf4Yop0Xnhhe+KR4dzO3a59l4r4rJrkOl17rap0lQ==
X-Received: by 2002:a17:906:57da:: with SMTP id u26mr984738ejr.157.1595444579823;
        Wed, 22 Jul 2020 12:02:59 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gu15sm325670ejb.111.2020.07.22.12.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 12:02:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] net-tools: upgrade to latest revision in upstream repo instead of old debian snapshot
Date: Wed, 22 Jul 2020 21:02:57 +0200
Message-Id: <20200722190257.476913-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16242787A7D3CF1F.13043@lists.openembedded.org>
References: <16242787A7D3CF1F.13043@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* debian switched to upstream snapshot as well in 2015:
  net-tools (1.60+git20150829.73cef8a-1) unstable; urgency=medium

  * After 14 years without an upstream release, I am producing a new package
    based on today's upstream repository.
    Closes: #391495, #486448, #323261, #260587, #545328, #511395.
  * Remove many patches now merged upstream, delete unmaintainable and
    undocumented local changes, and update the rest.

 -- Martín Ferrari <tincho@debian.org>  Mon, 07 Sep 2015 01:54:07 +0000

* this allows dropping nettools_do_patch task and other weird parts of the recipe

* LIC_FILES_CHKSUM change is caused by formatting changes in:
  d613e1d Updated COPYING file.

* patches now included in upstream:
  0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch
  eb04ef3 added 'ull' prefix to unsigned long long constants to make gcc 3.3 happy

  ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch
  81814dc ifconfig interface:0 del <IP> will remove the aliased IP on IA64

  musl-fixes.patch (only lib/inet_sr.c and netstat.c chunks weren't applied, but
  maybe not needed anymore)
  86b2c77 Remove support for IPV6 with libc5 and glibc 2.0
  ecae4b3 lib/util-ank: Include <limits.h> for UINT_MAX
  c35607e Remove inconsistent conditional includes for libc5 and glibc 2.0

  net-tools-1.60-sctp1.patch
  net-tools-1.60-sctp2-quiet.patch
  net-tools-1.60-sctp3-addrs.patch
  7af4859 netstat: update SCTP support
  3bbfa09 statistics: add SCTP support
  4932915 Add netstat -S/--sctp parameter into help and manpages
  8306063 netstat: add sctp connection decoding (Debian #306428 and Gentoo #258714)

  0001-lib-inet6.c-INET6_rresolve-various-fixes.patch
  a70c568 lib/inet6.c:INET6_rresolve() - various fixes

  net-tools-fix-building-with-linux-4.8.patch
  ea3935b iptunnel: fix building w/older linux headers
  45d573a iptunnel: drop netinet/ip.h include

* add 3 new patches from debian

* add PACKAGECONFIG for parts which are now optional since:
  https://salsa.debian.org/debian/net-tools/-/commit/939123848205c8745542c2052b2c53de49461f4b
  https://salsa.debian.org/debian/net-tools/-/commit/fbc11bb9cfb5acb4b3c3b24a57c02f2b2338c656
  https://salsa.debian.org/debian/net-tools/-/commit/bd8bceaed2311651710331a7f8990c3e31be9840
  but unlike debian, keep building them to limit the changes from this upgrade

* ifconfig and route were moved from sbin to bin adjust u-a accordingly

* debian changelog:
net-tools (1.60+git20180626.aebd88e-1) unstable; urgency=medium

  * New upstream snapshot
  * Refresh patches.
  * Fix typos in German manpages. Thanks to Prof. Dr. Steffen Wendzel and
    Dr. Tobias Quathamer for the patch. Closes: #900962.

 -- Martín Ferrari <tincho@debian.org>  Mon, 24 Sep 2018 19:08:57 +0000

net-tools (1.60+git20161116.90da8a0-4) unstable; urgency=medium

  * Update maintainer email address. Closes: #899617.
  * Update Standards-Version with no changes.

 -- Martín Ferrari <tincho@debian.org>  Mon, 24 Sep 2018 17:16:31 +0000

net-tools (1.60+git20161116.90da8a0-3) unstable; urgency=medium

  * debian/control: Update Vcs-* and Standards-Version.
  * debian/control: remove references to ancient package ja-trans.
  * debian/gbp.conf: Update repo layout.

 -- Martín Ferrari <tincho@debian.org>  Tue, 31 Jul 2018 19:09:00 +0000

net-tools (1.60+git20161116.90da8a0-2) unstable; urgency=medium

  * Fix typo in French manpage. Thanks to  Michel Grigaut for the patch.
  * Add manpage for iptunnel, thanks to Sergio Durigan Junior.
    Closes: #88910
  * Rename patches so CME does not choke on them.
  * Automated cme fixes; packaging improvements.
  * Remove unused and ancient patch.

 -- Martín Ferrari <tincho@debian.org>  Sun, 11 Feb 2018 17:29:24 +0000

net-tools (1.60+git20161116.90da8a0-1) unstable; urgency=medium

  * New upstream snapshot.
  * Re-synced translations.patch.
  * Acknowledge NMUs. Thanks a lot to Andrey Rahmatullin for the
    fixes and uploads. Closes: 846509.
  * Fix FTCBFS, thanks to Helmut Grohne for the patch. Closes: #811561.
    + Really assign CC for cross compilation.
    + Use triplet prefixed pkg-config.
  * Add debian/NEWS warning about changing output in net-tools commands.
    Closing bugs that reported problems in 3rd-party scripts arising from these
    changes.  Closes: #845153, #843892, #820212.
  * Update Standards-Version, with no changes.

 -- Martín Ferrari <tincho@debian.org>  Mon, 26 Dec 2016 05:58:42 +0000

net-tools (1.60+git20150829.73cef8a-2.2) unstable; urgency=medium

  * Non-maintainer upload.
  * Apply an additional fix for the previous FTBFS for some architectures.

 -- Andrey Rahmatullin <wrar@debian.org>  Thu, 01 Dec 2016 22:49:27 +0500

net-tools (1.60+git20150829.73cef8a-2.1) unstable; urgency=medium

  * Non-maintainer upload.
  * Fix FTBFS by applying the upstream patch (Closes: #844073).

 -- Andrey Rahmatullin <wrar@debian.org>  Sun, 20 Nov 2016 15:23:12 +0500

net-tools (1.60+git20150829.73cef8a-2) unstable; urgency=medium

  [ Laurent Bigonville ]
  * Enable SELinux support. Closes: #666204.

  [ Martín Ferrari ]
  * Mark the package "Multi-Arch: foreign", thanks to Frédéric Brière
    <fbriere@fbriere.net>. Closes: #752584.
  * Fix bug in Portuguese man page, thanks to julianofischer@gmail.com.
    Closes: #805377.

 -- Martín Ferrari <tincho@debian.org>  Thu, 19 Nov 2015 14:48:47 +0000

net-tools (1.60+git20150829.73cef8a-1) unstable; urgency=medium

  * After 14 years without an upstream release, I am producing a new package
    based on today's upstream repository.
    Closes: #391495, #486448, #323261, #260587, #545328, #511395.
  * Remove many patches now merged upstream, delete unmaintainable and
    undocumented local changes, and update the rest.

 -- Martín Ferrari <tincho@debian.org>  Mon, 07 Sep 2015 01:54:07 +0000

net-tools (1.60-27) unstable; urgency=medium

  * Add patch to accept "pointtopoint" as a synonym for "pointopoint".
    Closes: #443075.
  * Add patch to add an example for single route deletion in route.8.
    Closes: #500913.
  * Remove Luk from Uploaders as per his request. Closes: #748491.
  * Fix broken watchfile, thanks to Martin Bagge for the patch.
    Fix upstream homepage. Closes: #770070.
  * Add patch to make mii-tool scan all ethernet devices instead of eth[0-7].
    Closes: #532879, #319508.
  * Add Vcs fields.
  * Update build system to debhelper 9 and 3.0 source format.
  * Update ancient Standards-Version, no changes needed.

 -- Martín Ferrari <tincho@debian.org>  Sun, 06 Sep 2015 17:44:11 +0300

* upstream changelog:
git log --oneline v1.60..0eebece8c9
0eebece Spell checking for German netstat manpage (#9)
aebd88e standardize --help/usage handling
c360845 always write --version output to stdout
479bb4a Fix incorrect ARP output
b4f5182 Fix conversion of some ROSE addresses.
8076533 Update all instances of my email address.
bfbadfc AX.25: Rename all references to axattach to kissattach.
90da8a0 netstat: improve ROSE support
aab9274 build: respect standard $(LDLIBS) variable
ea3935b iptunnel: fix building w/older linux headers
45d573a iptunnel: drop netinet/ip.h include
115f1af Fixed trailing whitespace issue with a and i flags (#7)
bd8bcea slattach/plipconfig: add a config knob to control them
9391238 hostname: add a config knob to control build/install
fbc11bb arp/rarp: add a config knob to control them
2cc98e1 man: do not install pages for disabled commands
5bf8112 man: improve install
e1ce942 ifconfig: do not try to bring up interfaces implicitly w/IPv4 0.0.0.0
2529b5d ifconfig(8): document - suffix behavior w/alias interfaces
3f170bf netstat: increase address buffers to avoid and overflow
1cec84c route(8): fix typo in fr_FR page
452f8e2 hostname: -s: do not look up details via dns
8e9db22 po: delete duplicate translations
614e15d statistics: fix multiple typos in strings
5c9e1e7 use sockaddr_storage everywhere
27e4308 netstat: convert to sockaddr_storage
adf6f57 netstat: unrecognized option -> non-zero exit code
73cef8a statistics: use getline instead of fgets
d923212 statistics: optimize filter processing slightly
238f086 ipx: always byte swap fields
7af4859 netstat: update SCTP support
3bbfa09 statistics: add SCTP support
9c073fe statistics: sort tables statically (and constify)
70c3a90 statistics: constify tables
c58d03b statistics: constify strings
9c4b23a statistics: localize all vars/funcs
b2f0f02 statistics: delete dead code
6556c27 build: use -- with rm
c5a91aa lib: inet6: clean up INET6_print a bit
fd10bbe lib: inet6: mark fix_v4_address static/const
c17ec95 lib: frame: avoid casting char* to short*
b10a1c0 lib: inet: switch to inet_ntop
16a83b4 lib: masq_info: check fgets return value
df48bbe lib: masq_info: use stdlib.h instead of malloc.h
839f760 lib: masq_info: fix scanf addr loading on 64bit systems
2a0cd06 lib: af: constify sprint sockaddr
bcc7d40 hostname: unify IPv4/IPv6 codepaths
742e628 lib: hw: constify hwtype
a6118de lib: af: constify aftype
2e15dac lib: af/hw: constify name fields
738c834 lib: af: constify herror message
61077c3 lib: af/hw: localize init functions
cf32e54 lib: af: get_socket_for_af: re-use get_afntype
86b2c77 Remove support for IPV6 with libc5 and glibc 2.0
c35607e Remove inconsistent conditional includes for libc5 and glibc 2.0
92773ed Add utility function ticks_per_second() to get jiffies per second (aka HZ)
9bdfd2c build: turn on transparent LFS support
43efbf2 Disable Econet support by default since it is removed from Linux 3.5
ecae4b3 lib/util-ank: Include <limits.h> for UINT_MAX
69e6463 netstat: fix up Bluetooth error messages
761da2d netstat: support Linux v4.0 debug/bluetooth/l2cap
e5f1be1 ifconfig can incorrectly round PiB
25b3c9a netstat: INFO_GUTS1(): don't treat EACCES as error
24cd6f2 Revert "fix statistics with aliased interfaces"
4e499e2 netstat(8): fix style in a few places
2dd754e netstat: do not abort/warn with unsupported protocols using general -A buckets
343192d fix statistics with aliased interfaces
96225a6 netstat: decode timer type of 4 in tcp lines
6ab465c interface: localize & constify funcs
1fbf057 netstat.8: bump date
6b79232 Thanks: Lubomir
34ea18c netstat: Fix short options for --l2cap and --rfcomm
2246c64 pathnames: Bluetooth stuff is now in debugfs
b2a5d59 man: Document Bluetooth options
4321146 Fix typo in license notice.
80ac2bb First version of a contributors acknowledgement (to clean up file headers)
d621c2e [Bug#22] Return non-zero exit code if route arguments fail verification (CEM@sf.net)
038ed39 mii-tool: apply -p to -w
68a4d78 fix default for inet4 (0) and pointer to ip(8)
a3cab50 Documented metric defaults, made markup of keywords/variables more consistent.
b2f92c3 Fix unsigned sscanf format
4932915 Add netstat -S/--sctp parameter into help and manpages
47b8bce netstat.c: fix typo in error message
3eb367a Fix serveral strings in de/fr/pt_BR.po
12f5a0c Fix nstrcmp() to prevent ifconfig from showing duplicate interfaces.
f919c51 Makefile: add BINDIR & SBINDIR variables
08abda6 add const qualifier to fix compile warning about xstrdup argument
2356964 rprint_fib6() was passing 1 instead of 'numeric' into INET6_sprint()
a70c568 lib/inet6.c:INET6_rresolve() - various fixes
a753a90 lib/util.c: introduxe xstrdup which catches NULL and use it in all places
e8510bc lib/inet.c: replace safe_strcpy with strdup for dynamically allocated cache, fixes truncation
c0d4640 Show symbolic default only for 0.0.0.0/0 (which fixes Suse Bug#821077)
0348310 lib/x25.c: fix compile error for -DDEBUG=1
2466c75 hostname: modernized man page
8f124a7 hostname: do not mention root on permission problems. Thanks to Elias Probst for mentioning the problem.
e569425 merged: replace all remaining strcpy() with safe_strncpy()
d5d5db4 route: document  -4 and -6 for route command
cb15dc2 fix issues caused by replaceing strcpy() with safe_strncpy()
604785a replace all remaining strcpy() with safe_strncpy()
dc752cc Merge pull request #1 from florianl/master
3a2961d Fix calculation of available space
3da9774 [PATCH] replace strcpy() with safe_strncpy()
6a14c03 slattach: tweak how we ignore the ret of fchown()
d87ceba ifconfig: use sockaddr_storage to hold addresses
911ccc4 ifconfig: use in_addr_t for IPv4 types
d1381f9 trim trailing whitespace
35eaa82 Make SELINUX compile.
266c140 get selinux build info via pkg-config
4953812 ignore gdb related files
4fa4939 fix building with selinux enabled
70953e9 use CFLAGS when linking too
56a8434 Man page syntax fixes.
7cf048d Rémi Verschelde contributed french translation if ifconfig(8). https://sourceforge.net/p/net-tools/bugs/6/
36bd859 deal with 2-digits kernel versions as reported in Bug#7. https://sourceforge.net/p/net-tools/bugs/7/
e816552 Minor mostly comments typo fixes
3d31cea Use safe_strncpy wherever possible
60674bc updated manpage date, project url and email
adee8b7 mii-tool: dump also non standard registers
784f0af mii-tool: update manpage and usage
b30cd20 mii-tool: update PHY list
2370ab1 mii-tool: fix PHY ID in list
343864a Potential buffer overflow if kernel is missbehaved removed, reported by Adien Bustany
8b1ccd3 Merge branch 'master' of ssh://net-tools.git.sourceforge.net/gitroot/net-tools/net-tools
0727f6e Removed per-file version number
ded9e77 Removed per-file version number
a773411 Merge branch 'master' of ssh://net-tools.git.sourceforge.net/gitroot/net-tools/net-tools
4ee5ca4 Bump Version to 2.10 to be compatible with ubuntu
ae6e4a3 fix typo in statistics.c
4aa89e8 Bump to 1.70-alpha version and switch to net-tools-devel@lists.sourceforge.net as maintainer
339c720 mii-tool.c: increase buf size in show_basic_mii()
7e91281 netstat: check fstat's return value
8217b88 Some more fixes for german arp.8
d34e8f2 Use groff umlaut
868b18e Remove trailing linefeeds from arp.8 man pages
5333f7f arp(8): German translation updated + corrected, en: missing ) added
2bbc0ab arp(8): part of a sentence was missing
293bec6 update the dist target and add a distcheck target
70f4818 disable old features by default
8a77011 slattach: pass up exit status of shell command
77d0c1b Deprecated netstat, made usage with --inet/--inet6 clear.
6970e0b Minor cleanup of netstat usage()
01b8da0 Removed code duplication (Sourceforege#3567952 reported by hugh redelmeier)
e8b37a8 netstat memory leak fixed.
992a1de iptunnel.c: avoid fd leak in case of ioctl() error
53c4017 use scanf("%ms") instead of scanf("%as") for dynamic string
699e5db Consistently use defined exit codes.
6d09cad arp(8): fixed one more typo (simplyfy -> simplify)
776c653 arp(8): fixed typo (priveledge -> privilege)
b8cd80d Fixed 2 SELinux related compiler warnings.
a1de647 Removed SET and GET of interface metrics
5fac037 ifconfig(8): fix tunnel option syntax
6f050f1 infiniband: fix up new warning message
7182584 Make netstat -h and -V honor HAVE_SELINUX
4c91a43 removed unused variable
8509a38 new option for nestat, -Z shows SELinux context
064568d Make the code style consistent across netstat.c
aa01f8c man/de_DE/arp.8 fix translation (RHBZ#322901)
1e787c3 man/pt_BR/ifconfig.8: remove untranslated paragraph
653fd7c route(8): note that 'route mss' actually sets MTU (RHBZ#680837)
a4cbb77 ifconfig(8): note about supported format for IPv4 addresses (RHBZ#176661)
cb81887 ifconfig(8), netstat(8): mention iptables instead of ipchains, ipfwadm or ipfw.
4838db1 ifconfig(8): do not mention /proc/net/socket (RHBZ#661905)
5f5f16d Warn about changed encoding of man pages
6f5c897 Convert latin1 characters to UTF-8
1b74c24 inform user that ifconfig can correctly show only first 8 bytes of Infiniband hw address
9dc3a20 mii-tool: don't rely on eth0 being default network device name.
faf31f8 mii-tool: use <linux/mii.h> instead of "mii.h" and fix RHBZ #491358
6ccabd5 Possible problems found by static analysis of code.
0dcd1d1 plipconfig man page and usage output fixes
81814dc ifconfig interface:0 del <IP> will remove the aliased IP on IA64
796ba7f prevent 'netstat -nr -A inet6' from smashing stack (RHBZ #668047)
7b57688 fixed clearing flags in ifconfig (RHBZ #450252)
1f2c75d nameif crash for long interface names (RHBZ #209120)
cf33780 in kernel 2.6 /proc/net/x25_routes moves to /proc/net/x25/route
96b25f1 buffer overflow in arp (RHBZ #164695)
f1f8932 netstat -s reports negative octet counts
c8d4f43 The return value of nameif was wrong
81d60e0 Fix Content-Type in po files to avoid msgfmt warning.
ca5633d Updated README to reflect move to SourceForge.net
d613e1d Updated COPYING file.
98e1d90 mii-tool: fix inverted advertising/link features
0f65cdc slattach: man page documents /dev/ptmx support
4615091 slattach: add support for /dev/ptmx [Bug:3467521]
aa6c885 Merge branch 'master' of ssh://net-tools.git.sourceforge.net/gitroot/net-tools/net-tools
3642531 Bluetooth name fix
f6baf95 Add Bluetooth socket support
36b541c ifconfig/route: move to /bin
ca46fb1 ignore return value of fgets calls we dont care about
153ab83 hostname: check return value of getdomainname
9cd07a6 netstat: unify duplicate addr pretty printing
9eba397 fix integer/pointer cast warnings
c5e8dfb fix "format not a string literal" warnings
4d721ae fix up signed/unsigned warnings
46cd57a fix up unused variable warnings
243cd05 pull in stdlib.h for malloc() prototype
97b31ce clean up const/unsigned pointers with aftype/hwtype structs
7ae4aa5 get_sname: avoid buffer overflows if proto name is too long
6a9347c get_sname: unify numeric handling
2b4f34b get_sname: constify args/return when possible
5888d1b fix path to net-features.h
11310f8 patch from Bert Wesarg to separate basename of -p only if it is absulote path (in order to make argv[0]="sshd pty/0" display as sshd, and not as /0.
491cedb netstat: split host resolution out from --numeric-ports
74b2b54 netstat: fix handling of large socket numbers
8022436 hostname: fix FQDN handling with AAAA records
1dd95c5 corrected indention
c4b18d3 added some address family alias (still needs description) Bug#017886 Reported by Toralf
c65379a Bug #17812 Fix the handling of some of the HAVE_* flags ifdef vs if. --jpa468
1791685 [Bug #17645] Add netstat(8) support for RcvbufErrors, SndbufErrors. Thanks jwm
afb24b5 netstat: include sys/stat.h for S_ISREG macros
63582c8 Remove garbage ipv6 scopes in netstat output (Debian Bug #508110) Thanks Marco Steinacher for reporting.
60d538d netstat: PIDs can be long, Bug #199702 of Ubuntu Launchpad, Bug #16913 of Berlios
74f98bb interface: fix IPv6 parsing of interfaces with large indexes (> 255)
8003503 po/man: if LINGUAS is set, only install translations for those langs
0b2d037 improve dist target: include compiled gettext files, exclude scm files, and always prefix the paths in the tarball with the full versioned name
6c6e701 ignore generated gettext files
8c3c91f set BASEDIR to DESTDIR by default so the default install matches most packages
93f5da4 fix parallel build problems with the lib/ subdir and multiple targets that descend into it
043b0fa netstat: fix %*s handling -- the field takes an int, not a size_t
592e3a3 interface slip: cast keepalive/outfill to unsigned long to fix warnings on 64bit hosts -- no functional changes since these only have an 8bit range anyways
5edf1a4 ignore patch related files
8306063 netstat: add sctp connection decoding (Debian #306428 and Gentoo #258714)
0529337 ifconfig: fix no output when if_readlist_proc() fails
d50af4c slattach: use fchown() rather than chown() to avoid race between creation and permission changing
d114ba0 enable -fno-strict-aliasing until the code base gets a hefty clean up to fix all of the strict aliasing problems
f91f1b0 convert -idirafter to -I
fa5eec7 add missing dependency on version.h to libdir target to fix parallel build failures
f74e6f4 touch up build system to respect normal toolchain env vars rather than requiring people to set random custom ones
4db8743 handle raw "IP" masqinfo
b1c865c move man/fr_FR/*.8 pages into the "administrator" section
2e2ef32 arp: document the existing -e/-t options
15cf547 netstat: fix typo in udp display
9f22441 start a .gitignore
1e4c72b Missing include to make compileable with gcc-4.3.2 and glibc-2.9_p20081201 Patch from Petr Pisar [Berlios Bug#16232].
0d88998 ignore local .git dir
74f077e Fix for Feature Request from ssb [ Feature Request #4466 ] --continuous should flush stdout
9cfbce3 Czech translation update by petr.pisar@atlas.cz
0540cf6 Avoid name resolution for listening or established sockets (-l) by return fast. Problem reported by Ragnar Hojland Espinosa <ragnar@ragnar-hojland.com>
608b0fd scanf format length fix (non exploitable?) from Fabian Hugelshofer <hugelshofer2006@gmx.ch>
2750e60 -W option
bb2e60b new date, reformatted authors section (shorter)
9036cd6 sorted options
91f3c44 UDPlite Support for net-stat by Brian Micek <bmicek@gmail.com>
38720e8 Add wide option to prevent truncating IPv6 addresses
b6dabb7 moved H suport for Infiniband to the right section
24f959e Add hardware support for InfiniBand (Debian Bug #294252 Tom Duffy from Sun).
5737940 avoid unused filetype, fix formatting of -p headers
57b70fa conditional printing of values (to support -tuw options for netstat -s)
2e572c2 Support netstat -s with -6tuw options (incl. usage())
50165b2 Enable netstat -s for IPv6 (Debian Bug #453859 from Varun Chandramohan)
188a83f Avoid segfault of ifconfig(8) on missing /proc/net/dev (Debian Bug #222209 Pierre Lombard, Tollef Fog Heen)
0009712 Fix hypen in man pages (Debian Bug#288343 from Andrew Moise) Move man pages to sysadmin books update samples for route(8) (Debian Bug#400844, #368697 Danny Rathjens) update see also for ifconfig(8) (Debian Bug#365916 Dan Jacobs)
11b7232 fix some more hypens, changed book name and updated date to 2008-10-03
2fd7009 document the additional info in Send-Q/Recv-Q with recent kernels for listening sockets.
3e179eb allow netstat to print Rcv/Snd-Q for TCP_LISTEN (containing accept backlog)
7ac5bd2 Spelling error (Debian Bug #486448 reported by Volker Stolz)
bcebe9e fixed interfaceS spelling (Debian Bug #435690). Thanks Alan and Liu Xing.
3eb2013 more backoff
8ccfb33 backoff proc_fopen usage from etherfile.
b9963e7 use new page aliged proc_fopen for address families
eb21d0e Page aligned fopen buffer
20f0f8e Faster pagesize aligned fopen for netstat -s (Eric Dumazet)
41cae5e Better netstat -s error handling and larger buffers
94fb2fc cleanup man page (arp.8 2007-12-01)
c59ba33 ROSE support (not yet enabled)
4193b10 ROSE support
f6ec7f0 Fix Formatting Bug for ifconfig.8 (Debian Bug#450432 reported by Ivan Shmakov)
a7006fd unneeded %s in translation (Debian Bug #403033) Thanks to Marco Tulio Gontijo e Silva
2af5890 fixed signedness compiler warning
4347ec3 Fixed Debian Bug #392263 reported by Jochen Voss (buffer overflow in dev argument processing)
e44dfb3 formatting fixes from Justin Pryzby in Debian Bug #391495
2c5906a GigE Support by Stephen Hemminger from http://developer.osdl.org/shemminger/prototypes/mii-tool.tar.bz2 with verbose register patch from Dean Gaudet
b5b6f5b Debian Bug #260587 fixed, make sure the Columns state and user in netstat -t -e are separated by blanks. This may cause scripts to fail parsing by column width. Better wait for the script compatible output. Problems exists for ESTABLIHED state only.
3fecf29 use file version
79143c2 make slattach 3-wire -L mode work (no RTSCTS) (Debian Bug #175743)
2b01211 In order to fix alignment bugs with recent GCCs I have to use sockaddr_storage instead of sockaddr for allocation. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=340384 Thanks to Blars Blarson, Jurij Smakov and Steve Langasek
23e6090 X25 code compiles with 2.4 and 2.6 kernel headers (Debian Bug#271678)
464d107 Spelling fix for Debian Bug#326124 reported by A. Costa.
c47b0ce added link to berliOS
697cccc Eric Oberlander reported in Debian Bug#323261 that byte counter unit should be named "B" not "b".
3fb20be make ipx in 2.6 work (perhaps). Fixes http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=318503
fa7e5f6 minor formatting
c1b0c81 added pointer to iptables(8) not only ipchains(8) (Toralf Förster)
5ce2138 make  it compile with 2.4 and 2.6 kernel headers (Debian Bug #271678)
501fb48 desupport dontpub in arp.8 and arp -? (Debian Bug #203396)
7762692 updated pot file and use msgmerge instead of tupdate (Debian Bug #271426)
b07eb40 token ring patch from http://www.linuxtr.net/download/net-tools-1.60.patch Fixes Debian Bug #79462
d610378 line break fix debian bug #305637
85dad0a spellig fix debian bug #305638
0518929 spelling fix debian bug #305640
d1724c0 little formatting fix
f93122d default all options which work with recent systems  to on
d42c104 debians version of nstrcmp - ugly but works
a859bcb merged debian patch to make  it compile with new headers
6e5363d avoid namespace conflicts
faa3a97 added linebreak to  version signature
6ead3cb added diagnostics (closes debian bug #239229: EINVAL for downed interface)
b3412aa Typo Fix for german translation of arp po file reported by Christoph Berg (Debian Bug #176151)
321b4af make sure version string is helpful
7dfa4bd patch to recognize more hardware without MII support (from Redhat Bug#77882, notified by Tilmann Bubeck).
2085dd6 fix portability problem on 64-bit big endian. patch from Mads Martin Joergensen <mmj@suse.de>
17948a9 Maik Broemme contributed gcc warning fixes (break after default: label)
e02f9d0 fixes for man page bugs reported by Hugh Redelmeier.
aac294c Fix off by one in name length checking
a1c938f Use new style MII ioctls only. This will give you a warning, if compiled with old kernel source tree. It will also not work if compiled with new source on old kernels. The new ioctls also require root for reading, the old didnt. This fixes Debian bug #133648. No fallback compatibility is included for reasons of cleaner source.
5b24d94 bugfix: Skipping readlist, if readlist_proc sicceeded is not a good idea. I Rewrote that section for clarity. This is also present in the 1.60-8 debian package, which  fixed #197582 and #197924.
e273e09 make hostname compile warnign free with gcc 3.3 (Ec)
eb04ef3 added 'ull' prefix to unsigned long long constants to make gcc 3.3 happy
01c830f added mii-tool as featured tool
04331bd fixed compile warning (unneeded default: label in switch)
1c0f026 fixed wording of binary units counters and interpunctuation in netstat(8)
2868186 make it compile on stricter gcc3.3
408b6dd Fix Debian Bug#178209, Fix RedHat Bug#85748: nameif segfaults
8d55e6f Marc Lehmann pointed out that binary prefixes are made up by the IEEE and are not official SI yet. (Debian Bug #182478)
e06fed4 Add text for two new TCP statistics and fix some existing descriptions
651bf19 add a comment about alias interfaces and primary interface of scopes (intended to fix Debian wishlist bug #179780 and normal bug #64458)
4d2084d fixed an logic error in the "not found" handling for deleting entries also added a documentation comment and newer errno values for 2.4 Thanks to niteowl@intrinsity.com for pointing out.
fdc9421 use [::]:port as wildcard ipv6 address instead of *:port
9628c3a change confusing "*" into "<from_interface>"
cb9aeb9 - change columns of netstat -i/ifconfig -s to avoid run-into (Stefan Illner) - prevent segfault on protocol families without host error member - use /128 as default prefix if not specified instead of /0
88d85a7 Bruno Hall contributed a small and working nstrcmp()
1981012 corrected typo to make lib/interfaces.c actually compile
47af40a better ioctl fallback handling for interface listing, avoids duplicate interfaces, thanks for the help from Bruno Hall.
e2bee14 Implemented the Sean Reifenschneider suggested fflush() to the --watch function of mii-tool.
bbd4eca route now support -6 -4 or -46 option better layout for ipv6 routing table -C support for ipv6 routing cache more flags (i.e. reject) are recogniced for ipv6 routes
763c110 more stable ipx parsing (no segfault anymore)
0daeffd ethernet mac in lower case hex digits
f8f38f3 allow support for -6 and -4 options to netstat, also allow both, and print out tcp6, udp6 or raw6 if it is a v6 socket
8887da0 Jack Bloch noticed that the hw comamnd of ifconfig returns a confusing -EBUSY if interface is up (on lkml).
2ff6edc there is no such thing as -i option for ifconfig removed variable, fixed usage, added options to english man page
15080ea fixing debian bug #151130 reported by Dan Jacobson where netstat was printing 81 chars in a line for tcp, udp and raw.
2c3f73f thanks to "Erik A. Hendriks" <hendriks@lanl.gov> the interface nane bug in debian (#135744) is fixed, with his patch in (#149579) hopefully.
8cd8f53 this fixes segfault on -A "" and -F "" in mii-tool reported in debian bug #139027
7e52da1 simple patch from Ajax <ajax@firest0rm.org> (corrected) to print DDP (AppleTalk) routing table.
b03df1a brken buffer for printed irda address, reported by Christoph Bartelmus
d807bcb Fix some counter descriptions.
add5d92 export procnetdev_version, get_dev_fields, get_name from lib/interface.c for general usage (e.g. in my next patch to iptunnel)
5491f6f make RX-OK and TX-OK col. in "netstat -i" 1 digit longer by left aligning metric and TX-OVR and shorten max length of them.
5b1a3bb fixed typo in german man page and added a comment that man page is currently not completely up-to-date.
453c30f inodes in unix domain sockets are now padded to 8chars (netstat -x)
bdb279b fixes debian bug#134600 (sigsegv in netstat on negative inoded in /proc/net/udp) on "netstat -lpu". Thanks to Arnaud Giersch for the report.
4478c3c fixed debian bug#111642 reported by Jonathan Amery <jdamery@pick.ucam.org> (newline missing in nameif usage)
06be6d8 this fixes Debian Bug #109164 (netstat -ci does only print stats once). It also renames add_interface and free_interface list to if_cache_add/free. I am not sure if removing the "proc_read" flag will harm performance, looks likt this check is never triggereed. Anyway, we need more efficient b-search sooner or later.
1aaeb28 fixed minor errors in netstat.8 man page (--numeric-users was missing, some font problems and --interfaces has no <interface> argument (Debian Bug #120475) thanks for the report to Uwe Hermann.
2aea5d6 fixed debian bug#109370 (empty line if baseaddr < 0x100 in ifconfig). Patch by Jonathan Amery <jdamery@pick.ucam.org>
29e4329 added EUI64 Hardware Address Family Daniel Stodden <stodden@in.tum.de>
68ca19b added documentation about SI prefixes for decimal numbers
b93fefc added SI unit patch from adam@cfar.umd.edu to output of ifconfig byte counters
811cf0a sscanf pattern is %Lu not %llu for long long unsigned byte counters. This fixes the 0 byte output of ifconfig/netstat -i
017c996 changed troff syntax according to ESR's report
73ff76e fixed troff syntax, as reported by ESR. Did not changed the date of the man page.
e1dde4b delay the setting of netmask derived from /mask after setting address (Debian Bug #116573 reported by Brian Warner)
590aeaa minor fix to return E_USAGE on -V instead of exit(0);
234b63a failed to set error flag if netmask setting reported an error (Debian Bug #117837 reported by Sam Clegg)
81f8bc8 (Finally) update netstat -s for 2.4 statistics.
d67a12a Only print unknown statistics when their counter is > 0.
fb9c5b0 Fix netstat -- don't print all v4 addresses as v4-mapped-in-v6.
fc474dc Increase SIOCGIFCONF buffer size faster for many interfaces.
c8a6725 Remove Debian-specific path.
03f5eac doh
eb7fb72 Fix confusion between bits and bytes
c899ac9 made man page more useful and added right link for irq conflicts in ifconfig.8
6a06088 a fix for Debian which can be nicely included upstream (#102139)
866746a man page fix CLOSED -> CLOSE
afaea89 this will check after clearing a flag, that it is indeed cleared. it will also be a bit more verbose and precise on errors. See Debian Bug #102474
0284110 fixed CLOSED -> CLOSE in french and english manpage as of bug report from Matthew Tippett
1fa4848 changed a type arp -a now prints PUB instead of PUP for proxy arp entries
643ba69 Update from Meelis Roos

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 v2: I forgot to add new patches to SRC_URI and add Upstream-Status + SOB in them

 ...-to-unsigned-long-long-constants-to-.patch | 381 -----------
 ...inet6.c-INET6_rresolve-various-fixes.patch |  87 ---
 .../net-tools/Add_missing_headers.patch       |  15 +
 ...075-ifconfig.c-pointtopoint_spelling.patch |  26 +
 .../Bug_541172-netstat.c-exit-codes.patch     |  22 +
 ...ce-0-del-IP-will-remove-the-aliased-.patch |  32 -
 .../net-tools/net-tools/musl-fixes.patch      | 100 ---
 .../net-tools/net-tools-1.60-sctp1.patch      | 635 ------------------
 .../net-tools-1.60-sctp2-quiet.patch          |  28 -
 .../net-tools-1.60-sctp3-addrs.patch          | 363 ----------
 ...et-tools-fix-building-with-linux-4.8.patch |  52 --
 ..._1.60-26.bb => net-tools_1.60-20181103.bb} | 109 ++-
 12 files changed, 104 insertions(+), 1746 deletions(-)
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/Add_missing_headers.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch
 rename meta/recipes-extended/net-tools/{net-tools_1.60-26.bb => net-tools_1.60-20181103.bb} (38%)

diff --git a/meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch b/meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch
deleted file mode 100644
index 523d434b7c..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch
+++ /dev/null
@@ -1,381 +0,0 @@
-From eb04ef31571f6c707eacaba6846feeebfab518e6 Mon Sep 17 00:00:00 2001
-From: Bernd Eckenfels <net-tools@lina.inka.de>
-Date: Thu, 29 May 2003 02:09:14 +0000
-Subject: [PATCH] added 'ull' prefix to unsigned long long constants to make
- gcc 3.3 happy
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Backport [https://sourceforge.net/p/net-tools/code/ci/eb04ef31571f6c707eacaba6846feeebfab518e6]
----
- lib/interface.c | 299 ++++++++++++++++++++++++++----------------------
- 1 file changed, 161 insertions(+), 138 deletions(-)
-
-diff -uNr net-tools-1.60.orig/lib/interface.c net-tools-1.60/lib/interface.c
---- net-tools-1.60.orig/lib/interface.c	2020-06-16 10:04:16.308411879 +0000
-+++ net-tools-1.60/lib/interface.c	2020-06-16 10:05:15.697264291 +0000
-@@ -23,7 +23,6 @@
- #include <string.h>
- #include <unistd.h>
- #include <ctype.h>
--#include <string.h>
- 
- #if HAVE_AFIPX
- #if (__GLIBC__ > 2) || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
-@@ -654,6 +653,8 @@
-     const char *Rext = "B";
-     const char *Text = "B";
- 
-+    static char flags[200];
-+
- #if HAVE_AFIPX
-     static struct aftype *ipxtype = NULL;
- #endif
-@@ -685,32 +686,68 @@
-     if (hw == NULL)
- 	hw = get_hwntype(-1);
- 
--    printf(_("%-9s Link encap:%s  "), ptr->name, hw->title);
--    /* For some hardware types (eg Ash, ATM) we don't print the 
--       hardware address if it's null.  */
--    if (hw->print != NULL && (! (hw_null_address(hw, ptr->hwaddr) &&
--				  hw->suppress_null_addr)))
--	printf(_("HWaddr %s  "), hw->print(ptr->hwaddr));
--#ifdef IFF_PORTSEL
--    if (ptr->flags & IFF_PORTSEL) {
--	printf(_("Media:%s"), if_port_text[ptr->map.port][0]);
--	if (ptr->flags & IFF_AUTOMEDIA)
--	    printf(_("(auto)"));
--    }
-+    sprintf(flags, "flags=%d<", ptr->flags);
-+    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short, too */
-+    if (ptr->flags == 0)
-+       strcat(flags,">");
-+    if (ptr->flags & IFF_UP)
-+       strcat(flags,_("UP,"));
-+    if (ptr->flags & IFF_BROADCAST)
-+       strcat(flags,_("BROADCAST,"));
-+    if (ptr->flags & IFF_DEBUG)
-+       strcat(flags,_("DEBUG,"));
-+    if (ptr->flags & IFF_LOOPBACK)
-+       strcat(flags,_("LOOPBACK,"));
-+    if (ptr->flags & IFF_POINTOPOINT)
-+       strcat(flags,_("POINTOPOINT,"));
-+    if (ptr->flags & IFF_NOTRAILERS)
-+       strcat(flags,_("NOTRAILERS,"));
-+    if (ptr->flags & IFF_RUNNING)
-+       strcat(flags,_("RUNNING,"));
-+    if (ptr->flags & IFF_NOARP)
-+       strcat(flags,_("NOARP,"));
-+    if (ptr->flags & IFF_PROMISC)
-+       strcat(flags,_("PROMISC,"));
-+    if (ptr->flags & IFF_ALLMULTI)
-+       strcat(flags,_("ALLMULTI,"));
-+    if (ptr->flags & IFF_SLAVE)
-+       strcat(flags,_("SLAVE,"));
-+    if (ptr->flags & IFF_MASTER)
-+       strcat(flags,_("MASTER,"));
-+    if (ptr->flags & IFF_MULTICAST)
-+       strcat(flags,_("MULTICAST,"));
-+#ifdef HAVE_DYNAMIC
-+    if (ptr->flags & IFF_DYNAMIC)
-+       strcat(flags,_("DYNAMIC,"));
-+#endif
-+    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short */
-+    if (flags[strlen(flags)-1] == ',')
-+      flags[strlen(flags)-1] = '>';
-+    else
-+      flags[strlen(flags)-1] = 0;
-+      
-+
-+    printf(_("%s: %s  mtu %d  metric %d"),
-+          ptr->name, flags, ptr->mtu, ptr->metric ? ptr->metric : 1);
-+#ifdef SIOCSKEEPALIVE
-+    if (ptr->outfill || ptr->keepalive)
-+       printf(_("  outfill %d  keepalive %d"),
-+              ptr->outfill, ptr->keepalive);
- #endif
-     printf("\n");
- 
- #if HAVE_AFINET
-     if (ptr->has_ip) {
--	printf(_("          %s addr:%s "), ap->name,
-+        printf(_("        %s %s"), ap->name,
- 	       ap->sprint(&ptr->addr, 1));
--	if (ptr->flags & IFF_POINTOPOINT) {
--	    printf(_(" P-t-P:%s "), ap->sprint(&ptr->dstaddr, 1));
--	}
-+        printf(_("  netmask %s"), ap->sprint(&ptr->netmask, 1));
- 	if (ptr->flags & IFF_BROADCAST) {
--	    printf(_(" Bcast:%s "), ap->sprint(&ptr->broadaddr, 1));
-+            printf(_("  broadcast %s"), ap->sprint(&ptr->broadaddr, 1));
- 	}
--	printf(_(" Mask:%s\n"), ap->sprint(&ptr->netmask, 1));
-+       if (ptr->flags & IFF_POINTOPOINT) {
-+           printf(_("  destination %s"), ap->sprint(&ptr->dstaddr, 1));
-+       }
-+       printf("\n");
-     }
- #endif
- 
-@@ -727,29 +764,30 @@
- 			addr6p[0], addr6p[1], addr6p[2], addr6p[3],
- 			addr6p[4], addr6p[5], addr6p[6], addr6p[7]);
- 		inet6_aftype.input(1, addr6, (struct sockaddr *) &sap);
--		printf(_("          inet6 addr: %s/%d"),
--		 inet6_aftype.sprint((struct sockaddr *) &sap, 1), plen);
--		printf(_(" Scope:"));
--		switch (scope) {
--		case 0:
--		    printf(_("Global"));
--		    break;
--		case IPV6_ADDR_LINKLOCAL:
--		    printf(_("Link"));
--		    break;
--		case IPV6_ADDR_SITELOCAL:
--		    printf(_("Site"));
--		    break;
--		case IPV6_ADDR_COMPATv4:
--		    printf(_("Compat"));
--		    break;
--		case IPV6_ADDR_LOOPBACK:
--		    printf(_("Host"));
--		    break;
--		default:
--		    printf(_("Unknown"));
-+		printf(_("        %s %s  prefixlen %d"),
-+			inet6_aftype.name, 
-+			inet6_aftype.sprint((struct sockaddr *) &sap, 1), 
-+			plen);
-+		printf(_("  scopeid 0x%x"), scope);
-+
-+		flags[0] = '<'; flags[1] = 0;
-+		if (scope & IPV6_ADDR_COMPATv4) {
-+		    	strcat(flags, _("compat,"));
-+		    	scope -= IPV6_ADDR_COMPATv4;
- 		}
--		printf("\n");
-+		if (scope == 0)
-+			strcat(flags, _("global,"));
-+		if (scope & IPV6_ADDR_LINKLOCAL)
-+			strcat(flags, _("link,"));
-+		if (scope & IPV6_ADDR_SITELOCAL)
-+			strcat(flags, _("site,"));
-+		if (scope & IPV6_ADDR_LOOPBACK)
-+			strcat(flags, _("host,"));
-+		if (flags[strlen(flags)-1] == ',')
-+			flags[strlen(flags)-1] = '>';
-+		else
-+			flags[strlen(flags)-1] = 0;
-+		printf("%s\n", flags);
- 	    }
- 	}
- 	fclose(f);
-@@ -762,17 +800,17 @@
- 
-     if (ipxtype != NULL) {
- 	if (ptr->has_ipx_bb)
--	    printf(_("          IPX/Ethernet II addr:%s\n"),
--		   ipxtype->sprint(&ptr->ipxaddr_bb, 1));
-+	    printf(_("        %s Ethernet-II   %s\n"),
-+		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_bb, 1));
- 	if (ptr->has_ipx_sn)
--	    printf(_("          IPX/Ethernet SNAP addr:%s\n"),
--		   ipxtype->sprint(&ptr->ipxaddr_sn, 1));
-+	    printf(_("        %s Ethernet-SNAP %s\n"),
-+		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_sn, 1));
- 	if (ptr->has_ipx_e2)
--	    printf(_("          IPX/Ethernet 802.2 addr:%s\n"),
--		   ipxtype->sprint(&ptr->ipxaddr_e2, 1));
-+	    printf(_("        %s Ethernet802.2 %s\n"),
-+		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_e2, 1));
- 	if (ptr->has_ipx_e3)
--	    printf(_("          IPX/Ethernet 802.3 addr:%s\n"),
--		   ipxtype->sprint(&ptr->ipxaddr_e3, 1));
-+	    printf(_("        %s Ethernet802.3 %s\n"),
-+		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_e3, 1));
-     }
- #endif
- 
-@@ -781,7 +819,7 @@
- 	ddptype = get_afntype(AF_APPLETALK);
-     if (ddptype != NULL) {
- 	if (ptr->has_ddp)
--	    printf(_("          EtherTalk Phase 2 addr:%s\n"), ddptype->sprint(&ptr->ddpaddr, 1));
-+	    printf(_("        %s %s\n"), ddptype->name, ddptype->sprint(&ptr->ddpaddr, 1));
-     }
- #endif
- 
-@@ -790,53 +828,30 @@
- 	ectype = get_afntype(AF_ECONET);
-     if (ectype != NULL) {
- 	if (ptr->has_econet)
--	    printf(_("          econet addr:%s\n"), ectype->sprint(&ptr->ecaddr, 1));
-+	    printf(_("        %s %s\n"), ectype->name, ectype->sprint(&ptr->ecaddr, 1));
-     }
- #endif
- 
--    printf("          ");
--    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short, too */
--    if (ptr->flags == 0)
--	printf(_("[NO FLAGS] "));
--    if (ptr->flags & IFF_UP)
--	printf(_("UP "));
--    if (ptr->flags & IFF_BROADCAST)
--	printf(_("BROADCAST "));
--    if (ptr->flags & IFF_DEBUG)
--	printf(_("DEBUG "));
--    if (ptr->flags & IFF_LOOPBACK)
--	printf(_("LOOPBACK "));
--    if (ptr->flags & IFF_POINTOPOINT)
--	printf(_("POINTOPOINT "));
--    if (ptr->flags & IFF_NOTRAILERS)
--	printf(_("NOTRAILERS "));
--    if (ptr->flags & IFF_RUNNING)
--	printf(_("RUNNING "));
--    if (ptr->flags & IFF_NOARP)
--	printf(_("NOARP "));
--    if (ptr->flags & IFF_PROMISC)
--	printf(_("PROMISC "));
--    if (ptr->flags & IFF_ALLMULTI)
--	printf(_("ALLMULTI "));
--    if (ptr->flags & IFF_SLAVE)
--	printf(_("SLAVE "));
--    if (ptr->flags & IFF_MASTER)
--	printf(_("MASTER "));
--    if (ptr->flags & IFF_MULTICAST)
--	printf(_("MULTICAST "));
--#ifdef HAVE_DYNAMIC
--    if (ptr->flags & IFF_DYNAMIC)
--	printf(_("DYNAMIC "));
--#endif
--    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short */
--    printf(_(" MTU:%d  Metric:%d"),
--	   ptr->mtu, ptr->metric ? ptr->metric : 1);
--#ifdef SIOCSKEEPALIVE
--    if (ptr->outfill || ptr->keepalive)
--	printf(_("  Outfill:%d  Keepalive:%d"),
--	       ptr->outfill, ptr->keepalive);
-+    /* For some hardware types (eg Ash, ATM) we don't print the 
-+       hardware address if it's null.  */
-+    if (hw->print != NULL && (! (hw_null_address(hw, ptr->hwaddr) &&
-+				  hw->suppress_null_addr)))
-+	printf(_("        %s %s"), hw->name, hw->print(ptr->hwaddr));
-+    else
-+	printf(_("        %s"), hw->name);
-+    if (ptr->tx_queue_len != -1)
-+    	printf(_("  txqueuelen %d"), ptr->tx_queue_len);
-+    printf("  (%s)\n", hw->title);
-+
-+#ifdef IFF_PORTSEL
-+    if (ptr->flags & IFF_PORTSEL) {
-+	printf(_("        media %s"), if_port_text[ptr->map.port][0]);
-+	if (ptr->flags & IFF_AUTOMEDIA)
-+	    printf(_("autoselect"));
-+    	printf("\n");
-+    }
- #endif
--    printf("\n");
-+
- 
-     /* If needed, display the interface statistics. */
- 
-@@ -845,19 +860,9 @@
- 	 *      not for the aliases, although strictly speaking they're shared
- 	 *      by all addresses.
- 	 */
--	printf("          ");
--
--	printf(_("RX packets:%llu errors:%lu dropped:%lu overruns:%lu frame:%lu\n"),
--	       ptr->stats.rx_packets, ptr->stats.rx_errors,
--	       ptr->stats.rx_dropped, ptr->stats.rx_fifo_errors,
--	       ptr->stats.rx_frame_errors);
--	if (can_compress)
--	    printf(_("             compressed:%lu\n"), ptr->stats.rx_compressed);
- 
- 	rx = ptr->stats.rx_bytes;  
--	tx = ptr->stats.tx_bytes;
- 	short_rx = rx * 10;  
--	short_tx = tx * 10;
- 	if (rx > 1125899906842624ull) {
- 	    short_rx /= 1125899906842624ull;
- 	    Rext = "PiB";
-@@ -874,6 +879,8 @@
- 	    short_rx /= 1024;
- 	    Rext = "KiB";
- 	}
-+        tx = ptr->stats.tx_bytes;
-+        short_tx = tx * 10;
- 	if (tx > 1125899906842624ull) {
- 	    short_tx /= 1125899906842624ull;
- 	    Text = "PiB";
-@@ -891,37 +898,50 @@
- 	    Text = "KiB";
- 	}
- 
--	printf("          ");
--	printf(_("TX packets:%llu errors:%lu dropped:%lu overruns:%lu carrier:%lu\n"),
--	       ptr->stats.tx_packets, ptr->stats.tx_errors,
--	       ptr->stats.tx_dropped, ptr->stats.tx_fifo_errors,
--	       ptr->stats.tx_carrier_errors);
--	printf(_("          collisions:%lu "), ptr->stats.collisions);
--	if (can_compress)
--	    printf(_("compressed:%lu "), ptr->stats.tx_compressed);
--	if (ptr->tx_queue_len != -1)
--	    printf(_("txqueuelen:%d "), ptr->tx_queue_len);
--	printf("\n          ");
--	printf(_("RX bytes:%llu (%lu.%lu %s)  TX bytes:%llu (%lu.%lu %s)\n"),
-+	printf("        ");
-+	printf(_("RX packets %llu  bytes %llu (%lu.%lu %s)\n"), 
-+		ptr->stats.rx_packets, 
- 	       rx, (unsigned long)(short_rx / 10), 
--	       (unsigned long)(short_rx % 10), Rext, 
--	       tx, (unsigned long)(short_tx / 10), 
--	       (unsigned long)(short_tx % 10), Text);
-+	       (unsigned long)(short_rx % 10), Rext);
-+	if (can_compress) {
-+  	    printf("        ");
-+	    printf(_("RX compressed:%lu\n"), ptr->stats.rx_compressed);
-+	}
-+	printf("        ");
-+	printf(_("RX errors %lu  dropped %lu  overruns %lu  frame %lu\n"),
-+	       ptr->stats.rx_errors, ptr->stats.rx_dropped, 
-+	       ptr->stats.rx_fifo_errors, ptr->stats.rx_frame_errors);
-+
-+
-+	printf("        ");
-+	printf(_("TX packets %llu  bytes %llu (%lu.%lu %s)\n"),
-+		ptr->stats.tx_packets, 
-+	        tx, (unsigned long)(short_tx / 10), 
-+	        (unsigned long)(short_tx % 10), Text);
-+	if (can_compress) {
-+  	    printf("        ");
-+	    printf(_("TX compressed %lu\n"), ptr->stats.tx_compressed);
-+	}
-+	printf("        ");
-+	printf(_("TX errors %lu  dropped %lu overruns %lu  carrier %lu  collisions %lu\n"),
-+	       ptr->stats.tx_errors,
-+	       ptr->stats.tx_dropped, ptr->stats.tx_fifo_errors,
-+	       ptr->stats.tx_carrier_errors, ptr->stats.collisions);
-     }
- 
-     if ((ptr->map.irq || ptr->map.mem_start || ptr->map.dma ||
- 	 ptr->map.base_addr >= 0x100)) {
--	printf("          ");
-+	printf("        device ");
- 	if (ptr->map.irq)
--	    printf(_("Interrupt:%d "), ptr->map.irq);
-+	    printf(_("interrupt %d  "), ptr->map.irq);
- 	if (ptr->map.base_addr >= 0x100)	/* Only print devices using it for 
- 						   I/O maps */
--	    printf(_("Base address:0x%x "), ptr->map.base_addr);
-+	    printf(_("base 0x%x  "), ptr->map.base_addr);
- 	if (ptr->map.mem_start) {
--	    printf(_("Memory:%lx-%lx "), ptr->map.mem_start, ptr->map.mem_end);
-+	    printf(_("memory 0x%lx-%lx  "), ptr->map.mem_start, ptr->map.mem_end);
- 	}
- 	if (ptr->map.dma)
--	    printf(_("DMA chan:%x "), ptr->map.dma);
-+	    printf(_("  dma 0x%x"), ptr->map.dma);
- 	printf("\n");
-     }
-     printf("\n");
diff --git a/meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch b/meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch
deleted file mode 100644
index 8be45ccac9..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 08abfcd923e9f37d1902db26771b1dc6731eb265 Mon Sep 17 00:00:00 2001
-From: Jiri Popelka <jpopelka@redhat.com>
-Date: Fri, 27 Sep 2013 18:40:06 +0200
-Subject: [PATCH 1/1] lib/inet6.c:INET6_rresolve() - various fixes
-
-1) Fall-back to numeric address if getnameinfo fails.
-   Reverse lookup is not mandatory, therefore its fail
-   is not an error. Just return numeric address in that case.
-   This makes netstat/route show IPv6 address instead of
-   [UNKNOWN] in case of DNS problems.
-
-2) Pass length of 'name' buffer into function.
-   'name' is a pointer and therefore sizeof(name)
-   returns size of pointer and not size of the buffer.
-   see http://stackoverflow.com/questions/14298710/c-pointers-and-arrays-sizeof-operator
-   The sizeof() usage was added with commit 604785adc,
-   so I checked all the other changes in that commit
-   and they seem to be OK.
-
-3) remove unused 's' variable
-
-Upstream-Status: Pending
-
-Signed-off-by: Shan Hai <shan.hai@windriver.com>
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- lib/inet6.c | 21 ++++++++++-----------
- 1 file changed, 10 insertions(+), 11 deletions(-)
-
-diff --git a/lib/inet6.c b/lib/inet6.c
-index 9a484a0..2a9c459 100644
---- a/lib/inet6.c
-+++ b/lib/inet6.c
-@@ -84,10 +84,9 @@ static int INET6_resolve(char *name, struct sockaddr_in6 *sin6)
- #endif
- 
- 
--static int INET6_rresolve(char *name, struct sockaddr_in6 *sin6, int numeric)
-+static int INET6_rresolve(char *name, size_t namelen,
-+			  struct sockaddr_in6 *sin6, int numeric)
- {
--    int s;
--
-     /* Grmpf. -FvK */
-     if (sin6->sin6_family != AF_INET6) {
- #ifdef DEBUG
-@@ -98,21 +97,20 @@ static int INET6_rresolve(char *name, struct sockaddr_in6 *sin6, int numeric)
- 	return (-1);
-     }
-     if (numeric & 0x7FFF) {
--	inet_ntop( AF_INET6, &sin6->sin6_addr, name, 80);
-+	inet_ntop( AF_INET6, &sin6->sin6_addr, name, namelen);
- 	return (0);
-     }
-     if (IN6_IS_ADDR_UNSPECIFIED(&sin6->sin6_addr)) {
-         if (numeric & 0x8000)
--	    strcpy(name, "default");
-+	    safe_strncpy(name, "default", namelen);
- 	else
--	    strcpy(name, "[::]");
-+	    safe_strncpy(name, "[::]", namelen);
- 	return (0);
-     }
- 
--    if ((s = getnameinfo((struct sockaddr *) sin6, sizeof(struct sockaddr_in6),
--			 name, 255 /* !! */ , NULL, 0, 0))) {
--	fputs("getnameinfo failed\n", stderr);
--	return -1;
-+    if (getnameinfo((struct sockaddr *) sin6, sizeof(struct sockaddr_in6),
-+		    name, namelen , NULL, 0, 0)) {
-+	inet_ntop( AF_INET6, &sin6->sin6_addr, name, namelen);
-     }
-     return (0);
- }
-@@ -143,7 +141,8 @@ static char *INET6_sprint(struct sockaddr *sap, int numeric)
- 
-     if (sap->sa_family == 0xFFFF || sap->sa_family == 0)
- 	return safe_strncpy(buff, _("[NONE SET]"), sizeof(buff));
--    if (INET6_rresolve(buff, (struct sockaddr_in6 *) sap, numeric) != 0)
-+    if (INET6_rresolve(buff, sizeof(buff),
-+		       (struct sockaddr_in6 *) sap, numeric) != 0)
- 	return safe_strncpy(buff, _("[UNKNOWN]"), sizeof(buff));
-     return (fix_v4_address(buff, &((struct sockaddr_in6 *)sap)->sin6_addr));
- }
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-extended/net-tools/net-tools/Add_missing_headers.patch b/meta/recipes-extended/net-tools/net-tools/Add_missing_headers.patch
new file mode 100644
index 0000000000..f15d3654c7
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/Add_missing_headers.patch
@@ -0,0 +1,15 @@
+Description: Add missing headers
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/netstat.c
++++ b/netstat.c
+@@ -88,6 +88,7 @@
+ #include <sys/stat.h>
+ #include <net/if.h>
+ #include <dirent.h>
++#include <sys/types.h>
+ 
+ #include "net-support.h"
+ #include "pathnames.h"
diff --git a/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch b/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
new file mode 100644
index 0000000000..74d74668ce
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
@@ -0,0 +1,26 @@
+Description: Accept "pointtopoint" as a synonym for "pointopoint"
+Bug-Debian: https://bugs.debian.org/443075
+Author: Justin Pryzby <pryzbyj@libra>
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/ifconfig.c
++++ b/ifconfig.c
+@@ -644,14 +644,14 @@
+ 	    spp++;
+ 	    continue;
+ 	}
+-	if (!strcmp(*spp, "-pointopoint")) {
++	if (!strcmp(*spp, "-pointopoint") || !strcmp(*spp, "-pointtopoint")) {
+ 	    goterr |= clr_flag(ifr.ifr_name, IFF_POINTOPOINT);
+ 	    spp++;
+ 	    if (test_flag(ifr.ifr_name, IFF_POINTOPOINT) > 0)
+ 	    	fprintf(stderr, _("Warning: Interface %s still in POINTOPOINT mode.\n"), ifr.ifr_name);
+ 	    continue;
+ 	}
+-	if (!strcmp(*spp, "pointopoint")) {
++	if (!strcmp(*spp, "pointopoint") || !strcmp(*spp, "pointtopoint")) {
+ 	    if (*(spp + 1) != NULL) {
+ 		spp++;
+ 		safe_strncpy(host, *spp, (sizeof host));
diff --git a/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch b/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
new file mode 100644
index 0000000000..782b94bc61
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
@@ -0,0 +1,22 @@
+Description: Bug#541172: netstat.c exit codes
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/netstat.c
++++ b/netstat.c
+@@ -2237,12 +2237,14 @@
+             parsesnmp(flag_raw, flag_tcp, flag_udp, flag_sctp);
+ #else
+             ENOSUPP("netstat", "AF INET");
++            exit(1);
+ #endif
+         } else if(!strcmp(afname, "inet6")) {
+ #if HAVE_AFINET6
+             parsesnmp6(flag_raw, flag_tcp, flag_udp);
+ #else
+             ENOSUPP("netstat", "AF INET6");
++            exit(1);
+ #endif
+         } else {
+           printf(_("netstat: No statistics support for specified address family: %s\n"), afname);
diff --git a/meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch b/meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch
deleted file mode 100644
index 06f81420e9..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 81814dc2b14843009193efd307d814c26baa61f0 Mon Sep 17 00:00:00 2001
-From: Jiri Popelka <jpopelka@redhat.com>
-Date: Wed, 7 Dec 2011 19:14:09 +0100
-Subject: [PATCH] ifconfig interface:0 del <IP> will remove the aliased IP on IA64
-
-Upstream-Status: Backport
-
-commit 81814dc2b14843009193efd307d814c26baa61f0 from
-git://git.code.sf.net/p/net-tools/code
-
----
- ifconfig.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/ifconfig.c b/ifconfig.c
-index bc405c6..dae8922 100644
---- a/ifconfig.c
-+++ b/ifconfig.c
-@@ -890,7 +890,9 @@ int main(int argc, char **argv)
- 		    continue;
- 		}
- 		
--		memcpy(&ip, &sin.sin_addr.s_addr, sizeof(unsigned long));
-+		/* Clear "ip" in case sizeof(unsigned long) > sizeof(sin.sin_addr.s_addr) */
-+		ip = 0;
-+		memcpy(&ip, &sin.sin_addr.s_addr, sizeof(sin.sin_addr.s_addr));
- 		
- 		if (get_nmbc_parent(ifr.ifr_name, &nm, &bc) < 0) {
- 		    fprintf(stderr, _("Interface %s not initialized\n"),
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/net-tools/net-tools/musl-fixes.patch b/meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
deleted file mode 100644
index f694d594bf..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/musl-fixes.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-Adjust headers for non-glibc cases
-especially exposed by musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: net-tools-1.60/lib/inet6_gr.c
-===================================================================
---- net-tools-1.60.orig/lib/inet6_gr.c
-+++ net-tools-1.60/lib/inet6_gr.c
-@@ -23,7 +23,7 @@
- #include <string.h>
- #include <stdio.h>
- #include <unistd.h>
--#ifndef __GLIBC__
-+#ifdef HAVE_IPV6_ROUTE_H
- #include <netinet6/ipv6_route.h>	/* glibc doesn't have this */
- #endif
- #include "version.h"
-Index: net-tools-1.60/lib/inet6_sr.c
-===================================================================
---- net-tools-1.60.orig/lib/inet6_sr.c
-+++ net-tools-1.60/lib/inet6_sr.c
-@@ -23,10 +23,10 @@
- #include <string.h>
- #include <stdio.h>
- #include <unistd.h>
--#ifdef __GLIBC__
--#include <net/route.h>
--#else
-+#ifdef HAVE_IPV6_ROUTE_H
- #include <netinet6/ipv6_route.h>	/* glibc does not have this */
-+#else
-+#include <net/route.h>
- #endif
- #include "version.h"
- #include "net-support.h"
-Index: net-tools-1.60/lib/inet_sr.c
-===================================================================
---- net-tools-1.60.orig/lib/inet_sr.c
-+++ net-tools-1.60/lib/inet_sr.c
-@@ -26,6 +26,7 @@
- #include <string.h>
- #include <stdio.h>
- #include <unistd.h>
-+#include <asm-generic/param.h>
- #include "version.h"
- #include "net-support.h"
- #include "pathnames.h"
-Index: net-tools-1.60/lib/util-ank.c
-===================================================================
---- net-tools-1.60.orig/lib/util-ank.c
-+++ net-tools-1.60/lib/util-ank.c
-@@ -14,6 +14,7 @@
-  * Rani Assaf <rani@magic.metawire.com> 980929:	resolve addresses
-  */
- 
-+#include <limits.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-Index: net-tools-1.60/mii-tool.c
-===================================================================
---- net-tools-1.60.orig/mii-tool.c
-+++ net-tools-1.60/mii-tool.c
-@@ -47,10 +47,6 @@ static char Version[] = "$Id: mii-tool.c
- #include <net/if.h>
- #include <linux/sockios.h>
- 
--#ifndef __GLIBC__
--#include <linux/if_arp.h>
--#include <linux/if_ether.h>
--#endif
- #include "mii.h"
- #include "version.h"
- 
-Index: net-tools-1.60/netstat.c
-===================================================================
---- net-tools-1.60.orig/netstat.c
-+++ net-tools-1.60/netstat.c
-@@ -87,6 +87,7 @@
- #include <dirent.h>
- #include <sys/stat.h>
- #include <sys/types.h>
-+#include <asm-generic/param.h>
- 
- #include "net-support.h"
- #include "pathnames.h"
-Index: net-tools-1.60/slattach.c
-===================================================================
---- net-tools-1.60.orig/slattach.c
-+++ net-tools-1.60/slattach.c
-@@ -44,6 +44,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <getopt.h>
-+#include <termios.h>
- #include <linux/if_slip.h>
- 
- #if defined(__GLIBC__)
diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
deleted file mode 100644
index 78daf6c3ed..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
+++ /dev/null
@@ -1,635 +0,0 @@
-From 23276afe270009420cfbc52bffafdd25ac0817fe Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 14 Jan 2016 17:01:29 +0800
-Subject: [PATCH 1/3] net-tools: add SCTP support for netstat
-
-Upstream-Status: pending
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- netstat.c    | 411 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
- statistics.c |  68 +++++++++-
- 2 files changed, 465 insertions(+), 14 deletions(-)
-
-Index: net-tools-1.60/netstat.c
-===================================================================
---- net-tools-1.60.orig/netstat.c
-+++ net-tools-1.60/netstat.c
-@@ -58,6 +58,7 @@
-  *
-  *990420 {1.38} Tuan Hoang              removed a useless assignment from igmp_do_one()
-  *20010404 {1.39} Arnaldo Carvalho de Melo - use setlocale
-+ *20050516 {1.40} Ivan Skytte Joergensen:Added SCTP support
-  *
-  *              This program is free software; you can redistribute it
-  *              and/or  modify it under  the terms of  the GNU General
-@@ -106,7 +107,7 @@
- #endif
- 
- /* prototypes for statistics.c */
--void parsesnmp(int, int, int);
-+void parsesnmp(int, int, int, int);
- void inittab(void);
- void parsesnmp6(int, int, int);
- void inittab6(void);
-@@ -119,6 +120,28 @@ typedef enum {
-     SS_DISCONNECTING		/* in process of disconnecting  */
- } socket_state;
- 
-+#define SCTP_NSTATES  9         /* The number of states in array*/
-+
-+static const char *sctp_state[] = {
-+    N_("EMPTY"),
-+    N_("CLOSED"),
-+    N_("COOKIE_WAIT"),
-+    N_("COOKIE_ECHOED"),
-+    N_("ESTABLISHED"),
-+    N_("SHUTDOWN_PENDING"),
-+    N_("SHUTDOWN_SENT"),
-+    N_("SHUTDOWN_RECEIVED"),
-+    N_("SHUTDOWN_ACK_SENT")
-+};
-+
-+#define SCTP_NTYPES 3           /* The number of types in array */
-+
-+static const char *sctp_type[] = {
-+    N_("udp"),
-+    N_("udp-high-bw"),
-+    N_("tcp")
-+};
-+
- #define SO_ACCEPTCON    (1<<16)	/* performed a listen           */
- #define SO_WAITDATA     (1<<17)	/* wait data to read            */
- #define SO_NOSPACE      (1<<18)	/* no space to write            */
-@@ -149,6 +172,7 @@ int flag_opt = 0;
- int flag_raw = 0;
- int flag_tcp = 0;
- int flag_udp = 0;
-+int flag_sctp= 0;
- int flag_igmp= 0;
- int flag_rom = 0;
- int flag_exp = 1;
-@@ -995,6 +1019,365 @@ static int udp_info(void)
- 	       udp_do_one);
- }
- 
-+static const char *sctp_socket_type_str(int type) {
-+    if(type>=0 && type<SCTP_NTYPES)
-+	return sctp_type[type];
-+    else {
-+	static char type_str_buf[64];
-+	sprintf(type_str_buf,"UNKNOWN(%d)",type);
-+	return type_str_buf;
-+    }
-+}
-+
-+static const char *sctp_state_str(int state)
-+{
-+    if(state>=0 && state<SCTP_NSTATES)
-+	return sctp_state[state];
-+    else {
-+	static char state_str_buf[64];
-+	sprintf(state_str_buf,"UNKNOWN(%d)",state);
-+	return state_str_buf;
-+    }
-+}
-+
-+static const char *sctp_socket_state_str(int state)
-+{
-+    if(state>=0 && state<=10)
-+        return tcp_state[state];
-+    else {
-+	static char state_str_buf[64];
-+	sprintf(state_str_buf,"UNKNOWN(%d)",state);
-+	return state_str_buf;
-+    }
-+}
-+
-+static struct aftype *process_sctp_addr_str(const char *addr_str, struct sockaddr *sa)
-+{
-+    if (strchr(addr_str,':')) {
-+#if HAVE_AFINET6
-+	extern struct aftype inet6_aftype;
-+	/* Demangle what the kernel gives us */
-+	struct in6_addr in6;
-+	char addr6_str[INET6_ADDRSTRLEN];
-+	unsigned u0,u1,u2,u3,u4,u5,u6,u7;
-+	sscanf(addr_str, "%04X:%04X:%04X:%04X:%04X:%04X:%04X:%04X",
-+	       &u0, &u1, &u2, &u3, &u4, &u5, &u6, &u7);
-+	in6.s6_addr16[0] = htons(u0);
-+	in6.s6_addr16[1] = htons(u1);
-+	in6.s6_addr16[2] = htons(u2);
-+	in6.s6_addr16[3] = htons(u3);
-+	in6.s6_addr16[4] = htons(u4);
-+	in6.s6_addr16[5] = htons(u5);
-+	in6.s6_addr16[6] = htons(u6);
-+	in6.s6_addr16[7] = htons(u7);
-+
-+	inet_ntop(AF_INET6, &in6, addr6_str, sizeof(addr6_str));
-+	inet6_aftype.input(1, addr6_str, sa);
-+	sa->sa_family = AF_INET6;
-+#endif
-+    } else {
-+    	((struct sockaddr_in*)sa)->sin_addr.s_addr = inet_addr(addr_str);
-+	sa->sa_family = AF_INET;
-+    }
-+    return get_afntype(sa->sa_family);
-+}
-+
-+static void sctp_eps_do_one(int lnr, char *line)
-+{
-+    char buffer[1024];
-+    int type, state, port;
-+    int uid;
-+    unsigned long inode;
-+    
-+    struct aftype *ap;
-+#if HAVE_AFINET6
-+    struct sockaddr_in6 localaddr;
-+#else
-+    struct sockaddr_in localaddr;
-+#endif
-+    const char *sty_str;
-+    const char *sst_str;
-+    const char *lport_str;
-+    const char *uid_str;
-+    const char *inode_str;
-+    const char *pladdr_str;
-+    char *laddrs_str;
-+    
-+    if(lnr == 0) {
-+	/* ENDPT     SOCK   STY SST HBKT LPORT   uid inode pladdr LADDRS*/
-+	return;
-+    }
-+    
-+    strtok(line," \t\n"); /*skip ptr*/
-+    strtok(0," \t\n");    /*skip ptr*/
-+    sty_str = strtok(0," \t\n");
-+    sst_str = strtok(0," \t\n");
-+    strtok(0," \t\n"); /*skip hash bucket*/
-+    lport_str=strtok(0," \t\n");
-+    uid_str = strtok(0," \t\n");
-+    inode_str = strtok(0," \t\n");
-+    pladdr_str = strtok(0," \t\n");
-+    laddrs_str=strtok(0,"\t\n");
-+    
-+    type = atoi(sty_str);
-+    state = atoi(sst_str);
-+    port = atoi(lport_str);
-+    uid = atoi(uid_str);
-+    inode = strtoul(inode_str,0,0);
-+    
-+    if(flag_sctp<=1) {
-+	/* only print the primary address */
-+	char local_addr[64];
-+	char local_port[16];
-+	
-+	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
-+	if(ap)
-+	    safe_strncpy(local_addr,
-+	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
-+	                 sizeof(local_addr));
-+	else
-+	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
-+	
-+	snprintf(local_port, sizeof(local_port), "%s",
-+	         get_sname(htons(port), "sctp",
-+	                   flag_not & FLAG_NUM_PORT));
-+	
-+	printf("sctp                ");
-+	sprintf(buffer,"%s:%s", local_addr, local_port);
-+	printf("%-47s", buffer);
-+    	printf(" %-12s", sctp_socket_state_str(state));
-+    } else {
-+    	/*print all addresses*/
-+	const char *this_local_addr;
-+	int first=1;
-+	char local_port[16];
-+	snprintf(local_port, sizeof(local_port), "%s",
-+		 get_sname(htons(port), "sctp",
-+			   flag_not & FLAG_NUM_PORT));
-+	for(this_local_addr=strtok(laddrs_str," \t\n");
-+	    this_local_addr;
-+	    this_local_addr=strtok(0," \t\n"))
-+	{
-+	    char local_addr[64];
-+	    ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
-+	    if(ap)
-+		safe_strncpy(local_addr,
-+		             ap->sprint((struct sockaddr *) &localaddr, flag_not),
-+		             sizeof(local_addr));
-+	    else
-+		sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
-+
-+	    if(!first) printf("\n");
-+	    if(first)
-+	        printf("sctp                ");
-+	    else
-+	        printf("                    ");
-+	    sprintf(buffer,"%s:%s", local_addr, local_port);
-+	    printf("%-47s", buffer);
-+	    printf(" %-12s", first?sctp_socket_state_str(state):"");
-+	    first = 0;
-+	}
-+    }
-+
-+    finish_this_one(uid,inode,"");
-+}
-+
-+static void sctp_assoc_do_one(int lnr, char *line)
-+{
-+    char buffer[1024];
-+    int type, state, state2, lport,rport;
-+    int uid;
-+    unsigned rxqueue,txqueue;
-+    unsigned long inode;
-+    
-+    struct aftype *ap;
-+#if HAVE_AFINET6
-+    struct sockaddr_in6 localaddr,remoteaddr;
-+#else
-+    struct sockaddr_in localaddr,remoteaddr;
-+#endif
-+    const char *sty_str;
-+    const char *sst_str;
-+    const char *st_str;
-+    const char *txqueue_str;
-+    const char *rxqueue_str;
-+    const char *lport_str,*rport_str;
-+    const char *uid_str;
-+    const char *inode_str;
-+    const char *pladdr_str;
-+    char *laddrs_str;
-+    const char *praddr_str;
-+    char *raddrs_str;
-+    
-+    if(lnr == 0) {
-+	/* ASSOC     SOCK   STY SST ST HBKT tx_queue rx_queue uid inode LPORT RPORT pladdr praddr LADDRS <-> RADDRS*/
-+	return;
-+    }
-+    
-+    strtok(line," \t\n"); /*skip ptr*/
-+    strtok(0," \t\n");    /*skip ptr*/
-+    sty_str = strtok(0," \t\n");
-+    sst_str = strtok(0," \t\n");
-+    st_str = strtok(0," \t\n");
-+    strtok(0," \t\n"); /*skip hash bucket*/
-+    txqueue_str =  strtok(0," \t\n");
-+    rxqueue_str =  strtok(0," \t\n");
-+    uid_str = strtok(0," \t\n");
-+    inode_str = strtok(0," \t\n");
-+    lport_str=strtok(0," \t\n");
-+    rport_str=strtok(0," \t\n");
-+    pladdr_str = strtok(0," \t\n");
-+    praddr_str = strtok(0," \t\n");
-+    laddrs_str=strtok(0,"<->\t\n");
-+    raddrs_str=strtok(0,"<->\t\n");
-+
-+    type = atoi(sty_str);
-+    state = atoi(sst_str);
-+    state2 = atoi(st_str);
-+    txqueue = atoi(txqueue_str);
-+    rxqueue = atoi(rxqueue_str);
-+    uid = atoi(uid_str);
-+    inode = strtoul(inode_str,0,0);
-+    lport = atoi(lport_str);
-+    rport = atoi(rport_str);
-+    
-+    if(flag_sctp<=1) {
-+	/* only print the primary addresses */
-+	char local_addr[64];
-+	char local_port[16];
-+	char remote_addr[64];
-+	char remote_port[16];
-+	
-+	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
-+	if(ap)
-+	    safe_strncpy(local_addr,
-+	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
-+	                 sizeof(local_addr));
-+	else
-+	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
-+	
-+	snprintf(local_port, sizeof(local_port), "%s",
-+	         get_sname(htons(lport), "sctp",
-+	                   flag_not & FLAG_NUM_PORT));
-+	
-+	ap = process_sctp_addr_str(praddr_str, (struct sockaddr*)&remoteaddr);
-+	if(ap)
-+	    safe_strncpy(remote_addr,
-+	                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
-+	                 sizeof(remote_addr));
-+	else
-+	    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
-+	
-+	snprintf(remote_port, sizeof(remote_port), "%s",
-+		 get_sname(htons(rport), "sctp",
-+			   flag_not & FLAG_NUM_PORT));
-+
-+	printf("sctp");
-+	printf("  %6u %6u ", rxqueue, txqueue);
-+	sprintf(buffer,"%s:%s", local_addr, local_port);
-+	printf("%-23s", buffer);
-+	printf(" ");
-+	sprintf(buffer,"%s:%s", remote_addr, remote_port);
-+	printf("%-23s", buffer);
-+    	printf(" %-12s", sctp_socket_state_str(state));
-+    } else {
-+    	/*print all addresses*/
-+	const char *this_local_addr;
-+	const char *this_remote_addr;
-+	char *ss1,*ss2;
-+	int first=1;
-+	char local_port[16];
-+	char remote_port[16];
-+	snprintf(local_port, sizeof(local_port), "%s",
-+	         get_sname(htons(lport), "sctp",
-+	                   flag_not & FLAG_NUM_PORT));
-+	snprintf(remote_port, sizeof(remote_port), "%s",
-+	         get_sname(htons(rport), "sctp",
-+	                   flag_not & FLAG_NUM_PORT));
-+
-+	this_local_addr=strtok_r(laddrs_str," \t\n",&ss1);
-+	this_remote_addr=strtok_r(raddrs_str," \t\n",&ss2);
-+	while(this_local_addr || this_remote_addr) {
-+	    char local_addr[64];
-+	    char remote_addr[64];
-+	    if(this_local_addr) {
-+		ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
-+		if(ap)
-+		    safe_strncpy(local_addr,
-+		                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
-+		                 sizeof(local_addr));
-+		else
-+		    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
-+	    }
-+	    if(this_remote_addr) {
-+		ap = process_sctp_addr_str(this_remote_addr, (struct sockaddr*)&remoteaddr);
-+		if(ap)
-+		    safe_strncpy(remote_addr,
-+		                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
-+		                 sizeof(remote_addr));
-+		else
-+		    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
-+	    }
-+
-+	    if(!first) printf("\n");
-+	    if(first)
-+		printf("sctp  %6u %6u ", rxqueue, txqueue);
-+	    else
-+		printf("                    ");
-+	    if(this_local_addr) {
-+		if(first)
-+		    sprintf(buffer,"%s:%s", local_addr, local_port);
-+		else
-+		    sprintf(buffer,"%s", local_addr);
-+		printf("%-23s", buffer);
-+	    } else
-+	    	printf("%-23s", "");
-+	    printf(" ");
-+	    if(this_remote_addr) {
-+		if(first)
-+		    sprintf(buffer,"%s:%s", remote_addr, remote_port);
-+		else
-+		    sprintf(buffer,"%s", remote_addr);
-+		printf("%-23s", buffer);
-+	    } else
-+		printf("%-23s", "");
-+
-+	    printf(" %-12s", first?sctp_socket_state_str(state):"");
-+
-+	    first = 0;
-+	    this_local_addr=strtok_r(0," \t\n",&ss1);
-+	    this_remote_addr=strtok_r(0," \t\n",&ss2);
-+	}
-+    }
-+
-+    finish_this_one(uid,inode,"");
-+}
-+
-+static int sctp_info_eps(void)
-+{
-+#if !defined(_PATH_PROCNET_SCTP_EPS)
-+#define	_PATH_PROCNET_SCTP_EPS	"/proc/net/sctp/eps"
-+#endif
-+    INFO_GUTS(_PATH_PROCNET_SCTP_EPS, "AF INET (sctp)",
-+              sctp_eps_do_one);
-+}
-+
-+static int sctp_info_assocs(void)
-+{
-+#if !defined(_PATH_PROCNET_SCTP_ASSOCS)
-+#define	_PATH_PROCNET_SCTP_ASSOCS	"/proc/net/sctp/assocs"
-+#endif
-+    INFO_GUTS(_PATH_PROCNET_SCTP_ASSOCS, "AF INET (sctp)",
-+              sctp_assoc_do_one);
-+}
-+
-+static int sctp_info(void)
-+{
-+    if(flag_all)
-+    	sctp_info_eps();
-+    return sctp_info_assocs();
-+}
-+
- static void raw_do_one(int lnr, const char *line)
- {
-     char buffer[8192], local_addr[64], rem_addr[64];
-@@ -1558,7 +1941,7 @@ static void usage(void)
-     fprintf(stderr, _("        -F, --fib                display Forwarding Information Base (default)\n"));
-     fprintf(stderr, _("        -C, --cache              display routing cache instead of FIB\n\n"));
- 
--    fprintf(stderr, _("  <Socket>={-t|--tcp} {-u|--udp} {-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
-+    fprintf(stderr, _("  <Socket>={-t|--tcp} {-u|--udp} {-S|--sctp} {-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
-     fprintf(stderr, _("  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: %s\n"), DFLT_AF);
-     fprintf(stderr, _("  List of possible address families (which support routing):\n"));
-     print_aflist(1); /* 1 = routeable */
-@@ -1583,6 +1966,7 @@ int main
- 	{"protocol", 1, 0, 'A'},
- 	{"tcp", 0, 0, 't'},
- 	{"udp", 0, 0, 'u'},
-+	{"sctp", 0, 0, 'S' },
- 	{"raw", 0, 0, 'w'},
- 	{"unix", 0, 0, 'x'},
- 	{"listening", 0, 0, 'l'},
-@@ -1613,7 +1997,7 @@ int main
-     getroute_init();		/* Set up AF routing support */
- 
-     afname[0] = '\0';
--    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuWVv?wxl64", longopts, &lop)) != EOF)
-+    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuSWVv?wxl64", longopts, &lop)) != EOF)
- 	switch (i) {
- 	case -1:
- 	    break;
-@@ -1705,10 +2089,12 @@ int main
- 	case 't':
- 	    flag_tcp++;
- 	    break;
--
- 	case 'u':
- 	    flag_udp++;
- 	    break;
-+	case 'S':
-+	    flag_sctp++;
-+	    break;
- 	case 'w':
- 	    flag_raw++;
- 	    break;
-@@ -1726,13 +2112,13 @@ int main
-     if (flag_int + flag_rou + flag_mas + flag_sta > 1)
- 	usage();
- 
--    if ((flag_inet || flag_inet6 || flag_sta) && !(flag_tcp || flag_udp || flag_raw))
--	flag_tcp = flag_udp = flag_raw = 1;
-+    if ((flag_inet || flag_inet6 || flag_sta) && !(flag_tcp || flag_udp || flag_sctp || flag_raw))
-+	flag_tcp = flag_udp = flag_sctp = flag_raw = 1;
- 
--    if ((flag_tcp || flag_udp || flag_raw || flag_igmp) && !(flag_inet || flag_inet6))
-+    if ((flag_tcp || flag_udp || flag_sctp || flag_raw || flag_igmp) && !(flag_inet || flag_inet6))
-         flag_inet = flag_inet6 = 1;
- 
--    flag_arg = flag_tcp + flag_udp + flag_raw + flag_unx + flag_ipx
-+    flag_arg = flag_tcp + flag_udp + flag_sctp + flag_raw + flag_unx + flag_ipx
- 	+ flag_ax25 + flag_netrom + flag_igmp + flag_x25;
- 
-     if (flag_mas) {
-@@ -1760,7 +2146,7 @@ int main
-         char buf[256];
-         if (!afname[0]) {
-             inittab();
--            parsesnmp(flag_raw, flag_tcp, flag_udp);
-+            parsesnmp(flag_raw, flag_tcp, flag_udp, flag_sctp);
-         } else {
-             safe_strncpy(buf, afname, sizeof(buf));
-             tmp1 = buf;
-@@ -1815,7 +2201,7 @@ int main
- 	return (i);
-     }
-     for (;;) {
--	if (!flag_arg || flag_tcp || flag_udp || flag_raw) {
-+	if (!flag_arg || flag_tcp || flag_udp || flag_sctp || flag_raw) {
- #if HAVE_AFINET
- 	    prg_cache_load();
- 	    printf(_("Active Internet connections "));	/* xxx */
-@@ -1854,6 +2240,11 @@ int main
- 	    if (i)
- 		return (i);
- 	}
-+	if (!flag_arg || flag_sctp) {
-+	    i = sctp_info();
-+	    if (i)
-+		return (i);
-+	}
- 	if (!flag_arg || flag_raw) {
- 	    i = raw_info();
- 	    if (i)
-Index: net-tools-1.60/statistics.c
-===================================================================
---- net-tools-1.60.orig/statistics.c
-+++ net-tools-1.60/statistics.c
-@@ -21,7 +21,7 @@
- #define UFWARN(x)
- #endif
- 
--int print_static,f_raw,f_tcp,f_udp,f_unknown = 1;
-+int print_static,f_raw,f_tcp,f_udp,f_sctp,f_unknown = 1;
- 
- enum State {
-     number = 0, opt_number, i_forward, i_inp_icmp, i_outp_icmp, i_rto_alg,
-@@ -297,6 +297,27 @@ struct entry Tcpexttab[] =
-     { "TCPRenoRecoveryFail", N_("%llu classic Reno fast retransmits failed"), opt_number },
- };
- 
-+struct entry Sctptab[] =
-+{
-+    {"SctpCurrEstab", N_("%u Current Associations"), number},
-+    {"SctpActiveEstabs", N_("%u Active Associations"), number},
-+    {"SctpPassiveEstabs", N_("%u Passive Associations"), number},
-+    {"SctpAborteds", N_("%u Number of Aborteds "), number},
-+    {"SctpShutdowns", N_("%u Number of Graceful Terminations"), number},
-+    {"SctpOutOfBlues", N_("%u Number of Out of Blue packets"), number},
-+    {"SctpChecksumErrors", N_("%u Number of Packets with invalid Checksum"), number},
-+    {"SctpOutCtrlChunks", N_("%u Number of control chunks sent"), number},
-+    {"SctpOutOrderChunks", N_("%u Number of ordered chunks sent"), number},
-+    {"SctpOutUnorderChunks", N_("%u Number of Unordered chunks sent"), number},
-+    {"SctpInCtrlChunks", N_("%u Number of control chunks received"), number},
-+    {"SctpInOrderChunks", N_("%u Number of ordered chunks received"), number},
-+    {"SctpInUnorderChunks", N_("%u Number of Unordered chunks received"), number},
-+    {"SctpFragUsrMsgs", N_("%u Number of messages fragmented"), number},
-+    {"SctpReasmUsrMsgs", N_("%u Number of messages reassembled "), number},
-+    {"SctpOutSCTPPacks", N_("%u Number of SCTP packets sent"), number},
-+    {"SctpInSCTPPacks", N_("%u Number of SCTP packets received"), number},
-+};
-+
- struct tabtab {
-     char *title;
-     struct entry *tab;
-@@ -310,6 +331,7 @@ struct tabtab snmptabs[] =
-     {"Icmp", Icmptab, sizeof(Icmptab), &f_raw},
-     {"Tcp", Tcptab, sizeof(Tcptab), &f_tcp},
-     {"Udp", Udptab, sizeof(Udptab), &f_udp},
-+    {"Sctp", Sctptab, sizeof(Sctptab), &f_sctp},
-     {"TcpExt", Tcpexttab, sizeof(Tcpexttab), &f_tcp},
-     {NULL}
- };
-@@ -499,12 +521,40 @@ void process6_fd(FILE *f)
- 
- }
- 
--void parsesnmp(int flag_raw, int flag_tcp, int flag_udp)
-+/* Process a file with name-value lines (like /proc/net/sctp/snmp) */
-+void process_fd2(FILE *f, const char *filename)
-+{
-+    char buf1[1024];
-+    char *sp;
-+    struct tabtab *tab;
-+    
-+    tab = newtable(snmptabs, "Sctp");
-+    
-+    while (fgets(buf1, sizeof buf1, f)) {
-+	sp = buf1 + strcspn(buf1, " \t\n");
-+	if (!sp)
-+	    goto formaterr;
-+	*sp = '\0';
-+    	sp++;
-+
-+	sp += strspn(sp, " \t\n"); 
-+
-+	if (*sp != '\0' && *(tab->flag)) 	
-+	    printval(tab, buf1, strtoul(sp, 0, 10));
-+    }
-+  return;
-+  
-+formaterr:
-+  fprintf(stderr,_("error parsing %s\n"), filename);
-+  return;
-+}
-+
-+void parsesnmp(int flag_raw, int flag_tcp, int flag_udp, int flag_sctp)
- {
-     FILE *f;
- 
--    f_raw = flag_raw; f_tcp = flag_tcp; f_udp = flag_udp;
--    
-+    f_raw = flag_raw; f_tcp = flag_tcp; f_udp = flag_udp; f_sctp = flag_sctp;
-+
-     f = proc_fopen("/proc/net/snmp");
-     if (!f) {
- 	perror(_("cannot open /proc/net/snmp"));
-@@ -530,6 +580,16 @@ void parsesnmp(int flag_raw, int flag_tc
-     
-         fclose(f);
-     }
-+
-+    f = fopen("/proc/net/sctp/snmp", "r");
-+    if (f) {
-+	process_fd2(f,"/proc/net/sctp/snmp");
-+	if (ferror(f))
-+	    perror("/proc/net/sctp/snmp");
-+
-+	fclose(f);
-+    }
-+
-     return;
- }
-     
diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch
deleted file mode 100644
index d34e651327..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 14287b594e1f02b811f889fb515c1a51b72c08d4 Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 14 Jan 2016 17:07:48 +0800
-Subject: [PATCH 2/3] net-tools: add SCTP support for netstat
-
-Upstream-Status: pending
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- netstat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/netstat.c b/netstat.c
-index 5d1a4a1..56a15c2 100644
---- a/netstat.c
-+++ b/netstat.c
-@@ -2104,7 +2104,7 @@ int main
- 	usage();
- 
-     if ((flag_inet || flag_inet6 || flag_sta) && !(flag_tcp || flag_udp || flag_sctp || flag_raw))
--	flag_tcp = flag_udp = flag_sctp = flag_raw = 1;
-+	flag_tcp = flag_udp = flag_raw = 1;
- 
-     if ((flag_tcp || flag_udp || flag_sctp || flag_raw || flag_igmp) && !(flag_inet || flag_inet6))
-         flag_inet = flag_inet6 = 1;
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch
deleted file mode 100644
index 8b2ecab707..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch
+++ /dev/null
@@ -1,363 +0,0 @@
-From 1d386279a449a1a6b96b88a71f35bf13b14b2c2c Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 14 Jan 2016 17:11:24 +0800
-Subject: [PATCH 3/3] net-tools: add SCTP support for netstat
-
-Upstream-Status: pending
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- netstat.c | 282 ++++++++++++++++++++++++--------------------------------------
- 1 file changed, 108 insertions(+), 174 deletions(-)
-
-diff --git a/netstat.c b/netstat.c
-index 56a15c2..86adadb 100644
---- a/netstat.c
-+++ b/netstat.c
-@@ -1095,23 +1095,21 @@ static void sctp_eps_do_one(int lnr, char *line)
-     const char *lport_str;
-     const char *uid_str;
-     const char *inode_str;
--    const char *pladdr_str;
-     char *laddrs_str;
-     
-     if(lnr == 0) {
--	/* ENDPT     SOCK   STY SST HBKT LPORT   uid inode pladdr LADDRS*/
-+        /* ENDPT     SOCK   STY SST HBKT LPORT   UID INODE LADDRS */
- 	return;
-     }
-     
--    strtok(line," \t\n"); /*skip ptr*/
--    strtok(0," \t\n");    /*skip ptr*/
-+    strtok(line," \t\n"); /*skip endpt*/
-+    strtok(0," \t\n");    /*skip sock*/
-     sty_str = strtok(0," \t\n");
-     sst_str = strtok(0," \t\n");
-     strtok(0," \t\n"); /*skip hash bucket*/
-     lport_str=strtok(0," \t\n");
-     uid_str = strtok(0," \t\n");
-     inode_str = strtok(0," \t\n");
--    pladdr_str = strtok(0," \t\n");
-     laddrs_str=strtok(0,"\t\n");
-     
-     type = atoi(sty_str);
-@@ -1119,61 +1117,35 @@ static void sctp_eps_do_one(int lnr, char *line)
-     port = atoi(lport_str);
-     uid = atoi(uid_str);
-     inode = strtoul(inode_str,0,0);
--    
--    if(flag_sctp<=1) {
--	/* only print the primary address */
--	char local_addr[64];
--	char local_port[16];
--	
--	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
--	if(ap)
--	    safe_strncpy(local_addr,
--	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
--	                 sizeof(local_addr));
--	else
--	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
--	
--	snprintf(local_port, sizeof(local_port), "%s",
--	         get_sname(htons(port), "sctp",
--	                   flag_not & FLAG_NUM_PORT));
--	
--	printf("sctp                ");
--	sprintf(buffer,"%s:%s", local_addr, local_port);
--	printf("%-47s", buffer);
--    	printf(" %-12s", sctp_socket_state_str(state));
--    } else {
--    	/*print all addresses*/
--	const char *this_local_addr;
--	int first=1;
--	char local_port[16];
--	snprintf(local_port, sizeof(local_port), "%s",
--		 get_sname(htons(port), "sctp",
--			   flag_not & FLAG_NUM_PORT));
--	for(this_local_addr=strtok(laddrs_str," \t\n");
--	    this_local_addr;
--	    this_local_addr=strtok(0," \t\n"))
--	{
--	    char local_addr[64];
--	    ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
--	    if(ap)
--		safe_strncpy(local_addr,
--		             ap->sprint((struct sockaddr *) &localaddr, flag_not),
--		             sizeof(local_addr));
--	    else
--		sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
- 
--	    if(!first) printf("\n");
--	    if(first)
--	        printf("sctp                ");
--	    else
--	        printf("                    ");
--	    sprintf(buffer,"%s:%s", local_addr, local_port);
--	    printf("%-47s", buffer);
--	    printf(" %-12s", first?sctp_socket_state_str(state):"");
--	    first = 0;
--	}
-+    const char *this_local_addr;
-+    int first=1;
-+    char local_port[16];
-+    snprintf(local_port, sizeof(local_port), "%s",
-+        get_sname(htons(port), "sctp", flag_not & FLAG_NUM_PORT));
-+    for(this_local_addr=strtok(laddrs_str," \t\n");
-+        this_local_addr;
-+        this_local_addr=strtok(0," \t\n"))
-+    {
-+        char local_addr[64];
-+        ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
-+        if(ap)
-+            safe_strncpy(local_addr,
-+                ap->sprint((struct sockaddr *) &localaddr, flag_not),
-+                sizeof(local_addr));
-+        else
-+            sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
-+
-+        if(!first) printf("\n");
-+        if(first)
-+            printf("sctp                ");
-+        else
-+            printf("                    ");
-+        sprintf(buffer,"%s:%s", local_addr, local_port);
-+        printf("%-55s", buffer);
-+        printf(" %-12s", first?sctp_socket_state_str(state):"");
-+        first = 0;
-     }
--
-     finish_this_one(uid,inode,"");
- }
- 
-@@ -1199,32 +1171,29 @@ static void sctp_assoc_do_one(int lnr, char *line)
-     const char *lport_str,*rport_str;
-     const char *uid_str;
-     const char *inode_str;
--    const char *pladdr_str;
-     char *laddrs_str;
--    const char *praddr_str;
-     char *raddrs_str;
--    
-+
-     if(lnr == 0) {
--	/* ASSOC     SOCK   STY SST ST HBKT tx_queue rx_queue uid inode LPORT RPORT pladdr praddr LADDRS <-> RADDRS*/
-+	/* ASSOC     SOCK   STY SST ST HBKT ASSOC-ID TX_QUEUE RX_QUEUE UID INODE LPORT RPORT LADDRS <-> RADDRS */
- 	return;
-     }
--    
--    strtok(line," \t\n"); /*skip ptr*/
--    strtok(0," \t\n");    /*skip ptr*/
-+
-+    strtok(line," \t\n"); /*skip assoc*/
-+    strtok(0," \t\n");    /*skip sock*/
-     sty_str = strtok(0," \t\n");
-     sst_str = strtok(0," \t\n");
-     st_str = strtok(0," \t\n");
-     strtok(0," \t\n"); /*skip hash bucket*/
-+    strtok(0," \t\n"); /*skip hash assoc-id*/
-     txqueue_str =  strtok(0," \t\n");
-     rxqueue_str =  strtok(0," \t\n");
-     uid_str = strtok(0," \t\n");
-     inode_str = strtok(0," \t\n");
-     lport_str=strtok(0," \t\n");
-     rport_str=strtok(0," \t\n");
--    pladdr_str = strtok(0," \t\n");
--    praddr_str = strtok(0," \t\n");
--    laddrs_str=strtok(0,"<->\t\n");
--    raddrs_str=strtok(0,"<->\t\n");
-+    laddrs_str = strtok(0,"<->\t\n");
-+    raddrs_str = strtok(0,"<->\t\n");
- 
-     type = atoi(sty_str);
-     state = atoi(sst_str);
-@@ -1235,116 +1204,81 @@ static void sctp_assoc_do_one(int lnr, char *line)
-     inode = strtoul(inode_str,0,0);
-     lport = atoi(lport_str);
-     rport = atoi(rport_str);
--    
--    if(flag_sctp<=1) {
--	/* only print the primary addresses */
--	char local_addr[64];
--	char local_port[16];
--	char remote_addr[64];
--	char remote_port[16];
--	
--	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
--	if(ap)
--	    safe_strncpy(local_addr,
--	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
--	                 sizeof(local_addr));
--	else
--	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
--	
--	snprintf(local_port, sizeof(local_port), "%s",
--	         get_sname(htons(lport), "sctp",
--	                   flag_not & FLAG_NUM_PORT));
--	
--	ap = process_sctp_addr_str(praddr_str, (struct sockaddr*)&remoteaddr);
--	if(ap)
--	    safe_strncpy(remote_addr,
--	                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
--	                 sizeof(remote_addr));
--	else
--	    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
--	
--	snprintf(remote_port, sizeof(remote_port), "%s",
--		 get_sname(htons(rport), "sctp",
--			   flag_not & FLAG_NUM_PORT));
--
--	printf("sctp");
--	printf("  %6u %6u ", rxqueue, txqueue);
--	sprintf(buffer,"%s:%s", local_addr, local_port);
--	printf("%-23s", buffer);
--	printf(" ");
--	sprintf(buffer,"%s:%s", remote_addr, remote_port);
--	printf("%-23s", buffer);
--    	printf(" %-12s", sctp_socket_state_str(state));
--    } else {
--    	/*print all addresses*/
--	const char *this_local_addr;
--	const char *this_remote_addr;
--	char *ss1,*ss2;
--	int first=1;
--	char local_port[16];
--	char remote_port[16];
--	snprintf(local_port, sizeof(local_port), "%s",
--	         get_sname(htons(lport), "sctp",
--	                   flag_not & FLAG_NUM_PORT));
--	snprintf(remote_port, sizeof(remote_port), "%s",
--	         get_sname(htons(rport), "sctp",
--	                   flag_not & FLAG_NUM_PORT));
--
--	this_local_addr=strtok_r(laddrs_str," \t\n",&ss1);
--	this_remote_addr=strtok_r(raddrs_str," \t\n",&ss2);
--	while(this_local_addr || this_remote_addr) {
--	    char local_addr[64];
--	    char remote_addr[64];
--	    if(this_local_addr) {
--		ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
--		if(ap)
--		    safe_strncpy(local_addr,
--		                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
--		                 sizeof(local_addr));
--		else
--		    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
--	    }
--	    if(this_remote_addr) {
--		ap = process_sctp_addr_str(this_remote_addr, (struct sockaddr*)&remoteaddr);
--		if(ap)
--		    safe_strncpy(remote_addr,
--		                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
--		                 sizeof(remote_addr));
--		else
--		    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
--	    }
- 
--	    if(!first) printf("\n");
--	    if(first)
--		printf("sctp  %6u %6u ", rxqueue, txqueue);
--	    else
--		printf("                    ");
--	    if(this_local_addr) {
--		if(first)
--		    sprintf(buffer,"%s:%s", local_addr, local_port);
-+    /*print all addresses*/
-+    const char *this_local_addr;
-+    const char *this_remote_addr;
-+    char *ss1,*ss2;
-+    int first=1;
-+    char local_port[16];
-+    char remote_port[16];
-+    snprintf(local_port, sizeof(local_port), "%s",
-+             get_sname(htons(lport), "sctp",
-+             flag_not & FLAG_NUM_PORT));
-+    snprintf(remote_port, sizeof(remote_port), "%s",
-+             get_sname(htons(rport), "sctp",
-+             flag_not & FLAG_NUM_PORT));
-+
-+    this_local_addr=strtok_r(laddrs_str," \t\n",&ss1);
-+    this_remote_addr=strtok_r(raddrs_str," \t\n",&ss2);
-+    while(this_local_addr || this_remote_addr) {
-+        char local_addr[64];
-+        char remote_addr[64];
-+
-+        if(this_local_addr) {
-+            if (this_local_addr[0] == '*') {
-+                /* skip * */
-+                this_local_addr++;
-+            }
-+            ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
-+            if(ap)
-+                safe_strncpy(local_addr,
-+                    ap->sprint((struct sockaddr *) &localaddr, flag_not), sizeof(local_addr));
- 		else
--		    sprintf(buffer,"%s", local_addr);
--		printf("%-23s", buffer);
--	    } else
--	    	printf("%-23s", "");
--	    printf(" ");
--	    if(this_remote_addr) {
--		if(first)
--		    sprintf(buffer,"%s:%s", remote_addr, remote_port);
-+                    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
-+        }
-+	if(this_remote_addr) {
-+            if (this_remote_addr[0] == '*') {
-+                /* skip * */
-+                this_remote_addr++;
-+            }
-+            ap = process_sctp_addr_str(this_remote_addr, (struct sockaddr*)&remoteaddr);
-+            if(ap)
-+                safe_strncpy(remote_addr,
-+                    ap->sprint((struct sockaddr *) &remoteaddr, flag_not), sizeof(remote_addr));
- 		else
--		    sprintf(buffer,"%s", remote_addr);
--		printf("%-23s", buffer);
--	    } else
--		printf("%-23s", "");
--
--	    printf(" %-12s", first?sctp_socket_state_str(state):"");
-+                    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
-+       }
- 
--	    first = 0;
--	    this_local_addr=strtok_r(0," \t\n",&ss1);
--	    this_remote_addr=strtok_r(0," \t\n",&ss2);
--	}
-+       if(!first) printf("\n");
-+       if(first)
-+           printf("sctp  %6u %6u ", rxqueue, txqueue);
-+       else
-+           printf("                    ");
-+       if(this_local_addr) {
-+           if(first)
-+               sprintf(buffer,"%s:%s", local_addr, local_port);
-+           else
-+               sprintf(buffer,"%s", local_addr);
-+           printf("%-27s", buffer);
-+       } else
-+           printf("%-27s", "");
-+       printf(" ");
-+       if(this_remote_addr) {
-+           if(first)
-+               sprintf(buffer,"%s:%s", remote_addr, remote_port);
-+           else
-+               sprintf(buffer,"%s", remote_addr);
-+           printf("%-27s", buffer);
-+       } else
-+       printf("%-27s", "");
-+
-+       printf(" %-12s", first?sctp_socket_state_str(state):"");
-+
-+       first = 0;
-+       this_local_addr=strtok_r(0," \t\n",&ss1);
-+       this_remote_addr=strtok_r(0," \t\n",&ss2);
-     }
--
-     finish_this_one(uid,inode,"");
- }
- 
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch
deleted file mode 100644
index 505eeb048a..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4d56645ea144a34f7cdd3e3ede6452d81fbae251 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Sat, 8 Oct 2016 14:42:54 +0800
-Subject: [PATCH] iptunnel.c: include linux/ip.h to fix building with linux-4.8
-
-Fix a build error when using the linux-4.8 headers that results in:
-
-In file included from
-.../sysroots/qemuarm64/usr/include/linux/if_tunnel.h:6:0,
-                  from iptunnel.c:39:
-.../qemuarm64/usr/include/linux/ip.h:85:8: error: redefinition of
-'struct iphdr'
-  struct iphdr {
-         ^~~~~
-In file included from iptunnel.c:29:0:
-.../qemuarm64/usr/include/netinet/ip.h:44:8: note: originally defined here
-  struct iphdr
-         ^~~~~
-
-Upstream-Status: Submitted [1]
-
-[1] https://sourceforge.net/p/net-tools/mailman/message/35413022/
-
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- iptunnel.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iptunnel.c b/iptunnel.c
-index 4943d83..acfcbc7 100644
---- a/iptunnel.c
-+++ b/iptunnel.c
-@@ -26,7 +26,6 @@
- #include <sys/socket.h>
- #include <sys/ioctl.h>
- #include <netinet/in.h>
--#include <netinet/ip.h>
- #include <arpa/inet.h>
- #if defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))
- #include <net/if.h>
-@@ -36,6 +35,7 @@
- #include <linux/if_arp.h>
- #endif
- #include <linux/types.h>
-+#include <linux/ip.h>
- #include <linux/if_tunnel.h>
- 
- #include "config.h"
--- 
-2.8.3
-
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
similarity index 38%
rename from meta/recipes-extended/net-tools/net-tools_1.60-26.bb
rename to meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index 8bd30fc6d9..77122c8939 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -3,80 +3,28 @@ DESCRIPTION = "A collection of programs that form the base set of the NET-3 netw
 HOMEPAGE = "http://net-tools.berlios.de/"
 BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/n/${BPN}/${BPN}_1.60.orig.tar.gz;name=tarball \
-           http://snapshot.debian.org/archive/debian//20150831T093342Z/pool/main/n/${BPN}/${BPN}_${PV}.diff.gz;apply=no;name=patch \
-           file://net-tools-config.h \
-           file://net-tools-config.make \
-           file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
-           file://musl-fixes.patch \
-           file://net-tools-1.60-sctp1.patch \
-           file://net-tools-1.60-sctp2-quiet.patch \
-           file://net-tools-1.60-sctp3-addrs.patch \
-           file://0001-lib-inet6.c-INET6_rresolve-various-fixes.patch \
-           file://net-tools-fix-building-with-linux-4.8.patch \
-           file://0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch \
-          "
+PV = "1.60-20181103+git${SRCPV}"
+SRCREV = "0eebece8c964e3cfa8a018f42b2e7e751a7009a0"
+SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
+    file://net-tools-config.h \
+    file://net-tools-config.make \
+"
 
-# for this package we're mostly interested in tracking debian patches,
-# and not in the upstream version where all development has effectively stopped
-UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
-
-S = "${WORKDIR}/net-tools-1.60"
-
-SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
-SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
-
-SRC_URI[patch.md5sum] = "ea3592f49ac8380962bc4d9b66c7e7e9"
-SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e46585022fc76c"
-
-# the package is taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
+S = "${WORKDIR}/git"
 
 inherit gettext
 
-do_patch[depends] += "quilt-native:do_populate_sysroot"
-
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
 
-# Unlike other Debian packages, net-tools *.diff.gz contains another series of
-# patches maintained by quilt. So manually apply them before applying other local
-# patches. Also remove all temp files before leaving, because do_patch() will pop 
-# up all previously applied patches in the start
-nettools_do_patch() {
-	cd ${S}
-	# it's important that we only pop the existing patches when they've
-	# been applied, otherwise quilt will climb the directory tree
-	# and reverse out some completely different set of patches
-	if [ -d ${S}/patches ]; then
-		# whilst this is the default directory, doing it like this
-		# defeats the directory climbing that quilt will otherwise
-		# do; note the directory must exist to defeat this, hence
-		# the test inside which we operate
-		QUILT_PATCHES=${S}/patches quilt pop -a
-	fi
-	if [ -d ${S}/.pc-nettools ]; then
-		rm -rf ${S}/.pc
-		mv ${S}/.pc-nettools ${S}/.pc
-		QUILT_PATCHES=${S}/debian/patches quilt pop -a
-		rm -rf ${S}/.pc ${S}/debian
-	fi
-	patch -p1 < ${WORKDIR}/${BPN}_${PV}.diff	
-	QUILT_PATCHES=${S}/debian/patches quilt push -a
-	mv ${S}/.pc ${S}/.pc-nettools
-}
-
-do_unpack[cleandirs] += "${S}"
-
-# We invoke base do_patch at end, to incorporate any local patch
-python do_patch() {
-    bb.build.exec_func('nettools_do_patch', d)
-    bb.build.exec_func('patch_do_patch', d)
-}
+PACKAGECONFIG ??= "hostname arp serial plip"
+PACKAGECONFIG[hostname] = ""
+PACKAGECONFIG[arp] = ""
+PACKAGECONFIG[serial] = ""
+PACKAGECONFIG[plip] = ""
 
 do_configure() {
 	# net-tools has its own config mechanism requiring "make config"
@@ -87,6 +35,25 @@ do_configure() {
 	if [ "${USE_NLS}" = "no" ]; then
 		sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
 	fi
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'true', 'false', d)} ; then
+		echo "#define HAVE_HOSTNAME_TOOLS 1" >> ${S}/config.h
+		echo "#define HAVE_HOSTNAME_SYMLINKS 1" >> ${S}/config.h
+		echo "HAVE_HOSTNAME_TOOLS=1" >> ${S}/config.make
+		echo "HAVE_HOSTNAME_SYMLINKS=1" >> ${S}/config.make
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'arp', 'true', 'false', d)} ; then
+		echo "#define HAVE_ARP_TOOLS 1" >> ${S}/config.h
+		echo "HAVE_ARP_TOOLS=1" >> ${S}/config.make
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'serial', 'true', 'false', d)} ; then
+		echo "#define HAVE_SERIAL_TOOLS 1" >> ${S}/config.h
+		echo "HAVE_SERIAL_TOOLS=1" >> ${S}/config.make
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'plip', 'true', 'false', d)} ; then
+		echo "#define HAVE_PLIP_TOOLS 1" >> ${S}/config.h
+		echo "HAVE_PLIP_TOOLS=1" >> ${S}/config.make
+	fi
 }
 
 do_compile() {
@@ -112,11 +79,17 @@ do_install() {
 
 inherit update-alternatives
 
-base_sbindir_progs = "arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig rarp route slattach"
-base_bindir_progs  = "dnsdomainname domainname hostname netstat nisdomainname ypdomainname"
+base_sbindir_progs = "ipmaddr iptunnel mii-tool nameif \
+    ${@bb.utils.contains('PACKAGECONFIG', 'arp', 'arp rarp', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'plip', 'plipconfig', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'serial', 'slattach', '', d)} \
+"
+base_bindir_progs  = "ifconfig netstat route \
+    ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'dnsdomainname domainname hostname nisdomainname ypdomainname', '', d)} \
+"
 
 ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
-ALTERNATIVE_${PN}-doc += "hostname.1 dnsdomainname.1"
+ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'hostname.1 dnsdomainname.1', '', d)}"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
 ALTERNATIVE_PRIORITY[hostname.1] = "10"
