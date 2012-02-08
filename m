Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ruypl-00053n-8T
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:08:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2012 20:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105149507"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 20:00:34 -0800
Message-ID: <4F31F362.7040201@linux.intel.com>
Date: Tue, 07 Feb 2012 20:00:34 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F2A88F2.60906@opendreambox.org>
In-Reply-To: <4F2A88F2.60906@opendreambox.org>
Subject: Re: [PATCH] tune-mips32.inc: Add mips32-nf and mips32el-nf
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
X-List-Received-Date: Wed, 08 Feb 2012 04:08:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2012 05:00 AM, Andreas Oberritter wrote:
> tune-mips32.inc only lists mips32 CPUs with hardware FPU.
> Extend it to list CPUs without hardware FPU, too.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/conf/machine/include/tune-mips32.inc |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
> index 4a5f0fa..45d865e 100644
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ b/meta/conf/machine/include/tune-mips32.inc
> @@ -6,9 +6,13 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
>   TUNE_CONFLICTS[mips32] = "n64 n32"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
>
> -AVAILTUNES += "mips32 mips32el"
> +AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
>   TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
>   PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
>   TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
>   PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
> +TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
> +PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf"
> +TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
> +PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf"
>

Merged into OE-core

Thanks
	Sau!


