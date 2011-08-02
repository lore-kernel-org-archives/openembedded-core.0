Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoLoj-0006oC-VM for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 22:43:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72KdaoE019317
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 21:39:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19250-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 21:39:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72KdOGn019311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 21:39:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312312720-20828-1-git-send-email-galak@kernel.crashing.org>
References: <1312312720-20828-1-git-send-email-galak@kernel.crashing.org>
Date: Tue, 02 Aug 2011 21:39:08 +0100
Message-ID: <1312317548.2344.612.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tune/arch-powerpc64: keep insync with arch-powerpc.inc
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
X-List-Received-Date: Tue, 02 Aug 2011 20:43:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 14:18 -0500, Kumar Gala wrote:
> * Add DEFAULTTUNE setting
> * Sync TUNE_PKGARCH with:
> 	commit 20f285728219c1efcc23d8e861902c212893c68d
> 	Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> 	Date:   Tue Aug 2 12:40:06 2011 +0100
> 
> 	    tune/ppc: Fix various TUNE_PKGARCH issues

Quick question, are all ppc64 cores ppc32 capable or not?

Cheers,

Richard

> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  .../machine/include/powerpc/arch-powerpc64.inc     |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index a965d59..daad355 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -1,8 +1,13 @@
> +DEFAULTTUNE ?= "powerpc64"
> +
>  TUNEVALID[m64] = "Power ELF64 standard ABI"
>  TUNE_CONFLICTS[m64] = "m32 nf"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
>  
> +PPCPKGARCH = "${TUNE_ARCH}"
> +TUNE_PKGARCH ?= "${PPCPKGARCH}"
> +
>  AVAILTUNES += "powerpc64"
>  TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
>  BASE_LIB_tune-powerpc64 = "lib64"




