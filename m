Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rdqix-0004As-OJ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 23:02:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Dec 2011 13:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105250429"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2011 13:55:43 -0800
Message-ID: <4EF3A75F.1070705@linux.intel.com>
Date: Thu, 22 Dec 2011 13:55:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324549428-22664-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1324549428-22664-1-git-send-email-b19537@freescale.com>
Subject: Re: [PATCH oe-core] linux-dtb: add dtb into deploy cache package
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
X-List-Received-Date: Thu, 22 Dec 2011 22:02:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 02:23 AM, b19537@freescale.com wrote:
> From: Zhenhua Luo<b19537@freescale.com>
>
>      >  current dtb is not included in the deploy cache package, dtb is missing
>        when build kernel from caches
>
> Signed-off-by: Zhenhua Luo<b19537@freescale.com>
> ---
>   meta/recipes-kernel/linux/linux-dtb.inc |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 7ec7584..f6f5f81 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -25,3 +25,9 @@ do_install_append() {
>       fi
>   }
>
> +do_deploy_append() {
> +    install -d ${DEPLOYDIR}
> +    install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
> +    cd ${DEPLOYDIR}
> +    ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> +}
What machines did you test this on?  Is it possible that some kernels do 
not generate .dtb files?

Sau!


