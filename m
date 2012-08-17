Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2PTV-0001qD-3C
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:32:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 09:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135454292"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 09:20:39 -0700
Message-ID: <502E6F57.8030004@linux.intel.com>
Date: Fri, 17 Aug 2012 09:20:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
	<1344948628-15705-4-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1344948628-15705-4-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: Re: [PATCH 3/3] libxrandr: upgrade to 1.4.0
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
X-List-Received-Date: Fri, 17 Aug 2012 16:32:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 05:50 AM, Constantin Musca wrote:
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb}     |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb} (72%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
> similarity index 72%
> rename from meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
> rename to meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
> index 6fc3cf5..323c098 100644
> --- a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
> @@ -9,7 +9,7 @@ specified in the Proceedings of the 2001 Usenix Technical Conference \
>   require xorg-lib-common.inc
>
>   LICENSE = "MIT-style"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4c5c132d3690478179d78ec3bf064584"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=aa33e583cc3e96238a8467b485e62992"

What changed in the license file?  It could be as simple as the 
Copyright year or more complex, but you need to include that information 
in the commit message.

Thanks
	Sau!

>
>   DEPENDS += "virtual/libx11 randrproto libxrender libxext"
>
> @@ -20,5 +20,5 @@ XORG_PN = "libXrandr"
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI[md5sum] = "92473da2fccf5fac665be4fa4f2037fa"
> -SRC_URI[sha256sum] = "7eaca216ab5233d7396119eb87c1989d350a3efead104d54b55f22cdd1d99b81"
> +SRC_URI[md5sum] = "0c843636124cc1494e3d87df16957672"
> +SRC_URI[sha256sum] = "033ad0ac2f012afb05268660f6d78705c85f84689f92fa7b47ce12959b15f5c3"
>


