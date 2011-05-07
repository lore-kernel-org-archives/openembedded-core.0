Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QIkkO-0002O4-IS
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 18:52:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2011 09:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,331,1301900400"; d="scan'208";a="919338236"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2011 09:50:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
References: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
Date: Sat, 07 May 2011 09:50:12 -0700
Message-ID: <1304787012.8459.1.camel@doubt>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Sat, 07 May 2011 16:52:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

According to my discussion with RP, bb.note() is supposed to appear on
the console. If it doesn't, that is a bug in bitbake, not the recipe
logging. I used this information to document the intended use of the
similarly named bbnote() in logging.bbclass.

--
Darren

On Fri, 2011-05-06 at 16:48 +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/package.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index e6b3df7..082f233 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -676,9 +676,9 @@ python populate_packages () {
>  				unshipped.append(path)
>  
>  	if unshipped != []:
> -		bb.note("the following files were installed but not shipped in any package:")
> +		bb.warn("the following files were installed but not shipped in any package:")
>  		for f in unshipped:
> -			bb.note("  " + f)
> +			bb.warn("  " + f)
>  
>  	bb.build.exec_func("package_name_hook", d)
>  

-- 
Darren Hart
Yocto Linux Kernel



