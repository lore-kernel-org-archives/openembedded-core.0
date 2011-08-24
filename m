Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwMfj-0007Cy-Em
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:15:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2011 16:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,278,1312182000"; d="scan'208";a="42127552"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 16:10:59 -0700
Message-ID: <4E558502.7050602@linux.intel.com>
Date: Wed, 24 Aug 2011 16:10:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314138450.git.josh@linux.intel.com>
	<917b8ba7acc5c7f3e0f3e604d7f761635b5aeb90.1314138450.git.josh@linux.intel.com>
In-Reply-To: <917b8ba7acc5c7f3e0f3e604d7f761635b5aeb90.1314138450.git.josh@linux.intel.com>
Subject: Re: [PATCH 1/1] libtasn1: update SRC_URI
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
X-List-Received-Date: Wed, 24 Aug 2011 23:15:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2011 03:33 PM, Joshua Lock wrote:
> libtasn is no longer hosted as a sub-project of gnutls, it has its ftp
> directory.
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   meta/recipes-support/gnutls/libtasn1_2.9.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/gnutls/libtasn1_2.9.bb b/meta/recipes-support/gnutls/libtasn1_2.9.bb
> index 63bb3c8..9a80005 100644
> --- a/meta/recipes-support/gnutls/libtasn1_2.9.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_2.9.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>
>   PR = "r0"
>
> -SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
> +SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
>
>   SRC_URI[md5sum] = "f4f4035b84550100ffeb8ad4b261dea9"
>   SRC_URI[sha256sum] = "fac46855fac8b08cf6f5a1b60cebad8e090bac1f06c335a044e84110d0b412c4"

Merged into OE-Core

Thanks
	Sau!


