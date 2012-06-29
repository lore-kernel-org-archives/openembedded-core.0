Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ske1g-0005UV-43
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 18:26:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2012 09:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="159767462"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2012 09:15:34 -0700
Message-ID: <4FEDD4A6.3030500@linux.intel.com>
Date: Fri, 29 Jun 2012 09:15:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340887340-30645-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1340887340-30645-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] build-appliance-image: rename from self-hosted-image
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
X-List-Received-Date: Fri, 29 Jun 2012 16:26:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2012 05:42 AM, Valentin Popa wrote:
> (-) renamed self-hosted-image to build-appliance-image
> (-) replaced build-appliance-image description
>
> [YOCTO #2636]
>
> Signed-off-by: Valentin Popa<valentin.popa@intel.com>
> ---
>   meta/conf/multilib.conf                            |    2 +-
>   ...lf-hosted-image.bb =>  build-appliance-image.bb} |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-core/images/{self-hosted-image.bb =>  build-appliance-image.bb} (91%)
>
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index cea8694..92a7813 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -583,7 +583,7 @@ BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-self-hosted-image = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-build-appliance-image = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-service = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
> diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/build-appliance-image.bb
> similarity index 91%
> rename from meta/recipes-core/images/self-hosted-image.bb
> rename to meta/recipes-core/images/build-appliance-image.bb
> index aef1507..2b7906f 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "Version 1.0-r6 of the self-hosted image."
> +DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
>   IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
>
>   LICENSE = "MIT"

Merged into OE-Core

Thanks
	Sau!


