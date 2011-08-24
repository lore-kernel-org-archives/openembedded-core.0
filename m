Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwMIm-0006KY-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 00:52:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2011 15:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,277,1312182000"; d="scan'208";a="44768600"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2011 15:47:16 -0700
Message-ID: <4E557F73.30901@linux.intel.com>
Date: Wed, 24 Aug 2011 15:47:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313772909.6733.306.camel@phil-desktop>
In-Reply-To: <1313772909.6733.306.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] mips32: add mips32el tuning
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
X-List-Received-Date: Wed, 24 Aug 2011 22:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 09:55 AM, Phil Blundell wrote:
> This makes building for little-endian mips32 slightly more convenient.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/conf/machine/include/tune-mips32.inc |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
> index 45792d8..4a5f0fa 100644
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ b/meta/conf/machine/include/tune-mips32.inc
> @@ -6,6 +6,9 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
>   TUNE_CONFLICTS[mips32] = "n64 n32"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
>
> -AVAILTUNES += "mips32"
> +AVAILTUNES += "mips32 mips32el"
>   TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
>   PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
> +TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
> +PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
> +

Merged into OE-Core

Thanks
	Sau!


