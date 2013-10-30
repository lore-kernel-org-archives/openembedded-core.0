Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C73CB6C770
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 14:47:15 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Oct 2013 07:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314775734"
Received: from unknown (HELO helios.localnet) ([10.252.120.230])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Oct 2013 07:47:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 30 Oct 2013 14:47:15 +0000
Message-ID: <2034563.H7dbApMjKG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <5271162B.6020008@mlbassoc.com>
References: <5271162B.6020008@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] core-image-basic.bb: Allow user extensions
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
X-List-Received-Date: Wed, 30 Oct 2013 14:47:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Gary,

On Wednesday 30 October 2013 08:22:35 Gary Thomas wrote:
> Allow the user to provide additional packages to this image.
> This lets core-image-basic behave like all other core-image*
> recipes (which do support CORE_IMAGE_EXTRA_INSTALL), as well
> as match the documentation which suggests this as the mode to
> extend any core-image* image.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>   meta/recipes-extended/images/core-image-basic.bb |    3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-extended/images/core-image-basic.bb
> b/meta/recipes-extended/images/core-image-basic.bb index 091f57d..e393a28
> 100644
> --- a/meta/recipes-extended/images/core-image-basic.bb
> +++ b/meta/recipes-extended/images/core-image-basic.bb
> @@ -3,9 +3,12 @@ functionality installed."
>    IMAGE_FEATURES += "splash ssh-server-openssh"
>   +CORE_IMAGE_EXTRA_INSTALL ?= ""
> +

Not sure if it's my mail client but the above looks slightly mangled; in any 
case the above addition shouldn't be needed because core-image.bbclass already 
does this.

>   IMAGE_INSTALL = "\
>       packagegroup-core-boot \
>       packagegroup-core-basic \
> +    ${CORE_IMAGE_EXTRA_INSTALL} \
>       "
>    inherit core-image

Good catch on this one though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

