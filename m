Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0mj7-0003uu-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 05:25:49 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Feb 2012 20:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="69785919"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Feb 2012 20:17:26 -0800
Message-ID: <4F470F56.3050200@linux.intel.com>
Date: Thu, 23 Feb 2012 20:17:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329358121-1366-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1329358121-1366-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] busybox: don't create /etc/default
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
X-List-Received-Date: Fri, 24 Feb 2012 04:25:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2012 06:08 PM, Andreas Oberritter wrote:
> * It's not used by the recipe and its creation
>    currently depends on CONFIG_HWCLOCK=y.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-core/busybox/busybox.inc       |    1 -
>   meta/recipes-core/busybox/busybox_1.19.3.bb |    2 +-
>   2 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 5fb436e..fc69d65 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -179,7 +179,6 @@ do_install () {
>   		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
>   	fi
>   	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> -		install -d ${D}${sysconfdir}/default
>   		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
>   	fi
>   	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
> index a075407..45e284f 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.3.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://udhcpscript.patch \

Merged into OE-core

Thanks
	Sau!


