Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SHjLp-0007pv-Jt
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 00:15:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 15:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130938508"
Received: from unknown (HELO envy.home) ([10.255.12.43])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 15:06:18 -0700
Message-ID: <4F84AEB4.4040109@linux.intel.com>
Date: Tue, 10 Apr 2012 15:05:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1334094326.git.sgw@linux.intel.com>
	<560645d66f6a67d7a23531a3002d19ab37db1d01.1334094326.git.sgw@linux.intel.com>
In-Reply-To: <560645d66f6a67d7a23531a3002d19ab37db1d01.1334094326.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] boot-directdisk: remove the default setting of SYSLINUXCFG and SYSLINUXMENU
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
X-List-Received-Date: Tue, 10 Apr 2012 22:15:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/10/2012 02:49 PM, Saul Wold wrote:
> These two should get setup in {S} and installed into {HDDDIR}, by
> having them defined with {HDDDIR} they try to get created when the
> directory does not exist yet.

And they conflict with the syslinux.bbclass which now has appropriate
defaults. This is cruft left over from resurrecting directdisk.

> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/boot-directdisk.bbclass |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index e9e1ba3..7d8f8ff 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -40,9 +40,6 @@ AUTO_SYSLINUXCFG = "1"
>  SYSLINUX_ROOT ?= "root=/dev/sda2"
>  SYSLINUX_TIMEOUT ?= "10"
>  
> -SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
> -SYSLINUXMENU = "${HDDDIR}/menu"
> -
>  inherit syslinux
>  		
>  build_boot_dd() {

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


