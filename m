Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXdrr-0006uK-Aj
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 22:43:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2013 13:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,590,1363158000"; d="scan'208";a="306391513"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2013 13:25:10 -0700
Message-ID: <51817A25.6050009@linux.intel.com>
Date: Wed, 01 May 2013 13:25:09 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: tf+lists.yocto@r-finger.com
References: <1366991439-14728-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1367052737-8519-1-git-send-email-tf+lists.yocto@r-finger.com>
In-Reply-To: <1367052737-8519-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Enigmail-Version: 1.5.1
Cc: Tomas Frydrych <tomas@sleepfive.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ia32-base.inc: remove inapropriate grub dependency
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
X-List-Received-Date: Wed, 01 May 2013 20:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/27/2013 01:52 AM, tf+lists.yocto@r-finger.com wrote:
> From: Tomas Frydrych <tomas@sleepfive.com>
> 
> There is no good reason for ia32 machines to have hard dependency on grub,
> as there are other bootloaders available for ia32 platforms.
> 
> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
> ---
>  meta/conf/machine/include/ia32-base.inc |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
> index 921c740..cb542a5 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/ia32-base.inc
> @@ -9,7 +9,6 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
>                       acpi serial usbgadget alsa"
>  
>  MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "grub"

Agreed - but do the images still build as currently written after you
remove it here?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


