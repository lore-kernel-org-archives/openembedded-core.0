Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTdKv-0004G7-7V
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:11:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jun 2011 10:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,327,1304319600"; 
   d="scan'208";a="7931956"
Received: from unknown (HELO [10.255.13.99]) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2011 10:08:15 -0700
Message-ID: <4DED097F.9070804@linux.intel.com>
Date: Mon, 06 Jun 2011 10:08:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] allarch.bbclass: Define BASE_PACKAGE_ARCH =	"all"
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
X-List-Received-Date: Mon, 06 Jun 2011 17:11:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 12:45 PM, Khem Raj wrote:
> If not overridden it gets the value which is for target recipes
> usually defined in machine tune files
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/classes/allarch.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 26fca70..e3ac392 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -2,6 +2,7 @@
>   # This class is used for architecture independent recipes/data files (usally scripts)
>   #
>
> +BASE_PACKAGE_ARCH = "all"
>   PACKAGE_ARCH = "all"
>
>   # No need for virtual/libc or a cross compiler

Merged into OE-Core

Thanks
	Sau!


