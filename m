Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcaA-0007po-Em
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:16:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2012 11:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156855865"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 11:06:02 -0700
Message-ID: <4FBE788A.3000303@linux.intel.com>
Date: Thu, 24 May 2012 11:06:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337757650-14163-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1337757650-14163-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] gawk: update to 4.0.1
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
X-List-Received-Date: Thu, 24 May 2012 18:16:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 12:20 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan<radu.moisan@intel.com>
> ---
>   .../gawk/{gawk_4.0.0.bb =>  gawk_4.0.1.bb}          |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-extended/gawk/{gawk_4.0.0.bb =>  gawk_4.0.1.bb} (86%)
>
> diff --git a/meta/recipes-extended/gawk/gawk_4.0.0.bb b/meta/recipes-extended/gawk/gawk_4.0.1.bb
> similarity index 86%
> rename from meta/recipes-extended/gawk/gawk_4.0.0.bb
> rename to meta/recipes-extended/gawk/gawk_4.0.1.bb
> index 977feb9..b986ebd 100644
> --- a/meta/recipes-extended/gawk/gawk_4.0.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_4.0.1.bb
> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   RDEPENDS_gawk += "gawk-common"
>   RDEPENDS_pgawk += "gawk-common"
> -PR = "r1"
> +PR = "r0"
>
>   SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "51e417b71287629940051e6f652c6492"
> -SRC_URI[sha256sum] = "c3a7cf7d976e05c6a1d8a9b3f14fa55d4304707408ddafb1396212653ea00be5"
> +SRC_URI[md5sum] = "bab2bda483e9f32be65b43b8dab39fa5"
> +SRC_URI[sha256sum] = "476dee8bea8bc3b04af5cae502b83ea16edd5b703d20418918f8773889d78c80"
>
>   inherit autotools gettext update-alternatives
>
Merged into OE-Core

Thanks
	Sau!



