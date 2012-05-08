Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRblL-0000Ft-IY
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 06:10:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2012 21:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97487489"
Received: from unknown (HELO [10.255.12.217]) ([10.255.12.217])
	by AZSMGA002.ch.intel.com with ESMTP; 07 May 2012 21:01:06 -0700
Message-ID: <4FA89A82.2050204@linux.intel.com>
Date: Mon, 07 May 2012 21:01:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336169877-29276-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1336169877-29276-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] gcc-4.6: disable cloog, change syntax to disable ppl
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
X-List-Received-Date: Tue, 08 May 2012 04:10:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 03:17 PM, Andreas Oberritter wrote:
> * Backported from 523df15bcc21e1749771cca757613f3520243b8e
>    as suggested by Khem.
>
> * Original commit message:
>
>    If build system has those libraries installed
>    gcc configure will pick them up. We want
>    consistent builds so we disable them since we
>    do not (yet) support them
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-devtools/gcc/gcc-4.6.inc |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index 74843ae..0f56670 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r26"
> +PR = "r27"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -93,7 +93,8 @@ EXTRA_OECONF_BASE = " --enable-lto \
>   			--disable-libmudflap \
>   			--with-system-zlib \
>   			--with-linker-hash-style=${LINKER_HASH_STYLE} \
> -			--without-ppl \
> +			--with-ppl=no \
> +			--with-cloog=no \
>   			--enable-cheaders=c_global "
>
>   EXTRA_OECONF_INITIAL = "--disable-libmudflap \

Merged into OE-Core

Thanks
	Sau!


