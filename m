Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0ECC88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13648.1789364441909641572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fm+7UEBP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UyCGRvMD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a09e6e8fac-994bf23b-9efb-4c5d-b718-08389058b051-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364441;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ctmiL1Pn/SkTFtZRgGgyQOQriV8ItZEIsEvXxvPHEMs=;
	b=Fm+7UEBP7o03lf0z9lETWEjSV1yNLeMh9oIqIe5k+eBQeanjeREneNuIYKJeI9Oy
	4Fz3MyvukUyUs3dkKAZN7StxdqxP9tbRVxr13BDe+bVUS2pKcf7IxPPyyIiGs59g1y1
	U0KO2jn2RPztjJBRWMqk2BA1WbfV30RnNZoZZPtk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364441;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ctmiL1Pn/SkTFtZRgGgyQOQriV8ItZEIsEvXxvPHEMs=;
	b=UyCGRvMD4NYFO7wNaQrAbWtySUkZ1HmczYRMOTHWg5K7GiJm6oNrwux2VreCWgde
	V2upHraflR2wFpkYy7/Neis14K/cv1fFtLk+6I67DN80khrr3f3TlguXCoEr9snwUCL
	UgMcTgc9F3G8mUaYJR8fI8bYSMocNPqi7wL5n7xM=
Content-Type: multipart/mixed; boundary="===============2577883241597252972=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.11.0 FAILED
Message-ID: <010101a09e6e8fac-994bf23b-9efb-4c5d-b718-08389058b051-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245749

--===============2577883241597252972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcap* to *1.11.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpcap failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f94ae3d6ba49aef86f497998c0e0232a5039510a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f94ae3d6ba49aef86f497998c0e0232a5039510a"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f94ae3d6ba49aef86f497998c0e0232a5039510a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f94ae3d6ba49aef86f497998c0e0232a5039510a"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.tcpdump.org/release/libpcap-1.11.0.tar.xz...
INFO: Rebasing devtool onto 0c5a3e4ceb1dd9e690ed0b2c42c5a137dd2c0cee
WARNING: Command 'git rebase 0c5a3e4ceb1dd9e690ed0b2c42c5a137dd2c0cee' failed:
Auto-merging pcap-filter.manmisc.in
CONFLICT (content): Merge conflict in pcap-filter.manmisc.in
Auto-merging scanner.l

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libpcap
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libpcap/libpcap_1.11.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libpcap.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2577883241597252972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpcap-changelog.txt"

Changelog for libpcap: 1.10.7 -> 1.11.0
Source: CHANGES

