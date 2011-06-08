Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QULvk-00079p-CS
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 18:48:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2011 09:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,339,1304319600"; d="scan'208";a="13584593"
Received: from unknown (HELO [10.255.13.55]) ([10.255.13.55])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2011 09:44:54 -0700
Message-ID: <4DEFA705.60302@linux.intel.com>
Date: Wed, 08 Jun 2011 09:44:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307349584-31950-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1307349584-31950-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] util-linux: package agetty seperately
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
X-List-Received-Date: Wed, 08 Jun 2011 16:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2011 01:39 AM, Koen Kooi wrote:
> Some packages like systemd only want agetty to spawn a console and not drag in all of util-linux just for that.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
>   meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 71601dc..4b36100 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-
>              file://make_include \
>              "
>
> -PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
> +PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
>                util-linux-swaponoff util-linux-losetup util-linux-umount \
>                util-linux-mount util-linux-readprofile util-linux-libblkid \
>                util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
> @@ -37,6 +37,7 @@ EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elv
>
>   FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
>
> +FILES_util-linux-agetty = "${base_sbindir}/agetty"
>   FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${PN}"
>   FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
>   FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
> index 7fe7497..40183c9 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.19"
> -PR = "r0"
> +PR = "r1"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
Merged into oe-core

Thanks
	Sau!


