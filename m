Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qoa-0005dQ-9P
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:32:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Aug 2012 15:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="186635083"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2012 15:20:32 -0700
Message-ID: <503E95B0.80603@linux.intel.com>
Date: Wed, 29 Aug 2012 15:20:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344850769-21131-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1344850769-21131-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: Re: [PATCH] ethtool: package update 3.4.1 -> 3.5
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
X-List-Received-Date: Wed, 29 Aug 2012 22:32:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 02:39 AM, Constantin Musca wrote:
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../ethtool/{ethtool_3.4.1.bb => ethtool_3.5.bb}   |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/ethtool/{ethtool_3.4.1.bb => ethtool_3.5.bb} (79%)
>
> diff --git a/meta/recipes-extended/ethtool/ethtool_3.4.1.bb b/meta/recipes-extended/ethtool/ethtool_3.5.bb
> similarity index 79%
> rename from meta/recipes-extended/ethtool/ethtool_3.4.1.bb
> rename to meta/recipes-extended/ethtool/ethtool_3.5.bb
> index 41ef330..b9caab6 100644
> --- a/meta/recipes-extended/ethtool/ethtool_3.4.1.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_3.5.bb
> @@ -9,7 +9,7 @@ PR = "r0"
>
>   SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "25ccc0d717c37265042df4f7869485cb"
> -SRC_URI[sha256sum] = "3b67484b255996432854cb07de8f7e42ba555cf8efeb4a0134eb7575f9eef2a8"
> +SRC_URI[md5sum] = "f2dd81ecc515f25372503501f9b7ea1b"
> +SRC_URI[sha256sum] = "e87e232ba927aecca5be565e7bea20c533ade97758b17e65b8941df35b3c6f59"
>
>   inherit autotools
>
Merged into OE-Core

Thanks
	Sau!