Sunday, September 13, 2026 / The Tcpdump Group
  Summary for 1.11.0 libpcap release
    Source code:
      Use C99 fixed-width integer types, rather than self-defined
        fixed-width integer types, in rpcap code.
      Clean up DECnet address handling.
      struct pcap: Update buffer type from "void *" to "u_char *".
      Remove dead code that supported SITA ACN devices.
      Remove the TODO file.
      Merge four header files into gencode.c.
      Remove DAG card support on Windows as Linux is the only
        platform currently supported.
      Remove code related to Riverbed TurboCap card.
        Riverbed TurboCap hardware has reached EOA as of Jun 30 2014.
      Remove dead code that supported Septel devices.
      Remove outdated code related to AirPcap HW.
        The Riverbed AirPcap Product has reached End of Availability
        (EOA) as of December 31, 2017
      Make pcap_compile() error messages more uniform and consistent.
      Deprecate pcap_compile_nopcap().
      Remove unmaintained DPDK capture backend (was disabled by default).
      Return more useful strings from pcap_statustostr().
      Rename SWAPSHORT(), SWAPLONG(), SWAPLL() to PCAP_BSWAP_({16,32,64}).
      Replace EXTRACT_SHORT by EXTRACT_BE_U_2, EXTRACT_LONG by EXTRACT_BE_U_4.
      Add a comment to pcap-npf.c describing what pcap_stats() returns
          as ps_recv and ps_drop.
    Link-layer types:
      Add LINKTYPE_DECT_NR_TAP/DLT_DECT_NR_TAP.
    Packet filtering:
      Add support for Block Ack Req and Block Ack frame types (pull
        request #1039).
      Add support for filtering packets encapsulated with VXLAN (pull
        request #1273).
      Eliminate trailing space in bpf_image() result.
      Fix DECnet packet filtering on big-endian hosts.
      Fix various failures to reject invalid DECnet primitives.
      Require "vpi" and "vci" argument to be within valid ranges.
      Require "[wlan] dir" integer argument to be within range.
      Fix the != comparison for ATM and MTP field values.
      Require a live capture for all Linux BPF extensions.
      Have "outbound" mean Tx only for DLT_SLIP.
      Filter Linux SocketCAN frames in userland if necessary.
      Enable "[wlan] dir/type/subtype" for DLT_PPI.
      Require "(iso|isis) proto" argument to be within valid ranges.
      Use the correct IS-IS PDU type offset for DLT_C_HDLC.
      Use the correct bit mask for IS-IS PDU type value.
      Fix the "|" and "&" operators of the "byte" primitive.
      Require "byte" argument to be within range.
      Require "link proto" argument to be within range.
      Require "(ip|ip6) proto" argument to be within range.
      Require "protochain" argument to be within range.
      Always enable the "gateway" primitive.
      Properly reject "link proto" for DLT_BACNET_MS_TP.
      Extend "link (host|broadcast)" support onto DLT_BACNET_MS_TP.
      Do not try matching RFC 1051 system codes for ARCnet.
      Enable various primitives for DLT_DSA_TAG_BRCM and DLT_DSA_TAG_DSA.
      Test link protocol once per AF, not per address.
      Sort resolved IPv4 and IPv6 addresses.
      In "gateway" negate the host(s), but not the protocol.
      Reject "gateway" within MPLS, VXLAN or Geneve.
      Match both byte orders for the AF_ value when filtering DLT_NULL
        and DLT_ENC savefiles. (issue #74)
      Match all AF_INET6 values when filtering DLT_PFLOG savefiles.
      Fix optimization of "jset #0xffffffff".
      Produce cleaner DOT in the optimizer debugging code.
    Capture file reading:
      Fix misaligned accesses in processing Linux USB captures (issue
        #1634, reported by FuzzAnything Organization
        (https://github.com/FuzzAnything-ORG) (fuzzanything@gmail.com).
    rpcap:
      Add a -t flag to rpcapd to specify the data channel port; from
        another incorporate-remote-capture project. (issue #1120)
      rpcapd: Refine SSL options in printusage().
      Fix parameter name validation in the configuration file.
    Documentation:
      Add a README.hurd.md file.
      Cross-reference some man pages better.
      Actualize README.dag and make it Markdown.
      Add a README.snf.md file.
      pcap-filter(7): Make a number of assorted improvements.
      pcap_lib_version(3PCAP): Add details and examples.
      Discuss Linux BPF extensions in the man pages.
      Note endianness in pcap_compile(3PCAP) and pcap_lookupnet(3PCAP).
      man: Document devices, interfaces and "any" better.
      Add a README.qnx.md file.
      Improve documentation of TLS support in rpcapd man page.
      man: Use "null pointer" rather than "NULL" and fix some other
        issues.
    Building and testing:
      Apply GNU Hurd support patch from the Debian package.
      CI: Introduce and use LIBPCAP_CMAKE_TAINTED.
      Remove all remaining support for AOS (4.3BSD Unix), BSD/OS, DOS,
        HP-UX before 10.20, IRIX, {OSF/1, Digital Unix, Tru64 Unix}, SINIX,
        SunOS 3.x, 4.x and 5.x before 5.3.2, and Ultrix.
      Add a new test program for pcap_activate().
      Make FreeBSD, Linux, macOS, NetBSD, QNX and Sun C builds warning-free.
      Print MAC addresses in findalldevstest.
      Parameterize the interface name in reactivatetest.
      When necessary, trust the OS to implement ffs().
      At build time require a proof of suitable snprintf(3) implementation in
        libc (and document Solaris 9 and MinGW as unsupported because of that).
      Makefile.in: Update the .c.o build rule (Remove hacks for old SunOS 4).
      CMake: Skip snprintf(3) tests when cross-compiling; test whether
        check_c_source_runs() with a trivial program and, if it doesn't
        work, don't run tests that use it.
      Autoconf: Add support for libnl-tiny with pkg-config.
      Autoconf: Fix building of something-only libpcap.
      CI: Implement "make check".
      Fix autotools and CMake issues with snprintf test and sanitizers.
        Fixes issue #1396.
      filtertest: Add "-l" flag to use Linux BPF extensions.
      filtertest: Use ntohl() on the netmask to fix the -m option.
      filtertest: Add support for stdin as "-" to the -F option.
      Rename CMake option to ENABLE_PROTOCHAIN to match Autoconf.
      Remove the "disable IPv6" build option.
      translatetest: Add a test program for various translation functions.
      Autoconf: Fix detection of crypt() on QNX.
      Autoconf: Update config.{guess,sub}, timestamps 2025-07-10.
      CMake: Fix getaddrinfo() detection on QNX.
      enumeratetest: Add a new test program.
      Fix building libpcap with CMake without libnl-genl-3-dev.
    Hurd:
      Support network capture devices too.
      Fix a few device activation bugs.
      Count and timestamp packets better.
      Add kernel filtering, fix userland filtering.
    FreeBSD:
      Handle USB devices correctly on FreeBSD-CURRENT as of 2025-12.
    OpenBSD:
      Use getprotobyname_r() correctly on OpenBSD.
    Linux:
      Do not use ether_hostton() from musl libc.
      Fix propagation of getprotobyname_r() errors.
      Don't treat permission failures trying to fetch connection status
        as errors, just indicate connection status unknown.
    Linux Bluetooth monitor:
      Report permission failures as PCAP_ERROR_PERM_DENIED and indicate
        what privileges may be required.
    Linux nflog:
      Report permission failures as PCAP_ERROR_PERM_DENIED and indicate
        what privileges may be required.
    Haiku:
      Look for ethers(5) in /boot/system/settings/network/.
    DAG:
      Always set PCAP_IF_CONNECTION_STATUS_NOT_APPLICABLE.
      In dag_findalldevs() handle known errors better.
      Trust dag_get_stream_erf_types() to be available.
      Require the API to have 64-bit streams support.
      Make device descriptions more useful, make dagN conditional.
      Use PCAP_ERROR_NO_SUCH_DEVICE more in dag_activate().
      Validate capture device names better.
      Enumerate streams without trying to lock them.
      If the environment variable ERF_FCS_BITS is set, require it to be either
        0 or 16 or 32.  Likewise for ERF_DONT_STRIP_FCS (either 0 or 1).
      Remove FCS quirks specific to 4.2S and 4.23S.
      Fix ps_drop for stream drop counters.
      Add experimental packet transmit support.
    SNF:
      Require SNF_VERSION_API >= 0x0003.
      Improve device descriptions and flags.
      Fill pcap_if_t in more consistently.
    QNX:
      Use "unix.h" instead of the missing <sysexits.h>.
      Fix promiscuous mode for netmap.
    RDMA:
      Fix some resource freeing issues. (issues #1532 and #1300)
      Improve error messages for activate and findalldevs failures.

--===============2577883241597252972==--

