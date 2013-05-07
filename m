Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UZo5k-0003WQ-Fy
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 22:02:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2013 12:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,629,1363158000"; d="scan'208";a="333366687"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2013 12:44:23 -0700
Message-ID: <51895996.1030101@linux.intel.com>
Date: Tue, 07 May 2013 12:44:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1367922876-26933-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1367922876-26933-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mpfr: upgraded to 3.1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 20:02:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2013 03:34 AM, Bogdan Marinescu wrote:
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   .../mpfr/{mpfr-3.1.1 => mpfr-3.1.2}/long-long-thumb.patch      |    0
>   meta/recipes-support/mpfr/{mpfr_3.1.1.bb => mpfr_3.1.2.bb}     |    8 ++++----
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-support/mpfr/{mpfr-3.1.1 => mpfr-3.1.2}/long-long-thumb.patch (100%)
>   rename meta/recipes-support/mpfr/{mpfr_3.1.1.bb => mpfr_3.1.2.bb} (59%)
>
> diff --git a/meta/recipes-support/mpfr/mpfr-3.1.1/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr-3.1.2/long-long-thumb.patch
> similarity index 100%
> rename from meta/recipes-support/mpfr/mpfr-3.1.1/long-long-thumb.patch
> rename to meta/recipes-support/mpfr/mpfr-3.1.2/long-long-thumb.patch
> diff --git a/meta/recipes-support/mpfr/mpfr_3.1.1.bb b/meta/recipes-support/mpfr/mpfr_3.1.2.bb
> similarity index 59%
> rename from meta/recipes-support/mpfr/mpfr_3.1.1.bb
> rename to meta/recipes-support/mpfr/mpfr_3.1.2.bb
> index 7f34e71..2c2aaf3 100644
> --- a/meta/recipes-support/mpfr/mpfr_3.1.1.bb
> +++ b/meta/recipes-support/mpfr/mpfr_3.1.2.bb
> @@ -3,14 +3,14 @@ LICENSE="GPLv3&LGPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>   		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
>   DEPENDS = "gmp"
> -PR = "r0"
>
> -SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
> +SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
>              file://long-long-thumb.patch \
>              "
>
> -SRC_URI[md5sum] = "e90e0075bb1b5f626c6e31aaa9c64e3b"
> -SRC_URI[sha256sum] = "7b66c3f13dc8385f08264c805853f3e1a8eedab8071d582f3e661971c9acd5fd"
> +SRC_URI[md5sum] = "ee2c3ac63bf0c2359bf08fc3ee094c19"
> +SRC_URI[sha256sum] = "79c73f60af010a30a5c27a955a1d2d01ba095b72537dab0ecaad57f5a7bb1b6b"
> +

My local test comes up with a different set of check-sums then these.

Can you please verify.

Thanks
	Sau!



>   S = "${WORKDIR}/mpfr-${PV}"
>
>   BBCLASSEXTEND = "native nativesdk"
>


