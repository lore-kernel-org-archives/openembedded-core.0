Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ruyrr-0005DQ-HL
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:10:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2012 20:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105150046"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 20:02:47 -0800
Message-ID: <4F31F3E7.2040400@linux.intel.com>
Date: Tue, 07 Feb 2012 20:02:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328214086-6824-1-git-send-email-tworaz666@gmail.com>
In-Reply-To: <1328214086-6824-1-git-send-email-tworaz666@gmail.com>
Subject: Re: [PATCH] busybox: Add flock utility to default configuration.
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
X-List-Received-Date: Wed, 08 Feb 2012 04:10:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2012 12:21 PM, Peter Tworek wrote:
> Flock is required by by pm-utils package to function properly
> (/usr/lib/pm-utils/functions). It's shipped in both busybox and
> util-linux. Both versions work fine with pm-utils. Enabling it
> in busybox seems like simpliest solution for the problem.
>
> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
> ---
>   meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> index b474ad4..fa9c078 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> @@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
>   # CONFIG_FEATURE_GPT_LABEL is not set
>   # CONFIG_FEATURE_FDISK_ADVANCED is not set
>   # CONFIG_FINDFS is not set
> -# CONFIG_FLOCK is not set
> +CONFIG_FLOCK=y
>   # CONFIG_FREERAMDISK is not set
>   CONFIG_FSCK_MINIX=y
>   # CONFIG_MKFS_EXT2 is not set

Merged this one into OE-core, missed the v2 version with updated comment

Sorry and Thanks
	Sau!


