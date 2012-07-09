Received: from dd19416.kasserver.com ([85.13.139.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1SoAGS-0004Mw-R9
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:28:20 +0200
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 7F7BE1840DAC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 11:07:42 +0200 (CEST)
Message-ID: <4FFA9F5D.70300@herbrechtsmeier.net>
Date: Mon, 09 Jul 2012 11:07:41 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
	<1341401643-4395-3-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1341401643-4395-3-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH 2/5] bluez4: update to ver. 4.101
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
X-List-Received-Date: Mon, 09 Jul 2012 09:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 04.07.2012 13:34, schrieb Cristian Iorga:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../{bluez4-4.99 => bluez4-4.101}/bluetooth.conf   |    0
>   .../{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch    |    0
>   .../bluez/{bluez4_4.99.bb => bluez4_4.101.bb}      |    9 ++++-----
>   3 files changed, 4 insertions(+), 5 deletions(-)
>   rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/bluetooth.conf (100%)
>   rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch (100%)
>   rename meta/recipes-connectivity/bluez/{bluez4_4.99.bb => bluez4_4.101.bb} (83%)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> similarity index 100%
> rename from meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
> rename to meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
> rename to meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> similarity index 83%
> rename from meta/recipes-connectivity/bluez/bluez4_4.99.bb
> rename to meta/recipes-connectivity/bluez/bluez4_4.101.bb
> index 32831e7..a2ba66f 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -1,13 +1,12 @@
>   require bluez4.inc
>   
> -PR = "r2"
> +PR = "r0"
>   
>   SRC_URI += "file://bluetooth.conf \
> -            file://sbc_mmx.patch \
> -           "
> +            file://sbc_mmx.patch"
>   
> -SRC_URI[md5sum] = "570aa10692ed890aa0a4297b37824912"
> -SRC_URI[sha256sum] = "d884b9aa5d3d9653c076b7646ca14a3e43eb84bccfe8193c49690f802bbd827c"
> +SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
> +SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
>   
>   do_install_append() {
>   	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
This patch breaks bluetooth on new images without systemd, as bluez 
switch from udev rules to systemd service to start the bluetooth daemon.



