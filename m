Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozHD-0003Ss-LC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:51:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 07:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="34412072"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 07:47:35 -0700
Message-ID: <4E3AB107.6040502@linux.intel.com>
Date: Thu, 04 Aug 2011 07:47:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312193778-26396-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1312193778-26396-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] bison: Add dependency on flex-native
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
X-List-Received-Date: Thu, 04 Aug 2011 14:51:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2011 03:16 AM, Noor, Ahsan wrote:
> * This is 0479b70418ef553859029911c57c63a7aaebe299 from OE. flex-native is needed to build bison. The dependency was being satisfied indirectly but we need to add it explicitly.
>
> Signed-off-by: Noor, Ahsan<noor_ahsan@mentor.com>
> ---
>   meta/recipes-devtools/bison/bison_2.3.bb |    4 ++--
>   meta/recipes-devtools/bison/bison_2.5.bb |    4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
> index 22f884b..388476b 100644
> --- a/meta/recipes-devtools/bison/bison_2.3.bb
> +++ b/meta/recipes-devtools/bison/bison_2.3.bb
> @@ -7,9 +7,9 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>   SECTION = "devel"
> -DEPENDS = "bison-native"
> +DEPENDS = "bison-native flex-native"
>
> -PR = "r0"
> +PR = "r1"
>
>   BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
>            file://bison-2.3_m4.patch"
> diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
> index 63f4e76..eb5d87c 100644
> --- a/meta/recipes-devtools/bison/bison_2.5.bb
> +++ b/meta/recipes-devtools/bison/bison_2.5.bb
> @@ -7,9 +7,9 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   SECTION = "devel"
> -DEPENDS = "bison-native"
> +DEPENDS = "bison-native flex-native"
>
> -PR = "r0"
> +PR = "r1"
>
>   BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
>   	   file://m4.patch \

Merged into OE-Core

Thanks
	Sau!


