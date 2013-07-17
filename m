Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BE5F86B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:31:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2013 01:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,683,1367996400"; d="scan'208";a="371639442"
Received: from unknown (HELO helios.localnet) ([10.252.122.65])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2013 01:31:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ming Liu <ming.liu@windriver.com>
Date: Wed, 17 Jul 2013 09:31:18 +0100
Message-ID: <1949025.FnEU7Raat7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1374049179-19107-1-git-send-email-ming.liu@windriver.com>
References: <1374049179-19107-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V1] util-linux: replace += with _append to EXTRA_OECONF_virtclass-native
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
X-List-Received-Date: Wed, 17 Jul 2013 08:31:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ming,

On Wednesday 17 July 2013 16:19:39 Ming Liu wrote:
> The native/nativesdk overrides of EXTRA_OECONF should take effect before
> append operator, otherwise, it will cause EXTRA_OECONF be overridden instead
> of be appended at native/nativesdk build time.
> 
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> b/meta/recipes-core/util-linux/util-linux_2.23.1.bb index 12f5021..ae80450
> 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> @@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
>  SRC_URI[sha256sum] =
> "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
> 
>  CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
> -EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate
> --disable-use-tty-group" +EXTRA_OECONF_append_class-native +=
> "--disable-fallocate --disable-use-tty-group"
> +EXTRA_OECONF_append_class-nativesdk += "--disable-fallocate
> --disable-use-tty-group"

Could you please avoid the += in conjunction with _append? It's confusing. 
(You'll need to add a leading space to the value to compensate of course.)

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

