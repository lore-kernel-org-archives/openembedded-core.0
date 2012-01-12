Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTxJ-00088p-Rr
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:21:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Jan 2012 22:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95015028"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:26:55 -0800
Message-ID: <4F0E7D2F.3020502@linux.intel.com>
Date: Wed, 11 Jan 2012 22:26:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325911915-16001-1-git-send-email-steve@sakoman.com>
In-Reply-To: <1325911915-16001-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v2] Remove last remnants of kernel26 MACHINE_FEATURES
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
X-List-Received-Date: Thu, 12 Jan 2012 23:21:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 08:51 PM, Steve Sakoman wrote:
> There is no reason to continue to carry this feature
>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   meta/conf/bitbake.conf                             |    1 -
>   meta/conf/machine/include/qemu.inc                 |    2 +-
>   .../update-modules/update-modules_1.0.bb           |    4 ++--
>   3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b858364..336b1d7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -685,7 +685,6 @@ OES_BITBAKE_CONF = "1"
>   # Machine properties and task-base stuff
>   ##################################################################
>
> -MACHINE_FEATURES ?= "kernel26"
>   DISTRO_FEATURES ?= ""
>
>   # This is used to limit what packages goes into images built, so set big by default
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 3cebfab..10ab76e 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -1,7 +1,7 @@
>   PCMCIA_MANAGER = "pcmciautils"
>   PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
>
> -MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
> +MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
>
>   IMAGE_FSTYPES ?= "tar.bz2 ext3"
>
> diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
> index 1ea97a8..dc44965 100644
> --- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
> +++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
> @@ -3,8 +3,8 @@ SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
>
> -RDEPENDS_${PN} = "${@base_contains("MACHINE_FEATURES", "kernel26",  "module-init-tools-depmod","modutils-depmod",d)} "
> -PR = "r10"
> +RDEPENDS_${PN} = "module-init-tools-depmod"
> +PR = "r11"
>
>   SRC_URI = "file://update-modules \
>              file://COPYING.GPL"

Merged into OE-Core

Thanks
	Sau!


