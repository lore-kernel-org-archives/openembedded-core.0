Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ2UV-0001UV-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 22:19:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2012 13:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149066807"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2012 13:09:19 -0700
Message-ID: <4FA2E5EF.5080306@linux.intel.com>
Date: Thu, 03 May 2012 13:09:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336008514-26806-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1336008514-26806-1-git-send-email-kergoth@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: move kernel-vmlinux up in PACKAGES
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
X-List-Received-Date: Thu, 03 May 2012 20:19:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 06:28 PM, Christopher Larson wrote:
> If KERNEL_IMAGETYPE is vmlinux, the expectation is most likely that there will
> be no kernel image package, but we still want a vmlinux package for debugging,
> so move kernel-vmlinux in front of kernel-image in PACKAGES.
>
> Signed-off-by: Christopher Larson<kergoth@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..d81b33c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -247,7 +247,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>   # kernel-base becomes kernel-${KERNEL_VERSION}
>   # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux kernel-misc"
> +PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
>   FILES = ""
>   FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>   FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
Merged into OE-Core

Thanks
	Sau!


