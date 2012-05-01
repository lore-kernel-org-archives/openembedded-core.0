Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPI3M-0003VU-QS
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:44:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 11:34:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138820649"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 01 May 2012 11:34:16 -0700
Message-ID: <4FA02CA8.1090501@linux.intel.com>
Date: Tue, 01 May 2012 11:34:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335569869.git.peter.seebach@windriver.com>
	<8fd6ef92079e16fdf31fe8b6f3194df7a858ed71.1335569869.git.peter.seebach@windriver.com>
In-Reply-To: <8fd6ef92079e16fdf31fe8b6f3194df7a858ed71.1335569869.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 1/2] tune-sh4.inc: Fix spelling of big-endian feature set
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
X-List-Received-Date: Tue, 01 May 2012 18:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2012 04:51 PM, Peter Seebach wrote:
> In tune-sh3, tune-xscale, and tune-sh4, several FEATURES lines referred
> to nonexistent features like "sh3eb" when they should have referred to "sh3
> bigendian" or the like.  Caught by the TUNEVALID sanity check.
>
> Signed-off-by: Peter Seebach<peter.seebach@windriver.com>
> ---
>   meta/conf/machine/include/tune-sh3.inc    |    2 +-
>   meta/conf/machine/include/tune-sh4.inc    |    4 ++--
>   meta/conf/machine/include/tune-xscale.inc |    2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
> index 816c9c4..70bb10b 100644
> --- a/meta/conf/machine/include/tune-sh3.inc
> +++ b/meta/conf/machine/include/tune-sh3.inc
> @@ -11,7 +11,7 @@ TUNE_ARCH_tune-sh3 = "sh3"
>   TUNE_PKGARCH_tune-sh3 = "sh3"
>   PACKAGE_EXTRA_ARCHS_tune-sh3 = "sh sh3"
>
> -TUNE_FEATURES_tune-sh3eb = "sh3eb"
> +TUNE_FEATURES_tune-sh3eb = "sh3 bigendian"
>   TUNE_ARCH_tune-sh3eb = "sh3eb"
>   TUNE_PKGARCH_tune-sh3eb = "sh3eb"
>   PACKAGE_EXTRA_ARCHS_tune-sh3eb = "sheb sh3eb"
> diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
> index f971f23..00cfc3d 100644
> --- a/meta/conf/machine/include/tune-sh4.inc
> +++ b/meta/conf/machine/include/tune-sh4.inc
> @@ -18,7 +18,7 @@ TUNE_ARCH_tune-sh4 = "sh4"
>   TUNE_PKGARCH_tune-sh4 = "sh4"
>   PACKAGE_EXTRA_ARCHS_tune-sh4 = "sh sh4"
>
> -TUNE_FEATURES_tune-sh4eb = "sh4eb"
> +TUNE_FEATURES_tune-sh4eb = "sh4 bigendian"
>   TUNE_ARCH_tune-sh4eb = "sh4eb"
>   TUNE_PKGARCH_tune-sh4eb = "sh4eb"
>   PACKAGE_EXTRA_ARCHS_tune-sh4eb = "sheb sh4eb"
> @@ -28,7 +28,7 @@ TUNE_ARCH_tune-sh4a = "sh4"
>   TUNE_PKGARCH_tune-sh4a = "sh4a"
>   PACKAGE_EXTRA_ARCHS_tune-sh4a = "sh sh4 sh4a"
>
> -TUNE_FEATURES_tune-sh4aeb = "sh4aeb"
> +TUNE_FEATURES_tune-sh4aeb = "sh4a bigendian"
>   TUNE_ARCH_tune-sh4aeb = "sh4eb"
>   TUNE_PKGARCH_tune-sh4aeb = "sh4aeb"
>   PACKAGE_EXTRA_ARCHS_tune-sh4aeb = "sheb sh4eb sh4aeb"
> diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
> index 54f3727..80a3683 100644
> --- a/meta/conf/machine/include/tune-xscale.inc
> +++ b/meta/conf/machine/include/tune-xscale.inc
> @@ -10,7 +10,7 @@ TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
>   PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
>
>   AVAILTUNES += "xscale-be"
> -TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale-be"
> +TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
>   PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
>
>   # webkit-gtk has alignment issues with double instructions on armv5 so

Merged this patch into OE-Core

Thanks
	Sau!


