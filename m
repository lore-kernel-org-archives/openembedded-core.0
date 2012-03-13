Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Uuj-0004Os-9A
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:49:33 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128515270"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 09:40:48 -0700
Message-ID: <4F5F7890.1020909@linux.intel.com>
Date: Tue, 13 Mar 2012 09:40:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331346686-14454-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331346686-14454-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] linux-firmware: fix permissions of installed files
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
X-List-Received-Date: Tue, 13 Mar 2012 16:49:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2012 06:31 PM, Andreas Oberritter wrote:
> * The previous copy command preserved the original
>    owner and permission bits.
> * The new command uses root:root and applies OE's
>    umask.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../linux-firmware/linux-firmware_git.bb           |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index a99dc7e..52929fa 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef
>
>   SRCREV = "15888a2eab052ac3d3f49334e4f6f05f347a516e"
>   PV = "0.0+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "git://git.infradead.org/users/dwmw2/linux-firmware.git;protocol=git"
>
> @@ -35,7 +35,7 @@ do_compile() {
>
>   do_install() {
>   	install -d  ${D}/lib/firmware/
> -	cp -RpP * ${D}/lib/firmware/
> +	cp -r * ${D}/lib/firmware/
>
>   	# Libertas sd8686
>   	install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin

Merged into OE-Core

Thanks
	Sau!


