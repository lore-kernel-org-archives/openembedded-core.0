Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnwgt-0000uh-Vc
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:54:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2011 10:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="33903536"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2011 10:49:48 -0700
Message-ID: <4E36E73C.3050705@linux.intel.com>
Date: Mon, 01 Aug 2011 10:49:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311889627-28232-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311889627-28232-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] tune-ppce500mc: Adjust PowerPC e500mc tune file	to correctly set hard fpu.
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
X-List-Received-Date: Mon, 01 Aug 2011 17:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 02:47 PM, Kumar Gala wrote:
> From: Malcolm Crossley<malcolm.crossley@ge.com>
>
> Signed-off-by: Malcolm Crossley<malcolm.crossley@ge.com>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/conf/machine/include/tune-ppce500mc.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
> index a4cdb1f..73217dd 100644
> --- a/meta/conf/machine/include/tune-ppce500mc.inc
> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
> @@ -7,5 +7,5 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc
>   TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
>
>   AVAILTUNES += "ppce500mc"
> -TUNE_FEATURES_tune-ppce500mc = "m32 hard-fpu ppce500mc"
> +TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
>   PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"

Merged into OE-Core

Thanks
	Sau!


