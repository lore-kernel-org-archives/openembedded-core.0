Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGQj-0000ip-7d
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:55:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2012 08:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227327615"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2012 08:42:20 -0700
Message-ID: <506473DB.1030005@linux.intel.com>
Date: Thu, 27 Sep 2012 08:42:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348577690.31293.70.camel@phil-desktop>
In-Reply-To: <1348577690.31293.70.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Thu, 27 Sep 2012 15:55:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 05:54 AM, Phil Blundell wrote:
> Fixes the QA warnings:
>
> WARNING: QA Issue: non -staticdev package contains static .a library: util-linux-libblkid-dev path '/work/mips32el-oe-linux/util-linux/2.21.2-r3micro3/packages-split/util-linux-libblkid-dev/lib/libblkid.a'
> WARNING: QA Issue: non -staticdev package contains static .a library: util-linux-libuuid-dev path '/work/mips32el-oe-linux/util-linux/2.21.2-r3micro3/packages-split/util-linux-libuuid-dev/lib/libuuid.a'
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    4 ++--
>   meta/recipes-core/util-linux/util-linux_2.21.2.bb |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 2c5267f..b2a1552 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -57,9 +57,9 @@ FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
>   FILES_util-linux-uuidgen = "${bindir}/uuidgen"
>
>   FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
> -FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.a ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> +FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
>   FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
> -FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.a ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
> +FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>   FILES_util-linux-lscpu = "${bindir}/lscpu"
>
>   FILES_util-linux-fsck = "${base_sbindir}/fsck*"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index e8f00fc..792730c 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.21"
> -PR = "r3"
> +PR = "r4"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>

Merged into OE-Core

Thanks
	Sau!



