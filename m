Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYEQ-0005ab-PM
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:55:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2012 08:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="203964518"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2012 08:42:21 -0700
Message-ID: <5053505D.5030900@linux.intel.com>
Date: Fri, 14 Sep 2012 08:42:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
	<1347429555-32159-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1347429555-32159-2-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] runqemu: Explicitly specify MACHINE when calling bitbake
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
X-List-Received-Date: Fri, 14 Sep 2012 15:55:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 10:59 PM, Khem Raj wrote:
> When using runqemu with distros outside oe-core then
> MACHINE may not be there in local.conf so use the one
> thats available in environment of runqemu which is actually
> the correct one.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   scripts/runqemu |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index a3c3509..e843946 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -281,7 +281,7 @@ setup_tmpdir() {
>               exit 1; }
>
>           # We have bitbake in PATH, get OE_TMPDIR from bitbake
> -        OE_TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
> +        OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
>           if [ -z "$OE_TMPDIR" ]; then
>               echo "Error: this script needs to be run from your build directory,"
>               echo "or you need to explicitly set OE_TMPDIR in your environment"
>

Merged into OE-Core

Thanks
	Sau!



