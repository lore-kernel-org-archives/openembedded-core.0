Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-03.prod.phx3.secureserver.net
	(p3plsmtpa11-03.prod.phx3.secureserver.net [68.178.252.104])
	by mail.openembedded.org (Postfix) with ESMTP id D9D776B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:17:50 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa11-03.prod.phx3.secureserver.net with 
	id MPHq1m00Q1mTNtu01PHqiX; Thu, 05 Sep 2013 04:17:51 -0700
Message-ID: <5228685E.7090201@pabigot.com>
Date: Thu, 05 Sep 2013 06:17:50 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <1377553769-21608-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1377553769-21608-1-git-send-email-pab@pabigot.com>
Subject: Re: [PATCH 1/2] linux-firmware: correct name of Marvell license file
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
X-List-Received-Date: Thu, 05 Sep 2013 11:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok, third time after smacking thunderbird upside the head:

Ping for this and the revised 2/2 in which I addressed Saul's comment.

Peter

On 08/26/2013 04:49 PM, Peter A. Bigot wrote:
> From: "Peter A. Bigot" <pab@pabigot.com>
>
> Follow upstream in changing the name of the license file for Marvell
> firmware:
>
>    commit 2e79e60b7e4771427327ed508fa27b90d841afcb
>    Author: Bing Zhao <bzhao@marvell.com>
>    Date:   Fri Jan 7 16:06:56 2011 -0800
>
>      linux-firmware: use single license file for Marvell firmwares
>
>      Libertas and mwl8k firmware images are under the same license.
>
>      Signed-off-by: Bing Zhao <bzhao@marvell.com>
>      Signed-off-by: Brian Cavagnolo <brian@cozybit.com>
>      Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
>
>    :000000 100644 0000000... 3224e1b... A  LICENCE.Marvell
>    :100644 000000 1fd8766... 0000000... D  LICENCE.libertas
>    :100644 000000 3224e1b... 0000000... D  LICENCE.mwl8k
>    :100644 100644 d0740ce... 35b82c8... M  WHENCE
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>   .../linux-firmware/linux-firmware_git.bb           |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index ee33f50..42f6ce0 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
>                       file://LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea \
>                       file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
>                       file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
> +                    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
>                      "
>   
>   SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
> @@ -95,11 +96,11 @@ FILES_${PN}-ralink = " \
>     /lib/firmware/LICENCE.ralink-firmware.txt \
>   "
>   
> -LICENSE_${PN}-sd8686 = "Firmware-libertas"
> +LICENSE_${PN}-sd8686 = "Firmware-Marvell"
>   FILES_${PN}-sd8686 = " \
>     /lib/firmware/libertas/sd8686_v9* \
>     /lib/firmware/sd8686* \
> -  /lib/firmware/LICENCE.libertas \
> +  /lib/firmware/LICENCE.Marvell \
>   "
>   
>   FILES_${PN}-rtl-license = " \


