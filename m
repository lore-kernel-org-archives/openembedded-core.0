Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9768272491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 09:00:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 02:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="509656867"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.18.65])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2015 02:00:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Date: Wed, 17 Jun 2015 10:00 +0100
Message-ID: <3706563.UPu9mtN6Hi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1434530881-2119-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1434530881-2119-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: enable httpd su install
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
X-List-Received-Date: Wed, 17 Jun 2015 09:00:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Li,

On Wednesday 17 June 2015 16:48:01 Li xin wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-core/busybox/busybox.inc       |  1 +
>  meta/recipes-core/busybox/busybox/defconfig | 53
> +++++++++++++++-------------- 2 files changed, 28 insertions(+), 26
> deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc index 0769d92..3886457 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -39,6 +39,7 @@ INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> 
>  SYSTEMD_PACKAGES = "${PN}-syslog"
>  SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-syslog = "disable"
> 
>  CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
>  CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
> diff --git a/meta/recipes-core/busybox/busybox/defconfig
> b/meta/recipes-core/busybox/busybox/defconfig index c200ee0..667928b 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -227,8 +227,8 @@ CONFIG_FALSE=y
>  # CONFIG_FSYNC is not set
>  CONFIG_HEAD=y
>  # CONFIG_FEATURE_FANCY_HEAD is not set
> -# CONFIG_INSTALL is not set
> -# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
> +CONFIG_INSTALL=y
> +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
>  CONFIG_LN=y
>  CONFIG_LOGNAME=y
>  CONFIG_LS=y
> @@ -431,15 +431,15 @@ CONFIG_XARGS=y
>  CONFIG_HALT=y
>  # CONFIG_FEATURE_CALL_TELINIT is not set
>  CONFIG_TELINIT_PATH=""
> -# CONFIG_INIT is not set
> -# CONFIG_FEATURE_USE_INITTAB is not set
> -# CONFIG_FEATURE_KILL_REMOVED is not set
> +CONFIG_INIT=y
> +CONFIG_FEATURE_USE_INITTAB=y
> +CONFIG_FEATURE_KILL_REMOVED=y
>  CONFIG_FEATURE_KILL_DELAY=0
> -# CONFIG_FEATURE_INIT_SCTTY is not set
> +CONFIG_FEATURE_INIT_SCTTY=y
>  # CONFIG_FEATURE_INIT_SYSLOG is not set
> -# CONFIG_FEATURE_EXTRA_QUIET is not set
> -# CONFIG_FEATURE_INIT_COREDUMPS is not set
> -# CONFIG_FEATURE_INITRD is not set
> +CONFIG_FEATURE_EXTRA_QUIET=y
> +CONFIG_FEATURE_INIT_COREDUMPS=y
> +CONFIG_FEATURE_INITRD=y
>  CONFIG_INIT_TERMINAL_TYPE=""
>  CONFIG_MESG=y
>  # CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
> @@ -477,7 +477,7 @@ CONFIG_LAST_SYSTEM_ID=999
>  # CONFIG_CRYPTPW is not set
>  # CONFIG_CHPASSWD is not set
>  CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
> -# CONFIG_SU is not set
> +CONFIG_SU=y
>  # CONFIG_FEATURE_SU_SYSLOG is not set
>  # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
>  # CONFIG_SULOGIN is not set
> @@ -752,19 +752,20 @@ CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
>  # CONFIG_FTPPUT is not set
>  # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
>  CONFIG_HOSTNAME=y
> -# CONFIG_HTTPD is not set
> -# CONFIG_FEATURE_HTTPD_RANGES is not set
> -# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
> -# CONFIG_FEATURE_HTTPD_SETUID is not set
> -# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
> -# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
> -# CONFIG_FEATURE_HTTPD_CGI is not set
> -# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
> -# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
> -# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
> -# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
> -# CONFIG_FEATURE_HTTPD_PROXY is not set
> -# CONFIG_FEATURE_HTTPD_GZIP is not set
> +CONFIG_HTTPD=y
> +CONFIG_FEATURE_HTTPD_RANGES=y
> +CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
> +CONFIG_FEATURE_HTTPD_SETUID=y
> +CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
> +CONFIG_FEATURE_HTTPD_AUTH_MD5=y
> +CONFIG_FEATURE_HTTPD_CGI=y
> +CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
> +CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
> +CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
> +CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
> +CONFIG_FEATURE_HTTPD_PROXY=y
> +CONFIG_FEATURE_HTTPD_GZIP=y
> +
>  CONFIG_IFCONFIG=y
>  CONFIG_FEATURE_IFCONFIG_STATUS=y
>  # CONFIG_FEATURE_IFCONFIG_SLIP is not set
> @@ -802,9 +803,9 @@ CONFIG_FEATURE_IP_TUNNEL=y
>  # CONFIG_IPROUTE is not set
>  # CONFIG_IPTUNNEL is not set
>  # CONFIG_IPRULE is not set
> -# CONFIG_IPCALC is not set
> -# CONFIG_FEATURE_IPCALC_FANCY is not set
> -# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
> +CONFIG_IPCALC=y
> +CONFIG_FEATURE_IPCALC_FANCY=y
> +CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
>  CONFIG_NETSTAT=y
>  # CONFIG_FEATURE_NETSTAT_WIDE is not set
>  # CONFIG_FEATURE_NETSTAT_PRG is not set

There are several problems with this patch:

1) It does far more than just what the shortlog mentions

2) There isn't a proper commit message explaining why we need to enable these 
options in the core as opposed to those options being enabled with a bbappend 
in your custom layer. This turns on so many options that I very much doubt we 
can accept this patch unless there is very good justification for turning all 
of them on by default.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

