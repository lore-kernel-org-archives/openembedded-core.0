Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A01E73D13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 16:21:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2015 09:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,602,1432623600"; d="scan'208";a="775804786"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.52])
	([10.219.5.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2015 09:21:37 -0700
Message-ID: <55BF9547.8060908@linux.intel.com>
Date: Mon, 03 Aug 2015 11:22:31 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1438334099-30137-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <1438334099-30137-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH] init-install-efi.sh: Check if an installation device is present
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Aug 2015 16:21:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This patch does not solve the related bug (#7971) so I will send a V2 soon.


On 07/31/2015 04:14 AM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> In case there is no installation device present, give a better
> message to the user and abort installation.
>
> [YOCTO #7971]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f339b30..a3ed74b 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -55,6 +55,11 @@ for device in `ls /sys/block/`; do
>       esac
>   done
>
> +if [ -z "${hdnamelist}" ]; then
> +    echo "You need another device (besides the live device /dev/${live_dev_name}) to install the image. Installation aborted."
> +    exit 1
> +fi
> +
>   TARGET_DEVICE_NAME=""
>   for hdname in $hdnamelist; do
>       # Display found hard drives and their basic info
>

