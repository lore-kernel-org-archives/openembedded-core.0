Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrCs-0003sY-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:58:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2012 10:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="144307573"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2012 10:46:00 -0700
Message-ID: <5050CA58.8050208@linux.intel.com>
Date: Wed, 12 Sep 2012 10:46:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347279756-6624-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347279756-6624-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-x11-xserver: remove redundant PACKAGES statement
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
X-List-Received-Date: Wed, 12 Sep 2012 17:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 05:22 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../packagegroups/packagegroup-core-x11-xserver.bb                 |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> index bf39e63..fd6ed42 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> @@ -3,14 +3,12 @@
>   #
>
>   LICENSE = "MIT"
> -PR = "r38"
> +PR = "r39"
>
>   inherit packagegroup
>
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -PACKAGES = "${PN}"
> -
>   XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
>
>   SUMMARY_${PN} = "X11 display server"
>
Merged into OE-Core

Thanks
	Sau!



