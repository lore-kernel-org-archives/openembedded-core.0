Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwe8-0005kk-AE
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:24:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Oct 2012 13:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="157819965"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Oct 2012 13:11:26 -0700
Message-ID: <5080626E.1020509@linux.intel.com>
Date: Thu, 18 Oct 2012 13:11:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <1349862074-13950-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1349862074-13950-1-git-send-email-marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-self-hosted: recommend kernel modules instead of depending on them
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
X-List-Received-Date: Thu, 18 Oct 2012 20:24:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2012 02:41 AM, Marcin Juszkiewicz wrote:
> Requested kernel modules may be integrated in kernel or totally disabled
> as not needed on target.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   .../packagegroups/packagegroup-self-hosted.bb           |   15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index de0a46d..19f5a16 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -4,7 +4,7 @@
>
>   SUMMARY = "Self-hosting"
>   DESCRIPTION = "Packages required to run the build system"
> -PR = "r11"
> +PR = "r12"
>   LICENSE = "MIT"
>
>   inherit packagegroup
> @@ -37,11 +37,6 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
>       genext2fs \
>       hdparm \
>       iptables \
> -    kernel-module-tun \
> -    kernel-module-iptable-raw \
> -    kernel-module-iptable-nat \
> -    kernel-module-iptable-mangle \
> -    kernel-module-iptable-filter \
>       lsb \
>       mc \
>       parted \
> @@ -50,6 +45,14 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
>       vte \
>       "
>
> +RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
> +    kernel-module-tun \
> +    kernel-module-iptable-raw \
> +    kernel-module-iptable-nat \
> +    kernel-module-iptable-mangle \
> +    kernel-module-iptable-filter \
> +	"
> +
>   # eglibc-utils: for rpcgen
>   RDEPENDS_packagegroup-self-hosted-sdk = "\
>       autoconf \
>

Merged into OE-Core

Thanks
	Sau!



