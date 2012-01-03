Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiBqe-0005Wp-7V
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 22:24:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jan 2012 13:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108400683"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2012 13:17:22 -0800
Message-ID: <4F037062.5070204@linux.intel.com>
Date: Tue, 03 Jan 2012 13:17:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324597572-10548-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1324597572-10548-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: fix pkg_postinst and pkg_postrm
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
X-List-Received-Date: Tue, 03 Jan 2012 21:24:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 03:46 PM, Andrea Adami wrote:
> * Symptom: kernel symlink in /boot is not created.
> * Rename in order to create the expected files:
> * /var/lib/opkg/info/kernel-3.1.4.postinst
> * /var/lib/opkg/info/kernel-3.1.4.postrm
>
> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 120a524..ec5d65e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -223,11 +223,11 @@ do_savedefconfig() {
>   do_savedefconfig[nostamp] = "1"
>   addtask savedefconfig after do_configure
>
> -pkg_postinst_kernel () {
> +pkg_postinst_kernel-base () {
>   	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>   }
>
> -pkg_postrm_kernel () {
> +pkg_postrm_kernel-base () {
>   	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>   }
>
Merged into OE-Core

Thanks
	Sau!


