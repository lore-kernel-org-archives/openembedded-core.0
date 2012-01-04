Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEXz-0002fG-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:17:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 16:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94146003"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2012 16:10:17 -0800
Message-ID: <4F0398E9.80304@linux.intel.com>
Date: Tue, 03 Jan 2012 16:10:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EFA3FB5.7030605@linux.intel.com>
	<1325061785-2180-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1325061785-2180-1-git-send-email-fransmeulenbroeks@gmail.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH v2 1/2] u-boot: improved DESCRIPTION, fixed HOMEPAGE
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
X-List-Received-Date: Wed, 04 Jan 2012 00:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 12:43 AM, Frans Meulenbroeks wrote:
> HOMEPAGE pointed to an sf.net page that said that the
> page did not exist any more and after that it redirected
> to the denx.de page; updated HOMEPAGE to point to that page
> Also improved the description to use the official capitalisation
>
> Signed-off-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 544acd2..a3f50bc 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -1,3 +1,3 @@
> +DESCRIPTION = "U-Boot - the Universal Boot Loader"
> +HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
> -DESCRIPTION = "U-boot bootloader"
> -HOMEPAGE = "http://u-boot.sf.net"
>   SECTION = "bootloaders"

Merged this one into OE-Core, will drop the "generating eth env utils" 
patch until I see something else from you.

Thanks
	Sau!


