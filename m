Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpRyN-00016L-Cx
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 23:30:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2011 14:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,325,1309762800"; d="scan'208";a="35634139"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2011 14:26:01 -0700
Message-ID: <4E3C5FE8.2070602@linux.intel.com>
Date: Fri, 05 Aug 2011 14:26:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312430603-5629-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312430603-5629-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib
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
X-List-Received-Date: Fri, 05 Aug 2011 21:30:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 09:03 PM, Kumar Gala wrote:
> We might redefine ${base_libdir} from being set to just /lib.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/classes/image-mklibs.bbclass |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
> index d6630c4..69dac2f 100644
> --- a/meta/classes/image-mklibs.bbclass
> +++ b/meta/classes/image-mklibs.bbclass
> @@ -17,19 +17,19 @@ mklibs_optimize_image_doit() {
>
>   	case ${TARGET_ARCH} in
>   		powerpc | mips | microblaze )
> -			dynamic_loader="/lib/ld.so.1"
> +			dynamic_loader="${base_libdir}/ld.so.1"
>   			;;
>   		powerpc64)
>   			dynamic_loader="${base_libdir}/ld64.so.1"
>   			;;
>   		x86_64)
> -			dynamic_loader="/lib/ld-linux-x86-64.so.2"
> +			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
>   			;;
>   		i586 )
> -			dynamic_loader="/lib/ld-linux.so.2"
> +			dynamic_loader="${base_libdir}/ld-linux.so.2"
>   			;;
>   		arm )
> -			dynamic_loader="/lib/ld-linux.so.3"
> +			dynamic_loader="${base_libdir}/ld-linux.so.3"
>   			;;
>   		* )
>   			dynamic_loader="/unknown_dynamic_linker"
Merged into OE-Core

Thanks
	Sau!


