Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHMAr-0000Kc-8W
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:30:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Apr 2012 14:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139624853"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2012 14:21:39 -0700
Message-ID: <4F8352E3.1040902@linux.intel.com>
Date: Mon, 09 Apr 2012 14:21:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333693070.git.lianhao.lu@intel.com>
	<af03fd7f8452c7795fce23e3276e456dc431266f.1333693070.git.lianhao.lu@intel.com>
In-Reply-To: <af03fd7f8452c7795fce23e3276e456dc431266f.1333693070.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 1/1] connman: ensure ofono package is generated.
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
X-List-Received-Date: Mon, 09 Apr 2012 21:30:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 11:20 PM, Lianhao Lu wrote:
> Make sure ofono package is generated when buidling connman, because
> dynamic package connman-plugin-ofono has a RDEPENDS on ofono.
>
Since this is for a plugin, can the connman-plugin-ofono be generated in 
a separate package (or possibly even a separate recipe that depends on 
ofono, instead of making connman depend on ofono, I am not sure the 
solution below is correct either.

Sau!

> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 1a6dd1b..3ed5667 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -39,6 +39,8 @@ EXTRA_OECONF += "\
>       --disable-ntpd \
>   "
>
> +do_package[depends] = "${MLPREFIX}ofono:do_package"
> +
>   INITSCRIPT_NAME = "connman"
>   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>


