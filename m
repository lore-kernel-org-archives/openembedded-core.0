Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsJV-0007xo-Ls
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:02:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2012 13:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134549771"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2012 13:53:09 -0700
Message-ID: <4F9B0735.4060704@linux.intel.com>
Date: Fri, 27 Apr 2012 13:53:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335350660-4043-1-git-send-email-mpnorman@gmail.com>
In-Reply-To: <1335350660-4043-1-git-send-email-mpnorman@gmail.com>
Subject: Re: [PATCH v2] uclibc SDK not including libpthread_nonshared.a
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
X-List-Received-Date: Fri, 27 Apr 2012 21:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2012 03:44 AM, Mark Norman wrote:
> Modified the uclibc PACKAGES list order to ensure the uclibc-dev package is
> processed before uclibc-staticdev to allow *_nonshared.a libraries to be
> packaged in the uclibc-dev package.  The *_nonshared.a libraries are required
> by the SDK.
> ---
>   meta/recipes-core/uclibc/uclibc.inc |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 893d8fd..f5b6bf7 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -13,7 +13,7 @@ SECTION = "libs"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>   		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
>   file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
> -INC_PR = "r6"
> +INC_PR = "r7"
>
>   require uclibc-config.inc
>   STAGINGCC = "gcc-cross-intermediate"
> @@ -48,9 +48,9 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
>
>   INHIBIT_DEFAULT_DEPS = "1"
>
> -PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
> -PACKAGES =+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm"
> -PACKAGES =+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
> +# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
> +# *_nonshared.a libraries to be packaged in the uclibc-dev package.
> +PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
>
>   FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
>   FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"

Merged into OE-Core

Thanks
	Sau!



