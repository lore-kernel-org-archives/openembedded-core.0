Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0416ACA0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 04:14:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2014 21:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,623,1400050800"; d="scan'208";a="569749421"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2014 21:14:25 -0700
Message-ID: <53BB7021.4010803@linux.intel.com>
Date: Mon, 07 Jul 2014 21:14:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1404747336.git.cristian.iorga@intel.com>
	<4a54173d68bf7ba1534816aec71c592b6622ccd2.1404747336.git.cristian.iorga@intel.com>
In-Reply-To: <4a54173d68bf7ba1534816aec71c592b6622ccd2.1404747336.git.cristian.iorga@intel.com>
Subject: Re: [PATCH 2/2] ofono: upgrade to 1.15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jul 2014 04:14:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2014 08:36 AM, Cristian Iorga wrote:
> Bug fixes;
> Add support for Handsfree subscriber number feature;
> Add support for Handsfree multiple DTMF characters;
> Add support for PAP authentication.
>

This update appears to start using python3 for the -tests packages, I 
think it's best to see if we can not rely on Python3 if we can.

Sau!

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>   rename meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} (50%)
>
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.14.bb b/meta/recipes-connectivity/ofono/ofono_1.15.bb
> similarity index 50%
> rename from meta/recipes-connectivity/ofono/ofono_1.14.bb
> rename to meta/recipes-connectivity/ofono/ofono_1.15.bb
> index dea5d88..8462a28 100644
> --- a/meta/recipes-connectivity/ofono/ofono_1.14.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_1.15.bb
> @@ -1,13 +1,11 @@
>   require ofono.inc
>
> -PR = "r1"
> -
>   SRC_URI  = "\
>     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>     file://ofono \
>   "
>
> -SRC_URI[md5sum] = "8bc398d86642408cc71d039f59c61538"
> -SRC_URI[sha256sum] = "84d28d37cbc47129628a78bf3e17323af1636dceb2494511dd44caa829fb277f"
> +SRC_URI[md5sum] = "4d03de85239d8100dc7721bf0dad2bd2"
> +SRC_URI[sha256sum] = "978807a05e8904eb4e57d6533ed71e75676a55fa3819a39fe2c878f45dbf7af6"
>
>   CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>

