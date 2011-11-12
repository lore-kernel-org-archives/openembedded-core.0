Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RP2Si-0006at-Si
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 02:32:53 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Nov 2011 17:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,497,1315206000"; d="scan'208";a="36099713"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Nov 2011 17:26:32 -0800
Message-ID: <4EBDCB48.5050804@linux.intel.com>
Date: Fri, 11 Nov 2011 17:26:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
	<8af8989bc3e582e77f7ae9414de89f94bda76c01.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <8af8989bc3e582e77f7ae9414de89f94bda76c01.1321028799.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH][oe-core 10/22] alsa-lib: add nativesdk BBCLASSEXTEND
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
X-List-Received-Date: Sat, 12 Nov 2011 01:32:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2011 08:28 AM, Martin Jansa wrote:
> * needed for libsdl-nativesdk when DISTRO_FEATURES have alsa
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
> index b787c54..d701031 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1&  GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
>                       file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>
>   # configure.in sets -D__arm__ on the command line for any arm system
>   # (not just those with the ARM instruction set), this should be removed,

This seems to have added some multiple provider issues:

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime libasound (alsa-lib, 
alsa-lib-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound
NOTE: multiple providers are available for runtime alsa-conf-base 
(alsa-lib, alsa-lib-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match alsa-conf-base


Sau!


