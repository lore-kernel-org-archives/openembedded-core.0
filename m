Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C88876BEA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 17:42:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2013 10:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,984,1367996400"; d="scan'208";a="394070118"
Received: from unknown (HELO [10.255.14.210]) ([10.255.14.210])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2013 10:42:23 -0700
Message-ID: <521F87FF.2010602@linux.intel.com>
Date: Thu, 29 Aug 2013 10:42:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Peter A. Bigot" <pab@pabigot.com>
References: <1377553769-21608-1-git-send-email-pab@pabigot.com>
	<1377553769-21608-2-git-send-email-pab@pabigot.com>
In-Reply-To: <1377553769-21608-2-git-send-email-pab@pabigot.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-firmware: package Marvell SD8787 firmware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 17:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2013 02:49 PM, Peter A. Bigot wrote:
> From: "Peter A. Bigot" <pab@pabigot.com>
>
> Also split out Marvell license as separate package.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>   .../linux-firmware/linux-firmware_git.bb           |   14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 42f6ce0..0c69ee4 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -55,7 +55,9 @@ do_install() {
>   }
>
>
> -PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
> +PACKAGES =+ "${PN}-ralink \
> +             ${PN}-Marvell-license ${PN}-sd8686 ${PN}-sd8787 \
This is an illegal package name with Capital "Marvell", this is due to 
ipkg not handling capital letters in package names.

This should have given you an error during your testing.

Sau!

> +             ${PN}-wl12xx ${PN}-vt6656 \
>                ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
>                ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
>                ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
> @@ -96,12 +98,20 @@ FILES_${PN}-ralink = " \
>     /lib/firmware/LICENCE.ralink-firmware.txt \
>   "
>
> +FILES_${PN}-Marvell-license = "/lib/firmware/LICENCE.Marvell"
> +
>   LICENSE_${PN}-sd8686 = "Firmware-Marvell"
>   FILES_${PN}-sd8686 = " \
>     /lib/firmware/libertas/sd8686_v9* \
>     /lib/firmware/sd8686* \
> -  /lib/firmware/LICENCE.Marvell \
>   "
> +RDEPENDS_${PN}-sd8686 += "${PN}-Marvell-license"
> +
> +LICENSE_${PN}-sd8787 = "Firmware-Marvell"
> +FILES_${PN}-sd8787 = " \
> +  /lib/firmware/mrvl/sd8787_uapsta.bin \
> +"
> +RDEPENDS_${PN}-sd8787 += "${PN}-Marvell-license"
>
>   FILES_${PN}-rtl-license = " \
>     /lib/firmware/LICENCE.rtlwifi_firmware.txt \
>

