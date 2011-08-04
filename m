Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozN5-0003cs-RC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:58:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 07:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,317,1309762800"; d="scan'208";a="35381969"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 07:53:35 -0700
Message-ID: <4E3AB26E.1060306@linux.intel.com>
Date: Thu, 04 Aug 2011 07:53:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312288218-15909-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1312288218-15909-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] kernel.bbcalss: Added do_savedefconfig task.
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
X-List-Received-Date: Thu, 04 Aug 2011 14:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2011 05:30 AM, Noor, Ahsan wrote:
> * Added do_savedefconfig task to kernel.bbclass.
>
> Signed-off-by: Noor, Ahsan<noor_ahsan@mentor.com>
> ---
>   meta/classes/kernel.bbclass |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 25d2629..f2f05b1 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,6 +197,12 @@ kernel_do_configure() {
>
>   do_configure[depends] += "${INITRAMFS_TASK}"
>
> +do_savedefconfig() {
> +	oe_runmake savedefconfig
> +}
> +do_savedefconfig[nostamp] = "1"
> +addtask savedefconfig after do_configure
> +
>   pkg_postinst_kernel () {
>   	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>   }

Merged into OE-Core

Thanks
	Sau!


