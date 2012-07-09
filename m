Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHoM-0006r4-RE
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:31:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2012 10:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120409374"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 10:20:39 -0700
Message-ID: <4FFB12E7.60200@linux.intel.com>
Date: Mon, 09 Jul 2012 10:20:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207041501240.13342@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207041501240.13342@oneiric>
Subject: Re: recipes.txt: Add entries for "recipes-rt" and "recipes-support"
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
X-List-Received-Date: Mon, 09 Jul 2012 17:31:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 12:02 PM, Robert P. J. Day wrote:
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/recipes.txt b/meta/recipes.txt
> index bf7f19e..6d33743 100644
> --- a/meta/recipes.txt
> +++ b/meta/recipes.txt
> @@ -9,5 +9,7 @@ recipes-graphics     - X and other graphically related system libraries
>   recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
>   recipes-multimedia   - Codecs and support utilties for audio, images and video
>   recipes-qt           - All things related to the Qt application framework
> +recipes-rt           - Provides package and image recipes for using and testing the PREEMPT_RT kernel
>   recipes-sato         - The Sato demo/reference UI/UX, its associated apps and configuration
> +recipes-support      - Recipes used by other recipes but that are not directly included in images
>
>

Merged into OE-Core

Thanks
	Sau!


