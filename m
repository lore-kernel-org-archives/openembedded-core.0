Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 453F577AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:31:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 03 Apr 2017 08:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,270,1486454400"; d="scan'208";a="68569419"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2017 08:31:11 -0700
Message-ID: <1491233968.17259.79.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 03 Apr 2017 10:39:28 -0500
In-Reply-To: <20170402213135.21193-1-pbarker@toganlabs.com>
References: <20170402213135.21193-1-pbarker@toganlabs.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ethtool: Switch to download mirror
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
X-List-Received-Date: Mon, 03 Apr 2017 15:31:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-04-02 at 22:31 +0100, Paul Barker wrote:
> The md5sum & sha256sum for ethtool-4.8.tar.gz have changed upstream :(

so why the sums are not changed in the recipe if these change at the
upstream repo?

Leo

> 
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> ---
>  meta/recipes-extended/ethtool/ethtool_4.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/ethtool/ethtool_4.8.bb b/meta/recipes-extended/ethtool/ethtool_4.8.bb
> index 4ca88d766c..afaf2e2f71 100644
> --- a/meta/recipes-extended/ethtool/ethtool_4.8.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_4.8.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
>  
> -SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
> +SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/ethtool-${PV}.tar.gz \
>             file://run-ptest \
>             file://avoid_parallel_tests.patch \
>             "
> -- 
> 2.11.0
> 



