Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnw2i-0000Cn-0x
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:12:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 10:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="34310872"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 10:08:10 -0700
Message-ID: <4E36DD7A.1040007@linux.intel.com>
Date: Mon, 01 Aug 2011 10:08:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311865616.30326.450.camel@phil-desktop>
In-Reply-To: <1311865616.30326.450.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] tune-cortex{m1, m3, r4}: correct spelling of "cortex"
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
X-List-Received-Date: Mon, 01 Aug 2011 17:12:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 08:06 AM, Phil Blundell wrote:
> Otherwise the test in TUNE_CCARGS will never match.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/conf/machine/include/tune-cortexm1.inc |    2 +-
>   meta/conf/machine/include/tune-cortexm3.inc |    2 +-
>   meta/conf/machine/include/tune-cortexr4.inc |    3 +--
>   3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
> index 493025d..3eecd5b 100644
> --- a/meta/conf/machine/include/tune-cortexm1.inc
> +++ b/meta/conf/machine/include/tune-cortexm1.inc
> @@ -6,6 +6,6 @@ TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", "-mtune=cortex-m1", "", d)}"
>
>   AVAILTUNES += "cortexm1"
> -TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} coretexm1"
> +TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} cortexm1"
>   PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
>
> diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
> index f774fa6..85408eb 100644
> --- a/meta/conf/machine/include/tune-cortexm3.inc
> +++ b/meta/conf/machine/include/tune-cortexm3.inc
> @@ -10,6 +10,6 @@ TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7m", "-march=armv7-m", "", d)}"
>
>   AVAILTUNES += "cortexm3"
> -TUNE_FEATURES_tune-cortexm3 = "armv7m vfp coretexm3"
> +TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
>   PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m"
>
> diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
> index 738f5af..8d2459f 100644
> --- a/meta/conf/machine/include/tune-cortexr4.inc
> +++ b/meta/conf/machine/include/tune-cortexr4.inc
> @@ -10,6 +10,5 @@ TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-m", "", d)}"
>
>   AVAILTUNES += "cortexr4"
> -TUNE_FEATURES_tune-cortexr4 = "armv7r vfp coretexr4"
> +TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
>   PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r"
> -

Merged into OE-Core

Thanks
	Sau!


