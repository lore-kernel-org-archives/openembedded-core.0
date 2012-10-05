Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAYt-0003Ju-GS
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:15:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Oct 2012 09:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="152859286"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Oct 2012 09:02:35 -0700
Message-ID: <506F049B.7020906@linux.intel.com>
Date: Fri, 05 Oct 2012 09:02:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1349394459-26860-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1349394459-26860-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] toolchain-scripts.bbclass: Export M4
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
X-List-Received-Date: Fri, 05 Oct 2012 16:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2012 04:47 PM, Khem Raj wrote:
> some packages use M4 variable from environment and sometimes
> its hardcoded to /usr/bin/m4 if not found in environment. Lets
> define it such that it is picked from path
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/toolchain-scripts.bbclass |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 44284c3..6d8623c 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -26,6 +26,7 @@ toolchain_create_sdk_env_script () {
>   	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
>   	echo 'export AR=${TARGET_PREFIX}ar' >> $script
>   	echo 'export NM=${TARGET_PREFIX}nm' >> $script
> +	echo 'export M4=m4' >> $script
>   	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>   	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=${SDKTARGETSYSROOT}"' >> $script
>   	if [ "${TARGET_OS}" = "darwin8" ]; then
>

Merged into OE-Core

Thanks
	Sau!



