Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UB52h-0002MI-8U
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 16:05:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Feb 2013 06:48:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="297216803"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2013 06:48:43 -0800
Message-ID: <512F6E4A.6060909@linux.intel.com>
Date: Thu, 28 Feb 2013 06:48:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1362056140-22877-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1362056140-22877-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gmp: updated to 5.1.0a
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
X-List-Received-Date: Thu, 28 Feb 2013 15:05:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2013 04:55 AM, Bogdan Marinescu wrote:
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   meta/recipes-support/gmp/gmp.inc      |    4 +++-
>   meta/recipes-support/gmp/gmp_5.1.0.bb |    6 +++---
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
> index 823811f..709d8c4 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -3,7 +3,9 @@ DESCRIPTION = "GNU multiprecision arithmetic library"
>   HOMEPAGE = "http://gmplib.org/"
>   LICENSE = "GPLv3 LGPLv3"
>
> -SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}.tar.bz2 \
> +REVISION = "a"
> +
> +SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}${REVISION}.tar.bz2 \
>   	   file://configure.patch \
>   	   file://amd64.patch "
>
> diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support/gmp/gmp_5.1.0.bb
> index 6591ebe..7ffba24 100644
> --- a/meta/recipes-support/gmp/gmp_5.1.0.bb
> +++ b/meta/recipes-support/gmp/gmp_5.1.0.bb
> @@ -3,7 +3,7 @@ LICENSE="LGPLv3&GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>   		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
>
> -PR = "r1"
> +PR = "r2"
>
Why the PR Bump, the idea with PR Server is to get rid of these.

Sau!

>   SRC_URI_append = " file://use-includedir.patch \
>                      file://gmp_fix_for_x32.patch \
> @@ -11,5 +11,5 @@ SRC_URI_append = " file://use-includedir.patch \
>                      file://obsolete_automake_macros.patch \
>                      "
>
> -SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
> -SRC_URI[sha256sum] = "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a3181164ad2fad5eefc796"
> +SRC_URI[md5sum] = "cf6d7cb5915f29ce0fc41d042205c080"
> +SRC_URI[sha256sum] = "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb05ca9bccd990794dc"
>


