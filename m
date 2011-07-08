Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfD1I-0001bu-Um for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:31:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FRHbQ021277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:27:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:27:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FRAhS021271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:27:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
Date: Fri, 08 Jul 2011 16:26:32 +0100
Message-ID: <1310138792.20015.880.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/7] binutils: package unpackaged files
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
X-List-Received-Date: Fri, 08 Jul 2011 15:31:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 13:25 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> To fix these package qa warnings
> WARNING: For recipe binutils, the following files were installed but not shipped in any package:
> WARNING:   /usr/bin/ld.bfd
> WARNING:   /usr/bin/elfedit
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
>  .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
>  meta/recipes-devtools/binutils/binutils.inc        |    2 ++
>  meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
> index 7dad2a6..e91e7dc 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-canadian.inc
> -PR = "r0"
> +PR = "r1"
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> index 0d6efff..21289cd 100644
> --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> @@ -4,7 +4,7 @@ inherit crosssdk
>  
>  PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  do_configure_prepend () {
>  	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 08c14b2..9a6b9c8 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -35,11 +35,13 @@ FILES_${PN}-symlinks = " \
>  	${bindir}/c++filt \
>  	${bindir}/gprof \
>  	${bindir}/ld \
> +	${bindir}/ld.bfd \
>  	${bindir}/nm \
>  	${bindir}/objcopy \
>  	${bindir}/objdump \
>  	${bindir}/ranlib \
>  	${bindir}/readelf \
> +	${bindir}/elfedit \
>  	${bindir}/size \
>  	${bindir}/strip"

Nitin, do you know if the ld.bfd above is a hardlinked copy of ld?

It may be better to turn this into a symlink if so (although our
packaging process should preserve hardlinks these days).

Cheers,

Richard




