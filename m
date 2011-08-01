Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnvwq-0008Vp-LE
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:06:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2011 10:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="32921288"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2011 10:02:15 -0700
Message-ID: <4E36DC16.1040202@linux.intel.com>
Date: Mon, 01 Aug 2011 10:02:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311847629-4047-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1311847629-4047-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] bitbake.conf: attemp to fix PACKAGE_EXTRA_ARCHS problems
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
X-List-Received-Date: Mon, 01 Aug 2011 17:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 03:07 AM, Koen Kooi wrote:
> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/007075.html for more background
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/conf/bitbake.conf |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6e109ec..1a6969b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -84,7 +84,8 @@ HOST_EXEEXT = ""
>   TUNE_ARCH ??= "INVALID"
>   TUNE_CCARGS ??= ""
>   TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
> -PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}"
> +# Uncommenting the below line leads to all kinds of problems: http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/007075.html
> +#PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ?= "${TARGET_ARCH}"
>   LIBCEXTENSION ??= ""
>   ABIEXTENSION ??= ""
>
Koen,

As similar fix was pulled in from Paul

Sau!


