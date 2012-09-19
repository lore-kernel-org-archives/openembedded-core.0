Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEORF-0003FO-Q0
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:51:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 10:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,450,1344236400"; d="scan'208";a="194944930"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 10:39:11 -0700
Message-ID: <505A033E.3060107@linux.intel.com>
Date: Wed, 19 Sep 2012 10:39:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.co.uk>
References: <2145007.czf2bJ2Tzi@helios>
	<1347539241-594-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1347539241-594-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] local.conf.sample: change valgrind support architecture comment
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
X-List-Received-Date: Wed, 19 Sep 2012 17:51:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 05:27 AM, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> The comment for debug-tools states valgrind will only be installed for x86
> targets. This is not true as valgrind now supports x86*, PPC* and ARMv7a;
> delete the comment as the architecture support is now so varied.
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   meta/conf/local.conf.sample | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 5679c03..04d947f 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -119,7 +119,7 @@ PACKAGE_CLASSES ?= "package_ipk"
>   #                     (useful if you want to develop against libs in the image)
>   #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
>   #  "tools-debug"    - add debugging tools (gdb, strace)
> -#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
> +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
>   #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
>   #  "debug-tweaks"   - make an image suitable for development
>   #                     e.g. ssh root access has a blank password
>

Merged into OE-Core

Thanks
	Sau!



