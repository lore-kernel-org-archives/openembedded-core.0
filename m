Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RrvUb-0003Ir-Al
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:58:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 09:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="101946737"
Received: from mkgumbel-mobl5.jf.intel.com (HELO [10.7.199.151])
	([10.7.199.151])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2012 09:50:19 -0800
Message-ID: <4F26D85A.8030908@linux.intel.com>
Date: Mon, 30 Jan 2012 09:50:18 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] alsa-state: fix RDEPENDS assignment
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
X-List-Received-Date: Mon, 30 Jan 2012 17:58:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Yikes, I don't know why I keep making this mistake. Thanks for catching 
it Koen.

I thought we caught this in a QA error but I definitely didn't see it, 
best investigate.

On 30/01/12 08:49, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
Signed-off-by: Joshua Lock<josh@linux.intel.com>

Joshua

> ---
>   meta/recipes-bsp/alsa-state/alsa-state.bb |    5 ++---
>   1 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
> index bc17b25..83c9faa 100644
> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
> @@ -10,7 +10,7 @@ sound state at system boot and save it at system shut down."
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>   PV = "0.2.0"
> -PR = "r0"
> +PR = "r2"
>
>   SRC_URI = "\
>     file://asound.conf \
> @@ -18,8 +18,6 @@ SRC_URI = "\
>     file://alsa-state \
>   "
>
> -RDEPENDS = "alsa-utils-alsactl"
> -
>   inherit update-rc.d
>
>   INITSCRIPT_NAME = "alsa-state"
> @@ -39,6 +37,7 @@ PACKAGES += "alsa-states"
>
>   RRECOMMENDS_alsa-state = "alsa-states"
>
> +RDEPENDS_${PN} = "alsa-utils-alsactl"
>   FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
>   CONFFILES_${PN} = "${sysconfdir}/asound.conf"
>

-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


