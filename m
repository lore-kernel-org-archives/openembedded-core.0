Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UQKjg-0001BV-HW
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 18:52:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2013 09:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,455,1363158000"; d="scan'208";a="293572254"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2013 09:35:06 -0700
Message-ID: <5166E63A.7040008@linux.intel.com>
Date: Thu, 11 Apr 2013 09:35:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1365685469-19415-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1365685469-19415-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] build-appliance-image: update to newer poky revision
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
X-List-Received-Date: Thu, 11 Apr 2013 16:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2013 06:04 AM, Cristian Iorga wrote:
> Src rev for BA is now ae353c229cfe7e82588dc53fbed10c6ba8370d26.
>
Let's wait and update this on Sunday, please work with RP and myself to 
get the correct SRCREV into the core.

Sau!

> Includes improvements to:
> - Hob;
> - git proxy mechanism;
> - LSB compliance for Yocto Linux;
> - postinstall fixes.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-core/images/build-appliance-image.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
> index 43f0574..ae89684 100644
> --- a/meta/recipes-core/images/build-appliance-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -19,7 +19,7 @@ IMAGE_FSTYPES = "vmdk"
>
>   inherit core-image
>
> -SRCREV ?= "d823759b4594143d522eae0b2a2498436a6dcb1e"
> +SRCREV ?= "ae353c229cfe7e82588dc53fbed10c6ba8370d26"
>   SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
>              file://Yocto_Build_Appliance.vmx \
>              file://Yocto_Build_Appliance.vmxf \
>


