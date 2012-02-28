Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2QMC-0007Ql-J2
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 17:56:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2012 08:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130455361"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2012 08:48:28 -0800
Message-ID: <4F4D055B.9000209@linux.intel.com>
Date: Tue, 28 Feb 2012 08:48:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330444215-14321-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1330444215-14321-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] bootimg bbclass: quoting fixes
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
X-List-Received-Date: Tue, 28 Feb 2012 16:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2012 07:50 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/classes/bootimg.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index 1d1a3d0..c4a4c2a 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -35,8 +35,8 @@ ISODIR = "${S}/iso"
>   BOOTIMG_VOLUME_ID   ?= "boot"
>   BOOTIMG_EXTRA_SPACE ?= "512"
>
> -EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
> -EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
> +EFI = '${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}'
> +EFI_CLASS = '${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}'
>
>   # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
>   # contain "efi". This way legacy is supported by default if neither is
This actually needs more changes, see my patch.

Sau!


