Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4g6i-0007Yl-0l
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 23:10:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2012 14:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="114805958"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2012 14:01:39 -0800
Message-ID: <4F5537C3.5010307@linux.intel.com>
Date: Mon, 05 Mar 2012 14:01:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330729048-22399-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1330729048-22399-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] eglibc-testing: Fix testing script to work well with dash
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
X-List-Received-Date: Mon, 05 Mar 2012 22:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2012 02:57 PM, Khem Raj wrote:
> Dash did not like>&  so we do 2>&  1>  /dev/null
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-core/eglibc/eglibc-testing.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-testing.inc b/meta/recipes-core/eglibc/eglibc-testing.inc
> index c30409f..a5ce773 100644
> --- a/meta/recipes-core/eglibc/eglibc-testing.inc
> +++ b/meta/recipes-core/eglibc/eglibc-testing.inc
> @@ -47,7 +47,7 @@ then
>   	echo "Please specify the target machine and remote user in form of user@target"
>   	exit 1;
>   fi
> -ssh \$target ls \$PWD\>&  /dev/null
> +ssh \$target ls \$PWD\  2>&1>  /dev/null
>   if [ "x\$?" != "x0" ]
>   then
>   	echo "Failed connecting to \$target it could be because of:"

Merged into OE-core

Thanks
	Sau!


