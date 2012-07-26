Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTcm-0008Af-Vm
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:21:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 12:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127288243"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 12:09:56 -0700
Message-ID: <50119604.2080608@linux.intel.com>
Date: Thu, 26 Jul 2012 12:09:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343198559-3548-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1343198559-3548-1-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH] libpcre: upgrade to ver. 8.31
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
X-List-Received-Date: Thu, 26 Jul 2012 19:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2012 11:42 PM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../libpcre/{libpcre_8.30.bb => libpcre_8.31.bb}   |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/libpcre/{libpcre_8.30.bb => libpcre_8.31.bb} (93%)
>
> diff --git a/meta/recipes-support/libpcre/libpcre_8.30.bb b/meta/recipes-support/libpcre/libpcre_8.31.bb
> similarity index 93%
> rename from meta/recipes-support/libpcre/libpcre_8.30.bb
> rename to meta/recipes-support/libpcre/libpcre_8.31.bb
> index 4c6dfae..e1dad8b 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.30.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.31.bb
> @@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular expressions \
>   themselves still follow Perl syntax and semantics. The header file for \
>   the POSIX-style functions is called pcreposix.h."
>   SECTION = "devel"
> -PR = "r2"
> +PR = "r0"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
>   SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
>              file://pcre-cross.patch \
>              file://fix-pcre-name-collision.patch"
>
> -SRC_URI[md5sum] = "98e8928cccc945d04279581e778fbdff"
> -SRC_URI[sha256sum] = "c1113fd7db934e97ad8b3917d432e5b642e9eb9afd127eb797804937c965f4ac"
> +SRC_URI[md5sum] = "1c9a276af932b5599157f96e945391f0"
> +SRC_URI[sha256sum] = "5778a02535473c7ee7838ea598c19f451e63cf5eec0bf0307a688301c9078c3c"
>
>   S = "${WORKDIR}/pcre-${PV}"
>
>

Merged into OE-Core

Thanks
	Sau!


