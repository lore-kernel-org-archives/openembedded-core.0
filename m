Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiCrd-0007Ob-Ip
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 23:29:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 14:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92623806"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 14:22:27 -0800
Message-ID: <4F037FA2.4050705@linux.intel.com>
Date: Tue, 03 Jan 2012 14:22:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325347496-9980-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1325347496-9980-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] procps: raise update-alternatives priority
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
X-List-Received-Date: Tue, 03 Jan 2012 22:29:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/2011 08:04 AM, Koen Kooi wrote:
> This fixes a problem with the uptime utility:
>
> root@beagleboneA3-0088:/var/lib/cloud9# busybox uptime
>   16:00:17 up 2 days,  6:46,  load average: 0.14, 0.04, 0.05
> root@beagleboneA3-0088:/var/lib/cloud9# uptime.procps
>   16:00:22 up 2 days,  6:46,  1 user,  load average: 0.14, 0.05, 0.06
> root@beagleboneA3-0088:/var/lib/cloud9# uptime.coreutils
>   16:00pm  up 4382 days 15:58,  1 user,  load average: 0.13, 0.05, 0.05
> root@beagleboneA3-0088:/var/lib/cloud9# ls /usr/bin/uptime -la
> lrwxrwxrwx 1 root root 16 Dec 26 08:56 /usr/bin/uptime ->  uptime.coreutils
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/procps/procps_3.2.8.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
> index d989955..6a41ccd 100644
> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
> +++ b/meta/recipes-extended/procps/procps_3.2.8.bb
> @@ -1,12 +1,12 @@
>   require procps.inc
>
> -PR = "r3"
> +PR = "r4"
>
>   inherit update-alternatives
>
>   ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
>                        ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
> -ALTERNATIVE_PRIORITY = "90"
> +ALTERNATIVE_PRIORITY = "110"
>
>   SRC_URI += "file://procmodule.patch \
>               file://psmodule.patch \

Merged to OE-Core.

Is there a bug filed against coreutils uptime?

Thanks
Sau!


