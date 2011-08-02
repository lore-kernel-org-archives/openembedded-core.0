Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoIVm-0007mC-3A
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:12:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2011 10:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="34703937"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 10:07:47 -0700
Message-ID: <4E382EE3.40609@linux.intel.com>
Date: Tue, 02 Aug 2011 10:07:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH 1/5] tune/arch-powerpc64: Fix typo with 64-bit TUNE_CCARGS handling
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
X-List-Received-Date: Tue, 02 Aug 2011 17:12:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 01:59 PM, Kumar Gala wrote:
> When figuring out how to set TUNE_CCARGS we should look for 'm64' not
> 'n64' in TUNE_FEATURES.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   .../machine/include/powerpc/arch-powerpc64.inc     |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index a99f18d..e55910c 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -1,6 +1,6 @@
>   TUNEVALID[m64] = "Power ELF64 standard ABI"
>   TUNE_CONFLICTS[m64] = "m32"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
>   TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
>
>   AVAILTUNES += "powerpc64 powerpc64-nf"

Merged into OE-Core

Thanks
	Sau!


