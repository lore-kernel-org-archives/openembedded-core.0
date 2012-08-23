Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4ZVz-0007In-Kg
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 17:40:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2012 08:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,300,1344236400"; d="scan'208";a="184123807"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2012 08:28:03 -0700
Message-ID: <50364C03.30300@linux.intel.com>
Date: Thu, 23 Aug 2012 08:28:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1345709138.git.kai.kang@windriver.com>
	<55aeb8f8fd0cdce1c461c2c4f75026166e69e1dc.1345709138.git.kai.kang@windriver.com>
In-Reply-To: <55aeb8f8fd0cdce1c461c2c4f75026166e69e1dc.1345709138.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ltp_20120104: add rdepends
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
X-List-Received-Date: Thu, 23 Aug 2012 15:40:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 03:21 AM, Kang Kai wrote:
> [Yocto #2973]
>
> Add rdepends libaio to fix this defect.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/ltp/ltp_20120104.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20120104.bb b/meta/recipes-extended/ltp/ltp_20120104.bb
> index c82203a..f8119a7 100644
> --- a/meta/recipes-extended/ltp/ltp_20120104.bb
> +++ b/meta/recipes-extended/ltp/ltp_20120104.bb

Is this really correct for master?  I think this patch is for Denzil?

Will there be a patch for master?

Sau!

> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>   		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>   		"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
>              file://uclibc-getcontext.patch \
> @@ -28,6 +28,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
>   SRC_URI[md5sum] = "ac183bbdac67139f049b3755fda37179"
>   SRC_URI[sha256sum] = "11b149b821d709e3351ac66f028f1b0dd5337ee9073dc20019ccffdac42d5c2e"
>
> +RDEPENDS_${PN} += "libaio"
> +
>   export prefix = "/opt/ltp"
>   export exec_prefix = "/opt/ltp"
>
>


