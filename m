Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UFB0Z-00023P-9s
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 23:15:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Mar 2013 14:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="268831145"
Received: from unknown (HELO [10.255.13.68]) ([10.255.13.68])
	by azsmga001.ch.intel.com with ESMTP; 11 Mar 2013 14:59:11 -0700
Message-ID: <513E53AE.1030005@linux.intel.com>
Date: Mon, 11 Mar 2013 14:59:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Alex DAMIAN <alexandru.damian@intel.com>
References: <1362757528-9240-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1362757528-9240-1-git-send-email-alexandru.damian@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] dpkg depends on ncurses
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
X-List-Received-Date: Mon, 11 Mar 2013 22:16:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Missing Signed-off for both of these patches.

Sau!


On 03/08/2013 07:45 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> Dpkg compilation depends on the ncurses, so add
> this dependency.
> ---
>   meta/recipes-devtools/dpkg/dpkg.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index 0bc1ae8..cdecd19 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -7,7 +7,7 @@ INC_PR = "r19"
>   SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
>              file://ignore_extra_fields.patch"
>
> -DEPENDS = "zlib bzip2 perl"
> +DEPENDS = "zlib bzip2 perl ncurses"
>   DEPENDS_class-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
>   RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
>   RDEPENDS_${PN}_class-native = ""
>


