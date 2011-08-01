Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnsLr-0001Zr-R9 for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:16:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DBobv007333
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:11:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04880-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 14:11:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DBg3Z007327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:11:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <527a7669b89693abe83d557ba22e64d6a5554c81.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<527a7669b89693abe83d557ba22e64d6a5554c81.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 14:11:29 +0100
Message-ID: <1312204289.2344.438.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 21/22] external-*toolchain: remove glibc-utils provide
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
X-List-Received-Date: Mon, 01 Aug 2011 13:16:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> This was causing a multiple providers error

What kind of multiple providers error? This change doesn't feel right to
me and likely breaks external toolchains.

Cheers,

Richard

> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../meta/external-csl-toolchain_2008q3-72.bb       |    4 ++--
>  meta/recipes-core/meta/external-poky-toolchain.bb  |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> index a874c8b..1cd45d2 100644
> --- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> +++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> @@ -16,9 +16,9 @@ PROVIDES = "\
>  	virtual/libiconv \
>  	glibc-thread-db \
>  	virtual/linux-libc-headers "
> -RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
> +RPROVIDES = "libsegfault glibc-thread-db"
>  PACKAGES_DYNAMIC = "glibc-gconv-*"
> -PR = "r1"
> +PR = "r2"
>  
>  #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
>  
> diff --git a/meta/recipes-core/meta/external-poky-toolchain.bb b/meta/recipes-core/meta/external-poky-toolchain.bb
> index 5507746..b4b4418 100644
> --- a/meta/recipes-core/meta/external-poky-toolchain.bb
> +++ b/meta/recipes-core/meta/external-poky-toolchain.bb
> @@ -9,10 +9,10 @@ PROVIDES = "\
>      virtual/libintl \
>      virtual/libiconv \
>      virtual/linux-libc-headers "
> -RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
> +RPROVIDES = "libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
>  PACKAGES_DYNAMIC = "glibc-gconv-*"
>  INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  # License applies to this recipe code, not the toolchain itself
>  LICENSE = "MIT"




