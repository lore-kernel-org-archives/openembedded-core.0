Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjBx3-0007ra-1c
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:15:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jun 2012 09:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160439799"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by azsmga001.ch.intel.com with ESMTP; 25 Jun 2012 09:04:52 -0700
Message-ID: <4FE88C24.9090302@linux.intel.com>
Date: Mon, 25 Jun 2012 09:04:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340368073-7078-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1340368073-7078-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] gpgme: updated to 1.3.2
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
X-List-Received-Date: Mon, 25 Jun 2012 16:15:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 05:27 AM, Valentin Popa wrote:
> Licence update: the same licence and new copyright years added
>
> Signed-off-by: Valentin Popa<valentin.popa@intel.com>
> ---
>   .../disable_gpgconf_check.patch                    |    0
>   .../gpgme/{gpgme_1.3.1.bb =>  gpgme_1.3.2.bb}       |    8 ++++----
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-support/gpgme/{gpgme-1.3.1 =>  gpgme-1.3.2}/disable_gpgconf_check.patch (100%)
>   rename meta/recipes-support/gpgme/{gpgme_1.3.1.bb =>  gpgme_1.3.2.bb} (83%)
>
> diff --git a/meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
> similarity index 100%
> rename from meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch
> rename to meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
> diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
> similarity index 83%
> rename from meta/recipes-support/gpgme/gpgme_1.3.1.bb
> rename to meta/recipes-support/gpgme/gpgme_1.3.2.bb
> index 949a24c..b3c1d46 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
> @@ -5,19 +5,19 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
>   LICENSE = "GPLv2+&  LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                       file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
> -                    file://src/gpgme.h.in;endline=23;md5=942b47052c0674c6a3b9b9e6127628a4 \
> +                    file://src/gpgme.h.in;endline=23;md5=00846fee29ec2a6f5c808bfe7fc24e65 \
>                       file://src/engine.h;endline=22;md5=e96acfaab1cff82dd8fbefddd2f5c436"
>
>   SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
>              file://disable_gpgconf_check.patch"
>
> -SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
> -SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
> +SRC_URI[md5sum] = "326fe97077141713f0930aa87949a287"
> +SRC_URI[sha256sum] = "cfd235663f1d1adc97abb38dd5e6d093bb7e155580f171f9ba0158feab69f875"
>   DEPENDS = "libgpg-error libassuan ${PTH}"
>   PTH_libc-uclibc = "npth"
>   PTH = "pth"
>
> -PR = "r3"
> +PR = "r0"
>
>   EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
>                   --with-gpg=${bindir}/gpg --without-gpgsm"

Merged into OE-Core

Thanks
	Sau!


