Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIi7B-0003LG-1Y
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:08:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Apr 2012 07:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130591822"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2012 07:59:22 -0700
Message-ID: <4F883F4A.5030707@linux.intel.com>
Date: Fri, 13 Apr 2012 07:59:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334320817-7099-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1334320817-7099-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] default-distrovars: remove NO32LIBS setting
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
X-List-Received-Date: Fri, 13 Apr 2012 15:08:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 05:40 AM, Paul Eggleton wrote:
> The ??= assignment in pseudo.inc effectively nullifies this ??=
> assignment here, so remove it.
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   meta/conf/distro/include/default-distrovars.inc |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 16b3108..c38cd35 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -37,8 +37,6 @@ COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
>
>   BB_GENERATE_MIRROR_TARBALLS ??= "0"
>
> -NO32LIBS ??= "1"
> -
>   # Default to emitting logfiles if a build fails.
>   BBINCLUDELOGS ??= "yes"
>   SDK_VERSION ??= "oe-core.0"

Merged into OE-Core

Thanks
	Sau!


