Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoIYl-0007qs-0M
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:15:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2011 10:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="34704935"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 10:10:52 -0700
Message-ID: <4E382F9C.8030004@linux.intel.com>
Date: Tue, 02 Aug 2011 10:10:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>	<1311886748-17637-2-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-3-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311886748-17637-3-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH 3/5] tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
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
X-List-Received-Date: Tue, 02 Aug 2011 17:15:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 01:59 PM, Kumar Gala wrote:
> Its more likely that we explicitly set soft-floating point support for a
> given target than hard.  So use 'fpu-soft' in TUNE_FEATURES rather than
> 'fpu-hard' to determine setting 'nf' (no-float) in PPCPKGSFX_FPU.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index 8cc76ab..013755d 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -18,7 +18,7 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>
>   ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
>
> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
> +PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
>
>   TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>

The next three in this series need more work, Richard has commented on 
this in the CONSOLIDATED pull thread.

Sau!


