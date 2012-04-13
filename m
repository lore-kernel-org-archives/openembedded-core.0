Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIi6D-0003If-2J
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:07:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Apr 2012 07:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130591442"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2012 07:58:22 -0700
Message-ID: <4F883F0E.7050102@linux.intel.com>
Date: Fri, 13 Apr 2012 07:58:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334320516-6987-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1334320516-6987-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] pseudo: default NO32LIBS to 1
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
X-List-Received-Date: Fri, 13 Apr 2012 15:07:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 05:35 AM, Paul Eggleton wrote:
> If this value is not set to 1, then systems with some 32-bit libraries
> but no 32-bit version of libgcc installed will have pseudo-native fail
> at do_compile. It should only really be set to 0 by those who know what
> they are doing.
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-devtools/pseudo/pseudo.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index d5c33df..d710058 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -24,7 +24,7 @@ do_configure () {
>   	:
>   }
>
> -NO32LIBS ??= "0"
> +NO32LIBS ??= "1"
>
>   # Compile for the local machine arch...
>   do_compile () {

Merged into OE-Core

Thanks
	Sau!


