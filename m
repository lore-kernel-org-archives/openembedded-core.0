Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2479A781AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:42:41 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 09:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="112069774"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2017 09:42:32 -0700
Message-ID: <1496854280.26945.140.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 07 Jun 2017 11:51:20 -0500
In-Reply-To: <1496839163-2957-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1496839163-2957-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta*: Add LAYERSERIES_COMPAT and LAYERSERIES_CORENAMES markup to layer.conf
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
X-List-Received-Date: Wed, 07 Jun 2017 16:42:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-07 at 13:39 +0100, Richard Purdie wrote:
> This means mismatched layers are more clearly identified to the user in
> cases where compatibility has not been tested. This is perhaps not as
> needed for the core repository (other than CORENAMES) but lets lead by
> example.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta-selftest/conf/layer.conf | 2 ++
>  meta-skeleton/conf/layer.conf | 2 ++
>  meta/conf/layer.conf          | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
> index a847b78..2a71895 100644
> --- a/meta-selftest/conf/layer.conf
> +++ b/meta-selftest/conf/layer.conf
> @@ -8,3 +8,5 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>  BBFILE_COLLECTIONS += "selftest"
>  BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_selftest = "5"
> +
> +LAYERSERIES_COMPAT_selftest = "rocko"
> diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
> index aca1633..a15516a 100644
> --- a/meta-skeleton/conf/layer.conf
> +++ b/meta-skeleton/conf/layer.conf
> @@ -13,3 +13,5 @@ BBFILE_PRIORITY_skeleton = "1"
>  LAYERVERSION_skeleton = "1"
>  
>  LAYERDEPENDS_skeleton = "core"
> +
> +LAYERSERIES_COMPAT_skeleton = "rocko"
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index fc16502..6d36aa1 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -11,6 +11,8 @@ BBFILE_PRIORITY_core = "5"
>  # cause compatibility issues with other layers
>  LAYERVERSION_core = "10"
>  
> +LAYERSERIES_CORENAMES = "rocko"
> +
>  BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"

at oe-core, Is there a reason not to set all LAYERSERIES_COMPAT_* =
"${LAYERSERIES_CORENAMES}"? this would make it easier to bump the COMPAT
set of variables.

>  
>  # Set a variable to get to the top of the metadata location
> -- 
> 2.7.4
> 



