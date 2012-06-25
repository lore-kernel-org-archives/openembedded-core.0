Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjCEC-000859-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:33:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2012 09:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="157964636"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2012 09:22:36 -0700
Message-ID: <4FE8904C.1080008@linux.intel.com>
Date: Mon, 25 Jun 2012 09:22:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <298672C9-7064-437A-9D46-45259E697684@dominion.thruhere.net>
	<1340374507-20613-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1340374507-20613-1-git-send-email-paul.gortmaker@windriver.com>
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH v2] linux-firmware: update to main repo on kernel.org
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
X-List-Received-Date: Mon, 25 Jun 2012 16:33:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 07:15 AM, Paul Gortmaker wrote:
> This is now the authoratative repository, taking updates.
> The latest has a couple updated license files, vs. the previous
> srcrev that was used.
>
> Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
> ---
> [v2: add missing pr bump]
>
>   .../linux-firmware/linux-firmware_git.bb           |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 3675978..8aacce4 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -7,23 +7,23 @@ SECTION = "kernel"
>
>   LICENSE = "Proprietary"
>
> -LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef43 \
> +LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
>                       file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
>                       file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
>                       file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
>                       file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
> -                    file://LICENCE.iwlwifi_firmware;md5=311cc823df5b1be4f00fbf0f17d96a6b \
> +                    file://LICENCE.iwlwifi_firmware;md5=11545778abf78c43d7644d4f171ea1c7 \
>                       file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
>                       file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
>                       file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
>                       file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
>                      "
>
> -SRCREV = "15888a2eab052ac3d3f49334e4f6f05f347a516e"
> +SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
>   PV = "0.0+git${SRCPV}"
> -PR = "r1"
> +PR = "r2"
>
> -SRC_URI = "git://git.infradead.org/users/dwmw2/linux-firmware.git;protocol=git"
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
>
>   S = "${WORKDIR}/git"
>

Merged into OE-Core

Thanks
	Sau!


