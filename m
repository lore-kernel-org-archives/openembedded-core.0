Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVG9d-0007JY-Hb
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 07:55:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 May 2012 22:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144722176"
Received: from unknown (HELO [10.255.13.133]) ([10.255.13.133])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 22:45:04 -0700
Message-ID: <4FB5E1DE.7080309@linux.intel.com>
Date: Fri, 18 May 2012 08:45:02 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337176070-16359-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1337176070-16359-1-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH] gnupg: Update to upstream version 2.0.19
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
X-List-Received-Date: Fri, 18 May 2012 05:55:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2012 04:47 PM, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>
> ---
>   .../gnupg/{gnupg_2.0.18.bb =>  gnupg_2.0.19.bb}     |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/gnupg/{gnupg_2.0.18.bb =>  gnupg_2.0.19.bb} (81%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
> similarity index 81%
> rename from meta/recipes-support/gnupg/gnupg_2.0.18.bb
> rename to meta/recipes-support/gnupg/gnupg_2.0.19.bb
> index 3085494..1d19fe3 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.0.18.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
> @@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
>                       file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
>
>   DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
> -PR = "r1"
> +PR = "r0"
>
>   inherit autotools gettext
>
>   SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
>
> -SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
> -SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
> +SRC_URI[md5sum] = "6a8589381ca1b0c1a921e9955f42b016"
> +SRC_URI[sha256sum] = "efa23a8a925adb51c7d3b708c25b6d000300f5ce37de9bdec6453be7b419c622"
>
>   EXTRA_OECONF = "--disable-ldap \
>   		--with-zlib=${STAGING_LIBDIR}/.. \
Merged into OE-Core

Thanks
	Sau!


