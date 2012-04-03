Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFBQ8-00040m-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 23:37:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2012 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149298911"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2012 14:28:17 -0700
Message-ID: <4F7B6B71.6000404@linux.intel.com>
Date: Tue, 03 Apr 2012 14:28:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1203230535060.23552@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203230535060.23552@oneiric>
Subject: Re: [PATCH] Suggested threads should be double the number of cores.
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
X-List-Received-Date: Tue, 03 Apr 2012 21:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2012 02:37 AM, Robert P. J. Day wrote:
>
> Documentation suggests that the number of threads should actually be
> *double* the number of cores.
>
A better clarification with be to mention threading since a quad-core 
with hyperthreading enabled would be have 8 virtual cores.

Sau!



> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
>    the yocto docs i've seen do suggest that the suggested number is
> double the number of cores, unless that's wrong.
>
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 5679c03..505ec67 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -24,7 +24,7 @@
>   #
>   #PARALLEL_MAKE = "-j 4"
>   #
> -# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
> +# For a quad-core machine, BB_NUMBER_THREADS = "8", PARALLEL_MAKE = "-j 8" would
>   # be appropriate for example.
>
>   #
>
> rday
>


