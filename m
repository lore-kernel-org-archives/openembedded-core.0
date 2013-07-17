Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C948B6B1C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 06:51:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jul 2013 23:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,682,1367996400"; d="scan'208";a="332506608"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by azsmga001.ch.intel.com with ESMTP; 16 Jul 2013 23:51:05 -0700
Message-ID: <51E63ED9.2000600@linux.intel.com>
Date: Tue, 16 Jul 2013 23:51:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1374037784-7904-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1374037784-7904-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: replace += with _append to EXTRA_OECONF_virtclass-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jul 2013 06:51:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2013 10:09 PM, Ming Liu wrote:
> The native/nativesdk overrides of EXTRA_OECONF should take effect before
> append operator, otherwise, it will cause EXTRA_OECONF be overridden instead
> of be appended at native/nativesdk build time.
>

I am not sure I understand this one.  If what you are saying then all 
the overrides in recipes need to be changed, that does not seem correct 
to me.

Please confirm the overrides using += is correct.

Thanks
	Sau!

> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> index 12f5021..e597c41 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> @@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
>   SRC_URI[sha256sum] = "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
>
>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
> -EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
> +EXTRA_OECONF_append_virtclass-native = "--disable-fallocate --disable-use-tty-group"
> +EXTRA_OECONF_append_virtclass-nativesdk = "--disable-fallocate --disable-use-tty-group"
>

