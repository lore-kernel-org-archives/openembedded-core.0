Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTbsb-0002FW-7o
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 17:10:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Nov 2011 08:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,565,1315206000"; d="scan'208";a="40894017"
Received: from unknown (HELO envy.home) ([10.255.15.250])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Nov 2011 08:03:53 -0800
Message-ID: <4ECE6AEC.8060108@linux.intel.com>
Date: Thu, 24 Nov 2011 08:03:56 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322146645.10818.0.camel@ted>
In-Reply-To: <1322146645.10818.0.camel@ted>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] base.bbclass: Use bb.plain to print the build header
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
X-List-Received-Date: Thu, 24 Nov 2011 16:10:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/24/2011 06:57 AM, Richard Purdie wrote:
> If we just use print, the bitbake logging functions don't see the message
> and it can get lost if bitbake is for example logging messages to disk.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index ba1f230..72196d6 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -232,7 +232,7 @@ python base_eventhandler() {
>  
>  		statuslines += layers_branch_rev
>  		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
> -		print statusmsg
> +		bb.plain(statusmsg)
>  
>  		needed_vars = [ "TARGET_ARCH", "TARGET_OS" ]
>  		pesteruser = []
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


