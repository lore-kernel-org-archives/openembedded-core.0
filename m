Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qwfjn-00050k-4B
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 21:37:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2011 12:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="42278641"
Received: from unknown (HELO [10.255.13.251]) ([10.255.13.251])
	by orsmga001.jf.intel.com with ESMTP; 25 Aug 2011 12:32:25 -0700
Message-ID: <4E56A349.1090904@linux.intel.com>
Date: Thu, 25 Aug 2011 12:32:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1314277168-4324-1-git-send-email-mac@mcrowe.com>
In-Reply-To: <1314277168-4324-1-git-send-email-mac@mcrowe.com>
Subject: Re: [PATCH 1/2] kernel.bbclass: Find the kernel consistently.
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
X-List-Received-Date: Thu, 25 Aug 2011 19:37:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2011 05:59 AM, Mike Crowe wrote:
> Use KERNEL_OUTPUT variable to find the generated kernel image rather than
> duplicating the existing path. This also means it can be overridden simply.
>
There are other places in kernel.bbclass that use the path vs 
KERNEL_OUTPUT, is there a reason you did not change those also?

Sau!

> Signed-off-by: Mike Crowe<mac@mcrowe.com>
> ---
>   meta/classes/kernel.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a2b10f2..04e673a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -476,7 +476,7 @@ KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>   KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
>
>   kernel_do_deploy() {
> -	install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> +	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>   	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>   		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
>   	fi


