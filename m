Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6Vou-00022M-KM
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 01:03:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 15:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="52210271"
Received: from unknown (HELO [10.255.15.16]) ([10.255.15.16])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 15:57:52 -0700
Message-ID: <4E7A6BF0.2080709@linux.intel.com>
Date: Wed, 21 Sep 2011 15:57:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <E7A9054A5ACABE48B0E540E46E862B0F012064@NAEMMAIL01.na.leapfrog.com>
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F012064@NAEMMAIL01.na.leapfrog.com>
Cc: Daniel Lazzari <dlazzari@leapfrog.com>
Subject: Re: [PATCH 1/1] Fix alsa-utils package dependencies
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
X-List-Received-Date: Wed, 21 Sep 2011 23:03:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2011 04:15 PM, Daniel Lazzari wrote:
> Make alsa-utils main package depend on all of the more specific alsa-utils packages (such as alsa-utils-alsamixer).
>
> Signed-off-by: Daniel Lazzari Jr<dlazzari@leapfrog.com>
> ---
>   .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
> index 52a7871..307f293 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
> @@ -28,7 +28,7 @@ inherit autotools gettext
>   # This are all packages that we need to make. Also, the now empty alsa-utils
>   # ipk depends on them.
>
> -PACKAGES += "\
> +ALSA_UTILS_PKGS = "\
>                alsa-utils-alsamixer \
>                alsa-utils-midi \
>                alsa-utils-aplay \
> @@ -44,6 +44,9 @@ PACKAGES += "\
>                alsa-utils-alsaucm \
>               "
>
> +PACKAGES += "${ALSA_UTILS_PKGS}"
> +RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
> +
>   # We omit alsaconf, because
>   # a) this is a bash script
>   # b) it creates config files not suitable for OE-based distros

Merged into OE-Core

Thanks
	Sau!


