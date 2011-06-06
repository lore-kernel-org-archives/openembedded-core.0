Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTdM1-0004JZ-BN
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:12:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Jun 2011 10:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,327,1304319600"; 
   d="scan'208";a="7932944"
Received: from unknown (HELO [10.255.13.99]) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2011 10:09:23 -0700
Message-ID: <4DED09C3.1010103@linux.intel.com>
Date: Mon, 06 Jun 2011 10:09:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307100611.2529.256.camel@phil-desktop>
In-Reply-To: <1307100611.2529.256.camel@phil-desktop>
Subject: Re: [PATCH] gcc-package-cross: also install the symlinks in libexec with target prefix
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
X-List-Received-Date: Mon, 06 Jun 2011 17:12:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2011 04:30 AM, Phil Blundell wrote:
> ... since this is where collect2 seems to look for them.  This seems like
> it is really a bug in collect2, but installing the symlinks is an easy
> workaround.  Without this you get "could not find ld" errors when using -flto.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-devtools/gcc/gcc-package-cross.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
> index 04c8101..b51336b 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
> @@ -20,6 +20,7 @@ do_install () {
>   	install -d $dest
>   	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
>   		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
> +		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
>   	done
>
>   	# Remove things we don't need but keep share/java


Merged into OE-Core

Thanks
	Sau!


