Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShgBF-00016K-Uz for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:08:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LBvPim022002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:57:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21414-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:57:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LBvH0H021995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:57:18 +0100
Message-ID: <1340279838.1640.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 12:57:18 +0100
In-Reply-To: <1340178971-6053-1-git-send-email-valentin.popa@intel.com>
References: <1340178971-6053-1-git-send-email-valentin.popa@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 21 Jun 2012 12:08:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-20 at 10:56 +0300, Valentin Popa wrote:
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>  .../disable_gpgconf_check.patch                    |    0
>  .../gpgme/{gpgme_1.3.1.bb => gpgme_1.3.2.bb}       |    8 ++++----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/gpgme/{gpgme-1.3.1 => gpgme-1.3.2}/disable_gpgconf_check.patch (100%)
>  rename meta/recipes-support/gpgme/{gpgme_1.3.1.bb => gpgme_1.3.2.bb} (83%)

Please could you rebase this against master as some other changes have
merged that cause this not to apply and also mention in the commit log
what the license change was please?

Cheers,

Richard

> diff --git a/meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
> similarity index 100%
> rename from meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch
> rename to meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
> diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
> similarity index 83%
> rename from meta/recipes-support/gpgme/gpgme_1.3.1.bb
> rename to meta/recipes-support/gpgme/gpgme_1.3.2.bb
> index 43d8aad..6529fe5 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
> @@ -5,19 +5,19 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
>  LICENSE = "GPLv2+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
> -                    file://src/gpgme.h.in;endline=23;md5=942b47052c0674c6a3b9b9e6127628a4 \
> +                    file://src/gpgme.h.in;endline=23;md5=00846fee29ec2a6f5c808bfe7fc24e65 \
>                      file://src/engine.h;endline=22;md5=e96acfaab1cff82dd8fbefddd2f5c436"
>  
>  SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
>             file://disable_gpgconf_check.patch"
>  
> -SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
> -SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
> +SRC_URI[md5sum] = "326fe97077141713f0930aa87949a287"
> +SRC_URI[sha256sum] = "cfd235663f1d1adc97abb38dd5e6d093bb7e155580f171f9ba0158feab69f875"
>  DEPENDS = "libgpg-error libassuan ${PTH}"
>  PTH_libc-uclibc = "npth"
>  PTH = "pth"
>  
> -PR = "r2"
> +PR = "r0"
>  
>  EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
>                  --with-gpg=${bindir}/gpg --without-gpgsm"




