Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yWC-0002Bx-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:22:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2012 11:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190926785"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 11:09:55 -0700
Message-ID: <5037C373.3020701@linux.intel.com>
Date: Fri, 24 Aug 2012 11:09:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] runqemu: Honor KERNEL and ROOTFS settings from environment
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
X-List-Received-Date: Fri, 24 Aug 2012 18:22:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 10:59 AM, Khem Raj wrote:
> Expand the usage to be able to specify KERNEL and ROOTFS
> on commandline. This helps in using the script for booting
> images that are essentially not part of OE-Core
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   scripts/runqemu |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 90998ae..290f9cc 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -54,9 +54,9 @@ error() {
>   }
>
>   MACHINE=${MACHINE:=""}
> -KERNEL=""
> +KERNEL=${KERNEL:=""}
> +ROOTFS=${ROOTFS:=""}
>   FSTYPE=""
> -ROOTFS=""
>   LAZY_ROOTFS=""
>   SCRIPT_QEMU_OPT=""
>   SCRIPT_QEMU_EXTRA_OPT=""
>

Merged this along with 2 others, did not merge the the CC/KERNEL_CC change.

Thanks
	Sau!



