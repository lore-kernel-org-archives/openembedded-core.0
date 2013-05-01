Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UXbvF-0000Qv-LY
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 20:38:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2013 11:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,590,1363158000"; d="scan'208";a="327213256"
Received: from unknown (HELO [10.255.12.170]) ([10.255.12.170])
	by fmsmga001.fm.intel.com with ESMTP; 01 May 2013 11:20:39 -0700
Message-ID: <51815CF7.4080605@linux.intel.com>
Date: Wed, 01 May 2013 11:20:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1367317863-10350-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1367317863-10350-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iptables: upgrade to 1.4.18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 18:38:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2013 03:31 AM, Cristian Iorga wrote:
> fix-link-failure-ip6t-NETMAP.patch removed;
> already included in upstream.
>
You do not seem to have removed the patch file itself.

Sau!

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../iptables/{iptables_1.4.17.bb => iptables_1.4.18.bb}        |    8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/iptables/{iptables_1.4.17.bb => iptables_1.4.18.bb} (90%)
>
> diff --git a/meta/recipes-extended/iptables/iptables_1.4.17.bb b/meta/recipes-extended/iptables/iptables_1.4.18.bb
> similarity index 90%
> rename from meta/recipes-extended/iptables/iptables_1.4.17.bb
> rename to meta/recipes-extended/iptables/iptables_1.4.18.bb
> index aa932ce..bb8718f 100644
> --- a/meta/recipes-extended/iptables/iptables_1.4.17.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.4.18.bb
> @@ -7,8 +7,6 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
>                       file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
>
> -PR = "r1"
> -
>   RRECOMMENDS_${PN} = "kernel-module-x-tables \
>                        kernel-module-ip-tables \
>                        kernel-module-iptable-filter \
> @@ -23,12 +21,12 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
>
>   SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>              file://types.h-add-defines-that-are-required-for-if_packet.patch \
> -           file://fix-link-failure-ip6t-NETMAP.patch \
>              file://fix-iptables-extensions-build-error.patch \
>              file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
>             "
> -SRC_URI[md5sum] = "c3fb2ffd5b39d0d54b06ccc4c8660116"
> -SRC_URI[sha256sum] = "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156a543a1cd70554925"
> +
> +SRC_URI[md5sum] = "a819199d5ec013b82da13a8ffbba857e"
> +SRC_URI[sha256sum] = "14a99fb8b0ca22027a9ac6eb72fa32c834ceb3073820e0ba79bf251c6a7bcf3c"
>
>   inherit autotools
>
>


