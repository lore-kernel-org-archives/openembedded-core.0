Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTIn1-0006eA-Bl
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 20:47:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Nov 2011 11:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,560,1315206000"; d="scan'208";a="88614052"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 23 Nov 2011 11:40:52 -0800
Message-ID: <4ECD4C44.6040304@linux.intel.com>
Date: Wed, 23 Nov 2011 11:40:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
	<55c010c4a80f08a97654dadacdcca3fce4474292.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <55c010c4a80f08a97654dadacdcca3fce4474292.1322028165.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 7/9] directfb-examples: add package directfb-examples to OE-core
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
X-List-Received-Date: Wed, 23 Nov 2011 19:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 10:48 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Add this package for checking whether directfb run rightly or not.
> It also is an useful tool to test directfb.
>
> [YOCTO #1674]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../directfb/directfb-examples_1.2.0.bb            |   18 ++++++++++++++++++
>   1 files changed, 18 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
>
> diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
> new file mode 100644
> index 0000000..08cdc8f
> --- /dev/null
> +++ b/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "DirectFB extra providers"
Not very descriptive, please include more details, if needed add s 
SUMMARY line also that is a brief one liner.

> +DEPENDS = "directfb"
> +SECTION = "libs"
> +LICENSE = "GPL"
Which GPL?  Please include Version such as GPLv2

Sau!

> +PR = "r0"
> +
> +SRC_URI = " \
> +           http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
> +
> +S = "${WORKDIR}/DirectFB-examples-${PV}"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] = "ce018f681b469a1d72ffc32650304b98"
> +SRC_URI[sha256sum] = "830a1bd6775d8680523596a88a72fd8e4c6a74bf886d3e169b06d234a5cf7e3e"


