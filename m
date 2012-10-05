Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAbv-0003SC-PI
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:18:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Oct 2012 09:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="152860471"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Oct 2012 09:05:43 -0700
Message-ID: <506F0557.2000806@linux.intel.com>
Date: Fri, 05 Oct 2012 09:05:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1349276007-6014-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1349276007-6014-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] build-appliance-image: Fix spacing in DESCRIPTION
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
X-List-Received-Date: Fri, 05 Oct 2012 16:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 07:53 AM, Paul Eggleton wrote:
> Fixes [YOCTO #2636]
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-core/images/build-appliance-image.bb |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
> index 69a4828..49e250d 100644
> --- a/meta/recipes-core/images/build-appliance-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -1,4 +1,5 @@
> -DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
> +DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.\
> + For more information, see the <a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
>   IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
>
>   LICENSE = "MIT"
>
Merged into OE-Core

Thanks
	Sau!



