Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQRVk-0003lt-Qh
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 01:02:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 15:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137180495"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2012 15:52:12 -0700
Message-ID: <4FA45D9B.8020409@linux.intel.com>
Date: Fri, 04 May 2012 15:52:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<bf66597d441b73ad013875abb961f185cff2eaf7.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <bf66597d441b73ad013875abb961f185cff2eaf7.1335991900.git.raj.khem@gmail.com>
Subject: Re: [PATCH 5/7] openssl: Fix build for mips64(el)
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
X-List-Received-Date: Fri, 04 May 2012 23:02:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 01:53 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../openssl/openssl-1.0.0i/configure-targets.patch |   17 ++++++++---------
>   .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    2 +-
>   2 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
> index 6d23771..91b5502 100644
> --- a/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
> @@ -1,13 +1,12 @@
> -Upstream-Status: Inappropriate [embedded specific]
>
You removed the Upstream-Status:

and no Signed-off-by

Sau!

>   The number of colons are important :)
>
>
> -Index: openssl-1.0.0a/Configure
> +Index: openssl-1.0.0h/Configure
>   ===================================================================
> ---- openssl-1.0.0a.orig/Configure
> -+++ openssl-1.0.0a/Configure
> -@@ -380,6 +380,22 @@ my %table=(
> +--- openssl-1.0.0h.orig/Configure	2012-04-23 09:16:09.521511921 -0700
> ++++ openssl-1.0.0h/Configure	2012-04-23 09:17:41.829516389 -0700
> +@@ -380,6 +380,22 @@
>    "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
>    "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
>
> @@ -22,10 +21,10 @@ Index: openssl-1.0.0a/Configure
>   +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
>   +
>   +#### Linux on MIPS/MIPS64
> -+"linux-mips","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-mips64","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-mips","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-mips64","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
>   +
>    #### *BSD [do see comment about ${BSDthreads} above!]
>    "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
> index 68b092f..ca15a38 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
> @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
>
>   CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>


