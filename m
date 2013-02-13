Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U5hZ4-0002jh-L4
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 20:00:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Feb 2013 10:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="256516111"
Received: from unknown (HELO [10.255.12.50]) ([10.255.12.50])
	by azsmga001.ch.intel.com with ESMTP; 13 Feb 2013 10:44:10 -0800
Message-ID: <511BDEFA.5060601@linux.intel.com>
Date: Wed, 13 Feb 2013 10:44:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1360741570-11148-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1360741570-11148-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 1.3.1
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
X-List-Received-Date: Wed, 13 Feb 2013 19:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2013 11:46 PM, Khem Raj wrote:
> qemu on target,qemu-native and nativesdk versions built
> and worked fine
>

Already on the list and in MUT from Constantin

Thanks
	Sau!

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/qemu/qemu_1.3.0.bb |   10 ----------
>   meta/recipes-devtools/qemu/qemu_1.3.1.bb |    9 +++++++++
>   2 files changed, 9 insertions(+), 10 deletions(-)
>   delete mode 100644 meta/recipes-devtools/qemu/qemu_1.3.0.bb
>   create mode 100644 meta/recipes-devtools/qemu/qemu_1.3.1.bb
>
> diff --git a/meta/recipes-devtools/qemu/qemu_1.3.0.bb b/meta/recipes-devtools/qemu/qemu_1.3.0.bb
> deleted file mode 100644
> index 7d007ea..0000000
> --- a/meta/recipes-devtools/qemu/qemu_1.3.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require qemu.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> -                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
> -
> -SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "a4030ddd2ba324152a97d65d3c0b247d"
> -SRC_URI[sha256sum] = "878055ec05bc28fecfe2da97eb8bc992e8635575b67cebdfc5ca1ede171140a8"
> -
> -PR = "r0"
> diff --git a/meta/recipes-devtools/qemu/qemu_1.3.1.bb b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
> new file mode 100644
> index 0000000..9ac7027
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
> @@ -0,0 +1,9 @@
> +require qemu.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> +                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
> +
> +SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "5dbc6c22f47efca71dfaae0dd80dcf9e"
> +SRC_URI[sha256sum] = "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb43b56bdacaca0eaf"
> +
>


