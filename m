Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7F16BDE3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 21:55:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x98Ltc8o021628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2019 14:55:38 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 8 Oct 2019 14:55:38 -0700
To: <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>, Peiran Hong <peiran.hong@windriver.com>
References: <20191007025214.16260-1-zangrc.fnst@cn.fujitsu.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fb256b7d-b546-e213-5d6c-a2875c8d85d7@windriver.com>
Date: Tue, 8 Oct 2019 17:55:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007025214.16260-1-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] libpcap:upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Tue, 08 Oct 2019 21:55:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/6/19 10:52 PM, Zang Ruochen wrote:
> -libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
>   Removed since this is included in 1.9.1.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   ...nux.c-add-missing-limits.h-for-musl-syste.patch | 29 ----------------------
>   .../libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} |  5 ++--
>   2 files changed, 2 insertions(+), 32 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
>   rename meta/recipes-connectivity/libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} (88%)
> 
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
> deleted file mode 100644
> index 0177383..0000000
> --- a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
> -From: maxice8 <thinkabit.ukim@gmail.com>
> -Date: Sun, 22 Jul 2018 18:54:17 -0300
> -Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
> -
> -fix compilation on musl libc systems like Void Linux and Alpine.
> -
> -Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/d557c98a16dc254aaff03762b694fe624e180bea]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - pcap-usb-linux.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
> -index 6f8adf65..b92c05ea 100644
> ---- a/pcap-usb-linux.c
> -+++ b/pcap-usb-linux.c
> -@@ -50,6 +50,7 @@
> - #include <stdlib.h>
> - #include <unistd.h>
> - #include <fcntl.h>
> -+#include <limits.h>
> - #include <string.h>
> - #include <dirent.h>
> - #include <byteswap.h>
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
> similarity index 88%
> rename from meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
> rename to meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
> index 77bc31a..318e2d7 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
> @@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
>   DEPENDS = "flex-native bison-native"
>   
>   SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
> -           file://0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch \
>              "
> -SRC_URI[md5sum] = "dffd65cb14406ab9841f421732eb0f33"
> -SRC_URI[sha256sum] = "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
> +SRC_URI[md5sum] = "21af603d9a591c7d96a6457021d84e6c"
> +SRC_URI[sha256sum] = "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
>   
>   inherit autotools binconfig-disabled pkgconfig
>   
> 

Repeating what I said on oe-dev with a bit more detail.

We missed updating libpcap for 3.0 since it was only released
at the end of Sep 2019 after a year of development.

I understand that at some point you just have to stop accepting
new package updates but this one seems to be low risk, and a
moderate reward in that the primary use is the frequently used
tcpdump in meta-oe.

Since only ppp depends on libpcap in oe-core but 14 pkgs
in meta-oe do, it would be nice to add this to oe-core-3.0
should the M4 test report come back and require more work.
If that's not the case, perhaps it could be added to 3.0.1
even if there are minor non-bugfix commits.

I updated locally and did a qemux86-64 build with meta-oe and many other
layers and several packages that depend on libpcap rebuilt
successfully and as expected there were no errors in a world
build of the packages that we whitelist at least: ppc, tcpdump,
freeradius,nmap, ptdd, etc. tcpdump works well in basic tests
and no ptests failed, with only two being skipped.
Peiran and I will investigate the skipped tests.


The update is 300 commits, mostly bug fixes.

The update would fix some tcpdump ptest failures in tcpdump in meta-oe
as well as at least 6 CVEs. We could of course patch the relevant
commits back if there isn't an opportunity to merge this update.

I'll stop haranguing people about libpcap now.

../Randy


(1).

CHANGES:

Sunday, July 22, 2018
   Summary for 1.9.1 libpcap release
     Mention pcap_get_required_select_timeout() in the main pcap man page
     Fix pcap-usb-linux.c build on systems with musl
     Fix assorted man page and other documentation issues
     Plug assorted memory leaks
     Documentation changes to use https:
     Changes to how time stamp calculations are done
     Lots of tweaks to make newer compilers happier and warning-free and
         to fix instances of C undefined behavior
     Warn if AC_PROG_CC_C99 can't enable C99 support
     Rename pcap_set_protocol() to  pcap_set_protocol_linux().
     Align pcap_t private data on an 8-byte boundary.
     Fix various error messages
     Use 64-bit clean API in dag_findalldevs()
     Fix cleaning up after some errors
     Work around some ethtool ioctl bugs in newer Linux kernels (GitHub
         issue #689)
     Add backwards compatibility sections to some man pages (GitHub issue
         #745)
     Fix autotool configuration on AIX and macOS
     Don't export bpf_filter_with_aux_data() or struct bpf_aux_data;
         they're internal-only and subject to change
     Fix pcapng block size checking
     On macOS, don't build rpcapd or test programs any fatter than they
         need to be
     Fix reading of capture statistics for Linux USB
     Fix packet size values for Linux USB packets (GitHub issue #808)
     Check only VID in VLAN test in filterss (GitHub issue #461)
     Fix pcap_list_datalinks on 802.11 devices on macOS
     Fix overflows with very large snapshot length in pcap file
     Improve parsing of rpcapd configuration file (GitHub issue #767)
     Handle systems without strlcpy() or strlcat() better
     Fix crashes and other errors with invalid filter expressions
     Fix use of uninitialized file descriptor in remote capture
     Fix some CMake issues
     Fix some divide-by-zero issues with the filter compiler
     Work around a GNU libc bug in pcap_nametonetaddr()
     Add support for DLT_LINUX_SLL2
     Fix handling of the packet-count argument for Myricom SNF devices
     Fix --disable-rdma in configure script (GitHub issue #782)
     Fix compilation of TurboCap support (GitHub issue #764)
     Constify first argument to pcap_findalldevs_ex()
     Fix a number of issues when running rpcapd as an inetd-style daemon
     Fix CMake issues with D-Bus libraries
     In rpcapd, clean up termination of a capture session
     Redo remote capture protocol negotiation
     In rpcapd, report the same error for "invalid user name" and
         "invalid password", to make brute-forcing harder
     For remote captures, add an error code for "the server requires TLS"
     Fix pcap_dump_fopen() on Windows to avoid clashes between
         {Win,N}Pcap and application C runtimes
     Fix exporting of functions from Windows DLLs (GitHub issue #810)
     Fix building as part of Npcap
     Allow rpcapd to rebind more rapidly
     Fix building shared libpcap library on midipix (midipix.org)
     Fix hack to detect UTF-16LE adapter names on Windows not to go past
         the end of the string
     Fix handling of "wireless WAN" (mobile phone network modems) on
         Windows with WinPcap/Npcap (GitHub issue #824)
     Have pcap_dump_open_append() create the dump file if it doesn't
         exists (GitHub issue #247)
     Fix the maxmum snapshot length for DLT_USBPCAP
     Use -fPIC when building for 64-bit SPARC on Linux (GitHub issue #837)
     Fix CMake 64-bit library installation directory on some Linux
         distributions
     Boost the TPACKET_V3 timeout to the maximum if a timeout of 0 was
         specified
     Five CVE-2019-15161, CVE-2019-15162, CVE-2019-15163, 
CVE-2019-15164, CVE-2019-15165
     Fixes for CVE-2018-16301, errors in pcapng reading.
     PCAPNG reader applies some sanity checks before doing malloc().



-- 
# Randy MacLeod
# Wind River Linux

