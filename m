Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0jHO-0000D7-Ub
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:44:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 16:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120733182"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2012 16:36:36 -0800
Message-ID: <4F46DB93.9090107@linux.intel.com>
Date: Thu, 23 Feb 2012 16:36:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
	<31839c0ee2b68d525cbfaff920b502537980bc33.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <31839c0ee2b68d525cbfaff920b502537980bc33.1329993620.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 3/7] sstatesig: add pointercal-xinput to excluded machine specific configs
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
X-List-Received-Date: Fri, 24 Feb 2012 00:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/2012 02:43 AM, Martin Jansa wrote:
> * it's used by xinput-calibrator in meta-oe but contains just calibration data like pointercal does for tslib
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/lib/oe/sstatesig.py |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index ee7cbad..080b722 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -27,7 +27,7 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname):
>           return False
>
>       # Exclude well defined machine specific configurations which don't change ABI
> -    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-files']:
> +    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'pointercal-xinput', 'base-files']:
>           return False
>
>       # Default to keep dependencies

This patch needs to be re-based to use RP's new 
SIGGEN_EXCLUDERECIPES_ABISAFE variable in layer.conf

Thanks
	Sau!


