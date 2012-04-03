Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFBoA-0004b3-4H
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:02:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 14:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128368955"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2012 14:53:23 -0700
Message-ID: <4F7B7153.7080100@linux.intel.com>
Date: Tue, 03 Apr 2012 14:53:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 1/4] procps: use update-alternatives for pwdx, pgrep and watch
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
X-List-Received-Date: Tue, 03 Apr 2012 22:02:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2012 09:37 AM, Andreas Oberritter wrote:
> * pwdx, pgrep and watch may be provided by busybox.
> * Use update-alternatives to avoid conflict.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-extended/procps/procps_3.2.8.bb |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
> index 27d2b5c..683badc 100644
> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
> +++ b/meta/recipes-extended/procps/procps_3.2.8.bb
> @@ -1,11 +1,12 @@
>   require procps.inc
>
> -PR = "r5"
> +PR = "r6"
>
>   inherit update-alternatives
>
>   ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
> -                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
> +                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps \
> +                     ${bindir}/pgrep ${bindir}/pwdx ${bindir}/watch"
>   ALTERNATIVE_PRIORITY = "110"
>
>   SRC_URI += "file://procmodule.patch \

Merged this along with the sysvinit and ppp patches.

Thanks
	Sau!


