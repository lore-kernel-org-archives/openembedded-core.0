Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTn0-0008Ud-QR
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:32:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 12:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173619850"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 12:20:30 -0700
Message-ID: <5011987E.40706@linux.intel.com>
Date: Thu, 26 Jul 2012 12:20:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343131177-18517-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1343131177-18517-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] core-image: remove x11-netbook package group, it's unused
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
X-List-Received-Date: Thu, 26 Jul 2012 19:32:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2012 04:59 AM, Ross Burton wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/core-image.bbclass |    2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 6b207d7..13e45aa 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>   # - x11-mini            - minimal environment for X11 server
>   # - x11-base            - X11 server + minimal desktop	
>   # - x11-sato            - OpenedHand Sato environment
> -# - x11-netbook         - Metacity based environment for netbooks
>   # - apps-x11-core       - X Terminal, file manager, file editor
>   # - apps-x11-games
>   # - apps-x11-pimlico    - OpenedHand Pimlico apps
> @@ -33,7 +32,6 @@ PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
>   PACKAGE_GROUP_x11-mini = "task-core-x11-mini"
>   PACKAGE_GROUP_x11-base = "task-core-x11-base"
>   PACKAGE_GROUP_x11-sato = "task-core-x11-sato"
> -PACKAGE_GROUP_x11-netbook = "task-core-x11-netbook"
>   PACKAGE_GROUP_apps-x11-core = "task-core-apps-x11-core"
>   PACKAGE_GROUP_apps-x11-games = "task-core-apps-x11-games"
>   PACKAGE_GROUP_apps-x11-pimlico = "task-core-apps-x11-pimlico"
>
Merged into OE-Core

Thanks
	Sau!



