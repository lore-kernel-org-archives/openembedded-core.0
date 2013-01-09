Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tt0g5-0004b9-Ie
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 19:47:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2013 10:31:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,439,1355126400"; d="scan'208";a="244171688"
Received: from unknown (HELO [10.255.14.147]) ([10.255.14.147])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2013 10:31:47 -0800
Message-ID: <50EDB793.7080202@linux.intel.com>
Date: Wed, 09 Jan 2013 10:31:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1301091312270.14396@oneiric>
In-Reply-To: <alpine.DEB.2.02.1301091312270.14396@oneiric>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Suggest parallelism of twice the number of cores.
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
X-List-Received-Date: Wed, 09 Jan 2013 18:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 10:14 AM, Robert P. J. Day wrote:
>
> To be consistent with the Yocto Quick Start Guide, recommend that
> parallelism represent twice the number of cores on a multi-core
> machine.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 859eb93..46187ce 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -24,9 +24,9 @@
>   #
>   #PARALLEL_MAKE = "-j 4"
>   #
> -# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
> -# be appropriate for example.
> -
> +# If you have a multi-core machine, you would normally set both of these variables
> +# to twice the number of cores.  So for a quad-core machine, it would be appropriate
> +# to set BB_NUMBER_THREADS = "8" and PARALLEL_MAKE = "-j 8".

I think adding a note to ensure that hyperthreading is enabled would be 
appropriate, then number of threads = number of hyperthreaded cores (4 
vs 8).

Sau!

>   #
>   # Machine Selection
>   #
>


