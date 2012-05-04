Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQMMu-0004AP-Ix
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 19:32:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 10:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="140178434"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2012 10:22:48 -0700
Message-ID: <4FA41068.9080006@linux.intel.com>
Date: Fri, 04 May 2012 10:22:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336136984-11129-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1336136984-11129-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] gcc-4.6: explicitly disable ppl
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
X-List-Received-Date: Fri, 04 May 2012 17:32:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 06:09 AM, Andreas Oberritter wrote:
> * Fixes the following error after a system library upgrade
> | .../mipsel-oe-linux/4.6.4/cc1: error while loading shared libraries: libppl.so.10: cannot open shared object file: No such file or directory
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * This patch is based on the denzil branch.
>
>   meta/recipes-devtools/gcc/gcc-4.6.inc |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index 020e21b..74843ae 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r25"
> +PR = "r26"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -93,6 +93,7 @@ EXTRA_OECONF_BASE = " --enable-lto \
>   			--disable-libmudflap \
>   			--with-system-zlib \
>   			--with-linker-hash-style=${LINKER_HASH_STYLE} \
> +			--without-ppl \
>   			--enable-cheaders=c_global "
>
>   EXTRA_OECONF_INITIAL = "--disable-libmudflap \

Merged into OE-Core

Thanks
	Sau!


