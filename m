Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTtL-0000Id-Mi
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:38:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2012 12:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171881881"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 12:26:54 -0700
Message-ID: <501199FE.4090603@linux.intel.com>
Date: Thu, 26 Jul 2012 12:26:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/3] qemu.bbclass: Map the qemu binary name for powerpc64
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
X-List-Received-Date: Thu, 26 Jul 2012 19:38:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2012 04:54 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/qemu.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 68896ce..aead8e2 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -9,5 +9,7 @@ def qemu_target_binary(data):
>           target_arch = "i386"
>       elif target_arch == "powerpc":
>           target_arch = "ppc"
> +    elif target_arch == "powerpc64":
> +        target_arch = "ppc64"
>
>       return "qemu-" + target_arch
>
Merged into OE-Core

Thanks
	Sau!



