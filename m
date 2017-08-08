Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CD680600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:28:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 08 Aug 2017 13:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,344,1498546800"; d="scan'208";a="121399841"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2017 13:28:28 -0700
Message-ID: <1502224623.1934.32.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Joe Slater <jslater@windriver.com>
Date: Tue, 08 Aug 2017 15:37:03 -0500
In-Reply-To: <20170808201605.139537-1-jslater@windriver.com>
References: <20170808201605.139537-1-jslater@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] php: move to version 7.1.8
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
X-List-Received-Date: Tue, 08 Aug 2017 20:28:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-08-08 at 13:16 -0700, Joe Slater wrote:
> Fixes many CVEs.

would be a plus if you list those.

why LIC_FILES_CHKSUM changed?

Leo

> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../{php-7.1.0 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
>  meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb}         | 6 +++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php-7.1.0 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
>  rename meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb} (64%)
> 
> diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> rename to meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> similarity index 64%
> rename from meta-oe/recipes-devtools/php/php_7.1.0.bb
> rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
> index 210d91f..c0b2541 100644
> --- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> @@ -1,10 +1,10 @@
>  require php.inc
>  
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
>  
>  SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
> -SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
> -SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25bbc9ec70995228e61"
> +SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
> +SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e646e0be73b2e0f8c46ae34419f343ca2f8"
>  
>  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> -- 
> 2.7.4
> 



