Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzpQ-0007IO-Ai
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:27:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2012 20:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85936175"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 20:17:58 -0700
Message-ID: <4F7E6066.2080907@linux.intel.com>
Date: Thu, 05 Apr 2012 20:17:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333622218-5230-1-git-send-email-stefan@herbrechtsmeier.net>
In-Reply-To: <1333622218-5230-1-git-send-email-stefan@herbrechtsmeier.net>
Subject: Re: [PATCH] linux-firmware: keep version string in libertas firmware
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
X-List-Received-Date: Fri, 06 Apr 2012 03:27:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 03:36 AM, Stefan Herbrechtsmeier wrote:
> Recent Linux kernel tries to load the libertas firmware with the version
> string in its name first. This results in a delayed firmware load on
> system boot. Keep the default libertas firmware name and add a link for
> older driver versions.
>
> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
> ---
>   .../linux-firmware/linux-firmware_git.bb           |   10 +++++++---
>   1 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 52929fa..3675978 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -38,8 +38,8 @@ do_install() {
>   	cp -r * ${D}/lib/firmware/
>
>   	# Libertas sd8686
> -	install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
> -	install -m 0644 libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
> +	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
> +	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
>
>   	# Realtek rtl8192*
>   	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
> @@ -51,7 +51,11 @@ do_install() {
>   PACKAGES =+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
>
>   LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
> -FILES_${PN}-sd8686 = "/lib/firmware/sd8686* /lib/firmware/LICENCE.libertas"
> +FILES_${PN}-sd8686 = " \
> +  /lib/firmware/libertas/sd8686_v9* \
> +  /lib/firmware/sd8686* \
> +  /lib/firmware/LICENCE.libertas \
> +"
>
>   LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
>   FILES_${PN}-rtl8192cu = " \

Merged into OE-Core

Thanks
	Sau!


