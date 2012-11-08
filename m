Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TWOBE-0002Lv-RD
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Nov 2012 10:13:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA88xvt0006553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Nov 2012 00:59:57 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 8 Nov 2012 00:59:56 -0800
Message-ID: <509B748B.1000009@windriver.com>
Date: Thu, 8 Nov 2012 16:59:55 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1352364941-24076-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1352364941-24076-1-git-send-email-jackie.huang@windriver.com>
Subject: Re: [meta-networking][PATCH] ptpd-2.2.0: drop the patch adjust-daemon-name.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2012 09:13:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, wrong mailing list, plese ignore this.

Thanks,
Jackie

On 11/8/2012 4:55 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The patch adjust-daemon-name.patch is to change the daemon name
> ptpd2 back to ptpd, which broke some functionality:
>
> root@qemu0:~# ptpd -g
> Error: 1 ptpd daemon(s) detected in parallel, but we were not expecting any. Exiting.
>
> so drop it and use the default daemon name ptpd2.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../ptpd/ptpd-2.2.0/adjust-daemon-name.patch       |   61 --------------------
>   meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |    5 +-
>   2 files changed, 3 insertions(+), 63 deletions(-)
>   delete mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch
>
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch
> deleted file mode 100644
> index f6934b6..0000000
> --- a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Patch from http://patch-tracker.debian.org/package/ptpd
> -
> -Description: Executable name ptpd
> - This patch adjusts the binary executable to be called ptpd instead of ptpd2.
> - Similarly, the man page name is adjusted.
> -Author: Roland Stigge <stigge@antcom.de>
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - src/Makefile |    4 ++--
> - src/ptpd2.8  |    8 ++++----
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index dbbe525..a672625 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -1,4 +1,4 @@
> --# Makefile for ptpd2
> -+# Makefile for ptpd
> -
> - #
> - # Compile time defines:
> -@@ -42,7 +42,7 @@ CFLAGS += -DPTP_EXPERIMENTAL
> -
> - LDFLAGS+= -lm -lrt
> -
> --PROG = ptpd2
> -+PROG = ptpd
> - SRCS = ptpd.c arith.c bmc.c protocol.c display.c\
> - 	dep/msg.c dep/net.c dep/servo.c dep/startup.c dep/sys.c dep/timer.c
> -
> -diff --git a/src/ptpd2.8 b/src/ptpd2.8
> -index c6100f4..21f1906 100644
> ---- a/src/ptpd2.8
> -+++ b/src/ptpd2.8
> -@@ -1,9 +1,9 @@
> - .\" -*- nroff -*"
> --.TH ptpd2 8 "January, 2012" "version 2.2.0" "Precision Time Protocol daemon"
> -+.TH ptpd 8 "January, 2012" "version 2.2.0" "Precision Time Protocol daemon"
> - .SH NAME
> --ptpd2 \- Precision Time Protocol daemon (1588-2008)
> -+ptpd \- Precision Time Protocol daemon (1588-2008)
> - .SH SYNOPSIS
> --.B ptpd2
> -+.B ptpd
> - [?]
> - [-B]
> - [-c]
> -@@ -182,7 +182,7 @@ run as master without NTP
> - set an initial delay request value
> - .TP
> - .B \-L
> --enable running multiple ptpd2 daemons
> -+enable running multiple ptpd daemons
> - .TP
> - .B \-j
> - turn off IGMP refresh messages
> ---
> -1.7.4
> -
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> index 3449ee8..39a0cdd 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> @@ -8,8 +8,9 @@ SECTION = "network"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=3d8ac2c46c116bce2d2ad838b6cf3491"
>
> +PR = "r1"
> +
>   SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
> -           file://adjust-daemon-name.patch;striplevel=2 \
>              file://ld-as-needed.patch;striplevel=2 \
>   "
>
> @@ -22,6 +23,6 @@ EXTRA_OEMAKE = ""
>
>   do_install() {
>           install -d ${D}${bindir} ${D}${mandir}/man8
> -        install -m 0755 ptpd ${D}${bindir}
> +        install -m 0755 ptpd2 ${D}${bindir}
>           install -m 0644 ptpd2.8 ${D}${mandir}/man8
>   }
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


