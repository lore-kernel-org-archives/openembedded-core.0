Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SutOY-0000Xr-Nl
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 00:52:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2012 15:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174126110"
Received: from unknown (HELO envy.home) ([10.255.12.238])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2012 15:40:56 -0700
Message-ID: <50131892.6020708@linux.intel.com>
Date: Fri, 27 Jul 2012 15:39:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
	<15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
In-Reply-To: <15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH 1/1] kernel.bbclass: remove default module_autoload and module_conf values
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 22:52:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/26/2012 11:04 AM, Bruce Ashfield wrote:
> kernel.bbclass is a common class for many different kernel versions,
> and as such the default module_autoload and module_conf values that
> it contains are not relevant, or out of date for most builds.
> 
> Individual kernel recipes or distros can better specify these
> values to meet their needs.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

This makes sense to me. None of the below are likely to prevent boot and
seem to be more along the lines of MACHINE policy.

--
Darren

> ---
>  meta/classes/kernel.bbclass |   19 -------------------
>  1 files changed, 0 insertions(+), 19 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ab984e3..c647e9b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -293,25 +293,6 @@ if [ x"$D" = "x" ]; then
>  fi
>  }
>  
> -# autoload defaults (alphabetically sorted)
> -module_autoload_hidp = "hidp"
> -module_autoload_ipv6 = "ipv6"
> -module_autoload_ipsec = "ipsec"
> -module_autoload_ircomm-tty = "ircomm-tty"
> -module_autoload_rfcomm = "rfcomm"
> -module_autoload_sa1100-rtc = "sa1100-rtc"
> -# sa1100-rtc was renamed in 2.6.23 onwards
> -module_autoload_rtc-sa1100 = "rtc-sa1100"
> -
> -# alias defaults (alphabetically sorted)
> -module_conf_af_packet = "alias net-pf-17 af_packet"
> -module_conf_bluez = "alias net-pf-31 bluez"
> -module_conf_bnep = "alias bt-proto-4 bnep"
> -module_conf_hci_uart = "alias tty-ldisc-15 hci_uart"
> -module_conf_l2cap = "alias bt-proto-0 l2cap"
> -module_conf_sco = "alias bt-proto-2 sco"
> -module_conf_rfcomm = "alias bt-proto-3 rfcomm"
> -
>  python populate_packages_prepend () {
>      def extract_modinfo(file):
>          import tempfile, re, subprocess
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


