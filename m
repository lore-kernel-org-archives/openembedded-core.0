Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RrvVV-0003LW-77
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:59:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 09:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="104227016"
Received: from mkgumbel-mobl5.jf.intel.com (HELO [10.7.199.151])
	([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2012 09:51:15 -0800
Message-ID: <4F26D891.6080002@linux.intel.com>
Date: Mon, 30 Jan 2012 09:51:13 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
	<1327942199-4604-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1327942199-4604-2-git-send-email-koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] alsa-utils: make alsa-utils-alsactl recommend alsa-states
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
X-List-Received-Date: Mon, 30 Jan 2012 17:59:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/12 08:49, Koen Kooi wrote:
> This will drag in the asound.state from the BSP that alsactl uses.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
>   .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
> index 196128e..e62a0f3 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
>                       file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
>   DEPENDS = "alsa-lib ncurses libsamplerate0"
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
>              file://ncursesfix.patch \
> @@ -79,4 +79,6 @@ DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asou
>   DESCRIPTION_alsa-utils-alsaconf     = "a bash script that creates ALSA configuration files"
>   DESCRIPTION_alsa-utils-alsaucm      = "ALSA Use Case Manager"
>
> +RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
> +
>   ALLOW_EMPTY_alsa-utils = "1"

-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


