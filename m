Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B6B8865CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 18:36:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2014 11:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,776,1406617200"; d="scan'208";a="610138202"
Received: from unknown (HELO [10.255.13.134]) ([10.255.13.134])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2014 11:36:28 -0700
Message-ID: <54494AAB.90903@linux.intel.com>
Date: Thu, 23 Oct 2014 11:36:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1414086210-3393-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1414086210-3393-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] poky-lsb: Set LTSI as base kernel for LSB
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
X-List-Received-Date: Thu, 23 Oct 2014 18:36:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2014 10:43 AM, Saul Wold wrote:
> By doing this we will enable the LTSI kernel (3.10 at this time) for the LSB
> based images.
>

Oops, this should have gone to the poky@yoctoproject.org list, resent, 
sorry for the noise

Sau!

> [YOCTO #6853]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta-yocto/conf/distro/poky-lsb.conf | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-yocto/conf/distro/poky-lsb.conf b/meta-yocto/conf/distro/poky-lsb.conf
> index b0c2cf8..a9030a2 100644
> --- a/meta-yocto/conf/distro/poky-lsb.conf
> +++ b/meta-yocto/conf/distro/poky-lsb.conf
> @@ -11,4 +11,5 @@ PREFERRED_PROVIDER_virtual/libx11 = "libx11"
>   # Ensure the kernel nfs server is enabled
>   KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
>
> -
> +# Use the LTSI Kernel for LSB Testing
> +PREFERRED_VERSION_linux-yocto_linuxstdbase ?= "3.10%"
>

