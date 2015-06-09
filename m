Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 30C4E6AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 18:47:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2015 11:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,582,1427785200"; d="scan'208";a="740291266"
Received: from kchoi15-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.141.149])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2015 11:45:42 -0700
Message-ID: <55773456.1060101@linux.intel.com>
Date: Tue, 09 Jun 2015 11:45:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
References: <1433867609-26266-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1433867609-26266-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] poky-tiny: Update kernel to 3.19
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
X-List-Received-Date: Tue, 09 Jun 2015 18:47:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2015 09:33 AM, Saul Wold wrote:
> Additionally, allow both PREFERRED_VERSION and PREFERRED_PROVIDE to be overridden
>
> [YOCTO #7478]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta-yocto/conf/distro/poky-tiny.conf | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
> index aa60e77..63bbd88 100644
> --- a/meta-yocto/conf/distro/poky-tiny.conf
> +++ b/meta-yocto/conf/distro/poky-tiny.conf
> @@ -36,8 +36,8 @@ DISTRO = "poky-tiny"
>
>   # Distro config is evaluated after the machine config, so we have to explicitly
>   # set the kernel provider to override a machine config.
> -PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
> -PREFERRED_VERSION_linux-yocto-tiny = "3.14%"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-tiny"
> +PREFERRED_VERSION_linux-yocto-tiny ?= "3.19%"
>
>   # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
>   #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
>

Drop this patch please, the ?= change was masked by something I had in 
my local.conf and does not actually work correct.  The qemu.inc has a 
PREFERRED_PROVIDER ?= already and actually causes this to be not used as 
the first ?= found wins.

Sau!

