Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TytB0-0000V9-O0
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 00:59:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2013 15:43:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,541,1355126400"; d="scan'208";a="252662724"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.79])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2013 15:43:43 -0800
Message-ID: <510318AD.9020701@linux.intel.com>
Date: Fri, 25 Jan 2013 15:43:41 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1359157177-1411-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1359157177-1411-1-git-send-email-sgw@linux.intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky-tiny: Add pulseaudio to DISTRO_FEATURES_BACKFILL_CONSIDERED
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
X-List-Received-Date: Fri, 25 Jan 2013 23:59:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/25/2013 03:39 PM, Saul Wold wrote:
> This is to ensure it won't be included in DISTRO_FEATURES, we have
> considered it and it's not appropriate for the poky-tiny release.

Wow, that naming throws me, but the commit message clears it up.

> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta-yocto/conf/distro/poky-tiny.conf |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
> index 761844f..4ab488d 100644
> --- a/meta-yocto/conf/distro/poky-tiny.conf
> +++ b/meta-yocto/conf/distro/poky-tiny.conf
> @@ -86,6 +86,7 @@ DISTRO_FEATURES_USB = "usbhost"
>  #DISTRO_FEATURES_WIFI = "wifi"
>  # This is needed for DISTRO_FEATURES_BACKFILL
>  DISTRO_FEATURES_INITMAN = "tiny-init"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED = "pulseaudio"
>  
>  DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
>                     ${DISTRO_FEATURES_NET} \
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


