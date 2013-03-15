Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UGO0d-000683-8t
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 07:21:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 23:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,849,1355126400"; d="scan'208";a="271172002"
Received: from unknown (HELO [10.255.13.217]) ([10.255.13.217])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2013 23:04:09 -0700
Message-ID: <5142B9D7.8030008@linux.intel.com>
Date: Thu, 14 Mar 2013 23:04:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
	<21cb8554fe94a484af046b522aba56321ebf90f5.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <21cb8554fe94a484af046b522aba56321ebf90f5.1363283478.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/17] tzdata: Upgrade to v2013a
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
X-List-Received-Date: Fri, 15 Mar 2013 06:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2013 10:55 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../tzdata/{tzdata_2012j.bb => tzdata_2013a.bb}    |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013a.bb} (98%)
>
Radu,

There has been another patch on the list to update this to 2013b, please 
try to track this list also.

Thanks
	Sau!

> diff --git a/meta/recipes-extended/tzdata/tzdata_2012j.bb b/meta/recipes-extended/tzdata/tzdata_2013a.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2012j.bb
> rename to meta/recipes-extended/tzdata/tzdata_2013a.bb
> index 25220cc..2543ca0 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2012j.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2013a.bb
> @@ -5,7 +5,7 @@ LICENSE = "PD"
>   LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
>   DEPENDS = "tzcode-native"
>
> -PR = "r3"
> +PR = "r0"
>
>   inherit allarch
>
> @@ -16,8 +16,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
>
>   SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
>
> -SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
> -SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
> +SRC_URI[tzdata.md5sum] = "2a9b3208ed91652dd554e4d104662e67"
> +SRC_URI[tzdata.sha256sum] = "ed9f273f52d5df9ec09fdcf6684176bbdc86d0fbafcbc27b97e5a9c103024afc"
>
>   S = "${WORKDIR}"
>
>


