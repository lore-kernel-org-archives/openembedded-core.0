Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SMLWM-0006YM-Lp
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 17:49:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 08:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132879538"
Received: from unknown (HELO envy.home) ([10.7.199.64])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 08:40:12 -0700
Message-ID: <4F9577BE.9030004@linux.intel.com>
Date: Mon, 23 Apr 2012 08:39:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<e82edb126ccf8ceb6751996587e91a851697ca6b.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <e82edb126ccf8ceb6751996587e91a851697ca6b.1334940120.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [CONSOLIDATED PULL 43/43] kernel: Fix packaging issue
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
X-List-Received-Date: Mon, 23 Apr 2012 15:49:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/20/2012 09:45 AM, Saul Wold wrote:
> Remove /etc since it is empty, when creating a machine that does not
> deliver any module config files, the /etc is empty and is then warned
> about not being shipped, so we remove it.
> 
> This occurs in the routerstationpro with the following warning:
> WARNING: For recipe linux-yocto, the following files/directories were installed but not shipped in any package:
> WARNING:   /etc
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..e8f0f9a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -464,7 +464,7 @@ python populate_packages_prepend () {
>  	# avoid warnings. removedirs only raises an OSError if an empty
>  	# directory cannot be removed.
>  	dvar = d.getVar('PKGD', True)
> -	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
> +	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
>  		if len(os.listdir(dir)) == 0:
>  			os.rmdir(dir)
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


