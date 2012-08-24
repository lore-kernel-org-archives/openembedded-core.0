Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yeB-0002RP-6T
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:30:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2012 11:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="184998996"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2012 11:18:08 -0700
Message-ID: <5037C560.4070305@linux.intel.com>
Date: Fri, 24 Aug 2012 11:18:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <1345627342-3426-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1345627342-3426-1-git-send-email-radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Fri, 24 Aug 2012 18:30:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 02:22 AM, Radu Moisan wrote:
> Updated defconfig file from generated .config
> Disabled CONFIG_LSOF,CONFIG_CROSS_COMPILER_PREFIX, and CONFIG_EXTRA_CFLAGS
> for backwards compatibility.
> Added busybox-1.20.2-kernel_ver.patch from upstream.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../B921600.patch                                  |    0
>   .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   25 +++++++++++++
>   .../busybox-appletlib-dependency.patch             |    0
>   .../busybox-mkfs-minix-tests_bigendian.patch       |    0
>   .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++----------
>   .../{busybox-1.19.4 => busybox-1.20.2}/defconfig   |   39 +++++++++++++-------
>   .../fix-for-spurious-testsuite-failure.patch       |    0
>   .../get_header_tar.patch                           |    0
>   .../run-parts.in.usr-bin.patch                     |    0
>   .../sys_resource.patch                             |    0
>   .../watch.in.usr-bin.patch                         |    0
>   .../wget_dl_dir_fix.patch                          |    0
>   .../{busybox_1.19.4.bb => busybox_1.20.2.bb}       |    9 +++--
>   13 files changed, 72 insertions(+), 38 deletions(-)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/B921600.patch (100%)
>   create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/busybox-appletlib-dependency.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/busybox-mkfs-minix-tests_bigendian.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/busybox-udhcpc-no_deconfig.patch (78%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/defconfig (98%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/fix-for-spurious-testsuite-failure.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/get_header_tar.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/run-parts.in.usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/sys_resource.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/watch.in.usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/wget_dl_dir_fix.patch (100%)
>   rename meta/recipes-core/busybox/{busybox_1.19.4.bb => busybox_1.20.2.bb} (79%)
>

Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/B921600.patch b/meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/B921600.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
> new file mode 100644
> index 0000000..456fb08
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
> @@ -0,0 +1,25 @@
> +--- busybox-1.20.2/libbb/kernel_version.c
> ++++ busybox-1.20.2-kernel_ver/libbb/kernel_version.c
> +@@ -20,18 +20,15 @@
> + int FAST_FUNC get_linux_version_code(void)
> + {
> + 	struct utsname name;
> +-	char *s;
> ++	char *s, *t;
> + 	int i, r;
> +
> +-	if (uname(&name) == -1) {
> +-		bb_perror_msg("can't get system information");
> +-		return 0;
> +-	}
> +-
> ++	uname(&name); /* never fails */
> + 	s = name.release;
> + 	r = 0;
> + 	for (i = 0; i < 3; i++) {
> +-		r = r * 256 + atoi(strtok(s, "."));
> ++		t = strtok(s, ".");
> ++		r = r * 256 + (t ? atoi(t) : 0);
> + 		s = NULL;
> + 	}
> + 	return r;
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/busybox-appletlib-dependency.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
> similarity index 78%
> rename from meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
> index 13004f7..4c9ce3b 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
> +++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
> @@ -31,10 +31,10 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>    networking/udhcp/dhcpc.c |   29 +++++++++++++++++++++--------
>    1 files changed, 21 insertions(+), 8 deletions(-)
>
> -diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
> -index 4d755e6..a21e2c6 100644
> ---- a/networking/udhcp/dhcpc.c
> -+++ b/networking/udhcp/dhcpc.c
> +Index: busybox-1.20.2/networking/udhcp/dhcpc.c
> +===================================================================
> +--- busybox-1.20.2.orig/networking/udhcp/dhcpc.c
> ++++ busybox-1.20.2/networking/udhcp/dhcpc.c
>   @@ -29,6 +29,9 @@
>    #include <netpacket/packet.h>
>    #include <linux/filter.h>
> @@ -42,10 +42,10 @@ index 4d755e6..a21e2c6 100644
>   +/* option whether to down the interface when reconfiguring */
>   +static int allow_deconfig = 1;
>   +
> - /* struct client_config_t client_config is in bb_common_bufsiz1 */
> + /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
>
>
> -@@ -82,8 +85,9 @@ enum {
> +@@ -81,8 +84,9 @@ enum {
>    	OPT_x = 1 << 18,
>    	OPT_f = 1 << 19,
>    	OPT_B = 1 << 20,
> @@ -56,7 +56,7 @@ index 4d755e6..a21e2c6 100644
>    	USE_FOR_MMU(             OPTBIT_b,)
>    	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
>    	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
> -@@ -899,7 +903,8 @@ static void perform_renew(void)
> +@@ -1040,7 +1044,8 @@ static void perform_renew(void)
>    		state = RENEW_REQUESTED;
>    		break;
>    	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
> @@ -66,7 +66,7 @@ index 4d755e6..a21e2c6 100644
>    	case REQUESTING:
>    	case RELEASED:
>    		change_listen_mode(LISTEN_RAW);
> -@@ -923,7 +928,8 @@ static void perform_release(uint32_t requested_ip, uint32_t server_addr)
> +@@ -1064,7 +1069,8 @@ static void perform_release(uint32_t ser
>    		bb_info_msg("Unicasting a release of %s to %s",
>    				inet_ntoa(temp_addr), buffer);
>    		send_release(server_addr, requested_ip); /* unicast */
> @@ -76,16 +76,16 @@ index 4d755e6..a21e2c6 100644
>    	}
>    	bb_info_msg("Entering released state");
>
> -@@ -1083,7 +1089,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
> - #endif
> - 		;
> +@@ -1215,7 +1221,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> + 	/* O,x: list; -T,-t,-A take numeric param */
> + 	opt_complementary = "O::x::T+:t+:A+" IF_UDHCP_VERBOSE(":vv") ;
>    	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
>   -	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
>   +	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
>    		USE_FOR_MMU("b")
>    		IF_FEATURE_UDHCPC_ARPING("a")
>    		IF_FEATURE_UDHCP_PORT("P:")
> -@@ -1175,6 +1181,9 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
> +@@ -1316,6 +1322,9 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>    		logmode |= LOGMODE_SYSLOG;
>    	}
>
> @@ -95,7 +95,7 @@ index 4d755e6..a21e2c6 100644
>    	/* Make sure fd 0,1,2 are open */
>    	bb_sanitize_stdio();
>    	/* Equivalent of doing a fflush after every \n */
> -@@ -1189,7 +1198,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
> +@@ -1330,7 +1339,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>    	srand(monotonic_us());
>
>    	state = INIT_SELECTING;
> @@ -105,7 +105,7 @@ index 4d755e6..a21e2c6 100644
>    	change_listen_mode(LISTEN_RAW);
>    	packet_num = 0;
>    	timeout = 0;
> -@@ -1341,7 +1351,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
> +@@ -1484,7 +1494,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>    				}
>    				/* Timed out, enter init state */
>    				bb_info_msg("Lease lost, entering init state");
> @@ -115,8 +115,8 @@ index 4d755e6..a21e2c6 100644
>    				state = INIT_SELECTING;
>    				client_config.first_secs = 0; /* make secs field count from 0 */
>    				/*timeout = 0; - already is */
> -@@ -1489,7 +1500,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
> - 						send_decline(xid, server_addr, packet.yiaddr);
> +@@ -1667,7 +1678,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> + 						send_decline(/*xid,*/ server_addr, packet.yiaddr);
>
>    						if (state != REQUESTING)
>   -							udhcp_run_script(NULL, "deconfig");
> @@ -125,7 +125,7 @@ index 4d755e6..a21e2c6 100644
>    						change_listen_mode(LISTEN_RAW);
>    						state = INIT_SELECTING;
>    						client_config.first_secs = 0; /* make secs field count from 0 */
> -@@ -1536,7 +1548,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
> +@@ -1711,7 +1723,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
>    				bb_info_msg("Received DHCP NAK");
>    				udhcp_run_script(&packet, "nak");
>    				if (state != REQUESTING)
> @@ -135,6 +135,3 @@ index 4d755e6..a21e2c6 100644
>    				change_listen_mode(LISTEN_RAW);
>    				sleep(3); /* avoid excessive network traffic */
>    				state = INIT_SELECTING;
> ---
> -1.7.7.1
> -
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/defconfig b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
> similarity index 98%
> rename from meta/recipes-core/busybox/busybox-1.19.4/defconfig
> rename to meta/recipes-core/busybox/busybox-1.20.2/defconfig
> index 372d7b5..dff07f1 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.4/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
> @@ -1,7 +1,7 @@
>   #
>   # Automatically generated make config: don't edit
> -# Busybox version: 1.19.3
> -# Wed Nov 30 09:33:16 2011
> +# Busybox version: 1.20.2
> +# Mon Aug 20 17:01:45 2012
>   #
>   CONFIG_HAVE_DOT_CONFIG=y
>
> @@ -25,7 +25,7 @@ CONFIG_SHOW_USAGE=y
>   CONFIG_FEATURE_COMPRESS_USAGE=y
>   # CONFIG_FEATURE_INSTALLER is not set
>   # CONFIG_INSTALL_NO_USR is not set
> -CONFIG_LOCALE_SUPPORT=y
> +# CONFIG_LOCALE_SUPPORT is not set
>   # CONFIG_UNICODE_SUPPORT is not set
>   # CONFIG_UNICODE_USING_LOCALE is not set
>   # CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
> @@ -61,8 +61,11 @@ CONFIG_FEATURE_HAVE_RPC=y
>   # CONFIG_FEATURE_INDIVIDUAL is not set
>   # CONFIG_FEATURE_SHARED_BUSYBOX is not set
>   CONFIG_LFS=y
> -CONFIG_CROSS_COMPILER_PREFIX=""
> -CONFIG_EXTRA_CFLAGS=""
> +# CONFIG_CROSS_COMPILER_PREFIX is not set
> +CONFIG_SYSROOT=""
> +# CONFIG_EXTRA_CFLAGS is not set
> +CONFIG_EXTRA_LDFLAGS=""
> +CONFIG_EXTRA_LDLIBS=""
>
>   #
>   # Debugging Options
> @@ -92,7 +95,7 @@ CONFIG_PREFIX="./_install"
>   CONFIG_FEATURE_SYSTEMD=y
>   CONFIG_FEATURE_RTMINMAX=y
>   CONFIG_PASSWORD_MINLEN=6
> -CONFIG_MD5_SIZE_VS_SPEED=2
> +CONFIG_MD5_SMALL=1
>   CONFIG_FEATURE_FAST_TOP=y
>   # CONFIG_FEATURE_ETC_NETWORKS is not set
>   CONFIG_FEATURE_USE_TERMIOS=y
> @@ -101,6 +104,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024
>   # CONFIG_FEATURE_EDITING_VI is not set
>   CONFIG_FEATURE_EDITING_HISTORY=15
>   CONFIG_FEATURE_EDITING_SAVEHISTORY=y
> +# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
>   # CONFIG_FEATURE_REVERSE_SEARCH is not set
>   CONFIG_FEATURE_TAB_COMPLETION=y
>   CONFIG_FEATURE_USERNAME_COMPLETION=y
> @@ -140,6 +144,7 @@ CONFIG_CPIO=y
>   CONFIG_GUNZIP=y
>   CONFIG_GZIP=y
>   # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
> +CONFIG_GZIP_FAST=0
>   # CONFIG_LZOP is not set
>   # CONFIG_LZOP_COMPR_HIGH is not set
>   # CONFIG_RPM2CPIO is not set
> @@ -173,11 +178,13 @@ CONFIG_DATE=y
>   # CONFIG_FEATURE_DATE_ISOFMT is not set
>   # CONFIG_FEATURE_DATE_NANO is not set
>   CONFIG_FEATURE_DATE_COMPAT=y
> +# CONFIG_HOSTID is not set
>   CONFIG_ID=y
>   CONFIG_GROUPS=y
>   CONFIG_TEST=y
>   CONFIG_FEATURE_TEST_64=y
>   CONFIG_TOUCH=y
> +CONFIG_FEATURE_TOUCH_SUSV3=y
>   CONFIG_TR=y
>   CONFIG_FEATURE_TR_CLASSES=y
>   # CONFIG_FEATURE_TR_EQUIV is not set
> @@ -220,7 +227,6 @@ CONFIG_FALSE=y
>   # CONFIG_FSYNC is not set
>   CONFIG_HEAD=y
>   # CONFIG_FEATURE_FANCY_HEAD is not set
> -# CONFIG_HOSTID is not set
>   # CONFIG_INSTALL is not set
>   # CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
>   CONFIG_LN=y
> @@ -461,6 +467,7 @@ CONFIG_LAST_SYSTEM_ID=0
>   # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
>   # CONFIG_GETTY is not set
>   # CONFIG_LOGIN is not set
> +# CONFIG_LOGIN_SESSION_AS_CHILD is not set
>   # CONFIG_PAM is not set
>   # CONFIG_LOGIN_SCRIPTS is not set
>   # CONFIG_FEATURE_NOLOGIN is not set
> @@ -469,6 +476,7 @@ CONFIG_LAST_SYSTEM_ID=0
>   # CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
>   # CONFIG_CRYPTPW is not set
>   # CONFIG_CHPASSWD is not set
> +CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
>   # CONFIG_SU is not set
>   # CONFIG_FEATURE_SU_SYSLOG is not set
>   # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
> @@ -518,6 +526,12 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
>   # Linux System Utilities
>   #
>   # CONFIG_BLOCKDEV is not set
> +# CONFIG_MDEV is not set
> +# CONFIG_FEATURE_MDEV_CONF is not set
> +# CONFIG_FEATURE_MDEV_RENAME is not set
> +# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
> +# CONFIG_FEATURE_MDEV_EXEC is not set
> +# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
>   # CONFIG_REV is not set
>   # CONFIG_ACPID is not set
>   # CONFIG_FEATURE_ACPID_COMPAT is not set
> @@ -561,12 +575,6 @@ CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
>   CONFIG_LOSETUP=y
>   # CONFIG_LSPCI is not set
>   # CONFIG_LSUSB is not set
> -# CONFIG_MDEV is not set
> -# CONFIG_FEATURE_MDEV_CONF is not set
> -# CONFIG_FEATURE_MDEV_RENAME is not set
> -# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
> -# CONFIG_FEATURE_MDEV_EXEC is not set
> -# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
>   CONFIG_MKSWAP=y
>   # CONFIG_FEATURE_MKSWAP_UUID is not set
>   CONFIG_MORE=y
> @@ -697,7 +705,7 @@ CONFIG_MICROCOM=y
>   # CONFIG_MT is not set
>   # CONFIG_RAIDAUTORUN is not set
>   # CONFIG_READAHEAD is not set
> -# CONFIG_RFKILL is not set
> +CONFIG_RFKILL=y
>   # CONFIG_RUNLEVEL is not set
>   # CONFIG_RX is not set
>   # CONFIG_SETSID is not set
> @@ -831,6 +839,7 @@ CONFIG_TRACEROUTE=y
>   # CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
>   # CONFIG_TUNCTL is not set
>   # CONFIG_FEATURE_TUNCTL_UG is not set
> +# CONFIG_UDHCPC6 is not set
>   CONFIG_UDHCPD=y
>   # CONFIG_DHCPRELAY is not set
>   CONFIG_DUMPLEASES=y
> @@ -877,6 +886,7 @@ CONFIG_FEATURE_MIME_CHARSET=""
>   # Process Utilities
>   #
>   # CONFIG_IOSTAT is not set
> +# CONFIG_LSOF is not set
>   # CONFIG_MPSTAT is not set
>   # CONFIG_NMETER is not set
>   # CONFIG_PMAP is not set
> @@ -898,6 +908,7 @@ CONFIG_PIDOF=y
>   # CONFIG_PKILL is not set
>   CONFIG_PS=y
>   CONFIG_FEATURE_PS_WIDE=y
> +CONFIG_FEATURE_PS_LONG=y
>   # CONFIG_FEATURE_PS_TIME is not set
>   # CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
>   # CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch b/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/get_header_tar.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/run-parts.in.usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch b/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch b/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch
> rename to meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
> similarity index 79%
> rename from meta/recipes-core/busybox/busybox_1.19.4.bb
> rename to meta/recipes-core/busybox/busybox_1.20.2.bb
> index 2e262ca..ced04d2 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r13"
> +PR = "r0"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://B921600.patch \
> @@ -25,9 +25,10 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://umount.busybox \
>              file://defconfig \
>              file://busybox-mkfs-minix-tests_bigendian.patch \
> -           file://fix-for-spurious-testsuite-failure.patch"
> +           file://fix-for-spurious-testsuite-failure.patch \
> +           file://busybox-1.20.2-kernel_ver.patch"
>
> -SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
> -SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
> +SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
> +SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
>
>   EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
>


