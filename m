Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QNEA7-0006sj-S6
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 03:05:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2011 18:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; 
   d="scan'208";a="1263714"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2011 18:02:58 -0700
Message-ID: <4DD5BDC1.80206@intel.com>
Date: Thu, 19 May 2011 18:02:57 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/5] diffutils: fix libc overrides
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
X-List-Received-Date: Fri, 20 May 2011 01:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2011 06:44 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    2 +-
>   meta/recipes-extended/diffutils/diffutils_3.0.bb   |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
> index 9489b35..0fb3a31 100644
> --- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
> @@ -20,7 +20,7 @@ inherit autotools update-alternatives gettext
>   # standard functionality.  regex.c actually breaks compilation
>   # because it uses __mempcpy, there are other things (TBD:
>   # see diffutils.mk in buildroot)
> -EXTRA_OECONF_linux-uclibc = "--without-included-regex"
> +EXTRA_OECONF_libc-uclibc = "--without-included-regex"
>
>   ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
>   ALTERNATIVE_PRIORITY = "100"
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.0.bb b/meta/recipes-extended/diffutils/diffutils_3.0.bb
> index 427efdf..ecff5cc 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.0.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.0.bb
> @@ -16,7 +16,7 @@ inherit autotools update-alternatives gettext
>   # standard functionality.  regex.c actually breaks compilation
>   # because it uses __mempcpy, there are other things (TBD:
>   # see diffutils.mk in buildroot)
> -EXTRA_OECONF_linux-uclibc = "--without-included-regex"
> +EXTRA_OECONF_libc-uclibc = "--without-included-regex"
>
>   ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
>   ALTERNATIVE_PRIORITY = "100"

This along with the other 4 were merged into oe-core

Thanks
	Sau!


